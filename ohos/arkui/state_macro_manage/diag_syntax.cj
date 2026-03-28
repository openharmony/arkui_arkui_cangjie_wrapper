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

import std.ast.{Tokens, Token, TokenKind, ToTokens,
    Decl, VarDecl, FuncDecl, ClassDecl, PrimaryCtorDecl, Modifier,
    Expr, RefExpr, MemberAccess, LitConstExpr, FuncType,
    Node, IfExpr, Block, ForInExpr, parseDecl, parseExpr, parseExprFragment,
    diagReport, DiagReportLevel, PrimitiveType, assertParentContext, insideParentContext,
    Visitor, CallExpr, RefType, TypeNode
}
import std.collection.{HashMap, ArrayList, HashSet}
import std.deriving.Derive
import std.unicode.{UnicodeStringExtension}

/**
 * Component type for checking build function and @Builder function
 */
protected enum ComponentType {
    | BuiltInComponent      // Built-in component (e.g. Text, Column, Row)
    | CustomComponent      // Custom component (decorated with @Component)
    | IfComponent          // If expression
    | BuilderComponent     // Builder function component
    | MethodCall           // Method call (not a component)
    | ...
}

/**
 * UISyntax checker
 * 
 * Provides common check functions, all functions:
 * 1. Return MacroExpandResult<T> type
 * 2. Automatically call diagReport to report error on check failure
 * 3. Receive `macroCall: UIMacroKind` for error-message labeling
 */
protected class UISyntaxChecker {
    /**
     * Check if not in @Entry decorated component
     * This function checks if the current context is inside an @Entry decorated component.
     * 
     * @param input - The tokens at the error location
     * @param macroCall - Which UI macro is being checked (UIMacroKind)
     */
    protected static func checkNotInEntry(input: Tokens, macroCall: UIMacroKind): Bool {
        if (insideParentContext(MACRO_PARENT_CONTEXT_ENTRY)) {
            reportError(input, MacroErrorCode.NotAllowedInEntry, macroCall)
            return false
        }
        return true
    }

    /**
     * Check must be inside @Observed decorated class
     * Applicable to: @Publish
     */
    protected static func checkMustBeInObserved(input: Tokens, macroCall: UIMacroKind): Bool {
        if (!insideParentContext(MACRO_PARENT_CONTEXT_OBSERVED)) {
            reportError(input, MacroErrorCode.MustBeInObserved, macroCall)
            return false
        }
        true
    }

    /**
     * Check must be inside @Component decorated class
     * Applicable to: @Binder, @BuilderParam, etc.
     * Note: In current Cangjie ArkUI, only Refresh/RefreshOptions(refreshing:) accepts Bindable<Bool>; @Binder
     * expands to Bindable and is used there. Other components (e.g. TextInput text: ResourceStr) do not take Bindable.
     */
    protected static func checkMustBeInComponent(input: Tokens, macroCall: UIMacroKind): MacroExpandResult<Unit> {
        if (!insideParentContext(MACRO_PARENT_CONTEXT_COMPONENT)) {
            reportError(input, MacroErrorCode.MustBeInComponent, macroCall)
            return MacroExpandResult<Unit>.Err(input)
        }
        MacroExpandResult<Unit>.Success(())
    }
    
    /**
     * Expect variable declaration
     * Applicable to: @State, @Link, @Prop, @Provide, @Consume, @StorageLink, @StorageProp, etc.
     */
    protected static func expectVarDecl(input: Tokens, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        match (macroCall) {
            case Publish =>
                if (!UISyntaxChecker.checkMustBeInObserved(input, macroCall)) {
                    return MacroExpandResult<VarDecl>.Err(input)
                }
            case _ =>
                if (!insideParentContext(MACRO_PARENT_CONTEXT_COMPONENT) &&
                    !insideParentContext(MACRO_PARENT_CONTEXT_CUSTOM_DIALOG)) {
                    reportError(input, MacroErrorCode.MustBeInComponent, macroCall)
                    return MacroExpandResult<VarDecl>.Err(input)
                }
        }
        try {
            let decl = parseDecl(input)
            match (decl as VarDecl) {
                case Some(varDecl) => MacroExpandResult<VarDecl>.Success(varDecl)
                case None =>
                    reportError(input, MacroErrorCode.ExpectVarDecl, macroCall)
                    return MacroExpandResult<VarDecl>.Err(input)
            }
        } catch (e: Exception) {
            return MacroExpandResult<VarDecl>.Err(input)
        }
    }

    /**
     * Check if state variable type is FuncType, Any, or ArkTS controller/scroller/canvas types, report warning if so.
     * Applicable to: @State, @Link, @Prop, @Provide, @Consume, @StorageLink, @StorageProp, @Publish, @Watch
     */
    protected static func checkUnrecommendedStateType(varDecl: VarDecl, macroCall: UIMacroKind): Unit {
        try {
            let declType = varDecl.declType
            match (declType as FuncType) {
                case Some(_) =>
                    reportWarning(declType.toTokens(), MacroErrorCode.UnrecommendedStateType, macroCall)
                case None =>
                    let typeStr = declType.toTokens()[0].value
                    if (typeStr == "Any") {
                        reportWarning(declType.toTokens(), MacroErrorCode.UnrecommendedStateType, macroCall)
                    } else if (UNRECOMMENDED_STATE_TYPE_NAMES.contains(typeStr)) {
                        reportWarning(declType.toTokens(), MacroErrorCode.UnrecommendedStateType, macroCall)
                    } else {
                        match (declType as RefType) {
                            case Some(refType) =>
                                if (refType.identifier.value == "Option" && refType.typeArguments.size == 1) {
                                    let innerType = refType.typeArguments[0]
                                    match (innerType as RefType) {
                                        case Some(innerRef) =>
                                            if (UNRECOMMENDED_STATE_TYPE_NAMES.contains(innerRef.identifier.value)) {
                                                reportWarning(declType.toTokens(), MacroErrorCode.UnrecommendedStateType, macroCall)
                                            }
                                        case None => ()
                                    }
                                }
                            case None => ()
                        }
                    }
            }
        } catch (e: Exception) {
            // Skip type check on parse failure
        }
    }

    protected static func checkVarDeclType(input: Tokens, varDecl: VarDecl, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        try {
            varDecl.declType
            checkUnrecommendedStateType(varDecl, macroCall)
            return MacroExpandResult<VarDecl>.Success(varDecl)
        } catch (e: Exception) {
            match (varDecl.expr) {
                    case v: LitConstExpr => match (v.literal.kind) {
                        case STRING_LITERAL =>
                            varDecl.declType = RefType(quote(String))
                            return MacroExpandResult<VarDecl>.Success(varDecl)
                        case BOOL_LITERAL =>
                            varDecl.declType = PrimitiveType(quote(Bool))
                            return MacroExpandResult<VarDecl>.Success(varDecl)
                        case FLOAT_LITERAL =>
                            varDecl.declType = PrimitiveType(quote(Float64))
                            return MacroExpandResult<VarDecl>.Success(varDecl)
                        case INTEGER_LITERAL =>
                            varDecl.declType = PrimitiveType(quote(Int64))
                            return MacroExpandResult<VarDecl>.Success(varDecl)
                        case CHAR_LITERAL =>
                            varDecl.declType = PrimitiveType(quote(Rune))
                            return MacroExpandResult<VarDecl>.Success(varDecl)
                        case _ => reportError(input, MacroErrorCode.NullInitType, macroCall)
                            return MacroExpandResult<VarDecl>.Err(input)
                    }
                    case _ => reportError(input, MacroErrorCode.NullInitType, macroCall)
                            return MacroExpandResult<VarDecl>.Err(input)
            }
        }
    }

    /**
     * Expect function declaration
     * Applicable to: @Builder, etc.
     */
    protected static func expectFuncDecl(input: Tokens, macroCall: UIMacroKind): MacroExpandResult<FuncDecl> {
        try {
            let decl = parseDecl(input)
            match (decl as FuncDecl) {
                case Some(funcDecl) => MacroExpandResult<FuncDecl>.Success(funcDecl)
                case None =>
                    reportError(input, MacroErrorCode.ExpectFuncDecl, macroCall)
                    MacroExpandResult<FuncDecl>.Err(input)
            }
        } catch (e: Exception) {
            // Parse failed
            MacroExpandResult<FuncDecl>.Err(input)
        }
    }

    /**
     * Check if expression for UI component syntax
     * 
     * Rules:
     * 1. ForIn expression is not allowed inside If expression (including deeply nested if expressions)
     * 
     * Uses std.ast.Visitor pattern (IfExprForInChecker) for comprehensive AST traversal:
     * - visit(IfExpr) recursively traverses ifBlock.nodes and elseExpr (Block or nested IfExpr)
     * - expr_.traverse(this) continues recursion into child expressions
     * - breakTraverse() stops traversal on error
     * 
     * Parent-child component validation and other syntax checks are performed in
     * diag_parser.parseIfExprBody() which calls this method.
     * 
     * @param expr - The if expression to check
     * @return true if valid, false if errors found
     */
    protected static func checkIfExpr4UI(expr: Expr): Bool {
        let ifExpr = match (expr as IfExpr) {
            case Some(ifExpr) => ifExpr
            case None => return true  // Not an IfExpr, skip check
        }
        
        // Use Visitor to check for ForInExpr (similar to IfExprBodyVisitor)
        let visitor = IfExprForInChecker()
        visitor.visit(ifExpr)
        return !visitor.hasError
    }

    /**
     * Expect class declaration
     * Applicable to: @Component, @Observed, @CustomDialog, @Entry
     */
    protected static func expectClassDecl(input: Tokens, macroCall: UIMacroKind): MacroExpandResult<ClassDecl> {
        try {
            let decl = parseDecl(input)
            match (decl as ClassDecl) {
                case Some(classDecl) => MacroExpandResult<ClassDecl>.Success(classDecl)
                case None =>
                    reportError(input, MacroErrorCode.ExpectClassDecl, macroCall)
                    MacroExpandResult<ClassDecl>.Err(input)
            }
        } catch (e: Exception) {
            // Parse failed
            MacroExpandResult<ClassDecl>.Err(input)
        }
    }

    /**
     * Expect reference expression
     * Applicable to: @Binder
     */
    protected static func expectRefExpr(input: Tokens, macroCall: UIMacroKind): MacroExpandResult<RefExpr> {
        try {
            let expr = parseExpr(input)
            match (expr as RefExpr) {
                case Some(refExpr) => MacroExpandResult<RefExpr>.Success(refExpr)
                case None =>
                    reportError(input, MacroErrorCode.ExpectRefExpr, macroCall)
                    MacroExpandResult<RefExpr>.Err(input)
            }
        } catch (e: Exception) {
            MacroExpandResult<RefExpr>.Err(input)
        }
    }

    /**
     * Check variable has initializer
     * Applicable to: @State, @Provide, @StorageLink, @StorageProp
     */
    protected static func checkHasInitializer(input: Tokens, varDecl: VarDecl, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        try {
            let _ = varDecl.expr  // Try to access initializer
            MacroExpandResult<VarDecl>.Success(varDecl)
        } catch (e: Exception) {
            reportError(input, MacroErrorCode.MissingInitializer, macroCall)
            MacroExpandResult<VarDecl>.Err(input)
        }
    }

    /**
     * Check variable has no initializer
     * Applicable to: @Link
     */
    protected static func checkNoInitializer(input: Tokens, varDecl: VarDecl, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        try {
            let _ = varDecl.expr  // Try to access initializer
            // has initializer, report error
            reportError(input, MacroErrorCode.UnexpectedInitializer, macroCall)
            MacroExpandResult<VarDecl>.Err(input)
        } catch (e: Exception) {
            // Access failed means no initializer, as expected
            MacroExpandResult<VarDecl>.Success(varDecl)
        }
    }

    /**
     * Check variable has no modifiers.
     */
    protected static func checkNoModifiersFatal(input: Tokens, varDecl: VarDecl, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        if (varDecl.modifiers.size != 0) {
            reportError(varDecl.modifiers.toTokens(), MacroErrorCode.UnexpectedModifier, macroCall)
            return MacroExpandResult<VarDecl>.Err(input)
        }
        MacroExpandResult<VarDecl>.Success(varDecl)
    }

    /**
     * Check @StorageLink decorated variable does not use let modifier.
     * @StorageLink requires var for two-way binding.
     */
    protected static func checkStorageLinkNoLet(input: Tokens, varDecl: VarDecl, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        if (varDecl.keyword.kind == TokenKind.LET) {
            reportError(Tokens().append(varDecl.keyword), MacroErrorCode.StorageLinkLetNotAllowed, macroCall)
            return MacroExpandResult<VarDecl>.Err(input)
        }
        MacroExpandResult<VarDecl>.Success(varDecl)
    }

    /**
     * Check @Publish decorated variable uses var modifier.
     * @Publish requires var for mutable state.
     */
    protected static func checkPublishRequiresVar(input: Tokens, varDecl: VarDecl, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        if (varDecl.keyword.kind == TokenKind.LET) {
            reportError(Tokens().append(varDecl.keyword), MacroErrorCode.PublishLetNotAllowed, macroCall)
            return MacroExpandResult<VarDecl>.Err(input)
        }
        MacroExpandResult<VarDecl>.Success(varDecl)
    }

    /**
     * Check @StorageProp decorated variable does not use var modifier.
     * @StorageProp requires let for one-way binding.
     */
    protected static func checkStoragePropNoVar(input: Tokens, varDecl: VarDecl, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        if (varDecl.keyword.kind == TokenKind.VAR) {
            reportError(Tokens().append(varDecl.keyword), MacroErrorCode.StoragePropVarNotAllowed, macroCall)
            return MacroExpandResult<VarDecl>.Err(input)
        }
        MacroExpandResult<VarDecl>.Success(varDecl)
    }

    /**
     * Check attribute is string literal
     * Applicable to: @Provide["name"], @StorageLink["name"], @LocalStorageLink["name"]
     */
    protected static func checkStringLiteralAttr(attr: Tokens, macroCall: UIMacroKind): MacroExpandResult<String> {
        if (attr.size == 0) {
            return MacroExpandResult<String>.Err(attr)
        }
        try {
            let expr = parseExpr(attr)
            return match (expr as LitConstExpr) {
                case Some(litExpr) where litExpr.literal.kind == TokenKind.STRING_LITERAL =>
                    MacroExpandResult<String>.Success(litExpr.literal.value)
                case _ =>
                    reportError(attr, MacroErrorCode.InvalidAttributeType, macroCall)
                    MacroExpandResult<String>.Err(attr)
            }
        } catch (e: Exception) {
            MacroExpandResult<String>.Err(attr)
        }
    }

    /**
     * Check storage attribute validity
     * Check attribute is literal and of string type
     */
    protected static func checkStorageAttr(attr: Tokens, macroCall: UIMacroKind): MacroExpandResult<String> {
        try {
            let expr = parseExpr(attr)
            // Check if it's literal
            if (!(expr is LitConstExpr)) {
                reportError(attr, MacroErrorCode.InvalidAttributeType, macroCall)
                return MacroExpandResult<String>.Err(attr)
            }

            match (expr as LitConstExpr) {
                case Some(litExpr) =>
                    // Check if it's string type
                    if (litExpr.literal.kind != TokenKind.STRING_LITERAL) {
                        reportError(attr, MacroErrorCode.InvalidAttributeType, macroCall)
                        return MacroExpandResult<String>.Err(attr)
                    }
                    MacroExpandResult<String>.Success(litExpr.literal.value)
                case None =>
                    reportError(attr, MacroErrorCode.InvalidAttributeType, macroCall)
                    MacroExpandResult<String>.Err(attr)
            }
        } catch (e: Exception) {
            MacroExpandResult<String>.Err(attr)
        }
    }

    /**
     * Check function return type is Unit
     * Applicable to: @Builder
     */
    protected static func checkReturnTypeUnit(funcDecl: FuncDecl, input: Tokens, macroCall: UIMacroKind): MacroExpandResult<FuncDecl> {
        try {
            let retType = funcDecl.declType
            if (retType.toTokens().toString() != "Unit") {
                reportError(input, MacroErrorCode.InvalidReturnType, macroCall)
                return MacroExpandResult<FuncDecl>.Err(input)
            }
        } catch (e: Exception) {
            // No explicit return type, defaults to Unit, as expected
        }
        MacroExpandResult<FuncDecl>.Success(funcDecl)
    }

    /**
     * Check type conflict
     * For Storage type variables, same-name properties must be of same type
     * 
     * @param attrName Attribute name (e.g. "count")
     * @param newType New type string
     * @param typeMap Existing type mapping
     * @param tokens Position for error reporting
     * @param macroCall Which macro is being diagnosed (UIMacroKind)
     */
    protected static func checkTypeConflict(
        attrName: String, 
        newType: String, 
        typeMap: HashMap<String, String>,
        tokens: Tokens,
        macroCall: UIMacroKind
    ): MacroExpandResult<Unit> {
        match (typeMap.get(attrName)) {
            case Some(existingType) =>
                if (existingType != newType) {
                    reportTypeConflict(tokens, macroCall, attrName, existingType, newType)
                    return MacroExpandResult<Unit>.Err(tokens)
                }
            case None => ()  // First use, no conflict
        }
        MacroExpandResult<Unit>.Success(())
    }

    /**
     * Check class has no inheritance
     */
    protected static func checkNoInheritance(input: Tokens, classDecl: ClassDecl, macroCall: UIMacroKind): MacroExpandResult<ClassDecl> {
        if (classDecl.superTypes.size > 0) {
            reportError(input, MacroErrorCode.InvalidInheritance, macroCall)
            return MacroExpandResult<ClassDecl>.Err(input)
        }
        MacroExpandResult<ClassDecl>.Success(classDecl)
    }

    /**
     * Check class has no open modifier
     * @Observed class cannot be open (not allowed for inheritance)
     */
    protected static func checkNoOpenModifier(input: Tokens, classDecl: ClassDecl, macroCall: UIMacroKind): MacroExpandResult<ClassDecl> {
        for (modifier in classDecl.modifiers) {
            if (modifier.keyword.kind == TokenKind.OPEN) {
                reportError(modifier.toTokens(), MacroErrorCode.OpenModifierNotAllowed, macroCall)
                return MacroExpandResult<ClassDecl>.Err(input)
            }
        }
        MacroExpandResult<ClassDecl>.Success(classDecl)
    }

    /**
     * Check class has no constructor
     * Return Err on finding first constructor
     */
    protected static func checkNoConstructor(input: Tokens, classDecl: ClassDecl, macroCall: UIMacroKind): MacroExpandResult<ClassDecl> {
        for (decl in classDecl.body.decls) {
            if (decl is PrimaryCtorDecl) {
                reportError(decl.toTokens(), MacroErrorCode.InvalidConstructor, macroCall)
                return MacroExpandResult<ClassDecl>.Err(input)
            }
            match (decl as FuncDecl) {
                case Some(funcDecl) where funcDecl.identifier.value == "init" =>
                    reportError(decl.toTokens(), MacroErrorCode.InvalidConstructor, macroCall)
                    return MacroExpandResult<ClassDecl>.Err(input)
                case _ => ()
            }
        }
        MacroExpandResult<ClassDecl>.Success(classDecl)
    }

    /**
     * Check no duplicate member names (variables) in class body.
     * Applicable to: @Component, @Observed
     */
    protected static func checkNoDuplicateMemberNames(
        input: Tokens, classDecl: ClassDecl, macroCall: UIMacroKind): MacroExpandResult<ClassDecl> {
        var seenNames = HashSet<String>()
        for (decl in classDecl.body.decls) {
            var memberName: Option<String> = None
            match (decl as VarDecl) {
                case Some(varDecl) => memberName = Some(demangle(varDecl.identifier.value))
                case None => ()
            }
            match (memberName) {
                case Some(name) =>
                    if (seenNames.contains(name)) {
                        reportError(classDecl.toTokens(), MacroErrorCode.DuplicateMemberName, macroCall)
                        return MacroExpandResult<ClassDecl>.Err(input)
                    }
                    seenNames.add(name)
                case None => ()
            }
        }
        MacroExpandResult<ClassDecl>.Success(classDecl)
    }

    /**
     * Check custom component name does not conflict with built-in component names
     * @Component class identifier cannot be the same as built-in component names
     * @param builtInNames Array of built-in component names (e.g. MACRO_EXPAND_COMPONENTS)
     */
    protected static func checkComponentNameNotBuiltIn(input: Tokens, classDecl: ClassDecl, macroCall: UIMacroKind,
        builtInNames: Array<String>): MacroExpandResult<ClassDecl> {
        let compName = classDecl.identifier.value
        if (builtInNames.contains(compName)) {
            reportDuplicateBuiltInComponentName(Tokens().append(classDecl.identifier), macroCall)
            return MacroExpandResult<ClassDecl>.Err(input)
        }
        MacroExpandResult<ClassDecl>.Success(classDecl)
    }

    /**
     * Check variable type is function type and return type is Unit
     * Applicable to: @BuilderParam
     */
    protected static func checkIsFuncType(varDecl: VarDecl, input: Tokens, macroCall: UIMacroKind): MacroExpandResult<VarDecl> {
        try {
            let declType = varDecl.declType
            match (declType as FuncType) {
                case Some(funcType) =>
                    try {
                        let retType = funcType.returnType
                        if (retType.toTokens().toString() != "Unit") {
                            reportError(input, MacroErrorCode.InvalidReturnType, macroCall)
                            return MacroExpandResult<VarDecl>.Err(input)
                        }
                    } catch (e: Exception) {
                        // No return type, defaults to Unit
                    }
                    MacroExpandResult<VarDecl>.Success(varDecl)
                case None =>
                    reportError(input, MacroErrorCode.ExpectFuncType, macroCall)
                    MacroExpandResult<VarDecl>.Err(input)
            }
        } catch (e: Exception) {
            reportError(input, MacroErrorCode.ExpectSpecificType, macroCall)
            MacroExpandResult<VarDecl>.Err(input)
        }
    }

    /**
     * Check @Watch attribute is valid function name reference
     * Applicable to: @Watch
     */
    protected static func checkWatchAttr(attr: Tokens, macroCall: UIMacroKind): Bool {
        try {
            let expr = parseExpr(attr)
            match (expr as RefExpr) {
                case Some(refExpr) => true
                case None =>
                    reportError(attr, MacroErrorCode.ExpectRefExpr, macroCall)
                    false
            }
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Check @Binder expression is RefExpr or MemberAccess
     * Applicable to: @Binder
     */
    protected static func checkBinderExpr(input: Tokens, macroCall: UIMacroKind): MacroExpandResult<Expr> {
        try {
            let expr = parseExpr(input)
            match (expr) {
                case refExpr: RefExpr => 
                    MacroExpandResult<Expr>.Success(refExpr)
                case memberAccess: MemberAccess =>
                    // Check if baseExpr is 'this'
                    match (memberAccess.baseExpr as RefExpr) {
                        case Some(baseRef) =>
                            if (baseRef.identifier.value == "this") {
                                return MacroExpandResult<Expr>.Success(memberAccess)
                            }
                        case None => ()
                    }
                    MacroExpandResult<Expr>.Success(memberAccess)
                case _ =>
                    reportError(input, MacroErrorCode.ExpectRefOrMemberAccess, macroCall)
                    MacroExpandResult<Expr>.Err(input)
            }
        } catch (e: Exception) {
            MacroExpandResult<Expr>.Err(input)
        }
    }

    /**
     * Check expression is CallExpr
     * Applicable to: build method component syntax checking
     * 
     * @param expr - The expression to check
     */
    protected static func checkIsCallExpr(expr: Expr): Bool {
        match (expr as CallExpr) {
            case Some(callExpr) => true
            case None =>
                reportError(expr.toTokens(), MacroErrorCode.ExpectCallExpr, UIMacroKind.BuildQuoted)
                false
        }
    }

    /**
     * Check node is Expr
     * Applicable to: build method body content checking
     * 
     * @param node - The node to check
     */
    protected static func checkIsExpr(node: Node): Bool {
        match (node as Expr) {
            case Some(_) => true  // Valid expression
            case None =>
                reportError(
                    node.toTokens(),
                    MacroErrorCode.InvalidNodeType,
                    UIMacroKind.BuildQuoted
                )
                false
        }
    }

    /**
     * Check Entry uniqueness
     * Only one @Entry per file
     */
    protected static func checkUniqueEntry(
        token: Token, 
        entryFileIds: HashSet<UInt32>,
        input: Tokens
    ): MacroExpandResult<Token> {
        let fileId = token.pos.fileID
        if (entryFileIds.contains(fileId)) {
            reportError(input, MacroErrorCode.DuplicateEntry, UIMacroKind.Entry)
            return MacroExpandResult<Token>.Err(input)
        }
        entryFileIds.add(fileId)
        MacroExpandResult<Token>.Success(token)
    }

    /**
     * Check LocalStorage attribute: both single ["name"] and InterOp ["name", InterOp].
     * Replaces isLocalStorageInterOp + checkStorageAttr + checkLocalStorageInterOpAttr.
     *
     * Returns: (isInterOp: Bool, key: String) when valid; reports error and returns Err when invalid.
     *
     * Valid formats:
     * - Single: ["name"] → (false, "name")
     * - InterOp: ["name", InterOp] → (true, "name")
     *
     * Invalid: wrong format, non-string first element, parse failure, etc.
     */
    protected static func checkLocalStorageAttr(attr: Tokens, macroCall: UIMacroKind): MacroExpandResult<(Bool, String)> {
        try {
            var e: Expr
            var p: Int64
            (e, p) = parseExprFragment(attr)
            match (e as LitConstExpr) {
                case Some(litExpr) where litExpr.literal.kind == TokenKind.STRING_LITERAL =>
                    let key = litExpr.literal.value
                    let hasComma = p < attr.size && attr[p].kind == TokenKind.COMMA
                    let hasInterOp = p + 1 < attr.size && attr[p + 1].value == "InterOp"
                    if (!hasComma && !hasInterOp) {
                        return MacroExpandResult<(Bool, String)>.Success((false, key))
                    }
                    if (hasComma && hasInterOp) {
                        return MacroExpandResult<(Bool, String)>.Success((true, key))
                    }
                    reportError(attr, MacroErrorCode.InvalidAttributeFormat, macroCall)
                    MacroExpandResult<(Bool, String)>.Err(attr)
                case _ =>
                    reportError(attr, MacroErrorCode.InvalidAttributeType, macroCall)
                    MacroExpandResult<(Bool, String)>.Err(attr)
            }
        } catch (e: Exception) {
            MacroExpandResult<(Bool, String)>.Err(attr)
        }
    }

    /**
     * Validate expr is CallExpr and has valid CustomDialogController(...) format.
     * Shared by @Component and @CustomDialog.
     */
    protected static func validateCustomDialogControllerInitExpr(expr: Expr, macroCall: UIMacroKind): Bool {
        match (expr as CallExpr) {
            case None =>
                reportError(expr.toTokens(), MacroErrorCode.CustomDialogControllerInvalidInitFormat, macroCall)
                return false
            case Some(callExpr) =>
                return validateCustomDialogControllerCallExpr(callExpr, macroCall)
        }
    }

    /**
     * Validate CustomDialogController(CustomDialogControllerOptions(...)) call expression format.
     * Shared by @Component and @CustomDialog.
     */
    protected static func validateCustomDialogControllerCallExpr(callExpr: CallExpr, macroCall: UIMacroKind): Bool {
        let callfunc = callExpr.callFunc
        if (!isCustomdialogController(callfunc.toTokens().toString().trim())) {
            reportError(callfunc.toTokens(), MacroErrorCode.CustomDialogControllerInvalidConstructor, macroCall)
            return false
        }
        let params = callExpr.arguments
        if (params.size != 1) {
            reportError(params[params.size-1].toTokens(), MacroErrorCode.CustomDialogControllerInvalidOptionsArg, macroCall)
            return false
        }
        let options = params[0].expr
        match (options as CallExpr) {
            case None =>
                reportError(options.toTokens(), MacroErrorCode.CustomDialogControllerOptionsRequired, macroCall)
                return false
            case Some(optionsCallExpr) =>
                let optionsParams = optionsCallExpr.arguments
                if (optionsParams.size == 0) {
                    reportError(optionsCallExpr.toTokens(), MacroErrorCode.CustomDialogControllerOptionsMustContainBuilder, macroCall)
                    return false
                }
                match (optionsParams[0].expr as CallExpr) {
                    case None =>
                        reportError(optionsParams[0].toTokens(), MacroErrorCode.CustomDialogControllerOptionsMustContainBuilder, macroCall)
                        return false
                    case _ => return true
                }
        }
    }

    /**
     * Check CustomDialogController variable declaration syntax for @Component.
     * Valid format: var x: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(builder: MyDialog()))
     *
     * Rules:
     * 1. Must have initializer
     * 2. Initializer must be CallExpr (CustomDialogController(...))
     * 3. Single argument: CustomDialogControllerOptions(...)
     * 4. CustomDialogControllerOptions first arg must be Builder call (e.g. MyDialog())
     */
    protected static func checkCustomDialogControllerVarDecl(varDecl: VarDecl, macroCall: UIMacroKind): Bool {
        if (!isNeeadGenerateCustomDialog(varDecl)) {
            return true
        }
        var hasInitializer = false
        try {
            varDecl.expr
            hasInitializer = true
        } catch (e: Exception) {
            hasInitializer = false
        }
        if (!hasInitializer) {
            reportError(varDecl.toTokens(), MacroErrorCode.CustomDialogControllerMissingInit, macroCall)
            return false
        }
        let expr = varDecl.expr
        return validateCustomDialogControllerInitExpr(expr, macroCall)
    }

    /**
     * Report component format error
     */
    protected static func reportInvalidComponentFormat(input: Tokens, macroCall: UIMacroKind): Unit {
        reportError(input, MacroErrorCode.InvalidComponentFormat, macroCall)
    }

    /**
     * Report too many root nodes in build/Builder method
     */
    protected static func reportTooManyRootNodes(input: Tokens, macroCall!: UIMacroKind = UIMacroKind.BuildQuoted): Unit {
        reportError(input, MacroErrorCode.TooManyRootNodes, macroCall)
    }

    /**
     * Report root component must be container (CustomComponent/BuilderComponent not allowed as root)
     */
    protected static func reportRootMustBeContainer(input: Tokens, macroCall!: UIMacroKind = UIMacroKind.BuildQuoted): Unit {
        reportError(input, MacroErrorCode.RootMustBeContainer, macroCall)
    }

    /**
     * Report invalid node type in build/Builder method (non-Expr node)
     */
    protected static func reportInvalidNodeTypeInBuild(input: Tokens, macroCall!: UIMacroKind = UIMacroKind.BuildQuoted): Unit {
        reportError(input, MacroErrorCode.InvalidNodeType, macroCall)
    }

    /**
     * Report duplicate build function in @Component class
     */
    protected static func reportDuplicateBuild(input: Tokens): Unit {
        reportError(input, MacroErrorCode.DuplicateBuild, UIMacroKind.Component)
    }

    /**
     * Report missing build function in @Component class
     */
    protected static func reportMissingBuild(input: Tokens): Unit {
        reportError(input, MacroErrorCode.MissingBuild, UIMacroKind.Component)
    }

    /**
     * Report duplicate @Entry in file
     */
    protected static func reportDuplicateEntry(input: Tokens): Unit {
        reportError(input, MacroErrorCode.DuplicateEntry, UIMacroKind.Entry)
    }

    /**
     * Report duplicate @HybridComponentEntry in file
     */
    protected static func reportDuplicateHybridComponentEntry(input: Tokens): Unit {
        reportError(input, MacroErrorCode.DuplicateHybridComponentEntry, UIMacroKind.HybridComponentEntry)
    }

    /**
     * Report @Entry/@HybridComponentEntry must decorate class declaration
     */
    protected static func reportExpectClassDeclForEntry(input: Tokens, macroCall: UIMacroKind): Unit {
        reportError(input, MacroErrorCode.ExpectClassDecl, macroCall)
    }

    /**
     * Report undeclared identifier (MacroExpandDecl)
     */
    protected static func reportUndeclaredIdentifier(input: Tokens, macroCall: UIMacroKind, identValue: String): Unit {
        reportError(input, MacroErrorCode.UndeclaredIdentifier, macroCall, detail: "'${identValue}'")
    }

    /**
     * Report Entry/HybridComponentEntry build method root must be container component
     */
    protected static func reportEntryBuildRootMustBeContainer(input: Tokens, macroCall: UIMacroKind, compName: String): Unit {
        reportError(input, MacroErrorCode.RootMustBeContainer, macroCall)
    }

    /**
     * Report class should not inherit (for @CustomDialog, @Component, etc.)
     */
    protected static func reportInvalidInheritance(input: Tokens, macroCall: UIMacroKind): Unit {
        reportError(input, MacroErrorCode.InvalidInheritance, macroCall)
    }

    /**
     * Report custom component name conflicts with built-in component name
     */
    protected static func reportDuplicateBuiltInComponentName(input: Tokens, macroCall: UIMacroKind): Unit {
        reportError(input, MacroErrorCode.DuplicateBuiltInComponentName, macroCall)
    }

    /**
     * Report CustomDialog class missing Option<CustomDialogController> property
     */
    protected static func reportMissingCustomDialogController(input: Tokens): Unit {
        reportError(input, MacroErrorCode.MissingCustomDialogController, UIMacroKind.CustomDialog)
    }

    /**
     * Report expect class declaration (for @CustomDialog, etc.)
     */
    protected static func reportExpectClassDecl(input: Tokens, macroCall: UIMacroKind): Unit {
        reportError(input, MacroErrorCode.ExpectClassDecl, macroCall)
    }

    /**
     * Check if build function has no parameters
     * 
     * Rules:
     * 1. Build function must have no parameters
     * 
     * @param funcDecl Function declaration (for error reporting)
     */
    protected static func checkBuildFunctionNoParams(funcDecl: FuncDecl): MacroExpandResult<FuncDecl> {
        if (funcDecl.funcParams.size > 0) {
            reportError(
                funcDecl.funcParams.toTokens(),
                MacroErrorCode.BuildFuncHasParams,
                "'build'"
            )
            return MacroExpandResult<FuncDecl>.Err(Tokens())
        }
        return MacroExpandResult<FuncDecl>.Success(funcDecl)
    }

    /**
     * Check if build function has no return type (or returns Unit)
     * 
     * Rules:
     * 1. Build function must have no return type (defaults to Unit) or explicitly return Unit
     * 
     * @param funcDecl Function declaration (for error reporting)
     */
    protected static func checkBuildFunctionNoReturnType(funcDecl: FuncDecl): MacroExpandResult<FuncDecl> {
        try {
            let retType = funcDecl.declType
            let retTypeStr = retType.toTokens().toString()
            if (retTypeStr != "Unit") {
                reportError(
                    retType.toTokens(),
                    MacroErrorCode.BuildFuncHasReturnType,
                    "'build'"
                )
                return MacroExpandResult<FuncDecl>.Err(Tokens())
            }
        } catch (e: Exception) {
            // No explicit return type, defaults to Unit, as expected
        }
        return MacroExpandResult<FuncDecl>.Success(funcDecl)
    }

    /**
     * Check if build function has valid root component structure
     * 
     * Rules:
     * 1. Build function must have exactly one or zero root component
     * 2. If there is one root component, it must be a container component (BuiltInComponent)
     * 3. Custom components and Builder components are not allowed as root
     * 
     * Error categories:
     * - TooManyRootNodes: funcBody.size > 1
     * - InvalidNodeType: root node is not Expr
     * - RootMustBeContainer: root is CustomComponent or BuilderComponent
     * 
     * @param funcBody Build function body nodes
     * @param funcDecl Function declaration (for error reporting)
     * @param getComponentType Function to get component type from expression
     */
    protected static func checkBuildFunctionRootNode(
        funcBody: ArrayList<Node>,
        funcDecl: FuncDecl,
        getComponentType: (Expr) -> ComponentType
    ): MacroExpandResult<FuncDecl> {
        if (funcBody.size == 0) {
            return MacroExpandResult<FuncDecl>.Success(funcDecl)
        }
        for (node in funcBody) {
            match (node as Expr) {
                case Some(expr) =>
                    match (getComponentType(expr)) {
                        case CustomComponent | BuilderComponent | MethodCall =>
                            reportRootMustBeContainer(expr.toTokens())
                            return MacroExpandResult<FuncDecl>.Err(Tokens())
                        case _ => ()
                    }
                case None =>
                    reportInvalidNodeTypeInBuild(node.toTokens())
                    return MacroExpandResult<FuncDecl>.Err(Tokens())
            }
        }
        if (funcBody.size > 1) {
            reportTooManyRootNodes(funcBody[funcBody.size - 1].toTokens())
            return MacroExpandResult<FuncDecl>.Err(Tokens())
        }
        return MacroExpandResult<FuncDecl>.Success(funcDecl)
    }

    /**
     * Check all build function rules
     * 
     * This function performs all checks for build function:
     * 1. No parameters
     * 2. No return type (or Unit)
     * 3. Valid root component structure
     * 
     * @param funcBody Build function body nodes
     * @param funcDecl Function declaration (for error reporting)
     * @param getComponentType Function to get component type from expression
     */
    protected static func checkBuildFunctionAll(
        funcBody: ArrayList<Node>,
        funcDecl: FuncDecl,
        getComponentType: (Expr) -> ComponentType
    ): MacroExpandResult<FuncDecl> {
        let result = checkBuildFunctionNoParams(funcDecl).andThen {
            funcDecl: FuncDecl => checkBuildFunctionNoReturnType(funcDecl)
        }.andThen {
            funcDecl: FuncDecl => checkBuildFunctionRootNode(funcBody, funcDecl, getComponentType)
        }
        return result
    }

    /**
     * Check if @Builder function has valid component structure
     * 
     * Rules:
     * 1. @Builder function must have exactly one or zero root component
     * 2. If there is one root component, it cannot be CustomComponent or BuilderComponent
     * 
     * @param funcBody Builder function body nodes
     * @param funcDecl Function declaration (for error reporting)
     * @param getComponentType Function to get component type from expression
     * @return true if valid, false otherwise
     */
    protected static func checkBuilderFunc(
        funcBody: ArrayList<Node>,
        funcDecl: FuncDecl,
        getComponentType: (Expr) -> ComponentType
    ): Bool {
        if (funcBody.size == 0) {
            return true
        }
        for (node in funcBody) {
            match (node as Expr) {
                case Some(expr) =>
                    match (getComponentType(expr)) {
                        case CustomComponent | BuilderComponent | MethodCall =>
                            reportRootMustBeContainer(expr.toTokens(), macroCall: UIMacroKind.Builder)
                            return false
                        case _ => ()
                    }
                case None =>
                    reportInvalidNodeTypeInBuild(node.toTokens(), macroCall: UIMacroKind.Builder)
                    return false
            }
        }
        return true
    }

    /**
     * Check if function body contains only valid expressions
     * 
     * Rules:
     * 1. All nodes in function body must be expressions (Expr)
     * 2. Expressions must be valid UI component types
     * 
     * @param funcBody Function body nodes
     * @param funcDecl Function declaration (for error reporting)
     */
    protected static func checkFuncBodyContent(
        funcBody: ArrayList<Node>,
        funcDecl: FuncDecl
    ): MacroExpandResult<FuncDecl> {
        for (node in funcBody) {
            if(!checkIsExpr(node)) {
                return MacroExpandResult<FuncDecl>.Err(node.toTokens())
            }
        }
        return MacroExpandResult<FuncDecl>.Success(funcDecl)
    }
}


/**
 * Visitor for checking IfExpr: no ForInExpr allowed inside (including nested if/else).
 * Extend this class or add visit(Expr) overloads to add more syntax checks.
 */
class IfExprForInChecker <: Visitor {
    var hasError: Bool = false
    
    protected override func visit(expr: IfExpr): Unit {
        // Check ifBlock nodes
        for (expr_ in expr.ifBlock.nodes) {
            if (hasError) {
                breakTraverse()
                return
            }
            if (expr_ is ForInExpr) {
                reportError(
                    expr_.toTokens(),
                    MacroErrorCode.ForInNotAllowedInIf,
                    UIMacroKind.BuildQuoted
                )
                hasError = true
                breakTraverse()
            } else {
                expr_.traverse(this)
            }
        }

        // Check elseExpr
        if (hasError) {
            return
        }
        try {
            let elseExpr_ = expr.elseExpr
            match (elseExpr_) {
                case ifExpr_: IfExpr => this.visit(ifExpr_)
                case elseBody: Block =>
                    for (expr_ in elseBody.nodes) {
                        if (hasError) {
                            breakTraverse()
                            return
                        }
                        if (expr_ is ForInExpr) {
                            reportError(
                                expr_.toTokens(),
                                MacroErrorCode.ForInNotAllowedInIf,
                                UIMacroKind.BuildQuoted
                            )
                            hasError = true
                            breakTraverse()
                        } else {
                            // Recursively traverse all child nodes to find nested ForInExpr
                            expr_.traverse(this)
                        }
                    }
                case _ => breakTraverse()
            }
        } catch (e: Exception) {
            breakTraverse()
        }
    }
}