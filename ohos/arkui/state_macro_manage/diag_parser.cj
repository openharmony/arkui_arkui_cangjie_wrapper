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

import std.ast.{Tokens, ClassDecl, RefExpr, CallExpr, LambdaExpr, Expr, TrailingClosureExpr, MemberAccess,
    Token, Node, IfExpr, Block, VarDecl, FuncDecl, Decl, ToTokens, TokenKind, parseDecl,
    Argument, Modifier, ASTException, LitConstExpr, RefType}
import std.collection.{ArrayList, forEach}

/**
 * ForEach / LazyForEach: keyGeneratorFunc / keyGenerator returns a key string, not UI.
 * Do not run UI subtree validation on that lambda (allows templates, "+", RefExpr, etc.).
 * Positional 3-arg form is typically (data, itemGenerator, keyGenerator).
 */
func isForeachKeyGeneratorLastArg(componentName: String, arguments: ArrayList<Argument>, lastArg: Argument): Bool {
    if (!COMPONENT_TYPE_FOREACH_LIST.contains(componentName)) {
        return false
    }
    let argName = getArgumentIdentifier(lastArg).value
    if (FOREACH_KEY_GENERATOR_ARG_NAMES.contains(argName)) {
        return true
    }
    if (argName == FOREACH_ARG_NAME_POSITIONAL && arguments.size == FOREACH_POSITIONAL_ARG_COUNT_WITH_KEY) {
        return true
    }
    return false
}

func parseClassDeclMemberNodes(classDecl: ClassDecl): Bool {
    var buildFuncDecls = ArrayList<FuncDecl>()
    for(decl in classDecl.body.decls) {
        match(decl) {
            case funcDecl: FuncDecl =>
                if (funcDecl.identifier.value == "build") {
                    buildFuncDecls.add(funcDecl)
                }
            case varDecl: VarDecl =>
                if (!UISyntaxChecker.checkCustomDialogControllerVarDecl(varDecl, UIMacroKind.Implicit)) {
                    return false
                }
            case _ => ()
        }
    }

    if (buildFuncDecls.size == 0) {
        UISyntaxChecker.reportMissingBuild(classDecl.identifier.toTokens())
        return false
    }
    if (buildFuncDecls.size > 1) {
        UISyntaxChecker.reportDuplicateBuild(buildFuncDecls[1].toTokens())
        return false
    }

    if (!parseBuildFunction(buildFuncDecls[0])) {
        return false
    }
    return true
}

func parseBuildFunctionModifier(funcDecl: FuncDecl) {
    if (funcDecl.modifiers.size == 0) {
        funcDecl.modifiers.add(Modifier(Token(TokenKind.PUBLIC)))
        return
    }
    for (modifier in funcDecl.modifiers) {
        if (modifier.keyword.kind == TokenKind.PROTECTED || modifier.keyword.kind == TokenKind.PRIVATE) {
            modifier.keyword = Token(TokenKind.PUBLIC)
            return
        }
    }
}

func parseBuildFunction(funcDecl: FuncDecl): Bool { 
    parseBuildFunctionModifier(funcDecl)
    let result = UISyntaxChecker.checkBuildFunctionAll(funcDecl.block.nodes, funcDecl, getComponentType)
    if (result.isErr()) {
        return false
    }

    if (!parseBuildFuncBodyNode(funcDecl)) {
        return false
    }
    return true
}

func parseBuildFuncBodyNode(funcDecl: FuncDecl, bodyMacroCall!: UIMacroKind = UIMacroKind.BuildQuoted): Bool {
    let inBuilderBody = match(bodyMacroCall) {
        case UIMacroKind.Builder => true
        case _ => false
    }

    for(node in funcDecl.block.nodes) {
        if (let Some(expr) <- (node as Expr)) {
            match(getComponentType(expr)) {
                case BuiltInComponent =>
                    if (!parseBuiltInComponent(expr, inBuilderBody: inBuilderBody)) {
                        return false
                    }  
                case IfComponent =>
                    if (!UISyntaxChecker.checkIfExpr4UI(expr)) {
                        return false
                    }
                    let ifExpr = (expr as IfExpr).getOrThrow()
                    if (!parseIfExprBody(ifExpr, expr, inBuilderBody: inBuilderBody)) {
                        return false
                    }
                case _ =>
                    if (!UISyntaxChecker.checkIsCallExpr(expr, macroCall: bodyMacroCall)) {
                        return false
                    }
            }
        } else {
            return UISyntaxChecker.checkIsExpr(node, macroCall: bodyMacroCall)
        }
    }
    return true
}

/**
 * Validate child components against parent component constraints
 * 
 * @param parentExpr The parent component expression (for error reporting)
 * @param componentName The parent component name
 * @param childNodes The list of child nodes to validate
 * @return true if validation passed (no errors), false if errors were found
 */
func validateChildComponents(parentExpr: Expr, componentName: String, childNodes: ArrayList<Node>): Bool {
    let childCount = childNodes.size
    var hasError = false
    
    // Check if the child components are valid
    for (childComp in childNodes) {
        let childCompExpr = match (childComp as Expr) {
            case Some(expr) => expr
            case None => continue
        }
        let childName = getTrailingClosureExprValue(childCompExpr)

        match (COMPONENT_RULE_REGISTRY.validateComponentConstraints(parentName: componentName, childName: childName,
            childCount: childCount)) {
            case Some(error) =>
                let reportExpr = if (error.errorType == BuiltInComponentErrorType.ForEachNotAllowedInMonadic) {
                    childCompExpr
                } else {
                    parentExpr
                }
                reportComponentConstraintError(reportExpr, error)
                hasError = true
            case None => ()
        }
    }
    return !hasError
}

/**
 * Recursively collect all body nodes from IfExpr (if/else branches, including nested IfExpr)
 */
func collectIfExprBodyNodes(ifExpr: IfExpr): ArrayList<Node> {
    var result = ArrayList<Node>()
    for (node in ifExpr.ifBlock.nodes) {
        result.add(node)
    }
    try {
        match (ifExpr.elseExpr) {
            case nestedIf: IfExpr => result.add(all: collectIfExprBodyNodes(nestedIf))
            case elseBlock: Block =>
                for (node in elseBlock.nodes) {
                    result.add(node)
                }
            case _ => ()
        }
    } catch (e: Exception) {
        ()
    }
    return result
}

/**
 * Parse IfExpr body with parent context for parent-child component validation.
 * Rules: 1) No ForIn inside if; 2) Validate body nodes against parent; 3) Recursively parse each node.
 */
func parseIfExprBody(ifExpr: IfExpr, parentExpr: Expr, parentName!: String = "if",
    inBuilderBody!: Bool = false): Bool {
    if (!UISyntaxChecker.checkIfExpr4UI(ifExpr)) {
        return false
    }
    let bodyNodes = collectIfExprBodyNodes(ifExpr)
    if (!validateChildComponents(parentExpr, parentName, bodyNodes)) {
        return false
    }
    return parseLambdaNodes(bodyNodes, parentExpr, parentName, ancestorParentForValidation: None,
        inBuilderBody: inBuilderBody)
}

func parseLambdaNodes(childNodes: ArrayList<Node>, parentExpr: Expr, parentName: String,
    ancestorParentForValidation!: ?String = None, inBuilderBody!: Bool = false): Bool {
    for (node in childNodes) {
        if (let Some(childExpr) <- (node as Expr)) {
            if (let Some(ifExpr) <- (childExpr as IfExpr)) {
                if (!parseIfExprBody(ifExpr, parentExpr, parentName: parentName, inBuilderBody: inBuilderBody)) {
                    return false
                }
            } else {
                let childName = getTrailingClosureExprValue(childExpr)
                let ancestorForChild = if (COMPONENT_TYPE_FOREACH_LIST.contains(childName)) {
                    Some(parentName)
                } else {
                    ancestorParentForValidation
                }
                if (!parseBuiltInComponent(childExpr, ancestorParentForValidation: ancestorForChild,
                    inBuilderBody: inBuilderBody)) {
                    return false
                }
            }
        } else {
            if (!UISyntaxChecker.checkIsExpr(node)) {
                return false
            }
        }
    }
    return true
}

func parseBuiltInComponent(expr: Expr, ancestorParentForValidation!: ?String = None,
    inBuilderBody!: Bool = false): Bool {
    match(expr) {
        case tce: TrailingClosureExpr =>
            let expr = tce.expr
            let componentName = getTrailingClosureExprValue(expr)
            let childNodes = getChildNodes(tce)
            // @Builder: only when ForEach/LazyForEach is the root of the builder body (no ancestor) skip
            // parent/child rules (item fragment may be injected elsewhere). Nested ForEach still validates.
            let skipForeachTce = inBuilderBody && COMPONENT_TYPE_FOREACH_LIST.contains(componentName) &&
                ancestorParentForValidation.isNone()
            if (!skipForeachTce && !validateChildComponents(expr, componentName, childNodes)) {
                return false
            }
            return parseLambdaNodes(childNodes, expr, componentName,
                ancestorParentForValidation: ancestorParentForValidation, inBuilderBody: inBuilderBody)
        case callExpr: CallExpr =>
            // Check if the last argument is a LambdaExpr (function type parameter)
            // This handles cases like: Text("hello")
            // Note: This is mutually exclusive with TrailingClosureExpr
            let arguments = callExpr.arguments
            if (arguments.size > 0) {
                let lastArgument = arguments[arguments.size - 1]
                let lastExpr = lastArgument.expr
                match (lastExpr as LambdaExpr) {
                    case Some(lambda) =>
                        // Skip if callFunc is MemberAccess and direct member is NOT a component (e.g. onClick) - lambda is callback
                        // Reuse component classification: xx.Text has Text as component; Text("") { xxxx }.onClick has onClick as method
                        match (callExpr.callFunc as MemberAccess) {
                            case Some(memAccess) =>
                                if (!isDirectMemberComponent(memAccess)) {
                                    return parseBuiltInComponent(callExpr.callFunc,
                                        ancestorParentForValidation: ancestorParentForValidation,
                                        inBuilderBody: inBuilderBody)
                                }
                            case None => ()
                        }
                        // Extract component name from call expression
                        let componentName = getTrailingClosureExprValue(callExpr)
                        if (isForeachKeyGeneratorLastArg(componentName, arguments, lastArgument)) {
                            return true
                        }
                        let childNodes = lambda.nodes
                        
                        // For ForEach/LazyForEach under build(): validate itemGenerator (e.g. ListItem) against ancestor (e.g. List).
                        // Under @Builder: skip only if ForEach is root (no ancestor); if nested under Row/List, still validate.
                        let validationParent = if (COMPONENT_TYPE_FOREACH_LIST.contains(componentName) &&
                            ancestorParentForValidation.isSome()) {
                            ancestorParentForValidation.getOrThrow()
                        } else {
                            componentName
                        }
                        let skipForeachItemConstraint = inBuilderBody && COMPONENT_TYPE_FOREACH_LIST.contains(componentName) &&
                            ancestorParentForValidation.isNone()
                        if (!skipForeachItemConstraint && !validateChildComponents(callExpr, validationParent, childNodes)) {
                            return false
                        }
                        let lambdaParentName = if (skipForeachItemConstraint) {
                            componentName
                        } else {
                            validationParent
                        }
                        return parseLambdaNodes(childNodes, callExpr, lambdaParentName,
                            ancestorParentForValidation: ancestorParentForValidation, inBuilderBody: inBuilderBody)
                    case None => 
                        // Last argument is not a LambdaExpr
                        return true
                }
            } 
            // No arguments
            return true
        case memberAccess: MemberAccess =>
            return parseBuiltInComponent(memberAccess.baseExpr, ancestorParentForValidation: ancestorParentForValidation,
                inBuilderBody: inBuilderBody)
        case refExpr: RefExpr =>
            return true
        case ifExpr: IfExpr =>
            // IfExpr as direct child is handled in parseLambdaNodes via parseIfExprBody (with parent context).
            // This case is fallback when IfExpr appears in unexpected context.
            return true
        case _ =>
            UISyntaxChecker.reportInvalidNodeTypeInBuild(expr.toTokens())
            return false
    }
}

func genPropDeclNode(varDecl: VarDecl, stateKind: StateKind): Tokens {
    let mangledNameToken: Token = generateMangledToken(varDecl.identifier.value)
    let propDecl = genPropDecl(varDecl)
    var initializer: Tokens = Tokens()
    try {
        let _ = varDecl.expr 
        match (stateKind) {
            case AppStorageLinkTy =>
                let attrStr = getAppStorageAttrByIdent(mangledNameToken.value)
                initializer = quote(= AppStorage.setAndLink<$(varDecl.declType)>($attrStr, $(varDecl.expr)))
            case AppStoragePropTy =>
                let attrStr = getAppStorageAttrByIdent(mangledNameToken.value)
                initializer = quote(= AppStorage.setAndProp<$(varDecl.declType)>($attrStr, $(varDecl.expr)))
            case LocalStorageLinkTy =>
                let attrStr = getLocalStorageAttrByIdent(mangledNameToken.value)
                localStorageStateInfo.add(
                    (quote($mangledNameToken), quote(getLocalStorage().setAndLink<$(varDecl.declType)>($attrStr, $(varDecl.expr)))))
                return quote(
                    $(varDecl.keyword) $mangledNameToken: $OBSERVED_PROPERTY<$(varDecl.declType)>
                    $propDecl
                )
            case LocalStoragePropTy =>
                let attrStr = getLocalStorageAttrByIdent(mangledNameToken.value)
                localStorageStateInfo.add(
                    (quote($mangledNameToken), quote(getLocalStorage().setAndProp<$(varDecl.declType)>($attrStr, $(varDecl.expr)))))
                return quote(
                    $(varDecl.keyword) $mangledNameToken: $OBSERVED_PROPERTY<$(varDecl.declType)>
                    $propDecl
                )
            case _ => return Tokens()

        }
    } catch (e : ASTException) {
        ()
    }

    return quote(
        private $(varDecl.keyword) $mangledNameToken: $OBSERVED_PROPERTY<$(varDecl.declType)> $initializer
        $propDecl
    )
}


func genPropDeclNode(varDecl: VarDecl): Tokens {
    let mangledNameToken: Token = generateMangledToken(varDecl.identifier.value)
    let propDecl = genPropDecl(varDecl)
    let mangledNameValue = LitConstExpr(quote($(mangledNameToken.value)))
    var initializer: Tokens = Tokens()
    try {
        let _ = varDecl.expr
        initializer = quote(= $OBSERVED_PROPERTY<$(varDecl.declType)>($mangledNameValue, $(varDecl.expr)))
    } catch (e : ASTException) {
        ()
    }
    
    return quote(
        private $(varDecl.keyword) $mangledNameToken: $OBSERVED_PROPERTY<$(varDecl.declType)> $initializer
        $propDecl
    )
}


func genPropDecl(varDecl: VarDecl): Tokens {
    var mangledToken = generateMangledToken(varDecl.identifier.value)
    var valDeclType = varDecl.declType
    let modifiersTokens = Tokens()
    varDecl.modifiers |> forEach<Modifier> {
        modifier: Modifier => modifiersTokens.append(modifier.toTokens())
    }
    let identToken = varDecl.identifier
    return if (varDecl.keyword.value == "var") {
        quote(
            $modifiersTokens mut prop $identToken: $valDeclType
            {
                get() {
                    return this.$mangledToken.get()
                }
                set(v) {
                    this.$mangledToken.set(v)
                }
            }
        )
    } else {
        quote(
            $modifiersTokens prop $identToken: $valDeclType
            {
                get() {
                    return this.$mangledToken.get()
                }
            }
        )
    }
}


/**
 * get children of component
 */
func getChildNodes(input: Expr): ArrayList<Node> {
    match (input) {
        case callExpr: CallExpr =>
            //example: Column {...}.onClick({evt => ...})
            return getChild(callExpr.callFunc)
        case trailingClosureExpr: TrailingClosureExpr =>
            //example: Column { ... }
            let expr = trailingClosureExpr.expr
            let lambdaExpr = trailingClosureExpr.lambdaExpr
            if (isComponent(expr)) {
                return lambdaExpr.nodes
            }
            //example: Column {...}.onClick {evt => ...}
            return getChild(expr)
        case memAccess: MemberAccess =>
            //example: Column {...}.onClick
            return getChild(memAccess.baseExpr)
        case _ => return ArrayList<Node>([])
    }
}

/**
 * Demangle identifier to restore original name.
 * Used when identifier may have been mangled by generateMangledToken (e.g. stateVarDecl_xxx_).
 */
func demangle(identifier: String): String {
    let prefix = "stateVarDecl_"
    let minLen = prefix.size + 1
    if (identifier.size < minLen) { return identifier }
    if (identifier[0..prefix.size] != prefix) { return identifier }
    let lastPos = identifier.size - 1
    if (identifier[lastPos..identifier.size] != "_") { return identifier }
    identifier[prefix.size..lastPos]
}
