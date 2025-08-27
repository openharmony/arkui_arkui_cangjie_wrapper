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
 * @StorageLink["name"] var a: Int64 = 20
 */
public macro StorageLink(attr: Tokens, input: Tokens): Tokens {
    checkStateKindAndInit(input, StateKind.AppStorageLinkTy)
    let attrExpr = parseExpr(attr)
    checkStorageAttr(attrExpr)
    let attrStr = match (attrExpr as LitConstExpr) {
        case Some(lce) => lce.literal.value
        case None => throw IllegalArgumentException("Invaild param from StorageLink")
    }

    let varDecl = match (parseDecl(input) as VarDecl) {
        case Some(v) => v
        case None => throw IllegalArgumentException("Invaild decl after StorageLink")
    }
    let identTok: Token = varDecl.identifier
    stateManageHandler.stateInformation.add(mangle(identTok.value), (VariableKind.AppStorageLinkTy, varDecl))
    checkAppStorageTypeConflict(attrStr, varDecl)
    stateManageHandler.appStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
    return genProp(varDecl, StateKind.AppStorageLinkTy)
}

/**
 * support one-way data binding between app storage and component data
 * example:
 * @StorageProp["name"] let a: Int64 = 20
 */
public macro StorageProp(attr: Tokens, input: Tokens): Tokens {
    checkStateKindAndInit(input, StateKind.AppStoragePropTy)
    let attrExpr = parseExpr(attr)
    checkStorageAttr(attrExpr)
    let attrStr = match (attrExpr as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw IllegalArgumentException("Invaild param from StorageLink")
    }

    let varDecl = match (parseDecl(input) as VarDecl) {
        case Some(v) => v
        case None => throw IllegalArgumentException("Invaild decl after StorageLink")
    }
    let identTok: Token = varDecl.identifier
    stateManageHandler.stateInformation.add(mangle(identTok.value), (VariableKind.AppStoragePropTy, varDecl))
    checkAppStorageTypeConflict(attrStr, varDecl)
    stateManageHandler.appStorageVarAttrInfo.add(mangle(identTok.value), attrStr)
    return genProp(varDecl, StateKind.AppStoragePropTy)
}

/**
 * the same name of storage value can only have one type
 * conflict example:
 * @StorageLink["test"] var str: String = "test"
 * @StorageLink["test"] var int: Int64 = 0
 */
func checkAppStorageTypeConflict(attrStr: String, varDecl: VarDecl): Unit {
    let varType = varDecl.declType
    let newTypeStr = varType.toTokens().toString().trim()
    let typeOption = stateManageHandler.appStorageAttrTypeInfo.get(attrStr)
    match (typeOption) {
        case Some(v) =>
            let originTypeStr = v.trim()
            if (originTypeStr != newTypeStr) {
                diag.error(quote($varDecl), "error: ${attrStr} type conflicts!\n${originTypeStr} => ${newTypeStr}.")
            }
        case _ => stateManageHandler.appStorageAttrTypeInfo.add(attrStr, newTypeStr)
    }
}
