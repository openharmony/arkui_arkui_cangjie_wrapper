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

package ohos.arkui.component.radio

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.arkui.component.view
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

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
 *
 * @relation declare const Radio: RadioInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Radio <: ViewBase {
    /**
     * Create a radio box.
     *
     * @param { String } value
     * @param { String } group
     * @returns { This }
     * @relation (options: RadioOptions): RadioAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String, group!: String) {
        unsafe {
            try (groupStr = LibC.mallocCString(group).asResource(), valStr = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkRadioCreate(groupStr.value, valStr.value)
            }
        }
    }

    /**
     * Called when the radio box is selected.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation checked(value: boolean): RadioAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func checked(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkRadioChecked(value)
        }
        this
    }

    protected override func sizeInner(width: Length, height: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkRadioSetSize(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
        }
        this
    }

    protected override func paddingInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkRadioSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
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
     * @param { (Bool) -> Unit } callback
     * @returns { This }
     * @relation onChange(callback: (isChecked: boolean) => void): RadioAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkRadioOnChange(lambdaData.getID())
        }
        this
    }

    protected override func responseRegionInner(rect: Rectangle): This {
        let cjRect = rect.parseToNative()
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

    protected override func responseRegionInner(array: Array<Rectangle>): This {
        let vecFFi = FFIVectorNativeRectangle(array.size)
        var index = 0
        for (rect in array) {
            BaseLog.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.parseToNative())
            index++
        }
        unsafe {
            FfiRadioSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }
}
