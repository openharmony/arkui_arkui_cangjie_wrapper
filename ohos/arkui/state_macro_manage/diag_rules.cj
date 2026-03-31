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

import std.collection.{HashMap, ArrayList, HashSet}

protected enum MacroErrorCode {
    /** Expected variable declaration, but got other type */
    | ExpectVarDecl
    /** Expected function declaration, but got other type */
    | ExpectFuncDecl
    /** Expected class declaration, but got other type */
    | ExpectClassDecl
    /** Expected reference expression */
    | ExpectRefExpr
    /** @Binder: expression must be RefExpr or MemberAccess (not other expression kinds) */
    | ExpectRefOrMemberAccess
    /** Expected call expression */
    | ExpectCallExpr

    // ========== Initialization errors ========== //
    /** Missing initializer */
    | MissingInitializer
    /** Should not have initializer */
    | UnexpectedInitializer

    // ========== Attribute errors ========== //
    /** Invalid attribute type, expected string literal */
    | InvalidAttributeType
    /** Invalid attribute format */
    | InvalidAttributeFormat

    // ========== Modifier errors ========== //
    /** Should not have access modifiers (public/private/protected/static) */
    | UnexpectedModifier
    /** Class must not use the `open` modifier (e.g. @Observed cannot be subclassed) */
    | OpenModifierNotAllowed
    /** @StorageLink decorated variable cannot use let modifier */
    | StorageLinkLetNotAllowed
    /** @StorageProp decorated variable cannot use var modifier */
    | StoragePropVarNotAllowed
    /** @Publish decorated variable cannot use let modifier */
    | PublishLetNotAllowed
    /** @Watch must decorate a state variable (@State, @Prop, @Link, etc.) */
    | WatchMustDecorateStateVar

    // ========== Type errors ========== //
    /** Type conflict with same-name storage variable */
    | TypeConflict
    /** Invalid return type */
    | InvalidReturnType
    /** Must be function type */
    | ExpectFuncType
    /** Expect to specify the concrete type */
    | ExpectSpecificType
    /** Invalid Init type */
    | NullInitType
    /** Not recommended to use FuncType or Any as state variable type (warning) */
    | UnrecommendedStateType

    // ========== Custom Component errors ========== //
    /** Build method can only have one root node */
    | TooManyRootNodes
    /** Root component must be a container component */
    | RootMustBeContainer
    /** Build function cannot have parameters */
    | BuildFuncHasParams
    /** Build function cannot have return type */
    | BuildFuncHasReturnType
    /** Component can only have one build function */
    | DuplicateBuild
    /** Component must have a build function */
    | MissingBuild
    /** Component can only have one child component */
    | TooManyChildren
    /** Component cannot have child components */
    | NoChildAllowed
    /** Parent-child component relationship does not meet constraints */
    | InvalidParentChild
    /** Constructor definition is not allowed */
    | InvalidConstructor
    /** Inheritance from other classes or interfaces is not allowed */
    | InvalidInheritance
    /** ForIn is not allowed inside If expression */
    | ForInNotAllowedInIf
    /** Invalid component format */
    | InvalidComponentFormat
    /** CustomDialog class must contain CustomDialogController, ?CustomDialogController or Option<CustomDialogController> property */
    | MissingCustomDialogController
    /** CustomDialogController variable must have initializer */
    | CustomDialogControllerMissingInit
    /** CustomDialogController variable without initializer should explicitly pass parameter */
    | CustomDialogControllerNeedsInitParam
    /** CustomDialogController initializer must use CustomDialogController(CustomDialogControllerOptions(...)) format */
    | CustomDialogControllerInvalidInitFormat
    /** CustomDialogController must use CustomDialogController constructor */
    | CustomDialogControllerInvalidConstructor
    /** CustomDialogController requires exactly one CustomDialogControllerOptions argument */
    | CustomDialogControllerInvalidOptionsArg
    /** CustomDialogControllerOptions is required */
    | CustomDialogControllerOptionsRequired
    /** CustomDialogControllerOptions must contain a CustomDialog Builder */
    | CustomDialogControllerOptionsMustContainBuilder
    /** Custom component name cannot be the same as built-in component name */
    | DuplicateBuiltInComponentName
    /* Invalid node type in function body */
    | InvalidNodeType

    // ========== Uniqueness errors ==========
    /** Only one @Entry is allowed per file */
    | DuplicateEntry
    /** Only one @HybridComponentEntry is allowed per file */
    | DuplicateHybridComponentEntry
    /** Identifier not declared */
    | UndeclaredIdentifier
    /** Not allowed in @Entry decorated component */
    | NotAllowedInEntry
    /** @Entry decorated class is not recommended to use public modifier */
    | EntryPublicModifierNotRecommended
    /** @Entry must specify localStorage attribute when using @LocalStorageLink or @LocalStorageProp */
    | EntryLocalStorageAttributeRequired
    /** Must be used inside @Observed decorated class */
    | MustBeInObserved
    /** Must be used inside @Component decorated class */
    | MustBeInComponent
    /** Duplicate member name (variable) in class */
    | DuplicateMemberName

    // ========== Resource errors ========== //
    /** Resource format invalid, expected app.type.name or sys.type.name */
    | ResourceFormatError
    /** Resource not found in resource index */
    | ResourceNotFound
    /** Rawfile name must be string literal */
    | RawfileInvalidName
    /** Rawfile not found */
    | RawfileNotFound
    | ...

    /**
     * Get the default error message for the error code
     */
    protected func getErrorMessage(): String {
        match (this) {
            // Declaration errors
            case ExpectVarDecl => "should decorate a variable declaration"
            case ExpectFuncDecl => "should decorate a function declaration"
            case ExpectClassDecl => "should decorate a class declaration"
            case ExpectRefExpr => "expected a reference expression"
            case ExpectRefOrMemberAccess => "only MemberAccess or RefExpr is supported"
            case ExpectCallExpr => "expects a call to a custom component or builder function"

            // Initialization errors
            case MissingInitializer => "decorated variables should have an initial value"
            case UnexpectedInitializer => "decorated variables should not have an initial value"

            // Attribute errors
            case InvalidAttributeType => "attribute must be a string literal"
            case InvalidAttributeFormat => "has invalid attribute format"

            // Modifier errors
            case UnexpectedModifier => "decorated variables should not have modifiers like public, private, protected or static"
            case OpenModifierNotAllowed => "the 'open' modifier is not allowed"
            case StorageLinkLetNotAllowed => "cannot use 'let' modifier"
            case StoragePropVarNotAllowed => "cannot use 'var' modifier"
            case PublishLetNotAllowed => "cannot use 'let' modifier"
            case WatchMustDecorateStateVar => "must decorate a state variable"

            // Type errors
            case TypeConflict => "decorated variables have a type conflict with existing declaration"
            case InvalidReturnType => "return type should be 'Unit'"
            case ExpectFuncType => "should be a function type"
            case ExpectSpecificType => "expected to specify the concrete type"
            case NullInitType => "cannot derive from the initialization expression"
            case UnrecommendedStateType => "not recommended to use this type of variable, may cause unexpected behavior"

            // Component errors
            case TooManyRootNodes => "function can only have one root node"
            case RootMustBeContainer => "function root component must be a container component"
            case TooManyChildren => "can only have a single child component"
            case NoChildAllowed => "cannot have any child component"
            case InvalidParentChild => "has an invalid parent-child component relationship"
            case InvalidConstructor => "decorated class is not allowed to have a constructor"
            case InvalidInheritance => "decorated class should not inherit other class or interface"
            case ForInNotAllowedInIf => "for in expression is not allowed inside if"
            case InvalidComponentFormat => "has invalid component format"
            case MissingCustomDialogController => "must contain a property with 'CustomDialogController' type"
            case CustomDialogControllerMissingInit => "must have an initializer"
            case CustomDialogControllerNeedsInitParam => "decorated class needs to explicitly pass a parameter of this type when using"
            case CustomDialogControllerInvalidInitFormat => "should be defined using type 'CustomDialogController'"
            case CustomDialogControllerInvalidConstructor => "should use CustomDialogController constructor"
            case CustomDialogControllerInvalidOptionsArg => "requires exactly one CustomDialogControllerOptions argument"
            case CustomDialogControllerOptionsRequired => "should be defined using type 'CustomDialogControllerOptions'"
            case CustomDialogControllerOptionsMustContainBuilder => "CustomDialogControllerOptions must contain a CustomDialog Object"
            case DuplicateBuiltInComponentName => "cannot have the same name as a built-in component"
            case BuildFuncHasParams => "function cannot have parameters"
            case BuildFuncHasReturnType => "function cannot have return type"
            case DuplicateBuild => "can only have one build function"
            case MissingBuild => "decorated class must have the 'build' function"
            case InvalidNodeType => "can only be written with UI syntax"

            // Uniqueness errors
            case DuplicateEntry => "only one instance is allowed per file"
            case DuplicateHybridComponentEntry => "only one instance is allowed per file"
            case UndeclaredIdentifier => "undeclared identifier"
            case NotAllowedInEntry => "is not allowed in '@Entry' decorated component"
            case EntryPublicModifierNotRecommended => "'public' modifier is not recommended"
            case EntryLocalStorageAttributeRequired => "should specify localStorage attribute when using @LocalStorageLink or @LocalStorageProp"
            case MustBeInObserved => "can only be used inside '@Observed' decorated class"
            case MustBeInComponent => "can only be used inside '@Component' or '@CustomDialog' decorated class"
            case DuplicateMemberName => "decorated class has a duplicate member name"

            // Resource errors
            case ResourceFormatError => "has invalid format"
            case ResourceNotFound => "cannot find the required resource"
            case RawfileInvalidName => "must be a string literal"
            case RawfileNotFound => "cannot find the required resource"
            case _ => "Internal error"
        }
    }

    /**
     * Default detail appended after `getErrorMessage()` when the caller passes empty `detail`.
     * Use for fixed clarifications; keep passing `detail` at the call site when the text contains
     * dynamic values (identifiers, paths, component names, storage keys, etc.).
     */
    protected func getDefaultDetail(): String {
        match (this) {
            case NullInitType => "please specify its type explicitly"
            case InvalidAttributeFormat => "must follow the format [\"name\", InterOp]"
            case _ => ""
        }
    }

    /**
     * Default diagnostic hint for this error code (English), shown after the main message when the caller
     * does not pass an explicit `hint` override. Call sites may pass `hint:` to override.
     * Where one code had several legacy wordings, a single canonical hint is kept here.
     */
    protected func getDefaultHint(): String {
        match (this) {
            case StorageLinkLetNotAllowed => "Use 'var' instead"
            case PublishLetNotAllowed => "Use 'var' instead"
            case StoragePropVarNotAllowed => "Use 'let' instead"
            case ExpectClassDecl => "Apply this decorator to a class declaration only"
            case DuplicateBuild => "Remove the duplicate build function"
            case MissingBuild => "Add a build function to define the UI"
            case DuplicateEntry => "Remove the extra @Entry decorator or split into separate files"
            case DuplicateHybridComponentEntry => "Remove the extra decorator or split into separate files"
            case DuplicateBuiltInComponentName => "Rename the custom component to avoid conflict with built-in components"
            case MissingCustomDialogController => "Add a property of CustomDialogController type"
            case BuildFuncHasParams => "Remove all parameters from the build function"
            case BuildFuncHasReturnType => "Remove the return type or change it to Unit"
            case ResourceFormatError => "Expected format: app.type.name or sys.type.name"
            case ResourceNotFound => "Check if the resource exists in the resource index"
            case RawfileInvalidName => "Use a string literal for the file path, e.g. @rawfile(\"image.png\")"
            case RawfileNotFound =>
                "Verify the file path is correct and the file exists in the rawfile directory"
            case EntryLocalStorageAttributeRequired => "Try to provide a parameter, like '@Entry[storage]'"
            case WatchMustDecorateStateVar =>
                "Try to use with state macro, like @Watch @State var identifier: type ..."
            case InvalidInheritance => "Use composition instead of inheritance."
            case NotAllowedInEntry => "Move this declaration outside of the @Entry component"
            case MustBeInObserved => "Move this declaration inside an @Observed class"
            case ExpectCallExpr =>
                "Use only UI component calls (e.g. Column{}, Text()) in the build method"
            case TooManyRootNodes =>
                "Wrap your content in a unified container component (e.g. Column, Row)."
            case MustBeInComponent =>
                "Move this declaration inside an @Component or @CustomDialog class"
            case ExpectRefExpr =>
                "Use a reference expression (e.g. myHandler)."
            case ExpectRefOrMemberAccess =>
                "Use a simple identifier or this.member (MemberAccess) for @Binder."
            case OpenModifierNotAllowed =>
                "Remove 'open'; this declaration does not support inheritance."
            case InvalidNodeType =>
                "Remove non-UI statements; the build body should only contain UI component expressions."
            case RootMustBeContainer =>
                "Use a container component (e.g. Column, Row) as the root."
            case ForInNotAllowedInIf =>
                "Move the 'for in' out of the if expression or use ForEach instead."
            case TooManyChildren =>
                "Wrap multiple children in a container such as Column or Row"
            case NoChildAllowed => "Remove the trailing closure: {...}"
            case _ => ""
        }
    }
}