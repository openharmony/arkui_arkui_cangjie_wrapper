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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

macro package ohos.arkui.state_macro_manage

import std.collection.{HashMap, ArrayList}

// Lazy-loaded configuration caches
var _bindFunctionAllowedTypesCache: Option<HashMap<String, ArrayList<String>>> = None
var _bindFunctionsCache: Option<HashMap<String, Int64>> = None
var _bindFunctionNamedParamCache: Option<HashMap<String, Int64>> = None
var _bindFunctionParamNamesCache: Option<HashMap<String, String>> = None
var _bindFunctionMultiParamCache: Option<HashMap<String, ArrayList<(Int64, String)>>> = None
var _bindConstructorParamsCache: Option<HashMap<String, ArrayList<(Int64, String)>>> = None

/**
 * Build allowed types configuration (lazy loaded)
 * Maps function names to the list of component types that support them.
 * Empty list means the function is available on all components (via CommonMethodComponent).
 */
func buildAllowedTypes(): HashMap<String, ArrayList<String>> {
    if (let Some(cached) <- _bindFunctionAllowedTypesCache) {
        return cached
    }
    let config = HashMap<String, ArrayList<String>>([
        // Common methods (available on all components via CommonMethodComponent)
        ("bindMenu", ArrayList<String>([])),
        ("bindContextMenu", ArrayList<String>([])),
        ("bindContentCover", ArrayList<String>([])),
        ("bindSheet", ArrayList<String>([])),
        
        // Component-specific methods
        ("description", ArrayList(["Gauge"])),
        ("title", ArrayList(["Navigation", "NavDestination"])),
        ("customKeyboard", ArrayList(["TextInput", "RichEditor"])),
        ("tabBar", ArrayList(["TabContent"])),
        ("bindSelectionMenu", ArrayList(["RichEditor"])),
        ("swipeAction", ArrayList(["ListItem"]))
    ])
    _bindFunctionAllowedTypesCache = Some(config)
    return config
}

/**
 * Build positional parameter methods configuration (lazy loaded)
 * Maps function names to the index of the CustomBuilder parameter.
 * These functions accept CustomBuilder as a positional parameter (not named).
 */
func buildFunctions(): HashMap<String, Int64> {
    if (let Some(cached) <- _bindFunctionsCache) {
        return cached
    }
    let config = HashMap<String, Int64>([
        ("bindContentCover", 1),
        ("bindSheet", 1),
        ("description", 0),
        ("title", 0),
        ("customKeyboard", 0),
        ("tabBar", 0)
    ])
    _bindFunctionsCache = Some(config)
    return config
}

/**
 * Build named parameter methods configuration (lazy loaded)
 * Maps function names to the index of the CustomBuilder parameter (for reference).
 * These functions require the CustomBuilder parameter to be passed as a named parameter.
 */
func buildNamedParam(): HashMap<String, Int64> {
    if (let Some(cached) <- _bindFunctionNamedParamCache) {
        return cached
    }
    let config = HashMap<String, Int64>([
        ("bindMenu", 0),
        ("bindContextMenu", 0),
        ("bindSelectionMenu", 1)
    ])
    _bindFunctionNamedParamCache = Some(config)
    return config
}

/**
 * Build parameter names configuration (lazy loaded)
 * Maps function names to the expected parameter name for CustomBuilder.
 * Used when checking named parameters.
 */
func buildParamNames(): HashMap<String, String> {
    if (let Some(cached) <- _bindFunctionParamNamesCache) {
        return cached
    }
    let config = HashMap<String, String>([
        ("bindMenu", "builder"),
        ("bindContextMenu", "builder"),
        ("bindSelectionMenu", "content"),
        ("customKeyboard", "value")
    ])
    _bindFunctionParamNamesCache = Some(config)
    return config
}

/**
 * Build multi-parameter methods configuration (lazy loaded)
 * Maps function names to a list of (index, parameterName) pairs for CustomBuilder parameters.
 * These functions have multiple CustomBuilder parameters.
 */
func buildMultiParam(): HashMap<String, ArrayList<(Int64, String)>> {
    if (let Some(cached) <- _bindFunctionMultiParamCache) {
        return cached
    }
    let config = HashMap<String, ArrayList<(Int64, String)>>([
        ("swipeAction", ArrayList([(0, "start"), (1, "end")]))
    ])
    _bindFunctionMultiParamCache = Some(config)
    return config
}

/**
 * Build constructor parameters configuration (lazy loaded)
 * Maps class names to a list of (index, parameterName) pairs for CustomBuilder parameters in constructors.
 * Note: Index is the position in the constructor parameter list (0-based).
 */
func buildConstructorParams(): HashMap<String, ArrayList<(Int64, String)>> {
    if (let Some(cached) <- _bindConstructorParamsCache) {
        return cached
    }
    let config = HashMap<String, ArrayList<(Int64, String)>>([
        ("Checkbox", ArrayList([(2, "indicatorBuilder")])),
        ("ListItemGroup", ArrayList([(0, "header"), (1, "footer")])),
        ("DragItemInfo", ArrayList([(1, "builder")])),
        ("ContextMenuOptions", ArrayList([(4, "preview")])),
        ("CustomPopupOptions", ArrayList([(0, "builder")])),
        ("SheetOptions", ArrayList([(12, "title")]))
    ])
    _bindConstructorParamsCache = Some(config)
    return config
}

