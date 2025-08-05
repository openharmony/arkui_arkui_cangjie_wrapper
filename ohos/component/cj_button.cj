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
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Capsule
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Circle
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ROUNDED_RECTANGLE
    | ...

    func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Capsule => 1
            case Circle => 2
            case ROUNDED_RECTANGLE => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonRole {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORMAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ERROR
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case NORMAL => 0
            case ERROR => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonStyleMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORMAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMPHASIZED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TEXTUAL
    | ...

    public func getValue(): Int32 {
        match (this) {
            case NORMAL => 0
            case EMPHASIZED => 1
            case TEXTUAL => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct CJLabelStyle {
    CJLabelStyle(
        let overflow: Int32,
        let maxLines: UInt32,
        let minFontFlag: Bool,
        let minFontSize: Float64,
        let minFontSize_Unit: Int32,
        let maxFontflag: Bool,
        let maxFontSize: Float64,
        let maxFontSize_Unit: Int32,
        let heightAdaptivePolicy: Int32,
        let font_size: Float64,
        let font_size_Unit: Int32,
        let font_weight: CString,
        let font_family: CString,
        let font_style: Int32
    ) {}
}

@C
struct ButtonOptional {
    ButtonOptional(
        let shape: Int32,
        let stateEffect: Bool,
        let buttonStyle: Int32,
        let controlSize: Int32,
        let role: Int32
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkButtonCreateWithChild(): Unit

    func FfiOHOSAceFrameworkButtonCreateWithChildAndOptions(option: ButtonOptional): Unit

    func FfiOHOSAceFrameworkButtonCreateWithButtonOptions(option: ButtonOptional): Unit

    func FfiOHOSAceFrameworkButtonCreateWithLabel(content: CString): Unit

    func FfiOHOSAceFrameworkButtonCreateWithLabelAndOptions(content: CString, option: ButtonOptional): Unit

    func FfiOHOSAceFrameworkButtonSetFontSize(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetFontWeight(content: CString): Unit

    func FfiOHOSAceFrameworkButtonSetFontColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkButtonSetBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkButtonSetRadius(radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetAllBorderRadius(value: CJBorderRadius): Unit

    func FfiOHOSAceFrameworkButtonSetBorder(params: CJBorder): Unit

    func FfiOHOSAceFrameworkButtonSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetFontStyle(fontStyle: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetFontFamily(content: CString): Unit

    func FfiOHOSAceFrameworkButtonSetType(buttonType: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetPadding(top: Float64, topUnit: Int32, right: Float64, rightUnit: Int32,
        bottom: Float64, bottomUnit: Int32, left: Float64, leftUnit: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetStateEffect(stateEffect: Bool): Unit

    func FfiOHOSAceFrameworkButtonSetRole(value: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetControlSize(value: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetButtonStyle(value: Int32): Unit

    func FfiOHOSAceFrameworkButtonSetLabelStyle(labelStyle: CJLabelStyle): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shape: ButtonType
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var stateEffect: Bool
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttonStyle: ButtonStyleMode
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var controlSize: ControlSize
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var role: ButtonRole

    public init(
        shape!: ButtonType = ButtonType.Capsule,
        stateEffect!: Bool = true,
        buttonStyle!: ButtonStyleMode = ButtonStyleMode.EMPHASIZED,
        controlSize!: ControlSize = ControlSize.NORMAL,
        role!: ButtonRole = ButtonRole.NORMAL
    ) {
        this.shape = shape
        this.stateEffect = stateEffect
        this.buttonStyle = buttonStyle
        this.controlSize = controlSize
        this.role = role
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Button <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            let unsafeContent = LibC.mallocCString("")
            FfiOHOSAceFrameworkButtonCreateWithLabel(unsafeContent)
            LibC.free(unsafeContent)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkButtonCreateWithChild()
        }
        this.child = content
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(label: String) {
        unsafe {
            let unsafeContent = LibC.mallocCString(label)
            FfiOHOSAceFrameworkButtonCreateWithLabel(unsafeContent)
            LibC.free(unsafeContent)
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(label: AppResource) {
        this(getResourceString(label))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: ButtonOptions) {
        unsafe {
            FfiOHOSAceFrameworkButtonCreateWithButtonOptions(
                ButtonOptional(
                    options.shape.getValue(),
                    options.stateEffect,
                    options.buttonStyle.getValue(),
                    options.controlSize.getValue(),
                    options.role.getValue()
                )
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: ButtonOptions, content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkButtonCreateWithChildAndOptions(
                ButtonOptional(
                    options.shape.getValue(),
                    options.stateEffect,
                    options.buttonStyle.getValue(),
                    options.controlSize.getValue(),
                    options.role.getValue()
                )
            )
        }
        this.child = content
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(label: String, options: ButtonOptions) {
        unsafe {
            let unsafeContent = LibC.mallocCString(label)
            FfiOHOSAceFrameworkButtonCreateWithLabelAndOptions(
                unsafeContent,
                ButtonOptional(
                    options.shape.getValue(),
                    options.stateEffect,
                    options.buttonStyle.getValue(),
                    options.controlSize.getValue(),
                    options.role.getValue()
                )
            )
            LibC.free(unsafeContent)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(label: AppResource, options: ButtonOptions) {
        this(getResourceString(label), options)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(size: Length): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontSize(size_.value, getLengthUnitOrFp(size_).getValue());
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            let unsafeContent = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkButtonSetFontWeight(unsafeContent);
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontColor(transAppResourceToResourceColor(color));
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkButtonSetHeight(normalizeValue(value_.value, 0.0), value_.unitType.getValue());
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkButtonSetWidth(normalizeValue(value_.value, 0.0), value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onClick(callback: () -> Unit): This {
        onClick {
            _ => callback()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(style: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontStyle(style.getValue());
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: String): This {
        unsafe {
            let contentCString = LibC.mallocCString(content)
            FfiOHOSAceFrameworkButtonSetFontFamily(contentCString);
            LibC.free(contentCString)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: AppResource): This {
        fontFamily(getResourceString(content))
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shape(shapeType: ShapeType): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetType(shapeType.getValue());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shape(buttonType: ButtonType): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetType(buttonType.getValue());
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(paddingValue: Length): This {
        let value: Float64 = transAppResourceToLength(paddingValue).value
        let unitValue: Int32 = transAppResourceToLength(paddingValue).unitType.getValue()
        unsafe {
            FfiOHOSAceFrameworkButtonSetPadding(value, unitValue, value, unitValue, value, unitValue, value, unitValue);
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(radius: Length): This {
        let value_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkButtonSetRadius(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func size(width!: Length, height!: Length): This {
        let width_ = transAppResourceToLength(width)
        let height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkButtonSetSize(normalizeValue(width_.value, 0.0), width_.unitType.getValue(),
                normalizeValue(height_.value, 0.0), height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stateEffect(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetStateEffect(value);
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected func borderInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: BorderStyle
    ): This {
        let width_ = transAppResourceToLength(width)
        let radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkButtonSetBorder(
                CJBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    transAppResourceToResourceColor(color),
                    radius_.value,
                    radius_.unitType.getValue(),
                    style.getValue()
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
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        let top_ = transAppResourceToLength(top)
        let right_ = transAppResourceToLength(right)
        let bottom_ = transAppResourceToLength(bottom)
        let left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkButtonSetPadding(top_.value, top_.unitType.getValue(), right_.value,
                right_.unitType.getValue(), bottom_.value, bottom_.unitType.getValue(), left_.value,
                left_.unitType.getValue());
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected func borderRadiusInner(
        topLeft!: Length,
        topRight!: Length,
        bottomLeft!: Length,
        bottomRight!: Length
    ): This {
        let topLeft_ = transAppResourceToLength(topLeft)
        let topRight_ = transAppResourceToLength(topRight)
        let bottomLeft_ = transAppResourceToLength(bottomLeft)
        let bottomRight_ = transAppResourceToLength(bottomRight)
        unsafe {
            let value = CJBorderRadius(
                topLeft_.value,
                topLeft_.unitType.getValue(),
                topRight_.value,
                topRight_.unitType.getValue(),
                bottomLeft_.value,
                bottomLeft_.unitType.getValue(),
                bottomRight_.value,
                bottomRight_.unitType.getValue()
            )
            FfiOHOSAceFrameworkButtonSetAllBorderRadius(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func role(value: ButtonRole): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetRole(value.getValue());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func controlSize(value: ControlSize): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetControlSize(value.getValue());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func buttonStyle(value: ButtonStyleMode): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetButtonStyle(value.getValue());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelStyle(
        overflow!: TextOverflow = TextOverflow.Ellipsis,
        maxLines!: UInt32 = 1,
        minFontSize!: Option<Length> = None,
        maxFontSize!: Option<Length> = None,
        heightAdaptivePolicy!: TextHeightAdaptivePolicy = TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        font!: Fonts = Fonts()
    ): This {
        unsafe {
            var fontweightCString = LibC.mallocCString(font.weight.getValue())
            var fontFamilyCString = LibC.mallocCString(font.family)
            var minFont_Exist: Bool = false
            var minFont_Value: Float64 = 0.0
            var minFont_Unit = LENGTH_FP
            var maxFont_Exist: Bool = false
            var maxFont_Value: Float64 = 0.0
            var maxFont_Unit = LENGTH_FP
            match (minFontSize) {
                case Some(v) =>
                    minFont_Exist = true
                    minFont_Value = Float64(v.value)
                    minFont_Unit = v.unitType.getValue()
                case _ => ()
            }
            match (maxFontSize) {
                case Some(v) =>
                    maxFont_Exist = true
                    maxFont_Value = Float64(v.value)
                    maxFont_Unit = v.unitType.getValue()
                case _ => ()
            }
            FfiOHOSAceFrameworkButtonSetLabelStyle(
                CJLabelStyle(
                    overflow.getValue(),
                    maxLines,
                    minFont_Exist,
                    minFont_Value,
                    minFont_Unit,
                    maxFont_Exist,
                    maxFont_Value,
                    maxFont_Unit,
                    heightAdaptivePolicy.getValue(),
                    Float64(font.size.value),
                    font.size.unitType.getValue(),
                    fontweightCString,
                    fontFamilyCString,
                    font.style.getValue(),
                )
            )
            LibC.free(fontweightCString)
            LibC.free(fontFamilyCString)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelStyle(
        overflow!: TextOverflow = TextOverflow.Ellipsis,
        maxLines!: UInt32 = 1,
        minFontSize!: AppResource,
        maxFontSize!: AppResource,
        heightAdaptivePolicy!: TextHeightAdaptivePolicy = TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        font!: Fonts = Fonts()
    ): This {
        labelStyle(
            overflow: overflow,
            maxLines: maxLines,
            minFontSize: Some(getResourceLength(minFontSize)),
            maxFontSize: Some(getResourceLength(maxFontSize)),
            heightAdaptivePolicy: heightAdaptivePolicy,
            font: font
        )
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelStyle(
        overflow!: TextOverflow = TextOverflow.Ellipsis,
        maxLines!: UInt32 = 1,
        minFontSize!: AppResource,
        maxFontSize!: Option<Length> = None,
        heightAdaptivePolicy!: TextHeightAdaptivePolicy = TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        font!: Fonts = Fonts()
    ): This {
        labelStyle(
            overflow: overflow,
            maxLines: maxLines,
            minFontSize: Some(getResourceLength(minFontSize)),
            maxFontSize: maxFontSize,
            heightAdaptivePolicy: heightAdaptivePolicy,
            font: font
        )
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelStyle(
        overflow!: TextOverflow = TextOverflow.Ellipsis,
        maxLines!: UInt32 = 1,
        minFontSize!: Option<Length> = None,
        maxFontSize!: AppResource,
        heightAdaptivePolicy!: TextHeightAdaptivePolicy = TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        font!: Fonts = Fonts()
    ): This {
        labelStyle(
            overflow: overflow,
            maxLines: maxLines,
            minFontSize: minFontSize,
            maxFontSize: Some(getResourceLength(maxFontSize)),
            heightAdaptivePolicy: heightAdaptivePolicy,
            font: font
        )
        this
    }
}
