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

package ohos.component

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SubMenuExpandingMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SIDE_EXPAND
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMBEDDED_EXPAND
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    STACK_EXPAND
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        return match (this) {
            case SIDE_EXPAND => 0
            case EMBEDDED_EXPAND => 1
            case STACK_EXPAND => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DividerStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let strokeWidth: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let color: ResourceColor
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let startMargin: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let endMargin: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth: Length, color: ResourceColor, startMargin: Length, endMargin: Length) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.color = transAppResourceToResourceColor(color)
        this.startMargin = transAppResourceToLength(startMargin)
        this.endMargin = transAppResourceToLength(endMargin)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Menu <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        atomicservice: true,
        crossplatform: true,
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
        atomicservice: true,
        crossplatform: true,
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
        atomicservice: true,
        crossplatform: true,
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
        atomicservice: true,
        crossplatform: true,
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
        atomicservice: true,
        crossplatform: true,
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
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func menuItemDivider(options: ?DividerStyleOptions): This {
        unsafe {
            var hasValue = false
            if (let Some(params) <- options) {
                hasValue = true
                FfiOHOSAceFrameworkMenuSetItemDivider(
                    DividerParams(
                        params.strokeWidth.value,
                        params.strokeWidth.unitType.getValue(),
                        params.color.toUInt32(),
                        params.startMargin.value,
                        params.startMargin.unitType.getValue(),
                        params.endMargin.value,
                        params.endMargin.unitType.getValue(),
                    ),
                    hasValue
                )
            } else {
                FfiOHOSAceFrameworkMenuSetItemDivider(
                    DividerParams(
                        0.0,
                        LENGTH_VP,
                        Color.TRANSPARENT.toUInt32(),
                        0.0,
                        LENGTH_VP,
                        0.0,
                        LENGTH_VP,
                    ),
                    hasValue
                )
            }
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func menuItemGroupDivider(options: ?DividerStyleOptions): This {
        unsafe {
            var hasValue = false
            if (let Some(params) <- options) {
                hasValue = true
                FfiOHOSAceFrameworkMenuSetItemGroupDivider(
                    DividerParams(
                        params.strokeWidth.value,
                        params.strokeWidth.unitType.getValue(),
                        params.color.toUInt32(),
                        params.startMargin.value,
                        params.startMargin.unitType.getValue(),
                        params.endMargin.value,
                        params.endMargin.unitType.getValue(),
                    ),
                    hasValue
                )
            } else {
                FfiOHOSAceFrameworkMenuSetItemGroupDivider(
                    DividerParams(
                        0.0,
                        LENGTH_TYPE_LNVALID,
                        Color.FOREGROUND.toUInt32(),
                        0.0,
                        LENGTH_TYPE_LNVALID,
                        0.0,
                        LENGTH_TYPE_LNVALID,
                    ),
                    hasValue
                )
            }
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func subMenuExpandingMode(mode: SubMenuExpandingMode): This {
        unsafe {
            FfiOHOSAceFrameworkMenuSetExpandingMode(mode.getValue())
        }
        this
    }
}
