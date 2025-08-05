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
    func FfiOHOSAceFrameworkPanelCreate(isShow: Bool): Unit

    func FfiOHOSAceFrameworkPanelType(ty: Int32): Unit

    func FfiOHOSAceFrameworkPanelMode(mode: Int32): Unit

    func FfiOHOSAceFrameworkPanelDragBar(hasDragBar: Bool): Unit

    func FfiOHOSAceFrameworkPanelFullHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPanelHalfHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPanelMiniHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPanelShow(isShow: Bool): Unit

    func FfiOHOSAceFrameworkPanelShowCloseIcon(showCloseIcon: Bool): Unit

    func FfiOHOSAceFrameworkPanelBackgroundMask(color: UInt32): Unit

    func FfiOHOSAceFrameworkPanelOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkPanelOnHeightChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkPanelBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPanelBorder(params: CJBorder): Unit

    func FfiOHOSAceFrameworkPanelBorderWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPanelBorderColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPanelBorderRadius(radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPanelBorderStyle(style: Int32): Unit

    func FfiOHOSAceFrameworkPanelPop(): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Panel <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(show: Bool, content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkPanelCreate(show)
        }
        this.child = content
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func panelType(ty: PanelType): This {
        unsafe {
            FfiOHOSAceFrameworkPanelType(ty.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func mode(mode: PanelMode): This {
        unsafe {
            FfiOHOSAceFrameworkPanelMode(mode.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dragBar(hasDragBar: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkPanelDragBar(hasDragBar)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fullHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkPanelFullHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func halfHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkPanelHalfHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func miniHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkPanelMiniHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func show(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkPanelShow(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showCloseIcon(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkPanelShowCloseIcon(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundMask(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkPanelBackgroundMask(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Float64, Float64, PanelMode) -> Unit): This {
        let wrapper = {
            width: Float64, height: Float64, mode: Int32 => callback(width, height, PanelMode.parseValue(mode))
        }
        let lambdaData = Callback3Param<Float64, Float64, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkPanelOnChange(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onHeightChange(callback: (Float64) -> Unit): This {
        let lambdaData = Callback1Param<Float64, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkPanelOnHeightChange(lambdaData.getID())
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
    public override func backgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkPanelBackgroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    /**
     * Sets the inner border style.
     *
     * @param width: Border width.
     * @param color: Border color.
     * @param radius: Border corner radius.
     * @param style: Border style.
     * @return This: Current object.
     * @since 11
     */
    protected override func borderInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: BorderStyle
    ): This {
        var width_ = transAppResourceToLength(width)
        var color_ = transAppResourceToResourceColor(color)
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkPanelBorder(
                CJBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    color_.toUInt32(),
                    radius_.value,
                    radius_.unitType.getValue(),
                    style.getValue()
                )
            )
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
    public override func borderWidth(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            AceLog.debug("panel border width")
            FfiOHOSAceFrameworkPanelBorderWidth(width_.value, width_.unitType.getValue())
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
    public override func borderColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkPanelBorderColor(transAppResourceToResourceColor(color))
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
    public override func borderRadius(radius: Length): This {
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkPanelBorderRadius(radius_.value, radius_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderStyle(style: BorderStyle): This {
        unsafe {
            FfiOHOSAceFrameworkPanelBorderStyle(style.getValue())
        }
        this
    }

    /**
     * @deprecated
     */
    protected func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkPanelPop()
        }
    }
}
