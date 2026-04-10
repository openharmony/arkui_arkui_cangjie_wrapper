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

import std.ast.{Tokens, VarDecl, Token, setItem}
import std.unicode.{UnicodeStringExtension}

/**
 * support two-way data binding between app storage and component data
 * example:
 * @StorageLink["name"] var a: Int64 = 20
 */
public macro StorageLink(attr: Tokens, input: Tokens): Tokens {
    let attrResult = UISyntaxChecker.checkStorageAttr(attr, UIMacroKind.StorageLink)
    let attrStr = match (attrResult) {
        case Success(s) => s
        case Err(_) => return input
    }

    let finalResult = UISyntaxChecker.expectVarDecl(input, UIMacroKind.StorageLink)
        .andThen {
            varDecl: VarDecl => UISyntaxChecker.checkNoModifiersFatal(input, varDecl, UIMacroKind.StorageLink)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkStorageLinkNoLet(input, varDecl, UIMacroKind.StorageLink)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkHasInitializer(input, varDecl, UIMacroKind.StorageLink)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkVarDeclType(input, varDecl, UIMacroKind.StorageLink)
        }

    match (finalResult) {
        case Success(varDecl) =>
            let identTok: Token = varDecl.identifier
            if (!checkAppStorageTypeConflict(attrStr, varDecl, UIMacroKind.StorageLink)) {
                setItem(MACRO_MSG_EXPANDED_FAILED, false)
                return input
            }
            STATE_MANAGE_HANDLER.stateInformation.add(mangle(identTok.value), (VariableKind.AppStorageLinkTy, varDecl))
            STATE_MANAGE_HANDLER.appStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
            return genPropDeclNode(varDecl, stateKind: StateKind.AppStorageLinkTy)
        case Err(_) =>
            setItem(MACRO_MSG_EXPANDED_FAILED, false)
            return input
    }
}

/**
 * support one-way data binding between app storage and component data
 * example:
 * @StorageProp["name"] let a: Int64 = 20
 */
public macro StorageProp(attr: Tokens, input: Tokens): Tokens {
    let attrResult = UISyntaxChecker.checkStorageAttr(attr, UIMacroKind.StorageProp)
    let attrStr = match (attrResult) {
        case Success(s) => s
        case Err(_) => return input
    }

    let finalResult = UISyntaxChecker.expectVarDecl(input, UIMacroKind.StorageProp)
        .andThen {
            varDecl: VarDecl => UISyntaxChecker.checkNoModifiersFatal(input, varDecl, UIMacroKind.StorageProp)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkStoragePropNoVar(input, varDecl, UIMacroKind.StorageProp)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkHasInitializer(input, varDecl, UIMacroKind.StorageProp)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkVarDeclType(input, varDecl, UIMacroKind.StorageProp)
        }

    match (finalResult) {
        case Success(varDecl) =>
            let identTok: Token = varDecl.identifier
            if (!checkAppStorageTypeConflict(attrStr, varDecl, UIMacroKind.StorageProp)) {
                setItem(MACRO_MSG_EXPANDED_FAILED, false)
                return input
            }
            STATE_MANAGE_HANDLER.stateInformation.add(mangle(identTok.value), (VariableKind.AppStoragePropTy, varDecl))
            STATE_MANAGE_HANDLER.appStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
            return genPropDeclNode(varDecl, stateKind: StateKind.AppStoragePropTy)
        case Err(_) =>
            setItem(MACRO_MSG_EXPANDED_FAILED, false)
            return input
    }
}

/**
 * the same name of storage value can only have one type
 * conflict example:
 * @StorageLink["test"] var str: String = "test"
 * @StorageLink["test"] var int: Int64 = 0
 * @return true if no conflict, false if type conflict (error reported)
 */
func checkAppStorageTypeConflict(attrStr: String, varDecl: VarDecl, macroCall: UIMacroKind): Bool {
    let varType = varDecl.declType
    let newTypeStr = varType.toTokens().toString().trim()
    let typeOption = STATE_MANAGE_HANDLER.appStorageAttrTypeInfo.get(attrStr)
    match (typeOption) {
        case Some(v) =>
            let originTypeStr = v.trim()
            if (originTypeStr != newTypeStr) {
                reportError(varDecl.toTokens(), MacroErrorCode.TypeConflict, macroCall,
                    detail: "storage key '${attrStr}' has a type conflict: ${originTypeStr} vs ${newTypeStr}")
                return false
            }
            true
        case _ =>
            STATE_MANAGE_HANDLER.appStorageAttrTypeInfo.add(attrStr, newTypeStr)
            true
    }
}
