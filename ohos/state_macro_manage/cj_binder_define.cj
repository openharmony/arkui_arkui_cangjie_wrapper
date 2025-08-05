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

public macro Binder(input: Tokens): Tokens {
    assertParentContext("Component")
    let expr = parseExpr(input)
    match (expr) {
        case memberAccess: MemberAccess =>
            if (memberAccess.baseExpr is RefExpr) {
                let refExpr = (memberAccess.baseExpr as RefExpr).getOrThrow()
                if (refExpr.identifier.value == "this") {
                    setItem("IDENTIFIER", memberAccess.field.value)
                }
            }
        case refExpr: RefExpr => setItem("IDENTIFIER", refExpr.identifier.value)
        case _ => throw IllegalArgumentException("Only MemberAccess or RefExpr is supported in @Binder.")
    }

    return quote(
        (
            $input,
            {
                newValue =>
                $input = newValue
            }
        )
    )
}
