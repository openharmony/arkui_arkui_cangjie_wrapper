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

macro package ohos.arkui.state_macro_manage

import std.ast.*
import std.unicode.*

/**
 * support two-way data binding between app storage and component data
 * example:
 * @LocalStorageLink["name"] var a: Int64 = 20
 * @LocalStorageLink["name", "InterOp"] var a: Int64 = 20
 */
public macro LocalStorageLink(attr: Tokens, input: Tokens): Tokens {
    if (!isLocalStorageInterOp(attr)) {
        checkStateKindAndInit(input, StateKind.LocalStorageLinkTy)
        let attrExpr = parseExpr(attr)
        checkStorageAttr(attrExpr)
        let attrStr = match (attrExpr as LitConstExpr) {
            case Some(lce) => lce.literal.value
            case None => throw IllegalArgumentException("Invaild param from StorageLink")
        }

        let varDecl = match (parseDecl(input) as VarDecl) {
            case Some(v) => v
            case None => throw IllegalArgumentException(
                "LocalStorageLink should be used to decorate the decl of variable")
        }
        let identTok: Token = varDecl.identifier
        stateManageHandler.stateInformation.add(mangle(identTok.value), (VariableKind.LocalStorageLinkTy, varDecl))
        checkLocalStorageTypeConflict(attrStr, varDecl)
        stateManageHandler.localStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
        return genProp(varDecl, StateKind.LocalStorageLinkTy)
    } else {
        checkStateKindAndInit(input, StateKind.LocalStorageLinkInterOpTy)
        checkLocalStorageInterOpAttr(attr)
        return genLocalStorage(attr, input, StateKind.LocalStorageLinkInterOpTy, VariableKind.LocalStorageLinkInterOpTy)
    }
}

/**
 * support one-way data binding between app storage and component data
 * example:
 * @LocalStorageProp["name"] let a: Int64 = 20
 * @LocalStorageProp["name", "InterOp"] let a: Int64 = 20
 */
public macro LocalStorageProp(attr: Tokens, input: Tokens): Tokens {
    if (!isLocalStorageInterOp(attr)) {
        checkStateKindAndInit(input, StateKind.LocalStoragePropTy)
        let attrExpr = parseExpr(attr)
        checkStorageAttr(attrExpr)
        let attrStr = match (attrExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw IllegalArgumentException("Invaild param from LocalStorageProp")
        }

        let varDecl = match (parseDecl(input) as VarDecl) {
            case Some(v) => v
            case None => throw IllegalArgumentException(
                "LocalStorageProp should be used to decorate the decl of variable")
        }
        let identTok: Token = varDecl.identifier
        stateManageHandler.stateInformation.add(mangle(identTok.value), (VariableKind.LocalStoragePropTy, varDecl))
        checkLocalStorageTypeConflict(attrStr, varDecl)
        stateManageHandler.localStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
        return genProp(varDecl, StateKind.LocalStoragePropTy)
    } else {
        checkStateKindAndInit(input, StateKind.LocalStoragePropInterOpTy)
        checkLocalStorageInterOpAttr(attr)
        return genLocalStorage(attr, input, StateKind.LocalStoragePropInterOpTy, VariableKind.LocalStoragePropInterOpTy)
    }
}

/**
 * the same name of storage value can only have one type
 * conflict example:
 * @StorageLink["test"] var str: String = "test"
 * @StorageLink["test"] var int: Int64 = 0
 */
func checkLocalStorageTypeConflict(attrStr: String, varDecl: VarDecl): Unit {
    let varType = varDecl.declType
    let newTypeStr = varType.toTokens().toString().trim()
    let typeOption = stateManageHandler.localStorageAttrTypeInfo.get(attrStr)
    match (typeOption) {
        case Some(v) =>
            let originTypeStr = v.trim()
            if (originTypeStr != newTypeStr) {
                diag.error(quote($varDecl), "error: ${attrStr} type conflicts!\n${originTypeStr} => ${newTypeStr}.")
            }
        case _ => stateManageHandler.localStorageAttrTypeInfo.add(attrStr, newTypeStr)
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
    stateManageHandler.stateInformation.add(mangle(identTok.value), (variableKind, varDecl))
    stateManageHandler.localStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
    return genProp(varDecl, stateKink)
}
