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

package ohos.arkui.component.toggle

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkToggleCreate(toggleType: Int32, isOn: Bool): Unit

    func FfiOHOSAceFrameworkToggleWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkToggleHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkToggleSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkTogglePadding(left: Float64, leftUnit: Int32, top: Float64, topUnit: Int32, right: Float64,
        rightUnit: Int32, bottom: Float64, bottomUnit: Int32): Unit

    func FfiOHOSAceFrameworkToggleSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkToggleSwitchPointColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkToggleOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTogglePop(): Unit

    func FfiToggleSetResponseRegionArray(array: VectorNativeRectangleHandle): Unit

    func FfiToggleSetResponseRegion(value: CJResponseRegion): Unit

    func FfiOHOSAceFrameworkToggleSwitchStyle(pointRadius: Float64, unselectedColor: UInt32, pointColor: UInt32,
        trackBorderRadius: Float64): Unit

    func FfiOHOSAceFrameworkToggleBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkToggleRadius(radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkToggleHoverEffect(value: Int32): Unit
}

/**
 * Defines Toggle Component.
 *
 * @relation declare const Toggle: ToggleInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Toggle <: ContainerBase {

    /**
     * Set parameters to obtain the toggle.
     *
     * @param { ToggleType } toggleType
     * @param { Bool } isOn
     * @returns { This }
     * @relation (options: ToggleOptions): ToggleAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(toggleType: ToggleType, isOn!: Bool = false) {
        unsafe {
            FfiOHOSAceFrameworkToggleCreate(toggleType.getValue(), isOn)
        }
    }

    /**
     * Set parameters to obtain the toggle.
     *
     * @param { ToggleType } toggleType
     * @param { Bool } isOn
     * @param { () -> Unit } subcomponent
     * @returns { This }
     * @relation (options: ToggleOptions): ToggleAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(toggleType: ToggleType, isOn: Bool, subcomponent: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkToggleCreate(toggleType.getValue(), isOn)
        }
        match (toggleType) {
            case ToggleType.Button => this.child = subcomponent
            case _ => ()
        }
    }

    protected override func widthInner(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkToggleWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    protected override func heightInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkToggleHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func sizeInner(width: Length, height: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkToggleSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkTogglePadding(left_.value, left_.unitType.getValue(), top_.value,
                top_.unitType.getValue(), right_.value, right_.unitType.getValue(), bottom_.value,
                bottom_.unitType.getValue())
        }
        this
    }

    /**
     * Called when the color of the selected button is set.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation selectedColor(value: ResourceColor): ToggleAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkToggleSelectedColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Called when the color of the selected button is set.
     *
     * @param { ResourceColor } color
     * @returns { This }
     * @relation switchPointColor(color: ResourceColor): ToggleAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func switchPointColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkToggleSwitchPointColor(transAppResourceToResourceColor(color))
        }
        this
    }

    protected override func responseRegionInner(rect: Rectangle): This {
        let cjRect = rect.parseToNative()
        unsafe {
            FfiToggleSetResponseRegion(
                CJResponseRegion(
                    cjRect.x,
                    cjRect.xUnit,
                    cjRect.y,
                    cjRect.yUnit,
                    cjRect.width,
                    cjRect.widthUnit,
                    cjRect.height,
                    cjRect.heightUnit
                )
            )
        }
        this
    }

    protected override func responseRegionInner(array: Array<Rectangle>): This {
        let vecFFi = FFIVectorNativeRectangle(array.size)
        var index = 0
        for (rect in array) {
            BaseLog.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.parseToNative())
            index++
        }
        unsafe {
            FfiToggleSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }

    /**
     * Called when the selected state of the component changes.
     *
     * @param { (Bool) -> Unit } callback
     * @returns { This }
     * @relation onChange(callback: (isOn: boolean) => void): ToggleAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Bool) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkToggleOnChange(Callback1Param<Bool, Unit>(callback).getID())
        }
        this
    }

    protected override func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTogglePop()
        }
    }
}
