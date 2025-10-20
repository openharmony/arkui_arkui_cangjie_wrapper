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

package ohos.arkui.component.menu

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.resource.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkMenuCreate(): Unit

    func FfiOHOSAceFrameworkMenuFont(size: Float64, unit: Int32, weight: CString, family: CString, style: Int32): Unit

    func FfiOHOSAceFrameworkMenuSetFontColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkMenuSetWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkMenuSetRadiusByLength(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkMenuSetRadiusByBorderRadiuses(value: CBorderRadiuses): Unit

    func FfiOHOSAceFrameworkMenuSetItemDivider(params: DividerParams, hasValue: Bool): Unit

    func FfiOHOSAceFrameworkMenuSetItemGroupDivider(params: DividerParams, hasValue: Bool): Unit

    func FfiOHOSAceFrameworkMenuSetExpandingMode(mode: Int32): Unit

    func FFISetWidthWithEmpty(): Unit
}

let LENGTH_TYPE_LNVALID: Int32 = -2

/**
 * Defines the Menu Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Menu <: CommonMethodComponent<Menu> & MenuAttribute {

    /**
     * Creates the menu component.
     *
     * @param { () -> Unit } child
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkMenuCreate()
        }
        this.child = child
    }

    /**
     * Sets the font style.
     * Family and style are not supported currently and will be fixed in future.
     *
     * @param { ?Length } size
     * @param { ?FontWeight } weight
     * @param { ?ResourceStr } family
     * @param { ?FontStyle } style
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        size!: ?Length = None,
        weight!: ?FontWeight = None,
        family!: ?ResourceStr = None,
        style!: ?FontStyle = None
    ): This {
        unsafe {
            try (weightCString = LibC.mallocCString((weight ?? FontWeight.Normal).getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkMenuFont(transAppResourceToLength(size ?? 16.vp).value,
                    transAppResourceToLength(size ?? 16.vp).unitType.getValue(), weightCString.value, fontFamilyCString.value,
                    (style ?? FontStyle.Normal).getValue())
            }
        }
        this
    }

    /**
     * Sets the Menu font color.
     *
     * @param { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkMenuSetFontColor(transAppResourceToResourceColor(value ?? 0x99000000));
        }
        this
    }

    /**
     * Sets the radius of the corner around the menu.
     * When the radius is less than the menu width, the default border radius is used.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var value_ = transAppResourceToLength(tmpValue)
        if (value_.value < 0.0f64) {
            return this
        }
        unsafe {
            FfiOHOSAceFrameworkMenuSetRadiusByLength(value_.value, value_.unitType.getValue());
        }
        this
    }

    /**
     * Sets the radius of the corner around the menu.
     * When the radius is less than the menu width, the default border radius is used.
     *
     * @param { ?BorderRadiuses } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: ?BorderRadiuses): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkMenuSetRadiusByBorderRadiuses(tmpValue.toCBorderRadiuses());
        }
        this
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkMenuSetWidth(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }
}
