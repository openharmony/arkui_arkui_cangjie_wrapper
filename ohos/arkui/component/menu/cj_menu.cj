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
}

let LENGTH_TYPE_LNVALID: Int32 = -2

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Menu <: ContainerBase {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkMenuCreate()
        }
        this.child = child
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkMenuFont(transAppResourceToLength(size).value,
                    transAppResourceToLength(size).unitType.getValue(), weightCString.value, fontFamilyCString.value,
                    style.getValue())
            }
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        font(
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkMenuSetFontColor(transAppResourceToResourceColor(color));
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: Length): This {
        var value_ = transAppResourceToLength(value)
        if (value_.value < 0.0f64) {
            return this
        }
        unsafe {
            FfiOHOSAceFrameworkMenuSetRadiusByLength(value_.value, value_.unitType.getValue());
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: BorderRadiuses): This {
        unsafe {
            FfiOHOSAceFrameworkMenuSetRadiusByBorderRadiuses(value.toCBorderRadiuses());
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkMenuSetWidth(value_.value, value_.unitType.getValue());
        }
        this
    }
}
