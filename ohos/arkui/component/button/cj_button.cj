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

package ohos.arkui.component.button

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel
import ohos.resource.*
import std.deriving.Derive

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

/**
 * Provides a button component.
 * 
 * @relation enum ButtonType
 */
@Derive[Equatable]
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonType {
    /**
     * Common button (no rounded corners by default).
     *
     * @relation Normal
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    /**
     * Capsule button (rounded corners default to half the height).
     *
     * @relation Capsule
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Capsule |
    /**
     * Round buttons.
     *
     * @relation Circle
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Circle |
    /**
     * Rounded rectangle button.
     *
     * @relation ROUNDED_RECTANGLE
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RoundRectangle
    | ...

    func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Capsule => 1
            case Circle => 2
            case RoundRectangle => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for button role.
 *
 * @relation enum ButtonRole
 */
@Derive[Equatable]
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonRole {
    /**
     * Normal button.
     *
     * @relation NORMAL
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    /**
     * Error button.
     *
     * @relation ERROR
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Error |
    ...

    func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Error => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for button style type.
 *
 * @relation enum ButtonStyleMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonStyleMode {
    /**
     * Normal button (with normal background color).
     *
     * @relation NORMAL
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    /**
     * Emphasized button (with emphasized background color).
     *
     * @relation EMPHASIZED
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Emphasized |
    /**
     * Textual button (with none background color).
     *
     * @relation TEXTUAL
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Textual
    | ...

    func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Emphasized => 1
            case Textual => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the button options.
 *
 * @relation interface ButtonOptions
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonOptions {
    /**
     * Describes the button style.
     *
     * @type { ButtonType }
     * @relation type?: ButtonType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shape: ButtonType
    /**
     * Indicates whether to enable the switchover effect when the button is pressed. When the status is set to false, the switchover effect is disabled.
     *
     * @type { Bool }
     * @relation stateEffect?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var stateEffect: Bool
    /**
     * Describes the button style.
     *
     * @type { ButtonStyleMode }
     * @default ButtonStyleMode.Emphasized
     * @relation buttonStyle?: ButtonStyleMode
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttonStyle: ButtonStyleMode
    /**
     * Describes the button size.
     *
     * @type { ControlSize }
     * @default ControlSize.Normal
     * @relation controlSize?: ControlSize
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var controlSize: ControlSize
    /**
     * Describes the button role.
     *
     * @type { ButtonRole }
     * @default ButtonRole.Normal
     * @relation role?: ButtonRole
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var role: ButtonRole

    /**
     * ButtonOptions constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        shape!: ButtonType = ButtonType.Capsule,
        stateEffect!: Bool = true,
        buttonStyle!: ButtonStyleMode = ButtonStyleMode.Emphasized,
        controlSize!: ControlSize = ControlSize.Normal,
        role!: ButtonRole = ButtonRole.Normal
    ) {
        this.shape = shape
        this.stateEffect = stateEffect
        this.buttonStyle = buttonStyle
        this.controlSize = controlSize
        this.role = role
    }
}

/**
 * Defines Button Component.
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Button <: ContainerBase {
    /**
     * Button object
     *
     * @param { () -> Unit } child
     * @returns { This }
     * @relation (): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            try (unsafeContent = LibC.mallocCString("").asResource()) {
                FfiOHOSAceFrameworkButtonCreateWithLabel(unsafeContent.value)
            }
        }
    }

    /**
     * Button object
     *
     * @param { () -> Unit } child
     * @returns { This }
     * @relation (): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkButtonCreateWithChild()
        }
        this.child = child
    }

    /**
     * Create Button with inner text label.
     *
     * @param { ResourceStr } label
     * @returns { This }
     * @relation (label: ResourceStr, options?: ButtonOptions): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(label: ResourceStr) {
        let content = transResourceStrToString(label)
        unsafe {
            try (unsafeContent = LibC.mallocCString(content).asResource()) {
                FfiOHOSAceFrameworkButtonCreateWithLabel(unsafeContent.value)
            }
        }
    }

    /**
     * Create Button with Text child.
     *
     * @param { ButtonOptions } options
     * @returns { This }
     * @relation (options: ButtonOptions): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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

    /**
     * Create Button with Text child.
     *
     * @param { ButtonOptions } options
     * @param { () -> Unit } child
     * @returns { This }
     * @relation (options: ButtonOptions): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: ButtonOptions, child: () -> Unit) {
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
        this.child = child
    }

    /**
     * Create Button with inner text label.
     *
     * @param { ResourceStr } label
     * @param { ButtonOptions } options
     * @returns { This }
     * @relation (label: ResourceStr, options?: ButtonOptions): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(label: ResourceStr, options: ButtonOptions) {
        let content = transResourceStrToString(label)
        unsafe {
            try (unsafeContent = LibC.mallocCString(content).asResource()) {
                FfiOHOSAceFrameworkButtonCreateWithLabelAndOptions(
                    unsafeContent.value,
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
    }

    /**
     * Text size.
     *
     * @param { Length } value
     * @returns { This }
     * @relation fontSize(value: Length): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        var size = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontSize(size.value, getLengthUnitOrFp(size).getValue())
        }
        this
    }

    /**
     * Font weight.
     *
     * @param { FontWeight } value
     * @returns { This }
     * @relation fontWeight(value: number | FontWeight | string): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            let unsafeContent = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkButtonSetFontWeight(unsafeContent)
            LibC.free(unsafeContent)
        }
        this
    }

    /**
     * Text color.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation fontColor(value: ResourceColor): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontColor(transAppResourceToResourceColor(color))
        }
        this
    }

    /**
     * Sets the height of the component. By default, the height required to fully hold the
     * component content is used. If the height of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Length } value
     * @returns { This }
     * @relation height(value: Length): T
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func heightInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkButtonSetHeight(normalizeValue(value_.value, 0.0), value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the width of the component. By default, the width required to fully hold the
     * component content is used.If the width of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Length } value
     * @returns { This }
     * @relation width(value: Length): T
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func widthInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkButtonSetWidth(normalizeValue(value_.value, 0.0), value_.unitType.getValue())
        }
        this
    }

    /**
     * Font style.
     *
     * @param { FontStyle } value
     * @returns { This }
     * @relation fontStyle(value: FontStyle): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontStyle(value.getValue())
        }
        this
    }

    /**
     * Font family.
     *
     * @param { ResourceStr } value
     * @returns { This }
     * @relation fontFamily(value: string | Resource): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ResourceStr): This {
        let content = transResourceStrToString(value)
        unsafe {
            try (contentCString = LibC.mallocCString(content).asResource()) {
                FfiOHOSAceFrameworkButtonSetFontFamily(contentCString.value)
            }
        }
        this
    }

    /**
     * Describes the button style.
     *
     * @param { ButtonType } value
     * @returns { ButtonAttribute }
     * @relation type(value: ButtonType): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shape(value: ButtonType): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetType(value.getValue())
        }
        this
    }

    /**
     * Sets the padding of the component.
     * Default value: **0**.
     *
     * @param { Length } value
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func paddingInner(value: Length): This {
        let content = transAppResourceToLength(value)
        let value_: Float64 = content.value
        let unitValue_: Int32 = content.unitType.getValue()
        unsafe {
            FfiOHOSAceFrameworkButtonSetPadding(value_, unitValue_, value_, unitValue_, value_, unitValue_, value_, unitValue_)
        }
        this
    }

    protected override func borderRadiusInner(radius: Length): This {
        let value_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkButtonSetRadius(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the size of the component.
     *
     * @param { Length } width
     * @param { Length } height
     * @returns { This }
     * @relation size(value: SizeOptions): T
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func sizeInner(width: Length, height: Length): This {
        let width_ = transAppResourceToLength(width)
        let height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkButtonSetSize(normalizeValue(width_.value, 0.0), width_.unitType.getValue(),
                normalizeValue(height_.value, 0.0), height_.unitType.getValue())
        }
        this
    }

    /**
     * Indicates whether to enable the switchover effect when the button is pressed. When the status is set to false, the switchover effect is disabled.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation stateEffect(value: boolean): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stateEffect(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetStateEffect(value)
        }
        this
    }

    protected override func borderInner(
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

    protected override func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        let top_ = transAppResourceToLength(top)
        let right_ = transAppResourceToLength(right)
        let bottom_ = transAppResourceToLength(bottom)
        let left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkButtonSetPadding(top_.value, top_.unitType.getValue(), right_.value,
                right_.unitType.getValue(), bottom_.value, bottom_.unitType.getValue(), left_.value,
                left_.unitType.getValue())
        }
        this
    }

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

    /**
     * Describes the button style.
     *
     * @param { ButtonStyleMode } value - button style mode
     * @returns { ButtonAttribute }
     * @relation buttonStyle(value: ButtonStyleMode): ButtonAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func buttonStyle(value: ButtonStyleMode): This {
        unsafe {
            FfiOHOSAceFrameworkButtonSetButtonStyle(value.getValue())
        }
        this
    }
}
