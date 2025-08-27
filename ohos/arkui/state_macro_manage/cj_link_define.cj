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

public macro Link(input: Tokens): Tokens {
    checkStateKindAndInit(input, StateKind.LinkTy)
    let varDecl = (parseDecl(input) as VarDecl).getOrThrow()
    let identTok: Token = varDecl.identifier
    stateManageHandler.stateInformation.add(mangle(identTok.value), (VariableKind.LinkTy, varDecl))
    return genProp(varDecl, StateKind.LinkTy)
}
