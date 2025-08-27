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

package ohos.arkui.component.menu_item

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

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

/**
 * Defines MenuItem Component.
 *
 * @relation declare const MenuItem: MenuItemInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuItem <: ViewBase {

    /**
     * Creates the MenuItem component.
     *
     * @param { () -> Unit } child
     * @returns { This }
     * @relation (value?: MenuItemOptions | CustomBuilder): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkMenuItemCreateByBuilder(Callback0Param<Unit>(child).getID())
        }
    }

    /**
     * Creates the MenuItem component.
     *
     * @param { ResourceStr } startIcon
     * @param { ResourceStr } content
     * @param { ResourceStr } endIcon
     * @param { ResourceStr } labelInfo
     * @param { Option<() -> Unit> } builder
     * @returns { This }
     * @relation (value?: MenuItemOptions | CustomBuilder): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(startIcon!: ResourceStr, content!: ResourceStr, endIcon!: ResourceStr, labelInfo!: ResourceStr,
        builder!: Option<() -> Unit> = None) {
        let builderId = if (let Some(fn) <- builder) {
            Callback0Param<Unit>(fn).getID()
        } else {
            0
        }
        unsafe {
            try (cstartIcon = LibC.mallocCString(transResourceMediaToString(startIcon)).asResource(),
                ccontent = LibC.mallocCString(transResourceStrToString(content)).asResource(),
                cendIcon = LibC.mallocCString(transResourceMediaToString(endIcon)).asResource(),
                clabelInfo = LibC.mallocCString(transResourceStrToString(labelInfo)).asResource()) {
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
     *
     * @param { Bool } value
     * @returns { This }
     * @relation selected(value: boolean): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkMenuItemIsSelected(value)
        }
        this
    }

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation selectIcon(value: boolean | ResourceStr | SymbolGlyphModifier): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectIcon(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkMenuItemSelectIconByBool(value)
        }
        this
    }

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     *
     * @param { ResourceStr } value
     * @returns { This }
     * @relation selectIcon(value: boolean | ResourceStr | SymbolGlyphModifier): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectIcon(value: ResourceStr): This {
        unsafe {
            try (icon = LibC.mallocCString(transResourceMediaToString(value)).asResource()) {
                FfiOHOSAceFrameworkMenuItemSelectIconByResource(icon.value)
            }
        }
        this
    }

    /**
     * Sets the content font style.
     *
     * @param { Length } size
     * @param { FontWeight } weight
     * @param { ResourceStr } family
     * @param { FontStyle } style   
     * @returns { This }
     * @relation contentFont(value: Font): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFont(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: ResourceStr = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family)).asResource()) {
                FfiOHOSAceFrameworkMenuItemContentFont(
                    transAppResourceToLength(size).value,
                    transAppResourceToLength(size).unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    style.getValue()
                )
            }
        }
        this
    }

    /**
     * Sets the font color of content text.
     *
     * @param { ResourceColor } value 
     * @returns { This }
     * @relation contentFontColor(value: ResourceColor): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFontColor(value: ResourceColor): This {
        unsafe {
            let color = transAppResourceToResourceColor(value)
            FfiOHOSAceFrameworkMenuItemContentFontColor(color.toUInt32())
        }
        this
    }

    /**
     * Sets the label info font style.
     *
     * @param { Length } size
     * @param { FontWeight } weight
     * @param { ResourceStr } family
     * @param { FontStyle } style   
     * @returns { This }
     * @relation labelFont(value: Font): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFont(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: ResourceStr = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family)).asResource()) {
                FfiOHOSAceFrameworkMenuItemLabelFont(
                    transAppResourceToLength(size).value,
                    transAppResourceToLength(size).unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    style.getValue()
                )
            }
        }
        this
    }

    /**
     * Sets the font color of label info text.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation labelFontColor(value: ResourceColor): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFontColor(value: ResourceColor): This {
        unsafe {
            let color = transAppResourceToResourceColor(value)
            FfiOHOSAceFrameworkMenuItemLabelFontColor(color.toUInt32())
        }
        this
    }

    /**
     * Triggers a callback when a menu item is selected or unchecked.
     *
     * @param { (Bool) -> Unit } callback
     * @returns { This }
     * @relation onChange(callback: (selected: boolean) => void): MenuItemAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkMenuItemOnChange(lambdaData.getID())
        }
        this
    }
}
