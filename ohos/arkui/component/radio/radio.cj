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

package ohos.arkui.component.radio

import ohos.arkui.component.common.{CommonMethodComponent, Rectangle}
import ohos.arkui.component.native_struct.{CJEdge, VectorNativeRectangleHandle, CJResponseRegion, FFIVectorNativeRectangle}
import ohos.arkui.component.util.{transAppResourceToLength, lessNotEqual}
import ohos.arkui.component.custom_component
import ohos.base.{Length, BASE_LOG, LengthProp}
import ohos.ffi.{Callback1Param}
import ohos.labels.{APILevel, Hide}

foreign {
    func FfiOHOSAceFrameworkRadioCreate(group: CString, value: CString): Unit

    func FfiOHOSAceFrameworkRadioWithIndicatorCreate(group: CString, value: CString, indicatorType: Int32,
        indicatorBuilder: Int64): Unit

    func FfiOHOSAceFrameworkRadioChecked(value: Bool): Unit

    func FfiOHOSAceFrameworkRadioSetStyle(checkedBackgroundColor: UInt32, uncheckedBorderColor: UInt32,
        indicatorColor: UInt32): Unit

    func FfiOHOSAceFrameworkRadioSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkRadioSetPadding(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkRadioSetPaddings(params: CJEdge): Unit

    func FfiOHOSAceFrameworkRadioSetHoverEffect(value: Int32): Unit

    func FfiOHOSAceFrameworkRadioOnChange(callback: Int64): Unit

    func FfiRadioSetResponseRegionArray(array: VectorNativeRectangleHandle): Unit

    func FfiRadioSetResponseRegion(value: CJResponseRegion): Unit
}

/**
 * Defines Radio Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Radio <: CommonMethodComponent<Radio> & RadioAttribute {
    /**
     * Create a radio box.
     *
     * @param { ?String } value - Current value of the radio box.
     * @param { ?String } group - Group name of the radio box.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?String, group!: ?String) {
        unsafe {
            try (groupStr = LibC.mallocCString(group ?? "").asResource(), valStr = LibC.mallocCString(value ?? "").asResource()) {
                FfiOHOSAceFrameworkRadioCreate(groupStr.value, valStr.value)
            }
        }
    }

    /**
     * Called when the radio box is selected.
     *
     * @param { ?Bool } value - Whether the radio box is selected.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func checked(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkRadioChecked(value ?? false)
        }
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        let width_ = transAppResourceToLength(width ?? (-1.0).vp)
        let height_ = transAppResourceToLength(height ?? (-1.0).vp)
        if (lessNotEqual(height_.value, 0.0) || lessNotEqual(width_.value, 0.0)) {
            widthInner(width)
            heightInner(height)
            return this
        }
        unsafe {
            FfiOHOSAceFrameworkRadioSetSize(width_.value, width_.unitType.getValue(),
                height_.value, height_.unitType.getValue()
            )
        }
        this
    }

    protected override func paddingInner(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.0.vp)
        if (lessNotEqual(value_.value, 0.0)) {
            value_ = 0.0.px
        }
        unsafe {
            FfiOHOSAceFrameworkRadioSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(top: ?Length, right: ?Length, bottom: ?Length, left: ?Length): This {
        var top_ = transAppResourceToLength(top ?? 0.vp)
        var right_ = transAppResourceToLength(right ?? 0.vp)
        var bottom_ = transAppResourceToLength(bottom ?? 0.vp)
        var left_ = transAppResourceToLength(left ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRadioSetPaddings(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
        this
    }

    /**
     * Called when the radio box selection status changes.
     *
     * @param { ?(Bool) -> Unit } callback - Callback function when the selection status changes.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(Bool) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        let lambdaData = Callback1Param<Bool, Unit>(tmpCallback)
        unsafe {
            FfiOHOSAceFrameworkRadioOnChange(lambdaData.getID())
        }
        this
    }

    protected override func responseRegionInner(rect: ?Rectangle): This {
        let cjRect = (rect ?? Rectangle()).normalizeValue().parseToNative()
        unsafe {
            FfiRadioSetResponseRegion(
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
            BASE_LOG.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.normalizeValue().parseToNative())
            index++
        }
        unsafe {
            FfiRadioSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }
}
