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

@C
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
struct FFiCheckboxGroupResult {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FFiCheckboxGroupResult(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        let status: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        let size: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let nameBuffer: CPointer<CString>
    ) {}
}

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CheckboxGroupResult {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public CheckboxGroupResult(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var status: SelectStatus,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var name: ArrayList<String>
    ) {}
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
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CheckboxGroup <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetSelectedColor(transAppResourceToResourceColor(color))
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
    public override func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetWidth(value_.value, value_.unitType.getValue())
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
    public override func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetHeight(value_.value, value_.unitType.getValue())
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
    public override func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
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
    public override func padding(value: Length): This {
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(rect: Rectangle): This {
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unselectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetUnSelectedColor(transAppResourceToResourceColor(value))
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
    public func mark(strokeColor!: ResourceColor = Color.WHITE, size!: Length = 0.vp, strokeWidth!: Length = 2.vp): This {
        var size_ = transAppResourceToLength(size)
        var strokeWidth_ = transAppResourceToLength(strokeWidth)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetMark(transAppResourceToResourceColor(strokeColor), size_.value,
                size_.unitType.getValue(), strokeWidth_.value, strokeWidth_.unitType.getValue())
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
    public func checkboxShape(value: CheckBoxShape): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxGroupSetCheckboxShape(value.getValue())
        }
        this
    }
}
