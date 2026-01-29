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

package ohos.arkui.component.menu_item

import ohos.arkui.component.common.{FontWeight, FontStyle}
import ohos.arkui.component.util.{transResourceMediaToString, transResourceStrToString, transAppResourceToLength, transAppResourceToResourceColor}
import ohos.base.{ResourceStr, Length, ResourceColor, LengthProp}
import ohos.ffi.{Callback0Param, Callback1Param}
import ohos.arkui.component.common.{CommonMethodComponent}
import ohos.labels.{APILevel}

foreign {
    func FfiOHOSAceFrameworkMenuItemCreateByBuilder(builder: Int64): Unit

    func FfiOHOSAceFrameworkMenuItemCreateByOption(startIcon: CString, content: CString, endIcon: CString,
        labelInfo: CString, builder: Int64): Unit

    func FfiOHOSAceFrameworkMenuItemIsSelected(value: Bool): Unit

    func FfiOHOSAceFrameworkMenuItemSelectIconByBool(value: Bool): Unit

    func FfiOHOSAceFrameworkMenuItemSelectIconByResource(value: CString): Unit

    func FfiOHOSAceFrameworkMenuItemContentFont(size: Float64, unit: Int32, weight: CString, family: CString,
        style: Int32): Unit

    func FfiOHOSAceFrameworkMenuItemContentFontColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkMenuItemLabelFont(size: Float64, unit: Int32, weight: CString, family: CString, style: Int32): Unit

    func FfiOHOSAceFrameworkMenuItemLabelFontColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkMenuItemOnChange(callback: Int64): Unit
}

let DEFAULT_MENU_ITEM_FONT_COLOR = 0x99000000
let DEFAULT_MENU_ITEM_CONTENT_FONT_COLOR = 0xE5000000

/**
 * A component that represents a single item within a Menu component, typically with text, icons, and optional submenus.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuItem <: CommonMethodComponent<MenuItem> & MenuItemAttribute {

    /**
     * Initializes a MenuItem component with optional child content.
     *
     * @param { () -> Unit } child - The child component builder function for the menu item.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkMenuItemCreateByBuilder(Callback0Param<Unit>(child).getID())
        }
    }

    /**
     * Initializes a MenuItem component with icon, content, and label information.
     *
     * @param { ?ResourceStr } startIcon - Defines the start display image info.
     * @param { ?ResourceStr } content - Defines the content string display info.
     * @param { ?ResourceStr } endIcon - Defines the end display image info.
     * @param { ?ResourceStr } labelInfo - Defines the end label info like shortcut.
     * @param { Option<() -> Unit> } builder - Create the submenu.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(startIcon!: ?ResourceStr, content!: ?ResourceStr, endIcon!: ?ResourceStr, labelInfo!: ?ResourceStr,
        builder!: Option<() -> Unit> = None) {
        let builderId = if (let Some(fn) <- builder) {
            Callback0Param<Unit>(fn).getID()
        } else {
            0
        }
        unsafe {
            try (cstartIcon = LibC.mallocCString(transResourceMediaToString(startIcon ?? "")).asResource(),
                ccontent = LibC.mallocCString(transResourceStrToString(content ?? "")).asResource(),
                cendIcon = LibC.mallocCString(transResourceMediaToString(endIcon ?? "")).asResource(),
                clabelInfo = LibC.mallocCString(transResourceStrToString(labelInfo ?? "")).asResource()) {
                FfiOHOSAceFrameworkMenuItemCreateByOption(
                    cstartIcon.value,
                    ccontent.value,
                    cendIcon.value,
                    clabelInfo.value,
                    builderId
                )
            }
        }
    }

    /**
     * Setting whether menuItem is selected.
     * Configures the selection state of the menu item.
     *
     * @param { ?Bool } value - menuItem is selected.
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(value: ?Bool): This {
        let tmpValue = value ?? false
        unsafe {
            FfiOHOSAceFrameworkMenuItemIsSelected(tmpValue)
        }
        this
    }

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     * Controls the visibility of the check icon when the menu item is selected.
     *
     * @param { ?Bool } value - Indicates whether to display the check icon when selected.
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectIcon(value: ?Bool): This {
        let tmpValue = value ?? false
        unsafe {
            FfiOHOSAceFrameworkMenuItemSelectIconByBool(tmpValue)
        }
        this
    }

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     * Sets a custom icon to display when the menu item is selected.
     *
     * @param { ?ResourceStr } value - Indicates whether to display icon when selected.
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectIcon(value: ?ResourceStr): This {
        let tmpValue = value ?? ""
        unsafe {
            try (icon = LibC.mallocCString(transResourceMediaToString(tmpValue)).asResource()) {
                FfiOHOSAceFrameworkMenuItemSelectIconByResource(icon.value)
            }
        }
        this
    }

    /**
     * Configures the font properties of the menu item content text.
     *
     * @param { ?Length } size - Indicates the font size of content text.
     * @param { ?FontWeight } weight - Indicates the font weight of content text.
     * @param { ?ResourceStr } family - Indicates the font family of content text.
     * @param { ?FontStyle } style - Indicates the font style of content text.
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFont(
        size!: ?Length = None,
        weight!: ?FontWeight = None,
        family!: ?ResourceStr = None,
        style!: ?FontStyle = None
    ): This {
        let tmpWeight = weight ?? FontWeight.Normal
        let tmpStyle = style ?? FontStyle.Normal
        unsafe {
            try (weightCString = LibC.mallocCString(tmpWeight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkMenuItemContentFont(
                    transAppResourceToLength(size ?? 16.vp).value,
                    transAppResourceToLength(size ?? 16.vp).unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    tmpStyle.getValue()
                )
            }
        }
        this
    }

    /**
     * Sets the font color of content text.
     * Configures the font color of the menu item content text.
     *
     * @param { ?ResourceColor } value - Indicates the font color of content text.
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFontColor(value: ?ResourceColor): This {
        unsafe {
            let color = transAppResourceToResourceColor(value ?? DEFAULT_MENU_ITEM_CONTENT_FONT_COLOR)
            FfiOHOSAceFrameworkMenuItemContentFontColor(color.toUInt32())
        }
        this
    }

    /**
     * Sets the label info font style.
     * Configures the font properties of the menu item label text.
     *
     * @param { ?Length } size - Indicates the font size of label info text.
     * @param { ?FontWeight } weight - Indicates the font weight of label info text.
     * @param { ?ResourceStr } family - Indicates the font family of label info text.
     * @param { ?FontStyle } style - Indicates the font style of label info text.
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFont(
        size!: ?Length = None,
        weight!: ?FontWeight = None,
        family!: ?ResourceStr = None,
        style!: ?FontStyle = None
    ): This {
        unsafe {
            try (weightCString = LibC.mallocCString((weight ?? FontWeight.Normal).getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkMenuItemLabelFont(
                    transAppResourceToLength(size ?? 16.vp).value,
                    transAppResourceToLength(size ?? 16.vp).unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    (style ?? FontStyle.Normal).getValue()
                )
            }
        }
        this
    }

    /**
     * Sets the font color of label info text.
     * Configures the font color of the menu item label text.
     *
     * @param { ?ResourceColor } value - Indicates the font color of label info text.
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFontColor(value: ?ResourceColor): This {
        unsafe {
            let color = transAppResourceToResourceColor(value ?? DEFAULT_MENU_ITEM_FONT_COLOR)
            FfiOHOSAceFrameworkMenuItemLabelFontColor(color.toUInt32())
        }
        this
    }

    /**
     * Triggers a callback when a menu item is selected or unchecked.
     * Called when the selection state of the menu item changes.
     *
     * @param { ?(Bool) -> Unit } callback - Callback when a menu item is selected or unchecked.
     * The parameter indicates whether the menu item is currently selected (true) or not (false).
     * @returns { This } Returns the MenuItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(Bool) -> Unit): This {
        let tmpCallback = callback ?? { _: Bool => }
        let lambdaData = Callback1Param<Bool, Unit>(tmpCallback)
        unsafe {
            FfiOHOSAceFrameworkMenuItemOnChange(lambdaData.getID())
        }
        this
    }
}
