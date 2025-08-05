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
import std.regex.*

public macro Watch(watcher: Tokens, watched: Tokens): Tokens {
    checkWatch(watcher, watched)
    let varDecl = (parseDecl(watched) as VarDecl).getOrThrow()
    let identifier = varDecl.identifier
    let declType = varDecl.declType
    let identifierValue = identifier.value
    if (isMangled(identifierValue)) {
        // @Watch @State var cnt: Int64 = 0
        let originDeclType = generateOriginDeclType(declType.toTokens().toString())
        stateManageHandler.watchDeclare.add((quote($originDeclType), quote($identifier), watcher))
    } else {
        // @State @Watch var cnt: Int64 = 0
        let identTokenAssociated = generateAssociatedToken(identifierValue)
        stateManageHandler.watchDeclare.add((quote($declType), quote($identTokenAssociated), watcher))
    }
    return watched
}

func generateOriginDeclType(typeName: String): Token {
    let regexString = "ObservedProperty < ([a-zA-Z0-9_]*) >"
    let regex = Regex(regexString)
    let matcher = regex.matcher(typeName)
    match (matcher.find()) {
        case Some(value) =>
            if (value.groupNumber() > 0) {
                return Token(TokenKind.IDENTIFIER, value.matchString(1))
            } else {
                return Token(TokenKind.IDENTIFIER, value.matchString())
            }
        case None => return Token(TokenKind.IDENTIFIER, typeName)
    }
}

func isMangled(identifier: String) {
    let regexString = "^stateVarDecl_[a-zA-Z0-9_]*_$"
    let regex = Regex(regexString)
    match (regex.find(identifier)) {
        case None => return false
        case _ => return true
    }
}

func checkWatch(watcher: Tokens, watched: Tokens) {
    let watchFunc = parseExpr(watcher)
    let watchDecl = parseDecl(watched)
    if (!(watchFunc is RefExpr)) {
        diag.error(quote($watchFunc), "@Watch attr should be a ref expression.")
    }
    if (!(watchDecl is VarDecl)) {
        diag.fatal(quote($watchDecl), "@Watch should modify a variable declaration.")
    }
}
