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

import std.ast.{Tokens, ClassDecl, VarDecl, parseDecl, Token, TokenKind, ToTokens, Expr, MemberAccess, RefExpr, CallExpr, TypeNode, RefType}
import std.unicode.{UnicodeStringExtension}
import std.regex.{Regex}
import std.collection.ArrayList

public macro CustomDialog(input: Tokens): Tokens {
    let finalResult = UISyntaxChecker.expectClassDecl(input, UIMacroKind.CustomDialog)
        .andThen {
            classDecl: ClassDecl => UISyntaxChecker.checkNoInheritance(input, classDecl, UIMacroKind.CustomDialog)
        }.andThen {
            classDecl: ClassDecl => UISyntaxChecker.checkNoConstructor(input, classDecl, UIMacroKind.CustomDialog)
        }

    match(finalResult) {
        case Success(classDecl) =>
            if (!checkCustomDialogController(classDecl)) {
                return input
            }
            let classModifier = classDecl.modifiers
            let classIdent = classDecl.identifier
            let classBody = classDecl.body

            let classBodyAfterExpand = handleClassBody(classBody.decls)
            let initFunc = generateInitFunc(classDecl)
            let aboutTbDeleteFunc = generateAboutToBeDelete(classDecl)
            let updateParamFunc = generateUpdateParam(classDecl)
            let rerenderFunc = handleRerender()
            let purgeVariableFunc = handlePurgeVariable(classDecl)
            let setDialogControllerFunc = handleSetDialogControllerFunc()

            // record state with component and state kind
            STATE_MANAGE_HANDLER.compWithStateInfo.add(classIdent.value, STATE_MANAGE_HANDLER.stateInformation.clone())

            // reset global var declaration in macro
            STATE_MANAGE_HANDLER.clearGlobalInComponent()

            // emit all error in component
            DIAG.emit()

            // generate class after expand.
            return createClassDeclaration(
                modifiers: quote($classModifier),
                identifier: quote($classIdent),
                superTypes: quote($CUSTOM_VIEW),
                body: quote(
                    $classBodyAfterExpand
                    $initFunc
                    $aboutTbDeleteFunc
                    $updateParamFunc
                    $rerenderFunc
                    $purgeVariableFunc
                    $setDialogControllerFunc
                )
            )
        case Err(tokens) => 
            return tokens
    }
}

func checkCustomDialogController(classDecl: ClassDecl): Bool {
    var hasController = false
    for (decl in classDecl.body.decls) {
        match (decl) {
            case varDecl: VarDecl =>
                if (isCustomDialogControllerRelatedVarDecl(varDecl)) {
                    if (!hasController) {
                        STATE_MANAGE_HANDLER.customDialogControllerVarName = varDecl.identifier.value
                        hasController = true
                    }
                    if (!validateCustomDialogControllerVarForCustomDialog(varDecl)) {
                        return false
                    }
                }
            case _ => ()
        }
    }
    if (!hasController) {
        UISyntaxChecker.reportMissingCustomDialogController(quote($classDecl))
        return false
    }
    return true
}

/**
 * Validate CustomDialogController variable declaration for @CustomDialog class.
 * Supports: CustomDialogController, ?CustomDialogController, Option<CustomDialogController>
 * No initializer: warning (should explicitly pass parameter), check passes.
 */
func validateCustomDialogControllerVarForCustomDialog(varDecl: VarDecl): Bool {
    var hasInitializer = false
    try {
        varDecl.expr
        hasInitializer = true
    } catch (e: Exception) {
        hasInitializer = false
    }
    if (!hasInitializer) {
        let identifier = Tokens().append(varDecl.identifier)
        reportWarning(identifier, MacroErrorCode.CustomDialogControllerNeedsInitParam, UIMacroKind.CustomDialog)
        return true
    }
    let expr = varDecl.expr
    match (expr) {
        case memberAccess: MemberAccess =>
            if (isInitExprCustomDialogControllerRelated(expr)) {
                return true
            }
        case _ => ()
    }
    return UISyntaxChecker.validateCustomDialogControllerInitExpr(expr, UIMacroKind.CustomDialog)
}

func handleSetDialogControllerFunc(): Tokens {
    let varName = Token(TokenKind.IDENTIFIER, STATE_MANAGE_HANDLER.customDialogControllerVarName)
    return quote(
        public func setController(value: CustomDialogController) {
            this.$varName = value
        }
    )
}

func isCustomdialogController(typeName: String): Bool {
    let regexString = ##"^(CustomDialogController|ObservedProperty\s<\sCustomDialogController\s>)$"##
    let regex = Regex(regexString)
    match (regex.find(typeName)) {
        case None => return false
        case _ => return true
    }
}

func isCustomdialogControllerOption(typeName: String): Bool {
    let regexString = ##"^(Option\s<\sCustomDialogController\s>|ObservedProperty\s<\sOption\s<\sCustomDialogController\s>\s>)$"##
    let regex = Regex(regexString)
    match (regex.find(typeName)) {
        case None => return false
        case _ => return true
    }
}

/**
 * Check if type is CustomDialogController, ?CustomDialogController, or Option<CustomDialogController>.
 * Used for @CustomDialog class to accept all three forms.
 */
func isCustomDialogControllerRelatedType(typeNode: TypeNode): Bool {
    if (let Some(refType) <- (typeNode as RefType)) {
        if (refType.identifier.value == TYPE_NAME_CUSTOM_DIALOG_CONTROLLER) {
            return true
        }
        if (refType.identifier.value == "Option" && refType.typeArguments.size == 1) {
            return isCustomDialogControllerRelatedType(refType.typeArguments[0])
        }
    }
    return false
}

func isNeeadGenerateCustomDialogOption(varDecl: VarDecl): Bool {
    try {
        return isCustomdialogControllerOption(varDecl.declType.toTokens().toString().trim())
    } catch (e: Exception) {
        return false
    }
}

func isNeeadGenerateCustomDialog(varDecl: VarDecl): Bool {
    try {
        return isCustomdialogController(varDecl.declType.toTokens().toString().trim())
    } catch (e: Exception) {
        return false
    }
}

func isCustomDialogControllerRelatedVarDecl(varDecl: VarDecl): Bool {
    try {
        let declType = varDecl.declType
        if (isCustomDialogControllerRelatedType(declType)) {
            return true
        }
    } catch (e: Exception) {
        ()
    }
    try {
        let expr = varDecl.expr
        return isInitExprCustomDialogControllerRelated(expr)
    } catch (e: Exception) {
        false
    }
}

/**
 * Check if initializer expr infers CustomDialogController-related type.
 * e.g. var a = CustomDialogController(...) or var a = Option<CustomDialogController>.None
 */
func isInitExprCustomDialogControllerRelated(expr: Expr): Bool {
    match (expr) {
        case callExpr: CallExpr =>
            return isInitExprCustomDialogControllerRelated(callExpr.callFunc)
        case memberAccess: MemberAccess =>
            if (memberAccess.field.value == TYPE_NAME_CUSTOM_DIALOG_CONTROLLER) {
                return true
            }
            if (memberAccess.field.value == "None") {
                return isInitExprCustomDialogControllerRelated(memberAccess.baseExpr)
            }
            return false
        case refExpr: RefExpr =>
            let refTypeName = refExpr.identifier.value
            if (refTypeName == TYPE_NAME_CUSTOM_DIALOG_CONTROLLER) {
                return true
            }
            if (refTypeName == "Option") {
                if (refExpr.typeArguments.size == 0) {
                    return true
                }
                if (refExpr.typeArguments.size == 1) {
                    let refType = refExpr.typeArguments[0]
                    if (let Some(ref) <- (refType as RefType)) {
                        return ref.identifier.value == TYPE_NAME_CUSTOM_DIALOG_CONTROLLER
                    }
                }
                return false
            }
            return false
        case _ => false
    }
}
