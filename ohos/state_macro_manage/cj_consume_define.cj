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

public macro Consume(input: Tokens): Tokens {
    generateConsume(input)
}

public macro Consume(consumeIdentifier: Tokens, input: Tokens): Tokens {
    generateConsume(input, consumeIdentifier: consumeIdentifier)
}

func generateConsume(input: Tokens, consumeIdentifier!: Tokens = Tokens()) {
    checkStateKindAndInit(input, StateKind.ConsumeTy)
    let varDecl = (parseDecl(input) as VarDecl).getOrThrow()
    let identTok: Token = varDecl.identifier
    stateManageHandler.stateInformation.add(mangle(identTok.value), (VariableKind.ConsumeTy, varDecl))

    if (consumeIdentifier.size > 0) {
        let expr = parseExpr(consumeIdentifier)
        checkConsumeIdentifier(expr)
        let consumeIdentifierStr = (expr as LitConstExpr).getOrThrow().literal.value
        stateManageHandler.consumeVarDeclsMap.add(identTok.value, consumeIdentifierStr)
    }

    return genProp(varDecl, StateKind.ConsumeTy)
}

func checkConsumeIdentifier(input: Expr) {
    if (!isLiteral(input) || !isStringType(input)) {
        diag.fatal(quote($input), "invalid type, attribute must be a string literal.")
    }
}
