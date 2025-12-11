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

import ohos.arkui.component.common.{CommonMethodComponent, CustomBuilder, CheckBoxShape, Rectangle}
import ohos.arkui.component.native_struct.{VectorNativeRectangleHandle, CJResponseRegion, CJEdge, FFIVectorNativeRectangle}
import ohos.arkui.component.util.{transAppResourceToResourceColor, transAppResourceToLength, lessNotEqual}
import ohos.base.{ResourceColor, Length, BASE_LOG, LengthProp}
import ohos.ffi.{Callback0Param, Callback1Param}
import ohos.labels.{APILevel, Hide}

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

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines a Checkbox callback when onChange.
 *
 * @param { Bool } value - selected status.
 */
public type OnCheckboxChangeCallback = (Bool) -> Unit

/**
 * Defines Checkbox Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Checkbox <: CommonMethodComponent<Checkbox> & CheckboxAttribute {
    /**
     * Construct the Checkbox component.
     * Called when the Checkbox component is used.
     *
     * @param { ?String } name - The initial name of current checkbox.
     * @param { ?String } group - The initial group name of current checkbox.
     * @param { ?CustomBuilder } indicatorBuilder - The builder of current checkbox.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(name!: ?String = None, group!: ?String = None, indicatorBuilder!: ?CustomBuilder = None) {
        unsafe {
            try (nameCString = LibC.mallocCString(name ?? "").asResource(),
                 groupCString = LibC.mallocCString(group ?? "").asResource()) {
                if (let Some(v) <- indicatorBuilder) {
                    FfiCheckBoxCreateWithIndicator(nameCString.value, groupCString.value, Callback0Param<Unit>(v).getID())
                } else {
                    FfiOHOSAceFrameworkCheckBoxCreate(nameCString.value, groupCString.value)
                }
            }
        }
    }

    /**
     * Set whether checkbox is selected.
     *
     * @param { ?Bool } value - Whether the checkbox is selected.
     * @default true
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func select(value: ?Bool): This {
        let tmpValue = value ?? false
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSelect(tmpValue)
        }
        this
    }

    /**
     * Set the display color of checkbox.
     *
     * @param { ?ResourceColor } value - The color to display.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ?ResourceColor): This {
        // Need get default value from ffi, value from base/global/system_resources
        let tmpValue = value ?? 0xff007dff
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetSelectedColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    if (lessNotEqual(value_.value, 0.0)) {
                        FFISetWidthWithEmpty()
                    } else { 
                        FfiOHOSAceFrameworkCheckBoxSetWidth(value_.value, value_.unitType.getValue())
                    }
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
                    if (lessNotEqual(value_.value, 0.0)) {
                        FFISetHeightWithEmpty()
                    } else {
                        FfiOHOSAceFrameworkCheckBoxSetHeight(value_.value, value_.unitType.getValue())
                    }
                }
            case None => unsafe { FFISetHeightWithEmpty() }
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
            FfiOHOSAceFrameworkCheckBoxSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(top: ?Length, right: ?Length, bottom: ?Length, left: ?Length): This {
        var top_ = transAppResourceToLength(top ?? 0.vp)
        var right_ = transAppResourceToLength(right ?? 0.vp)
        var bottom_ = transAppResourceToLength(bottom ?? 0.vp)
        var left_ = transAppResourceToLength(left ?? 0.vp)
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
     *
     * @param { ?OnCheckboxChangeCallback } callback - The callback on selected status change.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?OnCheckboxChangeCallback): This {
        let tmpCallback = callback ?? { _: Bool => }
        let lambdaData = Callback1Param<Bool, Unit>(tmpCallback)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetOnChange(lambdaData.getID())
        }
        this
    }

    /**
     * Setting the shape of checkbox.
     *
     * @param { ?CheckBoxShape } value - The configuration of checkbox shape.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shape(value: ?CheckBoxShape): This {
        let tmpValue = value ?? CheckBoxShape.Circle
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetCheckboxStyle(tmpValue.getValue())
        }
        this
    }

    protected override func responseRegionInner(rect: ?Rectangle): This {
        let cjRect = (rect ?? Rectangle()).normalizeValue().parseToNative()
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
            FfiCheckBoxSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }
}
