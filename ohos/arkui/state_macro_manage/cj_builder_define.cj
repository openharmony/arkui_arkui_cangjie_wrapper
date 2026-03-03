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

import std.ast.{Tokens, CallExpr, MemberAccess, VarDecl, Node, Expr, parseDecl, Token, Visitor, TokenKind, FuncDecl, MatchExpr,
    ASTException, FuncParam, ToTokens, RefType, RefExpr, LambdaExpr, TrailingClosureExpr, Argument, LitConstExpr, parseExpr}
import std.collection.{HashMap, ArrayList}

public macro Builder(input: Tokens): Tokens {
    let decl = parseDecl(input)

    if ((decl as FuncDecl).isNone()) {
        DIAG.fatal(input, "@Builder should decorate function.")
    }
    let funcDecl = (decl as FuncDecl).getOrThrow()

    // check whether the return type is Unit or default
    try {
        let retType = funcDecl.declType
        if (retType.toTokens().toString() != "Unit") {
            DIAG.fatal(input, "The declaration type of the @Builder function should be Unit")
        }
    } catch (e: ASTException) {
        ()
    }

    let modifier = funcDecl.modifiers
    let funcIdent = funcDecl.identifier
    var funcBody = funcDecl.block.nodes
    var generics = None<Tokens>
    try {
        let gen = funcDecl.genericParam
        generics = Some(quote($gen))
    } catch (e: ASTException) {
        ()
    }
    let params = funcDecl.funcParams
    let genConstraints = if (funcDecl.genericConstraint.size != 0) {
        var genCons = Tokens()
        for (i in 0..funcDecl.genericConstraint.size) {
            if (i == 0) {
                genCons += (funcDecl.genericConstraint)[0].toTokens()
            } else {
                genCons += quote(,) + (funcDecl.genericConstraint)[i].toTokens()
            }
        }
        Some(genCons)
    } else {
        None<Tokens>
    }

    // create inner function identifier
    let innerFuncIdent: Token = generateInnerFuncIdent(funcIdent.value)

    // create entry and inner function params
    var entryParam = Tokens()
    var innerParam = Tokens()
    if (params.size != 0) {
        innerParam += quote(thisView: CustomView, )
        entryParam += quote(thisView: CustomView, )
    } else {
        innerParam += quote(thisView: CustomView)
        entryParam += quote(thisView: CustomView)
    }
    for (item in params) {
        innerParam += quote($item)
        entryParam += generateBuilderParam(item)
    }

    // create inner function call's concrete parameters
    var concretes = quote(thisView)
    for (item in params) {
        concretes += generateInnerValues(item)
    }

    // create entry function body
    let entryBody = if (let Some(gen) <- generics) {
        quote(
            ViewBuilder { $innerFuncIdent$gen($concretes) }
        )
    } else {
        quote(
            ViewBuilder { $innerFuncIdent($concretes) }
        )
    }

    STATE_MANAGE_HANDLER.builderSingleInfo.add(funcIdent.value)

    funcBody = bindBuilderCtx(funcBody, quote(thisView))
    let innerFunc = createMethodDeclaration(
        identifier: quote($innerFuncIdent),
        generics: generics,
        params: quote(($innerParam)),
        genConstraints: genConstraints,
        retType: quote(Unit),
        body: generateFuncBody(funcBody, quote(thisView))
    )

    createMethodDeclaration(
        modifiers: quote($modifier),
        identifier: quote($funcIdent),
        generics: generics,
        params: quote(($entryParam)),
        genConstraints: genConstraints,
        retType: quote(ViewBuilder),
        body: innerFunc + quote(
            ) + entryBody
    )
}

func generateBuilderParam(param: FuncParam): Tokens {
    let paramType = param.paramType
    param.paramType = RefType(quote(ObservedProperty<$paramType>))
    try {
        let expr = param.expr
        param.expr = CallExpr(quote(ObservedProperty<$paramType>("", $expr)))
    } catch (e: ASTException) {
        ()
    }
    param.toTokens()
}

func generateInnerValues(param: FuncParam): Tokens {
    let paramId = param.identifier
    if (param.not.value == "!") {
        quote(, $paramId: $paramId.get())
    } else {
        quote(, $paramId.get())
    }
}

func generateInnerFuncIdent(name: String): Token {
    Token(TokenKind.IDENTIFIER, "${name}" + "__inner__")
}

/**
 * Get the base type name from a MemberAccess expression.
 * Recursively traverses the expression chain to find the root type.
 * Returns the type name if found, or empty string if not a type reference.
 */
func getBaseTypeName(expr: Expr): String {
    match (expr) {
        case refExpr: RefExpr => 
            return refExpr.identifier.value
        case memberAccess: MemberAccess => 
            return getBaseTypeName(memberAccess.baseExpr)
        case callExpr: CallExpr => 
            return getBaseTypeName(callExpr.callFunc)
        case trailingClosureExpr: TrailingClosureExpr =>
            return getBaseTypeName(trailingClosureExpr.expr)
        case _ => 
            return ""
    }
}

/**
 * Check if an argument should be skipped (not processed)
 * Skip only for:
 * 1. LitConstExpr (literal constants, e.g., "string")
 * 2. CallExpr with __GenerateResource__() (e.g., __GenerateResource__())
 * All other cases should be processed (RefExpr, LambdaExpr, etc.)
 */
func shouldSkipArgument(expr: Expr): Bool {
    match (expr) {
        case litConst: LitConstExpr => 
            return true  // Skip literal constants like "string"
        case callExpr: CallExpr => 
            // Check if it's __GenerateResource__()
            if (callExpr.callFunc is RefExpr) {
                let refExpr = (callExpr.callFunc as RefExpr).getOrThrow()
                if (refExpr.identifier.value == "__GenerateResource__") {
                    return true  // Skip __GenerateResource__() calls
                }
            }
            return false  // Other CallExpr should be processed
        case _ => 
            return false  // All other types (RefExpr, LambdaExpr, etc.) should be processed
    }
}

/**
 * Check if a function call should be processed based on its type.
 * This provides type safety by ensuring we only transform methods from the correct types.
 */
func isAllowedType(functionName: String, baseTypeName: String): Bool {
    let allowedTypesMap = buildAllowedTypes()
    match (allowedTypesMap.get(functionName)) {
        case Some(allowedTypes) => 
            // Empty list means allow any type (common methods)
            if (allowedTypes.isEmpty()) {
                return true
            }
            // For component-specific methods, require valid type name
            if (baseTypeName == "") {
                return false
            }
            return allowedTypes.contains(baseTypeName)
        case None => 
            // Not in map - backward compatibility, allow it
            return true
    }
}

class VisitBuilder <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    let thisView: Tokens

    init(thisView: Tokens) {
        this.thisView = thisView
    }

    /**
     * Check if an expression already contains a bind(...) call
     * This is used for backward compatibility to avoid processing already-bound expressions
     * Examples:
     * - bind(this.myMenu, this) -> true
     * - { => bind(this.tabBuilder, this)(3, 'pink') } -> true
     */
    func isAlreadyBound(expr: Expr): Bool {
        match (expr) {
            case callExpr: CallExpr => 
                // Check if callFunc is a bind call
                match (callExpr.callFunc) {
                    case refExpr: RefExpr => 
                        // Direct bind call: bind(...)
                        if (refExpr.identifier.value == "bind") {
                            return true
                        }
                    case _ => 
                        // Recursively check nested callFunc (e.g., MemberAccess, nested CallExpr)
                        return isAlreadyBound(callExpr.callFunc)
                }
                return false
            case lambdaExpr: LambdaExpr => return true
                // Check if lambda body contains bind calls
                // Traverse lambda body nodes to find bind calls
            case _ => 
                return false
        }
    }

    /**
     * Check if an expression is Option.None or Option<T>.None
     * Returns true if it is, false otherwise
     */
    func isOptionNone(expr: Expr): Bool {
        match (expr) {
            case memberAccess: MemberAccess => 
                if (memberAccess.field.value == "None") {
                    if (getBaseTypeName(memberAccess.baseExpr) == "Option") {
                        return true
                    }
                }
            case _ => ()
        }
        return false
    }

    /**
     * Check if an expression is Option.Some(...) or Option<CustomBuilder>.Some(...)
     * Returns the inner expression if it is, None otherwise
     */
    func extractOptionSome(expr: Expr): Option<Expr> {
        match (expr) {
            case callExpr: CallExpr => 
                match (callExpr.callFunc) {
                    case memberAccess: MemberAccess => 
                        if (memberAccess.field.value == "Some") {
                            let baseTypeName = getBaseTypeName(memberAccess.baseExpr)
                            if (baseTypeName == "Option") {
                                if (callExpr.arguments.size == 1) {
                                    return Some(callExpr.arguments[0].expr)
                                }
                            }
                        }
                    case _ => ()
                }
            case _ => ()
        }
        return None
    }

    /**
     * Bind a CustomBuilder argument to thisView
     * Supports:
     * 1. Simple references (e.g., this.myMenu)
     * 2. Function calls with parameters (e.g., this.myMenu("A", "B"))
     * 3. Option.Some(...) or Option<CustomBuilder>.Some(...) (e.g., Option.Some(this.myMenu))
     * Maximum 3 parameters are supported for function calls
     */
    func bindArgument(argument: Argument): Unit {
        var expr = argument.expr
        
        // COMPATIBILITY CHECK: Skip if already bound to avoid duplicate processing
        if (isAlreadyBound(expr)) {
            return
        }
        
        // Skip Option.None or Option<T>.None
        if (isOptionNone(expr)) {
            return
        }
        
        // Check if it's Option.Some(...) or Option<CustomBuilder>.Some(...)
        match (extractOptionSome(expr)) {
            case Some(innerExpr) => 
                // It's Option.Some(...), bind the inner expression
                // Create a temporary argument for recursive processing
                var tempArg = Argument()
                tempArg.expr = innerExpr
                bindArgument(tempArg)
                argument.expr = tempArg.expr
                return
            case _ => ()
        }
        
        // Check if the argument is a CallExpr (function call with parameters)
        match (expr) {
            case callExpr: CallExpr => 
                // Limit to maximum 3 parameters
                if (callExpr.arguments.size > 3) {
                    return  // Skip if more than 3 parameters
                }
                let originalCallFunc = callExpr.callFunc
                let originalArgs = callExpr.arguments
                argument.expr = LambdaExpr(quote({ => bind($originalCallFunc, $thisView)($originalArgs) }))
            case _ => 
                // Simple reference case: bind(this.myMenu, thisView)
                argument.expr = CallExpr(quote(bind($expr, $thisView)))
        }
        return
    }

    /**
     * Try to bind constructor arg by parameter name.
     * Returns true if matched by name (bound or skipped), false if no name match.
     */
    func tryBindConstructorArgByName(curNode: CallExpr, typeName: String, paramList: ArrayList<(Int64, String)>, i: Int64): Bool {
        let argName = getArgumentIdentifier(curNode.arguments[i]).value
        if (argName == "") {
            return false
        }
        for ((_, expectedName) in paramList) {
            if (argName == expectedName) {
                bindArgument(curNode.arguments[i])
                return true
            }
        }
        false
    }

    /**
     * Try to bind constructor arg by position index, return true if matched and bound
     */
    func tryBindConstructorArgByIndex(curNode: CallExpr, paramList: ArrayList<(Int64, String)>, i: Int64): Bool {
        for ((index, _) in paramList) {
            if (index == i) {
                bindArgument(curNode.arguments[i])
                return true
            }
        }
        false
    }

    /**
     * Handle constructor calls with CustomBuilder parameters
     */
    func handleConstructorCall(curNode: CallExpr) {
        match (curNode.callFunc as RefExpr) {
            case None => return
            case Some(refExpr) =>
                let typeName = refExpr.identifier.value
                match (buildConstructorParams().get(typeName)) {
                    case None => ()
                    case Some(paramList) =>
                        for (i in 0..curNode.arguments.size) {
                            let matched = tryBindConstructorArgByName(curNode, typeName, paramList, i)
                            if (!matched) {
                                tryBindConstructorArgByIndex(curNode, paramList, i)
                            }
                        }
                }
        }
    }

    /**
     * Handle method with named CustomBuilder parameter (e.g., bindMenu(builder: ...))
     */
    func handleNamedParamMethod(curNode: CallExpr, fieldName: String): Bool {
        if (!buildNamedParam().contains(fieldName)) {
            return false
        }
        let expectedName = buildParamNames().get(fieldName) ?? ""
        for (i in 0..curNode.arguments.size) {
            if (getArgumentIdentifier(curNode.arguments[i]).value == expectedName) {
                bindArgument(curNode.arguments[i])
                return true
            }
        }
        true
    }

    /**
     * Handle method with positional CustomBuilder parameter (e.g., description(...))
     */
    func handlePositionalParamMethod(curNode: CallExpr, fieldName: String): Bool {
        match (buildFunctions().get(fieldName)) {
            case None => false
            case Some(index) =>
                if (index < curNode.arguments.size) {
                    if (fieldName == "title" || fieldName == "tabBar") {
                        return true
                    } else {
                        bindArgument(curNode.arguments[index])
                    }
                }
                true
        }
    }

    /**
     * Handle method with multiple CustomBuilder parameters (e.g., swipeAction(start:, end:))
     */
    func handleMultiParamMethod(curNode: CallExpr, fieldName: String): Unit {
        match (buildMultiParam().get(fieldName)) {
            case None => ()
            case Some(paramList) =>
                for (i in 0..curNode.arguments.size) {
                    let argName = getArgumentIdentifier(curNode.arguments[i]).value
                    for ((_, expectedName) in paramList) {
                        if (argName == expectedName) {
                            bindArgument(curNode.arguments[i])
                            break
                        }
                    }
                }
        }
    }

    /**
     * Handle method calls with CustomBuilder parameters
     */
    func handleMethodCall(curNode: CallExpr) {
        match (curNode.callFunc as MemberAccess) {
            case None => return
            case Some(ma) =>
                let fieldName = ma.field.value
                if (!isAllowedType(fieldName, getBaseTypeName(ma.baseExpr))) {
                    return
                }
                if (handleNamedParamMethod(curNode, fieldName)) {
                    return
                }
                if (handlePositionalParamMethod(curNode, fieldName)) {
                    return
                }
                handleMultiParamMethod(curNode, fieldName)
        }
    }

    protected override func visit(curNode: CallExpr) {
        handleConstructorCall(curNode)
        handleMethodCall(curNode)
    }

    protected override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

func bindBuilderCtx(input: ArrayList<Node>, thisView: Tokens): ArrayList<Node> {
    if (input.isEmpty()) {
        return input
    }
    input[0] = match (input[0]) {
        case value: Expr =>
            value.traverse(VisitBuilder(thisView))
            value
        case _ => input[0]
    }
    return input
}
