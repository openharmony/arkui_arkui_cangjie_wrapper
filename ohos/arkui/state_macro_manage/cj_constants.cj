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

import std.ast.*
import std.collection.*

// record all built-in component name, which will be handled when expand macro.
let MACRO_EXPAND_COMPONENTS_INTEROP: Array<String> = ["NavRouter", "WithTheme", "LocationButton", "PasteButton",
    "SaveButton", "Component3D", "Repeat", "ContainerSpan", "FormLink", "NodeContainer", "Particle", "TimePicker",
    "ContentSlot", "FolderStack", "MovingPhotoView"]
let MACRO_EXPAND_COMPONENTS: Array<String> = ["Row", "Column", "Text", "Image", "ImageAnimator", "Button", "TestButton",
    "Span", "ImageSpan", "Divider", "TextClock", "TextInput", "TextArea", "TextTimer", "TextTimerController", "Search",
    "Hyperlink", "Toggle", "Slider", "Blank", "Counter", "Sheet", "Section", "Select", "TextPicker", "DatePicker",
    "Piece", "SymbolGlyph", "Progress", "Radio", "RadioGroup", " Marquee", "Calendar", "Gauge", "DataPanel", "QRCode",
    "Rating", "Stack", "List", "ListItem", "ListItemGroup", "LoadingProgress", "Grid", "GridCol", "GridItem", "GridRow",
    "Scroll", "Scroller", "Tabs", "TabContent", "ColumnSplit", "RowSplit", "Navigation", "NavDestination", "Navigator",
    "RichText", "WaterFlow", "FlowItem", "Swiper", "Panel", "Flex", "Badge", "Refresh", "Stepper", "StepperItem",
    "SideBarContainer", "RelativeContainer", "LazyForEach", "GridContainer", "Shape", "Rect", "Circle", "Ellipse",
    "Line", "Menu", "MenuItem", "MenuItemGroup", "Polyline", "Polygon", "Path", "TapGesture", "LongPressGesture",
    "PanGesture", "PinchGesture", "AlphabetIndexer", "PatternLock", "RotationGesture", "GestureGroup", "Animator",
    "Video", "Web", "Camera", "ForEach", "ScrollBar", "Canvas", "Checkbox", "CheckboxGroup", "Marquee", "RichEditor",
    "XComponent", "SymbolSpan", "CalendarPicker", "__Recycle__"].concat(MACRO_EXPAND_COMPONENTS_INTEROP)

// Button Text Toggle TextTimer Stepper is not container component, but they can show in ets.
let CONTAINER_EXPAND_COMPONENTS: Array<String> = ["Badge", "Blank", "Button", "Column", "ColumnSplit", "Counter", "Flex",
    "Gauge", "Grid", "Menu", "MenuItemGroup", "GridContainer", "List", "ListItemGroup", "ListItem", "Navigator", "Panel",
    "Refresh", "Row", "RowSplit", "Scroll", "Shape", "Stack", "Stepper", "StepperItem", "Swiper", "TabContent", "Tabs",
    "Text", "TextTimer", "Toggle", "Navigation", "NavDestination", "SideBarContainer", "RelativeContainer", "RichEditor",
    "WaterFlow", "FlowItem", "__Recycle__", "SideBarContainer", "RelativeContainer", "WithTheme", "Hyperlink", "GridCol",
    "GridItem", "GridRow", "ScrollBar", "NavRouter", "ContainerSpan", "FormLink", "FolderStack",
    "AtomicServiceNavigation"]
let OBSERVED_PROPERTY = quote(ObservedProperty)
let OBSERVED_OBJECT = quote(ObservedObject)
let OBSERVED_COMPLEX_ABSTRACT = quote(ObservedComplexAbstract)
let CUSTOM_VIEW = quote(CustomView)
let VIEW_BUILDER = quote(ViewBuilder)
let COMPONENT_NUMBER_CONSTRAINT_LIST: HashSet<String> = HashSet<String>(
    ["Badge", "Button", "GridItem", "ListItem", "Navigator", "Refresh", "Scroll", "ScrollBar", "StepperItem",
        "TabContent", "GridCol", "FlowItem", "MenuItem", "WithTheme", "FormLink", "Gauge"])
let COMPONENT_CHILD_IN_SHAPE_LIST: HashSet<String> = HashSet<String>(
    ["Rect", "Path", "Circle", "Ellipse", "Shape", "Polyline", "Polygon", "Image", "Text", "Column", "Row"])
let COMPONENT_TYPE_CONSTRAINT_LIST: HashSet<String> = HashSet<String>(
    ["Tabs", "Grid", "Text", "List", "ListItemGroup", "WaterFlow", "Shape", "Stepper", "GridRow", "Menu",
        "MenuItemGroup", "Hyperlink", "ContainerSpan"])
// 特定父组件只能包含相应子组件的Map
let CONTAINER_TO_SPECIFIC_PARENT_MAP: HashMap<String, Array<String>> = HashMap<String, Array<String>>(
    [("Tabs", ["TabContent"]), ("Grid", ["GridItem"]), ("WaterFlow", ["FlowItem"]),
        ("Text", ["Span", "ImageSpan", "SymbolSpan", "ContainerSpan"]), ("Stepper", ["StepperItem"]),
        ("GridRow", ["GridCol"]), ("Menu", ["MenuItemGroup", "MenuItem"]), ("MenuItemGroup", ["MenuItem"]),
        ("List", ["ListItem", "ListItemGroup"]), ("ListItemGroup", ["ListItem"]), ("Hyperlink", ["Image"]),
        ("WaterFlow", ["FlowItem"]), ("ContainerSpan", ["Span", "ImageSpan"]),
        ("Shape", COMPONENT_CHILD_IN_SHAPE_LIST.toArray())])
// 特定子组件只能存在于相应父组件的Map
let CONTAINER_TO_SPECIFIC_CHILD_MAP: HashMap<String, Array<String>> = HashMap<String, Array<String>>(
    [("TabContent", ["Tabs"]), ("GridItem", ["Grid"]), ("Span", ["Text", "ContainerSpan"]),
        ("ImageSpan", ["Text", "ContainerSpan"]), ("SymbolSpan", ["Text"]), ("StepperItem", ["Stepper"]),
        ("GridCol", ["GridRow"]), ("MenuItem", ["MenuItemGroup", "Menu"]), ("MenuItemGroup", ["Menu"]),
        ("Blank", ["Row", "Column", "Flex"]), ("ListItem", ["List", "ListItemGroup"]), ("FlowItem", ["WaterFlow"]),
        ("ListItemGroup", ["List"]), ("ContainerSpan", ["Text"])])
let COMPONENT_NO_CHILD_CONSTRAINT_LIST: HashSet<String> = HashSet<String>(
    ["Blank", "Canvas", "Checkbox", "CheckboxGroup", "Circle", "Ellipse", "Divider", "Image", "Line", "LoadingProgress",
        "Path", "Polygon", "Polyline", "Progress", "MenuItem", "QRCode", "Rect", "Span", "ImageSpan", "Search", "Slider",
        "TextInput", "TextPicker", "AlphabetIndexer", "PatternLock", "TextClock", "ImageAnimator", "TextArea", "Select",
        "DatePicker", "Piece", "Radio", "Marquee", "Calendar", "DataPanel", "Rating", "RichText", "Video", "Web",
        "LocationButton", "PasteButton", "SaveButton", "Component3D", "RichEditor", "CalendarPicker", "SymbolSpan",
        "NodeContainer", "Particle", "SymbolGlyph", "TimePicker", "ContentSlot", "TextTimer", "XComponent",
        "SplitLayout", "FoldSplitContainer", "ComposeListItem", "GridObjectSortComponent", "SwipeRefresher",
        "DownloadFileButton", "ProgressButton", "SegmentButton", "Filter", "SelectionMenu", "Chip", "ChipGroup",
        "CounterComponent", "ExceptionPrompt", "Popup", "TreeView", "OffscreenCanvas", "EmbeddedComponent",
        "ComposeTitleBar", "EditableTitleBar", "SelectTitleBar", "TabTitleBar", "ToolBar", "SubHeader", "FormMenu",
        "AtomicServiceTabs", "AtomicServiceWeb", "InterstitialDialogAction", "FullScreenLaunchComponent",
        "NavPushPathHelper", "HandwriteComponent", "LoginPanel", "LoginWithHuaweiIDButton", "MapComponent", "PdfView",
        "TextReaderIcon", "AICaptionComponent", "FunctionalButton", "AlbumPickerComponent", "RecentPhotoComponent",
        "PhotoPickerComponent", "UserAuthIcon", "AVCastPicker", "MovingPhotoView", "AVVolumePanel", "AdComponent",
        "AutoAdComponent", "IconGroupSuffix", "InnerFullScreenLaunchComponent"])
let COMPONENT_TYPE_FOREACH_LIST: HashSet<String> = HashSet<String>(["ForEach", "LazyForEach"])
let COMPONENT_CHILD_IN_LISTCOMPONENT_LIST: HashSet<String> = HashSet<String>(["ListItem", "ListItemGroup"])
let NEWLINE = Token(TokenKind.NL)
