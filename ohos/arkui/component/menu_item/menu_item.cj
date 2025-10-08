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

let defaultMenuItemFontColor = 0x99000000
let defaultMenuItemContentFontColor = 0xE5000000

/**
 * Defines MenuItem Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuItem <: CommonMethodComponent<MenuItem> & MenuItemAttribute {

    /**
     * Creates the MenuItem component.
     *
     * @params { () -> Unit } child
     */
    @!APILevel[
        22,
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
     * @params { ?ResourceStr } startIcon
     * @params { ?ResourceStr } content
     * @params { ?ResourceStr } endIcon
     * @params { ?ResourceStr } labelInfo
     * @params { Option<() -> Unit> } builder
     */
    @!APILevel[
        22,
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
     *
     * @params { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        22,
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
     *
     * @params { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        22,
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
     *
     * @params { ?ResourceStr } value
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * Sets the content font style.
     *
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style   
     * @returns { This }
     */
    @!APILevel[
        22,
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
     *
     * @params { ?ResourceColor } value 
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFontColor(value: ?ResourceColor): This {
        unsafe {
            let color = transAppResourceToResourceColor(value ?? defaultMenuItemContentFontColor)
            FfiOHOSAceFrameworkMenuItemContentFontColor(color.toUInt32())
        }
        this
    }

    /**
     * Sets the label info font style.
     *
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style   
     * @returns { This }
     */
    @!APILevel[
        22,
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
     *
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFontColor(value: ?ResourceColor): This {
        unsafe {
            let color = transAppResourceToResourceColor(value ?? defaultMenuItemFontColor)
            FfiOHOSAceFrameworkMenuItemLabelFontColor(color.toUInt32())
        }
        this
    }

    /**
     * Triggers a callback when a menu item is selected or unchecked.
     *
     * @params { ?(Bool) -> Unit } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(Bool) -> Unit): This {
        let tmpCallback = callback ?? { res: Bool => }
        let lambdaData = Callback1Param<Bool, Unit>(tmpCallback)
        unsafe {
            FfiOHOSAceFrameworkMenuItemOnChange(lambdaData.getID())
        }
        this
    }
}
