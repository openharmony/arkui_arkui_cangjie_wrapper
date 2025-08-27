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

import std.collection.*
import std.ast.*
import std.ast.Position as AstPosition

class DiagnosticEngine {
    private DiagnosticEngine() {}

    static func getInstance(): DiagnosticEngine {
        diag
    }

    private static func dealPos(input: Tokens): AstPosition {
        var i = 0
        while (i < input.size && input[i].value == Token(TokenKind.NL).value) {
            i++
        }
        if (i == input.size) {
            throw NoneValueException("Error: Tokens is empty.")
        }
        return input[i].pos
    }

    func error(input: Tokens, msg: String): Unit {
        let pos = dealPos(input)
        cache_ += "${pos.fileID}:${pos.line}:${pos.column}: ${ERROR_TAG}: ${msg}\n"
        errorCount_ += 1
    }

    func fatal(input: Tokens, msg: String): Unit {
        let pos = dealPos(input)
        cache_ += "${pos.fileID}:${pos.line}:${pos.column}: ${ERROR_TAG}: ${msg}\n"
        errorCount_ += 1
        this.emit()
    }

    // Emit all diagnose messages collections
    func emit() {
        if (errorCount_ == 0) {
            return
        }
        let msg = "\n${PREFIX} ${errorCount_} error(s)\n${cache_}"
        errorCount_ = 0
        cache_ = ""
        throw IllegalArgumentException(msg)
    }

    private static let diag = DiagnosticEngine()

    private var errorCount_: Int64 = 0

    private var cache_: String = ""

    private let PREFIX: String = "[StateManageMacro]"

    private let ERROR_TAG: String = "error"
}

let diag = DiagnosticEngine.getInstance()
