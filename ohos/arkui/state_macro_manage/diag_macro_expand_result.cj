/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import std.ast.{Tokens}
import std.deriving.Derive

/**
 * Macro processing result type
 * 
 * Used to encapsulate check results with early exit mechanism:
 * - Success(value): Check succeeded, contains result value
 * - Err(tokens): Check failed, contains original tokens for return
 * 
 * Usage example:
 * ```
 * let result = UISyntaxChecker.expectVarDecl(input, UIMacroKind.State)
 * match (result) {
 *     case Success(varDecl) => // Continue processing
 *     case Err(tokens) => return tokens  // Early exit
 * }
 * ```
 */
protected enum MacroExpandResult<T> {
    | Success(T)
    | Err(Tokens)

    /**
     * Check if successful
     */
    protected func isSuccess(): Bool {
        match (this) {
            case Success(_) => true
            case Err(_) => false
        }
    }

    /**
     * Check if failed
     */
    protected func isErr(): Bool {
        !this.isSuccess()
    }

    /**
     * Get success value, return default value on failure
     */
    protected func unwrapOr(defaultValue: T): T {
        match (this) {
            case Success(v) => v
            case Err(_) => defaultValue
        }
    }

    /**
     * Chain check: execute next check if successful
     */
    protected func andThen<U>(f: (T) -> MacroExpandResult<U>): MacroExpandResult<U> {
        match (this) {
            case Success(v) => f(v)
            case Err(tokens) => MacroExpandResult<U>.Err(tokens)
        }
    }
}