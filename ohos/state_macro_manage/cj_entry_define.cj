/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

macro package ohos.state_macro_manage

import std.ast.*

public macro Entry(input: Tokens): Tokens {
    parseEntry(input, true)
}

public macro Entry(attr: Tokens, input: Tokens): Tokens {
    parseEntry(input, true, localStorageAttr: attr)
}

public macro Preview(input: Tokens): Tokens {
    parseEntry(input, false)
}

func parseEntry(input: Tokens, needCheckEntry: Bool, localStorageAttr!: ?Tokens = None): Tokens {
    let classDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    let entryClassIdent = classDecl.identifier
    if (needCheckEntry) {
        checkEntry(entryClassIdent)
    }
    let classBody = classDecl.body.decls
    checkEntryBody(classBody)
    let entryClassIdentStr = entryClassIdent.value
    let entryId = generateNewEntryId()
    let appEntryIdent = Token(TokenKind.IDENTIFIER, "appEntry${entryId}")
    if (localStorageAttr.isSome()) {
        return classDecl.toTokens().append(generateEntryFunc(input, appEntryIdent, localStorageAttr.getOrThrow()))
            .append(generateRegisterDecl(quote($entryClassIdentStr), appEntryIdent))
    }
    return classDecl.toTokens().append(generateEntryFunc(input, appEntryIdent))
        .append(generateRegisterDecl(quote($entryClassIdentStr), appEntryIdent))
}

/**
 * check if there is only one @Entry in the file.
 */
func checkEntry(input: Token) {
    let fileId = input.pos.fileID
    if (!stateManageHandler.entryFileId.contains(fileId)) {
        stateManageHandler.entryFileId.add(fileId)
        ()
    } else {
        diag.fatal(input.toTokens(), "An cangjie file can contain only one '@Entry' decorator.")
    }
}

func checkEntryBody(classBody: ArrayList<Decl>) {
    for (item in classBody) {
        match (item) {
            case funcDecl: FuncDecl =>
                if (funcDecl.identifier.value != "build") {
                    continue
                }
                let funcBody = funcDecl.block.nodes
                let lastDecl = funcBody[funcBody.size - 1]
                if (!(lastDecl is CallExpr) || !((lastDecl as CallExpr).getOrThrow().callFunc is MemberAccess)) {
                    continue
                }
                let memAccess = ((lastDecl as CallExpr).getOrThrow().callFunc as MemberAccess).getOrThrow()
                let compName = (memAccess.baseExpr as RefExpr).getOrThrow().identifier.value
                if (!stateManageHandler.isContainerComponent(compName) || stateManageHandler.isInBuilderComponents(
                    compName)) {
                    diag.fatal(
                        quote($funcDecl),
                        "${compName} The build method in the Entry component can only have one root node and can only be a container component and cannot be a custom component."
                    )
                }
            case _ => continue
        }
    }
}

@When[pipeline == "NG"]
func generateEntryFunc(input: Tokens, appEntryIdent: Token) {
    let entryClassIdent = (parseDecl(input) as ClassDecl).getOrThrow().identifier
    quote(
        public func $appEntryIdent(): Bool {
            let view = $entryClassIdent(Option<CustomView>.None)
            loadNativeView(view)
        }
    )
}

@When[pipeline == "NG"]
func generateEntryFunc(input: Tokens, appEntryIdent: Token, localStorageAttr: Tokens) {
    let entryClassIdent = (parseDecl(input) as ClassDecl).getOrThrow().identifier
    quote(
        public func $appEntryIdent(): Bool {
            let view = $entryClassIdent(Option<CustomView>.None, localStorage: $localStorageAttr)
            loadNativeView(view)
        }
    )
}

@When[pipeline == "CLASSIC"]
func generateEntryFunc(input: Tokens, appEntryIdent: Token) {
    let entryClassIdent = (parseDecl(input) as ClassDecl).getOrThrow().identifier
    let id = generateNewId()

    quote(
        public func $appEntryIdent(): Bool {
            let view = $entryClassIdent($id, Option<CustomView>.None)
            loadNativeView(view)
        }
    )
}

func generateRegisterDecl(registerName: Tokens, appEntryIdent: Token) {
    let entryId = generateNewEntryId()
    let a_p_ident = Token(TokenKind.IDENTIFIER, "A_P_${entryId}")
    quote(
        let $a_p_ident = CJEntry.getInstance().registerEntry($registerName, $appEntryIdent)
    )
}

public macro HybridComponentEntry(input: Tokens): Tokens {
    parseHybridComponentEntry(input, false)
}

func parseHybridComponentEntry(input: Tokens, needCheckEntry: Bool): Tokens {
    let classDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    let entryClassIdent = classDecl.identifier
    if (needCheckEntry) {
        checkHybridComponentEntry(entryClassIdent)
    }
    let classBody = classDecl.body.decls
    checkHybridComponentEntryBody(classBody)
    let entryClassIdentStr = entryClassIdent.value
    let entryId = generateNewEntryId()
    let hybridCompLoadIdent = Token(TokenKind.IDENTIFIER, "hybridComponent_${entryId}_load")
    let hybridCompUnloadIdent = Token(TokenKind.IDENTIFIER, "hybridComponent_${entryId}_unload")
    return input + generateHybridComponentEntryFunc(input, hybridCompLoadIdent, hybridCompUnloadIdent,
        quote($entryClassIdentStr)) + generateRegisterDecl(quote($entryClassIdentStr), entryClassIdentStr,
        hybridCompLoadIdent, hybridCompUnloadIdent)
}

/**
 * check if there is only one @HybridComponentEntry in the file.
 */
func checkHybridComponentEntry(input: Token) {
    let fileId = input.pos.fileID
    if (!stateManageHandler.entryFileId.contains(fileId)) {
        stateManageHandler.entryFileId.add(fileId)
        ()
    } else {
        diag.fatal(input.toTokens(), "An cangjie file can contain only one '@HybridComponentEntry' decorator.")
    }
}

func checkHybridComponentEntryBody(classBody: ArrayList<Decl>) {
    for (item in classBody) {
        match (item) {
            case funcDecl: FuncDecl =>
                if (funcDecl.identifier.value != "build") {
                    continue
                }
                let funcBody = funcDecl.block.nodes
                let lastDecl = funcBody[funcBody.size - 1]
                if (!(lastDecl is CallExpr) || !((lastDecl as CallExpr).getOrThrow().callFunc is MemberAccess)) {
                    continue
                }
                let memAccess = ((lastDecl as CallExpr).getOrThrow().callFunc as MemberAccess).getOrThrow()
                let compName = (memAccess.baseExpr as RefExpr).getOrThrow().identifier.value
                if (!stateManageHandler.isContainerComponent(compName) || stateManageHandler.isInBuilderComponents(
                    compName)) {
                    diag.fatal(
                        quote($funcDecl),
                        "${compName} The build method in the HybridComponentEntry component can only have one root node and can only be a container component and cannot be a custom component."
                    )
                }
            case _ => continue
        }
    }
}

func generateHybridComponentEntryFunc(input: Tokens, hybridCompIdentLoad: Token, hybridCompIdentUnload: Token,
    registerName: Tokens) {
    let entryClassIdent = (parseDecl(input) as ClassDecl).getOrThrow().identifier
    let entryClassIdentStr = entryClassIdent.value
    let instanceIdent = Token(TokenKind.IDENTIFIER, "${entryClassIdentStr}_instance")
    let entryId = generateNewEntryId()
    let h_c_ident = Token(TokenKind.IDENTIFIER, "hybrid_comp_${entryId}")
    quote(
        public func $hybridCompIdentLoad(): CPointer<Unit> {
            let elemId = ViewStackProcessor.AllocateNewElmetIdForNextComponent()
            ViewStackProcessor.StartGetAccessRecordingFor(elemId)
            let $instanceIdent = $entryClassIdent(Option<CustomView>.None)
            CustomView.create($instanceIdent)
            ViewStackProcessor.StopGetAccessRecording()
            CJPageEntry.getInstance().registerHybridPage($registerName, $instanceIdent)
            return CPointer<Unit>()
        }

        public func $hybridCompIdentUnload(): Unit {
            CJPageEntry.getInstance().removeHybridPage($registerName)
        }
    )
}

func generateRegisterDecl(registerName: Tokens, className: String, hybridCompIdentLoad: Token,
    hybridCompIdentUnload: Token) {
    let classNameIdent = Token(TokenKind.IDENTIFIER, "${className}_register")
    quote(
        class $classNameIdent <: HybridComponentBase {
            static init() {
                registerHybridComponent($registerName, $hybridCompIdentLoad, $hybridCompIdentUnload)
            }
        }
    )
}
