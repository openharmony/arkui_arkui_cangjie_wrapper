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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CheckBoxConfiguration {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public CheckBoxConfiguration(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var name!: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var selected!: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var triggerChange!: (Bool) -> Unit
    ) {}
}

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Checkbox <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(name!: String = "", group!: String = "", indicatorBuilder!: ?() -> Unit = None) {
        unsafe {
            let nameCString = LibC.mallocCString(name)
            let groupCString = LibC.mallocCString(group)
            if (let Some(v) <- indicatorBuilder) {
                FfiCheckBoxCreateWithIndicator(nameCString, groupCString, Callback0Param<Unit>(v).getID())
            } else {
                FfiOHOSAceFrameworkCheckBoxCreate(nameCString, groupCString)
            }
            LibC.free(nameCString)
            LibC.free(groupCString)
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
    public func select(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSelect(value)
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
            FfiOHOSAceFrameworkCheckBoxSetSelectedColor(transAppResourceToResourceColor(color))
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
            FfiOHOSAceFrameworkCheckBoxSetWidth(value_.value, value_.unitType.getValue())
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
            FfiOHOSAceFrameworkCheckBoxSetHeight(value_.value, value_.unitType.getValue())
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
            FfiOHOSAceFrameworkCheckBoxSetSize(width_.value, width_.unitType.getValue(), height_.value,
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
            FfiOHOSAceFrameworkCheckBoxSetPadding(value_.value, value_.unitType.getValue())
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetOnChange(lambdaData.getID())
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
    public func shape(value: CheckBoxShape): This {
        unsafe {
            FfiOHOSAceFrameworkCheckBoxSetCheckboxStyle(value.getValue())
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
            FfiCheckBoxSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unselectedColor(color: ResourceColor): This {
        unsafe {
            FfiCheckBoxUnselectedColor(transAppResourceToResourceColor(color))
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
    public func mark(
        strokeColor!: ResourceColor = Color.WHITE,
        size!: ?Length = None,
        strokeWidth!: Length = 2.vp
    ): This {
        unsafe {
            if (let Some(v) <- size) {
                FfiCheckBoxMarkStyle(
                    transAppResourceToResourceColor(strokeColor),
                    transAppResourceToLength(v).value,
                    transAppResourceToLength(v).unitType.getValue(),
                    transAppResourceToLength(strokeWidth).value,
                    transAppResourceToLength(strokeWidth).unitType.getValue()
                )
            } else {
                var strokeWidth_ = transAppResourceToLength(strokeWidth)
                FfiCheckBoxMarkStyle(
                    transAppResourceToResourceColor(strokeColor),
                    0.0,
                    INVALID_UNIT,
                    strokeWidth_.value,
                    strokeWidth_.unitType.getValue()
                )
            }
        }
        this
    }
}
