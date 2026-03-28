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

import std.ast.{Tokens, VarDecl, Token, LitConstExpr, parseDecl, parseExpr, setItem}


public macro Provide(input: Tokens): Tokens {
    generateProvide(input)
}

public macro Provide(provideIdentifier: Tokens, input: Tokens): Tokens {
    generateProvide(input, provideIdentifier: provideIdentifier)
}

func generateProvide(input: Tokens, provideIdentifier!: Tokens = Tokens()) {
    let attrResult: String = UISyntaxChecker.checkStringLiteralAttr(provideIdentifier, UIMacroKind.Provide).unwrapOr("")

    let finalResult = UISyntaxChecker.expectVarDecl(input, UIMacroKind.Provide)
        .andThen {
            varDecl: VarDecl => UISyntaxChecker.checkNoModifiersFatal(input, varDecl, UIMacroKind.Provide)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkHasInitializer(input, varDecl, UIMacroKind.Provide)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkVarDeclType(input, varDecl, UIMacroKind.Provide)
        }

    return match(finalResult) {
        case Success(varDecl) => 
            STATE_MANAGE_HANDLER.stateInformation.add(mangle(varDecl.identifier.value), (VariableKind.ProvideTy, varDecl))
            if (provideIdentifier.size != 0) {
                STATE_MANAGE_HANDLER.provideVarDeclsMap.add(varDecl.identifier.value, attrResult)
            }
            genPropDeclNode(varDecl)
        case Err(tokens) =>
            setItem(MACRO_MSG_EXPANDED_FAILED, false)
            tokens
    }
}
