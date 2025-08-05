
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

/**
 * Constraint: define reuseable component before @Entry
 * Example:
 * @Reusable
 * @Component
 * class Child {...}
 */
public macro Reusable(input: Tokens): Tokens {
    let classDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    let decls = classDecl.body.decls
    var initFunc = FuncDecl()
    var buildFunc = FuncDecl()
    for (item in decls) {
        if (item.identifier.value == "init") {
            initFunc = (item as FuncDecl).getOrThrow()
        }
    }
    let val = AssignExpr(quote(this.isReusable = true))
    initFunc.block.nodes.add(val)
    return classDecl.toTokens()
}
