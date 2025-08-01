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

package ohos.arkui.component.checkbox_group

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.ArrayList

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
}

class CallbackFFiCheckboxGroupResult <: BaseCallBack {
    CallbackFFiCheckboxGroupResult(let closure: (FFiCheckboxGroupResult) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackFFiCheckboxGroupResult")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<FFiCheckboxGroupResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackFFiCheckboxGroupResult")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CheckboxGroupResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var status: SelectStatus
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var name: ArrayList<String>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        status: SelectStatus,
        name: ArrayList<String>
    ) {
        this.status = status
        this.name = name
    }
}

func parseCheckboxGroupResult(event: FFiCheckboxGroupResult): CheckboxGroupResult {
    let size = event.size
    let nameList: ArrayList<String> = ArrayList<String>(size)

    for (i in 0..size) {
        unsafe {
            let buf = event.nameBuffer
            let item = buf.read(i)
            let value = item.toString()
            nameList.add(value)
        }
    }

    CheckboxGroupResult(
        SelectStatus.parseValue(event.status),
        nameList,
    )
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CheckboxGroup <: ViewBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(group!: String = "") {
        unsafe {
            try (groupCString = LibC.mallocCString(group).asResource()) {
                FfiOHOSAceFrameworkCheckBoxGroupCreate(groupCString.value)
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectAll(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSelectAll(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetSelectedColor(transAppResourceToResourceColor(color))
        }
        this
    }

    protected override func widthInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func heightInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func sizeInner(width: Length, height: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func paddingInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
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
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func responseRegionInner(rect: Rectangle): This {
        let cjRect = rect.parseToNative()
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegionArray(array: Array<Rectangle>): This {
        let vecFFi = FFIVectorNativeRectangle(array.size)
        var index = 0
        for (rect in array) {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (CheckboxGroupResult) -> Unit): This {
        let wrapper = {
            value: FFiCheckboxGroupResult =>
            var resolved = parseCheckboxGroupResult(value)
            callback(resolved)
        }
        let lambdaData = CallbackFFiCheckboxGroupResult(wrapper)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetOnChange(lambdaData.getID())
        }
        this
    }
}
