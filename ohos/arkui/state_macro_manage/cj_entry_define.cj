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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

macro package ohos.arkui.state_macro_manage

import std.ast.{Tokens, ClassDecl, Token, Decl, FuncDecl, CallExpr, MemberAccess, RefExpr, parseDecl, TokenKind,
    ToTokens, MacroExpandDecl, getChildMessages}
import std.collection.ArrayList


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
    if (getChildMessages("Component").isEmpty()) {
        return input
    }
    if (hasLocalStorageExpanded()) {
        let attrMissing = localStorageAttr.isNone() || (localStorageAttr.isSome() &&
            localStorageAttr.getOrThrow().size == 0)
        if (attrMissing) {
            reportWarning(input, MacroErrorCode.EntryLocalStorageAttributeRequired, UIMacroKind.Entry)
        }
    }
    let decl: Decl
    try {
        decl = parseDecl(input)
    } catch(e: Exception) {
        return input
    }
    var classDecl: ClassDecl
    match(decl) {
        case cd: ClassDecl => classDecl = cd
        case macroExpandDecl: MacroExpandDecl =>
            UISyntaxChecker.reportUndeclaredIdentifier(
                Tokens().append(macroExpandDecl.identifier), UIMacroKind.Entry, macroExpandDecl.identifier.value)
            return input
        case _ =>
            UISyntaxChecker.reportExpectClassDeclForEntry(Tokens().append(decl.keyword), UIMacroKind.Entry)
            return input
    }
    
    let entryClassIdent = classDecl.identifier
    if (needCheckEntry && !checkEntry(entryClassIdent)) {
        return input
    }
    if (needCheckEntry) {
        for (modifier in classDecl.modifiers) {
            if (modifier.keyword.value == "public") {
                reportWarning(Tokens().append(modifier), MacroErrorCode.EntryPublicModifierNotRecommended, UIMacroKind.Entry)
                break
            }
        }
    }
    let classBody = classDecl.body.decls
    checkEntryBody(classBody)
    let entryClassIdentStr = entryClassIdent.value
    let entryId = generateNewEntryId()
    let appEntryIdent = Token(TokenKind.IDENTIFIER, "appEntry${entryId}")
    if (localStorageAttr.isSome()) {
        return classDecl.toTokens().append(generateEntryFunc(entryClassIdent, appEntryIdent, localStorageAttr.getOrThrow()))
            .append(generateRegisterDecl(quote($entryClassIdentStr), appEntryIdent))
    }
    return classDecl.toTokens().append(generateEntryFunc(entryClassIdent, appEntryIdent))
        .append(generateRegisterDecl(quote($entryClassIdentStr), appEntryIdent))
}

/**
 * Check if @LocalStorageLink or @LocalStorageProp is used (Message has MACRO_MSG_EXPANDED_LOCAL_STORAGE).
 */
func hasLocalStorageExpanded(): Bool {
    for (message in getChildMessages("LocalStorageLink")) {
        if (message.hasItem(MACRO_MSG_EXPANDED_LOCAL_STORAGE)) {
            return true
        }
    }
    for (message in getChildMessages("LocalStorageProp")) {
        if (message.hasItem(MACRO_MSG_EXPANDED_LOCAL_STORAGE)) {
            return true
        }
    }
    false
}

/**
 * check if there is only one @Entry in the file.
 */
func checkEntry(input: Token): Bool {
    let fileId = input.pos.fileID
    if (!STATE_MANAGE_HANDLER.entryFileId.contains(fileId)) {
        STATE_MANAGE_HANDLER.entryFileId.add(fileId)
        true
    } else {
        UISyntaxChecker.reportDuplicateEntry(input.toTokens())
        false
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
                let expr = (lastDecl as CallExpr).getOrThrow()
                let compName = parseNodeToComponetName(expr)
                if (!STATE_MANAGE_HANDLER.isContainerComponent(compName) || STATE_MANAGE_HANDLER.isInBuilderComponents(
                    compName)) {
                    UISyntaxChecker.reportEntryBuildRootMustBeContainer(quote($funcDecl), UIMacroKind.Entry, compName)
                }
            case _ => continue
        }
    }
}

@When[pipeline == "NG"]
func generateEntryFunc(input: Token, appEntryIdent: Token) {
    quote(
        public func $appEntryIdent(): Bool {
            let view = $input(Option<CustomView>.None)
            loadNativeView(view)
        }
    )
}

@When[pipeline == "NG"]
func generateEntryFunc(input: Token, appEntryIdent: Token, localStorageAttr: Tokens) {
    quote(
        public func $appEntryIdent(): Bool {
            let view = $input(Option<CustomView>.None, __gen_local_storage: $localStorageAttr)
            loadNativeView(view)
        }
    )
}

@When[pipeline == "CLASSIC"]
func generateEntryFunc(input: Token, appEntryIdent: Token) {
    let id = generateNewId()

    quote(
        public func $appEntryIdent(): Bool {
            let view = $input($id, Option<CustomView>.None)
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
    let decl: Decl
    try {
        decl = parseDecl(input)
    } catch(e: Exception) {
        return input
    }
    var classDecl: ClassDecl
    match(decl) {
        case cd: ClassDecl => classDecl = cd
        case macroExpandDecl: MacroExpandDecl =>
            UISyntaxChecker.reportUndeclaredIdentifier(
                Tokens().append(macroExpandDecl.identifier), UIMacroKind.HybridComponentEntry, macroExpandDecl.identifier.value)
            return input
        case _ =>
            UISyntaxChecker.reportExpectClassDeclForEntry(Tokens().append(decl.keyword), UIMacroKind.HybridComponentEntry)
            return input
    }
    let entryClassIdent = classDecl.identifier
    if (needCheckEntry && !checkHybridComponentEntry(entryClassIdent)) {
        return input
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
func checkHybridComponentEntry(input: Token): Bool {
    let fileId = input.pos.fileID
    if (!STATE_MANAGE_HANDLER.entryFileId.contains(fileId)) {
        STATE_MANAGE_HANDLER.entryFileId.add(fileId)
        true
    } else {
        UISyntaxChecker.reportDuplicateHybridComponentEntry(input.toTokens())
        false
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
                if (!STATE_MANAGE_HANDLER.isContainerComponent(compName) || STATE_MANAGE_HANDLER.isInBuilderComponents(
                    compName)) {
                    UISyntaxChecker.reportEntryBuildRootMustBeContainer(quote($funcDecl), UIMacroKind.HybridComponentEntry, compName)
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
    quote(
        public func $hybridCompIdentLoad(): CPointer<Unit> {
            let elemId = ViewStackProcessor.allocateNewElmetIdForNextComponent()
            ViewStackProcessor.startGetAccessRecordingFor(elemId)
            let $instanceIdent = $entryClassIdent(Option<CustomView>.None)
            CustomView.create($instanceIdent)
            ViewStackProcessor.stopGetAccessRecording()
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
