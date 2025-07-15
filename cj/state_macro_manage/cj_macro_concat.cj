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
import std.collection.*

func createMethodDeclaration(
    annotations!: Tokens = Tokens(),
    modifiers!: Tokens = Tokens(),
    keyword!: Tokens = quote(func),
    identifier!: Tokens = Tokens(),
    generics!: ?Tokens = None,
    params!: Tokens = quote(()),
    genConstraints!: ?Tokens = None,
    retType!: Tokens = Tokens(),
    body!: Tokens = Tokens()
): Tokens {
    let funcType = if (retType.size == 0) {
        Tokens()
    } else {
        quote(: $retType)
    }
    var funcDef = quote(
        $annotations
        $modifiers $keyword $identifier)
    if (let Some(v) <- generics) {
        funcDef += quote($v)
    }
    funcDef += quote($params $funcType)
    if (let Some(v) <- genConstraints) {
        funcDef += quote($v)
    }

    funcDef + quote({
            $body
        }
    )
}

func createClassDeclaration(
    annotations!: Tokens = Tokens(),
    modifiers!: Tokens = Tokens(),
    keyword!: Tokens = quote(class),
    identifier!: Tokens = Tokens(),
    superTypes!: Tokens = Tokens(),
    body!: Tokens = Tokens()
): Tokens {
    let extendExpression = if (superTypes.size == 0) {
        Tokens()
    } else {
        quote(<: $superTypes)
    }
    quote(
        $annotations
        $modifiers $keyword $identifier $extendExpression {
            $body
        }
    )
}

func createCallExpression(baseFunc!: Tokens = Tokens(), args!: Tokens = Tokens()) {
    quote(
        $baseFunc($args)
    )
}

func createConstructorDeclaration(
    annotations!: Tokens = Tokens(),
    modifiers!: Tokens = Tokens(),
    keyword!: Tokens = quote(init),
    params!: Tokens = Tokens(),
    body!: Tokens = Tokens()
): Tokens {
    quote(
        $annotations
        $modifiers $keyword($params) {
            $body
        }
    )
}
