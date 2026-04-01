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
import std.ast.{
    Tokens, Token, TokenKind, ToTokens,
    Decl, VarDecl, FuncDecl, ClassDecl, PrimaryCtorDecl,
    Expr, RefExpr, MemberAccess, LitConstExpr, FuncType,
    CallExpr, TrailingClosureExpr, IfExpr,
    parseDecl, parseExpr, parseExprFragment,
    diagReport, DiagReportLevel
}

/**
 * UI macro / decorator kind for ArkUI diagnostics and macro-expand checks (state, component, entry, @r, build labels, etc.).
 * Prefer this enum at call sites instead of ad-hoc "@…" strings; use toDisplayString() for messages and match on cases where rules differ.
 */
protected enum UIMacroKind {
    | State
    | Link
    | Prop
    | Provide
    | Consume
    | StorageLink
    | StorageProp
    | LocalStorageLink
    | LocalStorageProp
    | BuilderParam
    | Publish
    | Watch
    | Builder
    | Binder
    | Component
    | Observed
    | CustomDialog
    | Reusable
    | Entry
    | HybridComponentEntry
    /** Resource macros (same package) */
    | R
    | Rawfile
    /**
     * Label for build-body diagnostics (displayed as `'build'` in messages).
     */
    | BuildQuoted
    /** Empty prefix: internal validation where message omits decorator name */
    | Implicit

    /** Diagnostic label shown in macro diagnostic lines (after `MACRO_ERROR_PREFIX`, e.g. `[ArkUI]`). */
    protected func toDisplayString(): String {
        match (this) {
            case State => "@State"
            case Link => "@Link"
            case Prop => "@Prop"
            case Provide => "@Provide"
            case Consume => "@Consume"
            case StorageLink => "@StorageLink"
            case StorageProp => "@StorageProp"
            case LocalStorageLink => "@LocalStorageLink"
            case LocalStorageProp => "@LocalStorageProp"
            case BuilderParam => "@BuilderParam"
            case Publish => "@Publish"
            case Watch => "@Watch"
            case Builder => "@Builder"
            case Binder => "@Binder"
            case Component => "@Component"
            case Observed => "@Observed"
            case CustomDialog => "@CustomDialog"
            case Reusable => "@Reusable"
            case Entry => "@Entry"
            case HybridComponentEntry => "@HybridComponentEntry"
            case R => "@r"
            case Rawfile => "@rawfile"
            case BuildQuoted => "'build'"
            case Implicit => ""
        }
    }
}

/** Log/diag tag for all macro-expand checks in this package (state, @Component, build body, entry, @r, etc.). */
let MACRO_ERROR_PREFIX: String = "[ArkUI]"

/**
 * Smart token extraction for diagnostics: first line only, stop at opening brackets, skip comments/NL, truncate long literals.
 * Callers pass raw `Tokens`; reportError / reportWarning apply this internally.
 */
protected func normalizeTokensForDiagReport(input: Tokens): Tokens {
    if (input.size == 0) {
        return input
    }
    let maxTokenLength: Int64 = 50
    var result = Tokens()
    var i: Int64 = 0
    var lineEnd: Int64 = input.size
    var j: Int64 = 0
    while (j < input.size) {
        if (input[j].kind == TokenKind.NL) {
            lineEnd = j
            break
        }
        j += 1
    }
    while (i < lineEnd && isInsignificantDiagToken(input[i])) {
        i += 1
    }
    if (i >= lineEnd) {
        if (input.size > 0) {
            return Tokens().append(input[0])
        }
        return input
    }
    while (i < lineEnd) {
        let token = input[i]
        if (token.kind == TokenKind.NL) {
            break
        }
        if (isOpeningBracketToken(token)) {
            break
        }
        if (isInsignificantDiagToken(token)) {
            i += 1
            continue
        }
        if (token.value.size > maxTokenLength) {
            let truncatedValue = token.value + " ..."
            result = result.append(Token(token.kind, truncatedValue))
        } else {
            result = result.append(token)
        }
        i += 1
    }
    if (result.size == 0) {
        if (input.size > 0) {
            return Tokens().append(input[0])
        }
        return input
    }
    return result
}

private func isOpeningBracketToken(token: Token): Bool {
    match (token.value) {
        case "{" | "(" | "[" => true
        case _ => false
    }
}

private func isInsignificantDiagToken(token: Token): Bool {
    match (token.kind) {
        case TokenKind.NL | TokenKind.COMMENT => true
        case _ => false
    }
}

/**
 * Resolve hint: explicit override wins; otherwise use `MacroErrorCode.getDefaultHint()` so hints stay
 * centralized in diag_rules.cj alongside each code.
 */
protected func resolveReportHint(code: MacroErrorCode, hintOverride: String): String {
    if (hintOverride.size > 0) {
        return hintOverride
    }
    return code.getDefaultHint()
}

/**
 * Resolve detail: explicit override wins; otherwise use `MacroErrorCode.getDefaultDetail()` when defined.
 */
protected func resolveReportDetail(code: MacroErrorCode, detailOverride: String): String {
    if (detailOverride.size > 0) {
        return detailOverride
    }
    return code.getDefaultDetail()
}

/**
 * Report error (non-fatal, does not interrupt compilation)
 *
 * @param tokens - Raw tokens at the error location (normalization applied internally)
 * @param code - Error code
 * @param macroName - Macro name (e.g. "@State")
 * @param detail - Additional detailed information (optional); empty uses `code.getDefaultDetail()` when defined
 * @param hint - Optional hint; omit or pass empty to use `code.getDefaultHint()` when defined
 */
protected func reportError(tokens: Tokens, code: MacroErrorCode, macroName: String, detail!: String = "",
    hint!: String = ""): Unit {
    let resolvedDetail = resolveReportDetail(code, detail)
    let message = if (macroName.size > 0) {
            buildErrorMessage(code, macroName, resolvedDetail)
        } else {
            buildErrorMessage(code, resolvedDetail)
        }

    let normalized = normalizeTokensForDiagReport(tokens)
    let diagTokens = if (normalized.size == 0) {
        Tokens().append(Token(TokenKind.IDENTIFIER, "unknown"))
    } else {
        normalized
    }

    diagReport(DiagReportLevel.ERROR, diagTokens, message, resolveReportHint(code, hint))
}

/** Same as reportError(tokens, code, macroName, …) with macroName = macroCall.toDisplayString() (UIMacroKind). */
protected func reportError(tokens: Tokens, code: MacroErrorCode, macroCall: UIMacroKind, detail!: String = "",
    hint!: String = ""): Unit {
    reportError(tokens, code, macroCall.toDisplayString(), detail: detail, hint: hint)
}

/**
 * Report warning
 *
 * @param tokens - Raw tokens at the error location (normalization applied internally)
 * @param code - Error code
 * @param macroName - Macro name
 * @param detail - Additional detailed information (optional); empty uses `code.getDefaultDetail()` when defined
 * @param hint - Optional hint; omit or pass empty to use `code.getDefaultHint()` when defined
 */
protected func reportWarning(tokens: Tokens, code: MacroErrorCode, macroName: String, detail!: String = "",
    hint!: String = ""): Unit {
    let message = buildErrorMessage(code, macroName, resolveReportDetail(code, detail))

    let normalized = normalizeTokensForDiagReport(tokens)
    let diagTokens = if (normalized.size == 0) {
        Tokens().append(Token(TokenKind.IDENTIFIER, "unknown"))
    } else {
        normalized
    }

    diagReport(DiagReportLevel.WARNING, diagTokens, message, resolveReportHint(code, hint))
}

protected func reportWarning(tokens: Tokens, code: MacroErrorCode, macroCall: UIMacroKind, detail!: String = "",
    hint!: String = ""): Unit {
    reportWarning(tokens, code, macroCall.toDisplayString(), detail: detail, hint: hint)
}

/**
 * Build error message
 */
func buildErrorMessage(code: MacroErrorCode, macroName: String, detail: String): String {
    var message = "${MACRO_ERROR_PREFIX}: ${macroName} ${code.getErrorMessage()}"
    if (detail.size > 0) {
        message = "${message}, ${detail}"
    }
    return message
}

/**
 * Build error message
 */
func buildErrorMessage(code: MacroErrorCode, detail: String): String {
    var message = "${MACRO_ERROR_PREFIX}: ${code.getErrorMessage()}"
    if (detail.size > 0) {
        message = "${message}, ${detail}"
    }
    return message
}


/**
 * Report error with type conflict details
 */
protected func reportTypeConflict(tokens: Tokens, macroName: String, attrName: String, 
                                expectedType: String, actualType: String): Unit {
    let detail = "attribute '${attrName}' expects type '${expectedType}', but got '${actualType}'"
    reportError(tokens, MacroErrorCode.TypeConflict, macroName, detail: detail)
}

protected func reportTypeConflict(tokens: Tokens, macroCall: UIMacroKind, attrName: String,
    expectedType: String, actualType: String): Unit {
    reportTypeConflict(tokens, macroCall.toDisplayString(), attrName, expectedType, actualType)
}

/**
 * Get original expression token for error reporting
 * Extracts the first meaningful token from expression for precise error location
 * 
 * This function is used to ensure error messages point to user-written code
 * rather than expanded code.
 * 
 * @param expr Original expression
 * @return First meaningful token from the expression
 */
protected func getOriginalExprToken(expr: Expr): Token {
    match (expr) {
        case callExpr: CallExpr =>
            match (callExpr.callFunc) {
                case refExpr: RefExpr => refExpr.identifier
                case memberAccess: MemberAccess => memberAccess.field
                case _ => 
                    if (callExpr.toTokens().size > 0) {
                        callExpr.toTokens()[0]
                    } else {
                        Token(TokenKind.IDENTIFIER, "unknown")
                    }
            }
        case trailingClosureExpr: TrailingClosureExpr =>
            getOriginalExprToken(trailingClosureExpr.expr)
        case memberAccess: MemberAccess =>
            memberAccess.field
        case refExpr: RefExpr =>
            refExpr.identifier
        case _ =>
            if (expr.toTokens().size > 0) {
                expr.toTokens()[0]
            } else {
                Token(TokenKind.IDENTIFIER, "unknown")
            }
    }
}

func parseNodeToComponetName(expr: Expr): String {
    match (expr) {
        case v: CallExpr => return getTrailingClosureExprValue(v.callFunc)
        case v: TrailingClosureExpr => return getTrailingClosureExprValue(v.expr)
        case v: MemberAccess => return v.field.value
        case v: RefExpr => return v.identifier.value
        case v: IfExpr => return "if"
        case _ => return ""
    }
}