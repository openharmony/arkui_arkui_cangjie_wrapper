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

package ohos.arkui.component.checkbox

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

const INVALID_UNIT: Int32 = -1

foreign {
    func FfiOHOSAceFrameworkCheckBoxCreate(name: CString, group: CString): Unit

    func FfiOHOSAceFrameworkCheckBoxSelect(value: Bool): Unit

    func FfiOHOSAceFrameworkCheckBoxSetSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkCheckBoxSetWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxSetHeight(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxSetPadding(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxSetPaddings(params: CJEdge): Unit

    func FfiOHOSAceFrameworkCheckBoxSetOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkCheckBoxSetCheckboxStyle(checkBoxStyle: Int32): Unit

    func FfiCheckBoxSetResponseRegionArray(array: VectorNativeRectangleHandle): Unit

    func FfiCheckBoxSetResponseRegion(value: CJResponseRegion): Unit

    func FfiCheckBoxCreateWithIndicator(name: CString, group: CString, indicatorBuilder: Int64): Unit

    func FfiCheckBoxUnselectedColor(color: UInt32): Unit

    func FfiCheckBoxMarkStyle(strokeColor: UInt32, size: Float64, sizeUnit: Int32, strokeWidth: Float64,
        strokeWidthUnit: Int32): Unit
}

/**
 * Defines a Checkbox callback when onChange.
 * Anonymous Object Rectification.
 *
 * @typedef { function } OnCheckboxChangeCallback
 * @param { boolean } value - selected status
 * @relation declare type OnCheckboxChangeCallback = (value: boolean) => void
 */
public type OnCheckboxChangeCallback = (Bool) -> Unit

/**
 * Defines Checkbox Component.
 *
 * @relation const Checkbox: CheckboxInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Checkbox <: ViewBase {
    /**
     * Construct the Checkbox component.
     * Called when the Checkbox component is used.
     *
     * @param { String } name
     * @param { String } group
     * @param { ?CustomBuilder } indicatorBuilder
     * @returns { Checkbox }
     * @relation (options?: CheckboxOptions): CheckboxAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(name!: String = "", group!: String = "", indicatorBuilder!: ?CustomBuilder = None) {
        unsafe {
            try (nameCString = LibC.mallocCString(name).asResource(),
                 groupCString = LibC.mallocCString(group).asResource()) {
                if (let Some(v) <- indicatorBuilder) {
                    FfiCheckBoxCreateWithIndicator(nameCString.value, groupCString.value, Callback0Param<Unit>(v).getID())
                } else {
                    FfiOHOSAceFrameworkCheckBoxCreate(nameCString.value, groupCString.value)
                }
            }
        }
    }

    /**
     * setting whether checkbox is selected.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation select(value: boolean): CheckboxAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func select(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSelect(value)
        }
        this
    }

    /**
     * setting the display color of checkbox.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation selectedColor(value: ResourceColor): CheckboxAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetSelectedColor(transAppResourceToResourceColor(value))
        }
        this
    }

    protected override func widthInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func heightInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func sizeInner(width: Length, height: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetPaddings(
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
     * Called when the selection status changes.
     * Anonymous Object Rectification.
     *
     * @param { OnCheckboxChangeCallback } callback
     * @returns { This }
     * @relation onChange(callback: OnCheckboxChangeCallback): CheckboxAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: OnCheckboxChangeCallback): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetOnChange(lambdaData.getID())
        }
        this
    }

    /**
     * setting the shape of checkbox.
     *
     * @param { CheckBoxShape } value - The configuration of checkbox shape.
     * @returns { This }
     * @relation shape(value: CheckBoxShape): CheckboxAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shape(value: CheckBoxShape): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetCheckboxStyle(value.getValue())
        }
        this
    }

    protected override func responseRegionInner(rect: Rectangle): This {
        let cjRect = rect.parseToNative()
        unsafe {
            FfiCheckBoxSetResponseRegion(
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
            FfiCheckBoxSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }
}
