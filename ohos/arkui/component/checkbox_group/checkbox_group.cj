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

package ohos.arkui.component.checkbox_group

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.ArrayList
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkCheckBoxGroupCreate(group: CString): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSelectAll(flag: Bool): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetHeight(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetPadding(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetPaddings(params: CJEdge): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetOnChange(callback: Int64): Unit

    func FfiCheckBoxGroupSetResponseRegionArray(array: VectorNativeRectangleHandle): Unit

    func FfiCheckBoxGroupSetResponseRegion(value: CJResponseRegion): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetUnSelectedColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetMark(strokeColor: UInt32, size: Float64, sizeUnit: Int32,
        strokeWidth: Float64, strokeWidthUnit: Int32): Unit

    func FfiOHOSAceFrameworkCheckBoxGroupSetCheckboxShape(value: Int32): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines a CheckboxGroup callback when onChange.
 * Anonymous Object Rectification.
 *
 * @param { CheckboxGroupResult } value - checkbox group result
 */
public type OnCheckboxGroupChangeCallback = (CheckboxGroupResult) -> Unit

class CallbackFFiCheckboxGroupResult <: BaseCallBack {
    CallbackFFiCheckboxGroupResult(let closure: (FFiCheckboxGroupResult) -> Unit) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackFFiCheckboxGroupResult")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<FFiCheckboxGroupResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackFFiCheckboxGroupResult")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

/**
 * Defines the options of CheckboxGroupResult.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CheckboxGroupResult {
    /**
     * Set the group of status.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var status: SelectStatus
    /**
     * Checkbox name.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var name: Array<String>

    /**
     * CheckboxGroupResult constructor.
     *
     * @param { SelectStatus } status
     * @param { Array<String> } name
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        status: SelectStatus,
        name: Array<String>
    ) {
        this.status = status
        this.name = name
    }
}

func parseCheckboxGroupResult(event: FFiCheckboxGroupResult): CheckboxGroupResult {
    let size = event.size
    let nameList: Array<String> = Array<String>(size, repeat: "")

    for (i in 0..size) {
        unsafe {
            let buf = event.nameBuffer
            let item = buf.read(i)
            let value = item.toString()
            nameList[i] = value
        }
    }

    CheckboxGroupResult(
        SelectStatus.parseValue(event.status),
        nameList
    )
}

/**
 * Defines CheckboxGroup Component.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CheckboxGroup <: CommonMethodComponent<CheckboxGroup> & CheckboxGroupAttribute {
    /**
     * Called when the CheckboxGroup component is used.
     *
     * @param { ?String } group
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(group!: ?String = None) {
        unsafe {
            try (groupCString = LibC.mallocCString(group ?? "").asResource()) {
                FfiOHOSAceFrameworkCheckBoxGroupCreate(groupCString.value)
            }
        }
    }

    /**
     * setting whether all checkbox is selected.
     *
     * @param { ?Bool } isAllSelected
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectAll(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSelectAll(value ?? false)
        }
        this
    }

    /**
     * setting the display color of checkbox.
     *
     * @param { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetSelectedColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkCheckBoxGroupSetWidth(value_.value, value_.unitType.getValue())
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
                    FfiOHOSAceFrameworkCheckBoxGroupSetHeight(value_.value, value_.unitType.getValue())
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
                FfiOHOSAceFrameworkCheckBoxGroupSetSize(width_.value, width_.unitType.getValue(), height_.value,
                    height_.unitType.getValue())
            }
        }
        this
    }

    protected override func paddingInner(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(top: ?Length, right: ?Length, bottom: ?Length, left: ?Length): This {
        var top_ = transAppResourceToLength(top ?? 0.vp)
        var right_ = transAppResourceToLength(right ?? 0.vp)
        var bottom_ = transAppResourceToLength(bottom ?? 0.vp)
        var left_ = transAppResourceToLength(left ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetPaddings(
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

    protected override func responseRegionInner(rect: ?Rectangle): This {
        let cjRect = (rect ?? Rectangle()).parseToNative()
        unsafe {
            FfiCheckBoxGroupSetResponseRegion(
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
            FfiCheckBoxGroupSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }

    /**
     * Called when the selection status changes.
     * Anonymous Object Rectification.
     *
     * @param { ?OnCheckboxGroupChangeCallback } callback
     * @returns { This }
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?OnCheckboxGroupChangeCallback): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            value: FFiCheckboxGroupResult =>
            var resolved = parseCheckboxGroupResult(value)
            tmpCallback(resolved)
        }
        let lambdaData = CallbackFFiCheckboxGroupResult(wrapper)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetOnChange(lambdaData.getID())
        }
        this
    }
}
