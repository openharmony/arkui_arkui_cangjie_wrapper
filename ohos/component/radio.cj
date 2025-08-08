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
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RadioIndicatorType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TICK
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DOT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CUSTOM
    | ...

    func getValue(): Int32 {
        match (this) {
            case TICK => 0
            case DOT => 1
            case CUSTOM => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Radio <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String, group!: String) {
        unsafe {
            let groupStr = LibC.mallocCString(group)
            let valStr = LibC.mallocCString(value)
            FfiOHOSAceFrameworkRadioCreate(groupStr, valStr)
            groupStr.asResource().close()
            valStr.asResource().close()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String, group!: String, indicatorType!: RadioIndicatorType) {
        unsafe {
            try (groupStr = LibC.mallocCString(group).asResource(), valStr = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkRadioWithIndicatorCreate(groupStr.value, valStr.value, indicatorType.getValue(), 0)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String, group!: String, indicatorType!: RadioIndicatorType,
        indicatorBuilder!: Option<() -> Unit>) {
        unsafe {
            let builderId = if (let Some(fn) <- indicatorBuilder) {
                Callback0Param<Unit>(fn).getID()
            } else {
                0
            }
            try (groupStr = LibC.mallocCString(group).asResource(), valStr = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkRadioWithIndicatorCreate(groupStr.value, valStr.value, indicatorType.getValue(),
                    builderId)
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
    public func checked(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkRadioChecked(value)
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
    public func radioStyle(
        checkedBackgroundColor!: ResourceColor = Color(0x007DFF),
        uncheckedBorderColor!: ResourceColor = Color(0x182431),
        indicatorColor!: ResourceColor = Color.WHITE
    ): This {
        unsafe {
            FfiOHOSAceFrameworkRadioSetStyle(transAppResourceToResourceColor(checkedBackgroundColor),
                transAppResourceToResourceColor(uncheckedBorderColor), transAppResourceToResourceColor(indicatorColor))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func size(width!: Length, height!: Length): This {
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func padding(value: Length): This {
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hoverEffect(value: HoverEffect): This {
        unsafe {
            FfiOHOSAceFrameworkRadioSetHoverEffect(value.getValue())
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
            FfiOHOSAceFrameworkRadioOnChange(lambdaData.getID())
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
            FfiRadioSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }
}
