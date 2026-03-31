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

import std.ast.{Tokens, VarDecl, Token, parseDecl, setItem}


public macro Prop(input: Tokens): Tokens {
    if (!UISyntaxChecker.checkNotInEntry(input, UIMacroKind.Prop)) {
        return input
    }
    let finalResult = UISyntaxChecker.expectVarDecl(input, UIMacroKind.Prop)
        .andThen {
            varDecl: VarDecl =>
                UISyntaxChecker.checkUnrecommendedStateType(varDecl, UIMacroKind.Prop)
                UISyntaxChecker.checkNoModifiersFatal(input, varDecl, UIMacroKind.Prop)
        }.andThen {
            varDecl: VarDecl => UISyntaxChecker.checkNoInitializer(input, varDecl, UIMacroKind.Prop)
        }

    return match(finalResult) {
        case Success(varDecl) => 
            STATE_MANAGE_HANDLER.stateInformation.add(mangle(varDecl.identifier.value), (VariableKind.PropTy, varDecl))
            genPropDeclNode(varDecl)
        case Err(tokens) =>
            setItem(MACRO_MSG_EXPANDED_FAILED, false)
            tokens
    }
}
