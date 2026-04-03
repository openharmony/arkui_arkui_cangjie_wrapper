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

import std.ast.{Tokens, Expr}
import std.collection.{ArrayList, HashMap}
import std.deriving.Derive

/**
 * Canonical built-in component names for ComponentRuleRegistry.
 * Single source of truth to avoid string drift across parent/child constraint rules.
 */
class BuiltInComponentName {
    static let AlphabetIndexer: String = "AlphabetIndexer"
    static let Badge: String = "Badge"
    static let Blank: String = "Blank"
    static let Button: String = "Button"
    static let Calendar: String = "Calendar"
    static let Canvas: String = "Canvas"
    static let Checkbox: String = "Checkbox"
    static let CheckboxGroup: String = "CheckboxGroup"
    static let Circle: String = "Circle"
    static let Column: String = "Column"
    static let ContainerSpan: String = "ContainerSpan"
    static let DataPanel: String = "DataPanel"
    static let DatePicker: String = "DatePicker"
    static let Divider: String = "Divider"
    static let Ellipse: String = "Ellipse"
    static let Flex: String = "Flex"
    static let FlowItem: String = "FlowItem"
    static let FormLink: String = "FormLink"
    static let Gauge: String = "Gauge"
    static let Grid: String = "Grid"
    static let GridCol: String = "GridCol"
    static let GridItem: String = "GridItem"
    static let GridRow: String = "GridRow"
    static let Hyperlink: String = "Hyperlink"
    static let Image: String = "Image"
    static let ImageAnimator: String = "ImageAnimator"
    static let ImageSpan: String = "ImageSpan"
    static let Line: String = "Line"
    static let List: String = "List"
    static let ListItem: String = "ListItem"
    static let ListItemGroup: String = "ListItemGroup"
    static let LoadingProgress: String = "LoadingProgress"
    static let Marquee: String = "Marquee"
    static let Menu: String = "Menu"
    static let MenuItem: String = "MenuItem"
    static let MenuItemGroup: String = "MenuItemGroup"
    static let Navigator: String = "Navigator"
    static let Path: String = "Path"
    static let PatternLock: String = "PatternLock"
    static let Piece: String = "Piece"
    static let Polygon: String = "Polygon"
    static let Polyline: String = "Polyline"
    static let Progress: String = "Progress"
    static let QRCode: String = "QRCode"
    static let Radio: String = "Radio"
    static let Rating: String = "Rating"
    static let Rect: String = "Rect"
    static let Refresh: String = "Refresh"
    static let RichText: String = "RichText"
    static let Row: String = "Row"
    static let Scroll: String = "Scroll"
    static let ScrollBar: String = "ScrollBar"
    static let Search: String = "Search"
    static let Select: String = "Select"
    static let Shape: String = "Shape"
    static let Slider: String = "Slider"
    static let Span: String = "Span"
    static let Stepper: String = "Stepper"
    static let StepperItem: String = "StepperItem"
    static let SymbolSpan: String = "SymbolSpan"
    static let TabContent: String = "TabContent"
    static let Tabs: String = "Tabs"
    static let Text: String = "Text"
    static let TextArea: String = "TextArea"
    static let TextClock: String = "TextClock"
    static let TextInput: String = "TextInput"
    static let TextPicker: String = "TextPicker"
    static let Video: String = "Video"
    static let WaterFlow: String = "WaterFlow"
    static let Web: String = "Web"
    static let WithTheme: String = "WithTheme"
}

/**
 * Child component error types
 */
@Derive[Equatable]
protected enum BuiltInComponentErrorType {
    | InvalidChildType      // Child component type mismatch
    | TooManyChildren       // Too many child components
    | NoChildAllowed        // Child components not allowed
    | InvalidParentForChild // Incorrect parent for child component
    | ForEachNotAllowedInMonadic // ForEach/LazyForEach not allowed under MaxChildren(1) parent
    | ...
}


protected enum ComponentConstraint {
    | AllowedChildren(ArrayList<String>)     // Only allow specific child components
    | MaxChildren(Int64)                      // Maximum number of child components
    | NoChildren                              // No child components allowed
    | RequiredParent(ArrayList<String>)       // Must be within specific parent component
    | ...
}

protected class ChildComponentError {
    let parentName: String          // Parent component name
    let childName: String           // Child component name
    let allowedChildren: ArrayList<String>  // Allowed child component names
    var componentPath: String = ""      // Component path
    let errorType: BuiltInComponentErrorType   // Error classification
    
    init(parentName: String, childName: String, allowedChildren: ArrayList<String>, 
        errorType: BuiltInComponentErrorType) {
        this.parentName = parentName
        this.childName = childName
        this.allowedChildren = allowedChildren
        this.errorType = errorType
    }
}

/**
 * Format allowed children list to string
 * Examples:
 *   [] -> "none"
 *   ["A"] -> "A"
 *   ["A", "B"] -> "A or B"
 *   ["A", "B", "C"] -> "A, B or C"
 */
protected func formatAllowedChildren(allowed: ArrayList<String>): String {
    if (allowed.isEmpty()) {
        return "none"
    }
    if (allowed.size == 1) {
        return allowed[0]
    }
    if (allowed.size == 2) {
        return "${allowed[0]} or ${allowed[1]}"
    }
    // 3 or more
    var result = allowed[0]
    for (i in 1..allowed.size - 2) {
        result = "${result}, ${allowed[i]}"
    }
    result = "${result} or ${allowed[allowed.size - 1]}"
    return result
}


/**
 * Report component constraint error
 * 
 * This function reports component constraint errors with detailed information
 * including component path, allowed children, and helpful suggestions.
 * 
 * Uses original expression location for better error reporting.
 * 
 * @param expr Original expression (for location tracking)
 * @param error ChildComponentError object containing error details
 */
protected func reportComponentConstraintError(expr: Expr, error: ChildComponentError): Unit {
    let (detail, hint) = buildComponentConstraintMessage(error)
    let originalToken = getOriginalExprToken(expr)
    let locationTokens = Tokens().append(originalToken)
    
    match (error.errorType) {
        case BuiltInComponentErrorType.TooManyChildren =>
            reportError(
                locationTokens,
                MacroErrorCode.TooManyChildren,
                error.parentName,
                hint: hint
            )
        
        case BuiltInComponentErrorType.NoChildAllowed =>
            reportError(
                locationTokens,
                MacroErrorCode.NoChildAllowed,
                error.parentName,
                detail: detail,
                hint: hint
            )
        
        case BuiltInComponentErrorType.InvalidChildType =>
            reportError(
                locationTokens,
                MacroErrorCode.InvalidParentChild,
                error.parentName,
                detail: detail,
                hint: hint
            )
        
        case BuiltInComponentErrorType.InvalidParentForChild =>
            reportError(
                locationTokens,
                MacroErrorCode.InvalidParentChild,
                error.childName,
                detail: detail,
                hint: hint
            )

        case BuiltInComponentErrorType.ForEachNotAllowedInMonadic =>
            reportError(
                locationTokens,
                MacroErrorCode.InvalidParentChild,
                error.parentName,
                detail: detail,
                hint: hint
            )
        
        case _ =>
            // Unknown error type, use generic error
            reportError(
                locationTokens,
                MacroErrorCode.InvalidParentChild,
                error.parentName,
                detail: detail,
                hint: hint
            )
    }
}

/**
 * Build component constraint error message and hint
 * 
 * @param error ChildComponentError object
 * @return Tuple of (detail message, hint message)
 */
protected func buildComponentConstraintMessage(error: ChildComponentError): (String, String) {
    match (error.errorType) {
        case BuiltInComponentErrorType.TooManyChildren =>
            return ("", "")
        
        case BuiltInComponentErrorType.NoChildAllowed =>
            return ("", "")
        
        case BuiltInComponentErrorType.InvalidChildType =>
            let allowedStr = formatAllowedChildren(error.allowedChildren)
            var detail = "'${error.parentName}' cannot have '${error.childName}' as a child"
            if (error.allowedChildren.size > 0) {
                detail = "${detail}. Allowed: ${allowedStr}"
            }
            let hint = "Use one of the allowed child types shown in the error detail above"
            return (detail, hint)
        
        case BuiltInComponentErrorType.InvalidParentForChild =>
            let requiredStr = formatAllowedChildren(error.allowedChildren)
            let detail = "'${error.childName}' must be inside one of: ${requiredStr}"
            var hint = "Move '${error.childName}' to the correct parent component"
            return (detail, hint)

        case BuiltInComponentErrorType.ForEachNotAllowedInMonadic =>
            let detail =
                "'${error.parentName}' cannot contain '${error.childName}' (single-child container)"
            let hint = "Use a container such as Column or Row to wrap '${error.childName}' content"
            return (detail, hint)
        
        case _ => 
            let detail = "Invalid component relationship: '${error.childName}' in '${error.parentName}'"
            let hint = "Use one of the allowed child types shown in the error detail above"
            return (detail, hint)
    }
}


protected class ComponentRuleRegistry {
    protected static let RULES: HashMap<String, ArrayList<ComponentConstraint>> = HashMap()
    private static let INSTANCE = ComponentRuleRegistry()

    static func getInstance() {
        return INSTANCE
    }

    // Max Children num is 1.
    let monadicContainers = [
        BuiltInComponentName.Badge, BuiltInComponentName.Button, BuiltInComponentName.GridItem,
        BuiltInComponentName.ListItem, BuiltInComponentName.Navigator, BuiltInComponentName.Refresh,
        BuiltInComponentName.Scroll, BuiltInComponentName.ScrollBar, BuiltInComponentName.StepperItem,
        BuiltInComponentName.TabContent, BuiltInComponentName.GridCol, BuiltInComponentName.FlowItem,
        BuiltInComponentName.WithTheme, BuiltInComponentName.FormLink, BuiltInComponentName.Gauge
    ]
    // NoChildren
    let leafComponents = [
        BuiltInComponentName.Blank, BuiltInComponentName.Canvas, BuiltInComponentName.Checkbox,
        BuiltInComponentName.CheckboxGroup, BuiltInComponentName.Circle, BuiltInComponentName.Ellipse,
        BuiltInComponentName.Divider, BuiltInComponentName.Image, BuiltInComponentName.Line,
        BuiltInComponentName.LoadingProgress, BuiltInComponentName.Path, BuiltInComponentName.Polygon,
        BuiltInComponentName.Polyline, BuiltInComponentName.Progress, BuiltInComponentName.QRCode,
        BuiltInComponentName.Rect, BuiltInComponentName.Span, BuiltInComponentName.ImageSpan,
        BuiltInComponentName.Search, BuiltInComponentName.Slider, BuiltInComponentName.TextInput,
        BuiltInComponentName.TextPicker, BuiltInComponentName.AlphabetIndexer, BuiltInComponentName.PatternLock,
        BuiltInComponentName.TextClock, BuiltInComponentName.ImageAnimator, BuiltInComponentName.TextArea,
        BuiltInComponentName.Select, BuiltInComponentName.DatePicker, BuiltInComponentName.Piece,
        BuiltInComponentName.Radio, BuiltInComponentName.Marquee, BuiltInComponentName.Calendar,
        BuiltInComponentName.DataPanel, BuiltInComponentName.Rating, BuiltInComponentName.RichText,
        BuiltInComponentName.Video, BuiltInComponentName.Web
    ]

    private init() {
        for (comp in monadicContainers) {
            register(comp, [ComponentConstraint.MaxChildren(1)])
        }

        for (comp in leafComponents) {
            register(comp, [ComponentConstraint.NoChildren])
        }
        
        // Allowed Children
        // Tabs
        register(BuiltInComponentName.Tabs, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.TabContent]))
        ])
        
        // Grid
        register(BuiltInComponentName.Grid, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.GridItem]))
        ])
        
        // Text
        register(BuiltInComponentName.Text, [
            ComponentConstraint.AllowedChildren(ArrayList([
                BuiltInComponentName.Span, BuiltInComponentName.ImageSpan, BuiltInComponentName.SymbolSpan,
                BuiltInComponentName.ContainerSpan
            ]))
        ])
        
        // List
        register(BuiltInComponentName.List, [
            ComponentConstraint.AllowedChildren(ArrayList([
                BuiltInComponentName.ListItem, BuiltInComponentName.ListItemGroup
            ]))
        ])
        
        // ListItemGroup
        register(BuiltInComponentName.ListItemGroup, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.ListItem])),
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.List]))
        ])
        
        // WaterFlow
        register(BuiltInComponentName.WaterFlow, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.FlowItem]))
        ])
        
        // Stepper
        register(BuiltInComponentName.Stepper, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.StepperItem]))
        ])
        
        // GridRow
        register(BuiltInComponentName.GridRow, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.GridCol]))
        ])
        
        // Menu
        register(BuiltInComponentName.Menu, [
            ComponentConstraint.AllowedChildren(ArrayList([
                BuiltInComponentName.MenuItemGroup, BuiltInComponentName.MenuItem
            ]))
        ])
        
        // MenuItemGroup
        register(BuiltInComponentName.MenuItemGroup, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.MenuItem])),
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.Menu]))
        ])
        
        // Hyperlink
        register(BuiltInComponentName.Hyperlink, [
            ComponentConstraint.AllowedChildren(ArrayList([BuiltInComponentName.Image]))
        ])
        
        // ContainerSpan
        register(BuiltInComponentName.ContainerSpan, [
            ComponentConstraint.AllowedChildren(ArrayList([
                BuiltInComponentName.Span, BuiltInComponentName.ImageSpan
            ])),
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.Text]))
        ])
        
        // Shape
        register(BuiltInComponentName.Shape, [
            ComponentConstraint.AllowedChildren(ArrayList([
                BuiltInComponentName.Rect, BuiltInComponentName.Path, BuiltInComponentName.Circle,
                BuiltInComponentName.Ellipse, BuiltInComponentName.Shape, BuiltInComponentName.Polyline,
                BuiltInComponentName.Polygon, BuiltInComponentName.Image, BuiltInComponentName.Text,
                BuiltInComponentName.Column, BuiltInComponentName.Row
            ]))
        ])
        
        // RequiredParent
        register(BuiltInComponentName.TabContent, [
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.Tabs])),
            ComponentConstraint.MaxChildren(1)
        ])

        // Must keep MaxChildren(1) from monadicContainers: a later register replaces the whole rule set, so merge here.
        register(BuiltInComponentName.GridItem, [
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.Grid])),
            ComponentConstraint.MaxChildren(1)
        ])

        register(BuiltInComponentName.FlowItem, [
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.WaterFlow])),
            ComponentConstraint.MaxChildren(1)
        ])

        register(BuiltInComponentName.StepperItem, [
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.Stepper])),
            ComponentConstraint.MaxChildren(1)
        ])

        register(BuiltInComponentName.GridCol, [
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.GridRow])),
            ComponentConstraint.MaxChildren(1)
        ])

        register(BuiltInComponentName.MenuItem, [
            ComponentConstraint.RequiredParent(ArrayList([
                BuiltInComponentName.MenuItemGroup, BuiltInComponentName.Menu
            ])),
        ])

        // leafComponents already registered NoChildren; merge RequiredParent here or the no-child rule is lost.
        register(BuiltInComponentName.Span, [
            ComponentConstraint.RequiredParent(ArrayList([
                BuiltInComponentName.Text, BuiltInComponentName.ContainerSpan
            ])),
            ComponentConstraint.NoChildren
        ])
        
        register(BuiltInComponentName.ImageSpan, [
            ComponentConstraint.RequiredParent(ArrayList([
                BuiltInComponentName.Text, BuiltInComponentName.ContainerSpan
            ])),
            ComponentConstraint.NoChildren
        ])
        
        register(BuiltInComponentName.SymbolSpan, [
            ComponentConstraint.RequiredParent(ArrayList([BuiltInComponentName.Text])),
            ComponentConstraint.NoChildren
        ])

        register(BuiltInComponentName.ListItem, [
            ComponentConstraint.RequiredParent(ArrayList([
                BuiltInComponentName.List, BuiltInComponentName.ListItemGroup
            ])),
            ComponentConstraint.MaxChildren(1)
        ])

        register(BuiltInComponentName.Blank, [
            ComponentConstraint.RequiredParent(ArrayList([
                BuiltInComponentName.Row, BuiltInComponentName.Column, BuiltInComponentName.Flex
            ])),
            ComponentConstraint.NoChildren
        ])
    }
    
    private func register(componentName: String, constraints: Array<ComponentConstraint>): Unit {
        RULES.add(componentName, ArrayList(constraints))
    }
    
    /**
     * Get component constraint rules
     */
    protected func getComponentConstraintRules(componentName: String): ArrayList<ComponentConstraint> {
        match (RULES.get(componentName)) {
            case Some(c) => c
            case None => ArrayList()
        }
    }
    
    protected func validateComponentConstraints(
        parentName!: String,
        childName!: String,
        childCount!: Int64
    ): ?ChildComponentError {
        // ForEach/LazyForEach as direct children: skip full rule table (legacy: treat as item generators).
        // Monadic parents (COMPONENT_NUMBER_CONSTRAINT_LIST) cannot contain ForEach/LazyForEach.
        if (COMPONENT_TYPE_FOREACH_LIST.contains(childName)) {
            if (COMPONENT_NUMBER_CONSTRAINT_LIST.contains(parentName)) {
                return ChildComponentError(
                    parentName, childName, ArrayList(),
                    BuiltInComponentErrorType.ForEachNotAllowedInMonadic
                )
            }
            return None
        }

        let constraints = getComponentConstraintRules(parentName)
        
        for (constraint in constraints) {
            match (constraint) {
                case MaxChildren(max) =>
                    if (childCount > max) {
                        return ChildComponentError(
                            parentName, childName, ArrayList(),
                            BuiltInComponentErrorType.TooManyChildren
                        )
                    }
                
                case NoChildren =>
                    if (childCount > 0) {
                        return ChildComponentError(
                            parentName, childName, ArrayList(),
                            BuiltInComponentErrorType.NoChildAllowed
                        )
                    }
                
                case AllowedChildren(allowed) =>
                    if (!allowed.contains(childName)) {
                        return ChildComponentError(
                            parentName, childName, allowed,
                            BuiltInComponentErrorType.InvalidChildType
                        )
                    }
                case _ => ()
            }
        }
        
        // check child component.
        let childConstraints = getComponentConstraintRules(childName)
        for (constraint in childConstraints) {
            match (constraint) {
                case RequiredParent(required) =>
                    if (!required.contains(parentName)) {
                        return ChildComponentError(
                            parentName, childName, required,
                            BuiltInComponentErrorType.InvalidParentForChild
                        )
                    }
                case _ => ()
            }
        }
        None
    }
}

let COMPONENT_RULE_REGISTRY = ComponentRuleRegistry.getInstance()