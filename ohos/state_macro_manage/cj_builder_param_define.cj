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

public macro BuilderParam(input: Tokens): Tokens {
    let decl = parseDecl(input)

    // check whether @BuilderParam decorated a variable declaration
    if ((decl as VarDecl).isNone()) {
        diag.fatal(input, "@BuilderParam should decorate variable declaration")
    }
    let varDecl: VarDecl = (decl as VarDecl).getOrThrow()

    // check whether @BuilderParam decorated a variable with function type
    if ((varDecl.declType as FuncType).isNone()) {
        diag.fatal(input, "@BuilderParam variable should be function type")
    }
    let funcType = (varDecl.declType as FuncType).getOrThrow()
    match (funcType.returnType as PrimitiveType) {
        case Some(r) =>
            if (r.keyword.kind != UNIT) {
                diag.fatal(input, "@BuilderParam variable should be a function type and the return type should be Unit")
            }
        case None => diag.fatal(input, "@BuilderParam variable should be a function type and the return type is Unit")
    }

    // update the return type to ViewBuilder
    funcType.returnType = RefType(quote(ViewBuilder))

    // add a CustomView
    let entryTypes = ArrayList<TypeNode>.of(RefType(quote(CustomView)))

    // update the type T of the parameter to ObservedProperty<T> 
    for (paramType in funcType.types) {
        entryTypes.add(RefType(quote(ObservedProperty<$paramType>)))
    }
    funcType.types = entryTypes

    stateManageHandler.builderParamInfo.add(varDecl.identifier.value)

    quote(private) + varDecl.toTokens()
}
