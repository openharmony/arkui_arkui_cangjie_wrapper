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

import std.deriving.Derive

foreign {
    func FfiOHOSAceFrameworkSaveButtonOnClick(callback: Int64): Unit

    func FfiOHOSAceFrameworkSecButtonBasePop(): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetHeight(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderRadius(radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetPosition(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetConstraintSize(value: CJConstraintSize): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderColor(color: UInt32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetOffset(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetFontColor(color: UInt32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetFontSize(fontSize: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderStyle(style: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetIconSize(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseMarkAnchor(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetIconColor(color: UInt32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundPadding(padding: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundPaddings(params: CJEdge): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetFontWeight(value: CString): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetTextIconSpace(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetFontFamily(fontFamily: CString): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetFontStyle(fontStyle: Int32): Unit

    func FfiOHOSAceFrameWorkSecButtonBaseSetLayoutDirection(value: Int32): Unit
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SecurityComponentLayoutDirection {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    | ...

    func getValue(): Int32 {
        match (this) {
            case Horizontal => 0
            case Vertical => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class SecurityComponent <: ComponentRender {
    protected open func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSecButtonBasePop()
        }
        this
    }

    protected init() {
        super()
    }

    public open func initial(): Unit {
        pop()
    }

    public func update(): Unit {
        pop()
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backgroundColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderRadius(radius: Length): This {
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderRadius(radius_.value, radius_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func position(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetPosition(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func constraintSize(
        minWidth!: Length = 0.vp,
        maxWidth!: Length = (Float64.Inf).vp,
        minHeight!: Length = 0.vp,
        maxHeight!: Length = (Float64.Inf).vp
    ): This {
        constraintSizeInner(minWidth, maxWidth, minHeight, maxHeight)
        this
    }

    protected open func constraintSizeInner(
        minWidth: Length,
        maxWidth: Length,
        minHeight: Length,
        maxHeight: Length
    ): This {
        var minWidth_ = transAppResourceToLength(minWidth)
        var maxWidth_ = transAppResourceToLength(maxWidth)
        var minHeight_ = transAppResourceToLength(minHeight)
        var maxHeight_ = transAppResourceToLength(maxHeight)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetConstraintSize(
                CJConstraintSize(
                    minWidth_.value,
                    minWidth_.unitType.getValue(),
                    maxWidth_.value,
                    maxWidth_.unitType.getValue(),
                    minHeight_.value,
                    minHeight_.unitType.getValue(),
                    maxHeight_.value,
                    maxHeight_.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderWidth(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func offset(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetOffset(x_.value, x_.unitType.getValue(), y_.value, y_
                .unitType
                .getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func fontColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetFontColor(transAppResourceToResourceColor(color));
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func fontSize(size: Length): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetFontSize(size_.value, size_.unitType.getValue());
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderStyle(style: BorderStyle): This {
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundBorderStyle(style.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func iconSize(size: Length): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetIconSize(size_.value, size_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func markAnchor(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseMarkAnchor(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func iconColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetIconColor(transAppResourceToResourceColor(color));
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func padding(value: Length): This {
        unsafe {
            var value_ = transAppResourceToLength(value)
            FfiOHOSAceFrameWorkSecButtonBaseSetBackgroundPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(top!: Length = 8.vp, right!: Length = 16.vp, bottom!: Length = 8.vp, left!: Length = 16.vp): This {
        paddingInner(top, right, bottom, left)
        this
    }

    protected open func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPaddings(
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
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func fontWeight(value: FontWeight): This {
        unsafe {
            let unsafeContent = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameWorkSecButtonBaseSetFontWeight(unsafeContent);
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func textIconSpace(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetTextIconSpace(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func fontFamily(content: String): This {
        unsafe {
            let contentCString = LibC.mallocCString(content)
            FfiOHOSAceFrameWorkSecButtonBaseSetFontFamily(contentCString);
            LibC.free(contentCString)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func fontFamily(content: AppResource): This {
        fontFamily(getResourceString(content))
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func fontStyle(style: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetFontStyle(style.getValue());
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func layoutDirection(value: SecurityComponentLayoutDirection): This {
        unsafe {
            FfiOHOSAceFrameWorkSecButtonBaseSetLayoutDirection(value.getValue());
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(value: String): This {
        unsafe {
            let unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetId(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }
}
