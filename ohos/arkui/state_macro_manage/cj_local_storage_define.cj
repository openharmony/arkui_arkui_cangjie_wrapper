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

import std.ast.{Token, Tokens, LitConstExpr, VarDecl, parseExpr, parseDecl, setItem}
import std.unicode.{UnicodeStringExtension}

/**
 * support two-way data binding between app storage and component data
 * example:
 * @LocalStorageLink["name"] var a: Int64 = 20
 * @LocalStorageLink["name", "InterOp"] var a: Int64 = 20
 */
public macro LocalStorageLink(attr: Tokens, input: Tokens): Tokens {
    let attrResult = UISyntaxChecker.checkLocalStorageAttr(attr, UIMacroKind.LocalStorageLink)
    match (attrResult) {
        case Err(_) =>
            setItem(MACRO_MSG_EXPANDED_FAILED, false)
            return input
        case Success((isInterOp, attrStr)) =>
            let finalResult = UISyntaxChecker.expectVarDecl(input, UIMacroKind.LocalStorageLink)
                    .andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkNoModifiersFatal(input, varDecl, UIMacroKind.LocalStorageLink)
                    }.andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkStorageLinkNoLet(input, varDecl, UIMacroKind.LocalStorageLink)
                    }.andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkHasInitializer(input, varDecl, UIMacroKind.LocalStorageLink)
                    }.andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkVarDeclType(input, varDecl, UIMacroKind.LocalStorageLink)
                    }
            if (!isInterOp) {
                return match (finalResult) {
                    case Success(varDecl) =>
                        let identTok: Token = varDecl.identifier
                        if (!checkLocalStorageTypeConflict(attrStr, varDecl, UIMacroKind.LocalStorageLink)) {
                            setItem(MACRO_MSG_EXPANDED_FAILED, false)
                            return input
                        }
                        STATE_MANAGE_HANDLER.stateInformation.add(mangle(identTok.value), (VariableKind.LocalStorageLinkTy, varDecl))
                        STATE_MANAGE_HANDLER.localStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
                        setItem(MACRO_MSG_EXPANDED_LOCAL_STORAGE, true)
                        genPropDeclNode(varDecl, stateKind: StateKind.LocalStorageLinkTy)
                    case Err(_) => input
                }
            } else {
                return genLocalStorage(attr, input, StateKind.LocalStorageLinkInterOpTy, VariableKind.LocalStorageLinkInterOpTy)
            }
    }
}

/**
 * support one-way data binding between app storage and component data
 * example:
 * @LocalStorageProp["name"] let a: Int64 = 20
 * @LocalStorageProp["name", "InterOp"] let a: Int64 = 20
 */
public macro LocalStorageProp(attr: Tokens, input: Tokens): Tokens {
    let attrResult = UISyntaxChecker.checkLocalStorageAttr(attr, UIMacroKind.LocalStorageProp)
    match (attrResult) {
        case Err(_) =>
            setItem(MACRO_MSG_EXPANDED_FAILED, false)
            return input
        case Success((isInterOp, attrStr)) =>
            let finalResult = UISyntaxChecker.expectVarDecl(input, UIMacroKind.LocalStorageProp)
                    .andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkNoModifiersFatal(input, varDecl, UIMacroKind.LocalStorageProp)
                    }.andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkStoragePropNoVar(input, varDecl, UIMacroKind.LocalStorageProp)
                    }.andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkHasInitializer(input, varDecl, UIMacroKind.LocalStorageProp)
                    }.andThen {
                        varDecl: VarDecl => UISyntaxChecker.checkVarDeclType(input, varDecl, UIMacroKind.LocalStorageProp)
                    }
            if (!isInterOp) {
                return match (finalResult) {
                    case Success(varDecl) =>
                        let identTok: Token = varDecl.identifier
                        if (!checkLocalStorageTypeConflict(attrStr, varDecl, UIMacroKind.LocalStorageProp)) {
                            setItem(MACRO_MSG_EXPANDED_FAILED, false)
                            return input
                        }
                        STATE_MANAGE_HANDLER.stateInformation.add(mangle(identTok.value), (VariableKind.LocalStoragePropTy, varDecl))
                        STATE_MANAGE_HANDLER.localStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
                        setItem(MACRO_MSG_EXPANDED_LOCAL_STORAGE, true)
                        genPropDeclNode(varDecl, stateKind: StateKind.LocalStoragePropTy)
                    case Err(_) =>
                        setItem(MACRO_MSG_EXPANDED_FAILED, false)
                        input
                }
            } else {
                return genLocalStorage(attr, input, StateKind.LocalStoragePropInterOpTy, VariableKind.LocalStoragePropInterOpTy)
            }
    }
}

/**
 * the same name of storage value can only have one type
 * conflict example:
 * @StorageLink["test"] var str: String = "test"
 * @StorageLink["test"] var int: Int64 = 0
 * @return true if no conflict, false if type conflict (error reported)
 */
func checkLocalStorageTypeConflict(attrStr: String, varDecl: VarDecl, macroCall: UIMacroKind): Bool {
    let varType = varDecl.declType
    let newTypeStr = varType.toTokens().toString().trim()
    let typeOption = STATE_MANAGE_HANDLER.localStorageAttrTypeInfo.get(attrStr)
    match (typeOption) {
        case Some(v) =>
            let originTypeStr = v.trim()
            if (originTypeStr != newTypeStr) {
                reportError(varDecl.toTokens(), MacroErrorCode.TypeConflict, macroCall,
                    detail: "storage key '${attrStr}' has a type conflict between '${originTypeStr}' and '${newTypeStr}'")
                return false
            }
            true
        case _ =>
            STATE_MANAGE_HANDLER.localStorageAttrTypeInfo.add(attrStr, newTypeStr)
            true
    }
}

func genLocalStorage(attr: Tokens, input: Tokens, stateKink: StateKind, variableKind: VariableKind) {
    var attrExpr = parseExpr(attr)
    let attrStr = match (attrExpr as LitConstExpr) {
        case Some(lce) => lce.literal.value
        case None => throw IllegalArgumentException("Invaild param from LocalStorage")
    }

    let varDecl = match (parseDecl(input) as VarDecl) {
        case Some(v) => v
        case None => throw IllegalArgumentException("LocalStorage should be used to decorate the decl of variable")
    }

    let identTok: Token = varDecl.identifier
    STATE_MANAGE_HANDLER.stateInformation.add(mangle(identTok.value), (variableKind, varDecl))
    STATE_MANAGE_HANDLER.localStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
    return genProp(varDecl, stateKink)
}
