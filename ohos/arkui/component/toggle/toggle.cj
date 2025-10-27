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

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines Toggle Component.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Toggle <: CommonMethodComponent<Toggle> & ToggleAttribute {

    /**
     * Set parameters to obtain the toggle.
     *
     * @param { ?ToggleType } toggleType - Type of the toggle button.
     * @param { ?Bool } isOn - Initial selected state of the toggle button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(toggleType: ?ToggleType, isOn!: ?Bool = None) {
        let tmpToggleType = toggleType ?? ToggleType.Switch
        unsafe {
            FfiOHOSAceFrameworkToggleCreate(tmpToggleType.getValue(), isOn ?? false)
        }
    }

    /**
     * Set parameters to obtain the toggle.
     *
     * @param { ?ToggleType } toggleType - Type of the toggle button.
     * @param { ?Bool } isOn - Initial selected state of the toggle button.
     * @param { () -> Unit } subcomponent - Subcomponent builder function.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(toggleType: ?ToggleType, isOn: ?Bool, subcomponent: () -> Unit) {
        let tmpToggleType = toggleType ?? ToggleType.Switch
        unsafe {
            FfiOHOSAceFrameworkToggleCreate(tmpToggleType.getValue(), isOn ?? false)
        }
        match (tmpToggleType) {
            case ToggleType.Button => this.child = subcomponent
            case _ => ()
        }
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkToggleWidth(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkToggleHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        if (width.isNone() || height.isNone()) {
            widthInner(width)
            heightInner(height)
        } else {
            var width_ = transAppResourceToLength(width ?? 0.0.vp)
            var height_ = transAppResourceToLength(height ?? 0.0.vp)
            unsafe {
                FfiOHOSAceFrameworkToggleSize(width_.value, width_.unitType.getValue(), height_.value,
                    height_.unitType.getValue())
            }
        }
        this
    }

    protected override func paddingInner(top: ?Length, right: ?Length, bottom: ?Length, left: ?Length): This {
        var top_ = transAppResourceToLength(top ?? 0.vp)
        var right_ = transAppResourceToLength(right ?? 0.vp)
        var bottom_ = transAppResourceToLength(bottom ?? 0.vp)
        var left_ = transAppResourceToLength(left ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkTogglePadding(left_.value, left_.unitType.getValue(), top_.value,
                top_.unitType.getValue(), right_.value, right_.unitType.getValue(), bottom_.value,
                bottom_.unitType.getValue())
        }
        this
    }

    /**
     * Set the color of the selected button.
     *
     * @param { ?ResourceColor } value - Color of the selected button.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkToggleSelectedColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Set the color of the switch point.
     *
     * @param { ?ResourceColor } color - Color of the switch point.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func switchPointColor(color: ?ResourceColor): This {
        let tmpColor = color ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkToggleSwitchPointColor(transAppResourceToResourceColor(tmpColor))
        }
        this
    }

    protected override func responseRegionInner(rect: ?Rectangle): This {
        let cjRect = (rect ?? Rectangle()).parseToNative()
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

    protected override func responseRegionInner(array: ?Array<Rectangle>): This {
        let tmpArray = array ?? [Rectangle()]
        let vecFFi = FFIVectorNativeRectangle(tmpArray.size)
        var index = 0
        for (rect in tmpArray) {
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
     * @param { ?(Bool) -> Unit } callback - Callback function triggered when the selected state changes.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(Bool) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        unsafe {
            FfiOHOSAceFrameworkToggleOnChange(Callback1Param<Bool, Unit>(tmpCallback).getID())
        }
        this
    }

    protected override func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTogglePop()
        }
    }
}
