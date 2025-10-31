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

import std.ast.{Tokens, VarDecl, Token, LitConstExpr, parseDecl, parseExpr}

public macro Provide(input: Tokens): Tokens {
    generateProvide(input)
}

public macro Provide(provideIdentifier: Tokens, input: Tokens): Tokens {
    generateProvide(input, provideIdentifier: provideIdentifier)
}

func generateProvide(input: Tokens, provideIdentifier!: Tokens = Tokens()) {
    checkStateKindAndInit(input, StateKind.ProvideTy)
    let varDecl = (parseDecl(input) as VarDecl).getOrThrow()
    let identTok: Token = varDecl.identifier
    STATE_MANAGE_HANDLER.stateInformation.add(mangle(identTok.value), (VariableKind.ProvideTy, varDecl))

    if (provideIdentifier.size > 0) {
        let expr = parseExpr(provideIdentifier)
        checkConsumeIdentifier(expr)
        let provideIdentifierStr = (expr as LitConstExpr).getOrThrow().literal.value
        STATE_MANAGE_HANDLER.provideVarDeclsMap.add(identTok.value, provideIdentifierStr)
    }

    return genProp(varDecl, StateKind.ProvideTy)
}
