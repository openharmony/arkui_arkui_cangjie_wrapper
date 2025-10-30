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

package ohos.arkui.component.button

import ohos.arkui.component.common.{CommonMethodComponent, ControlSize, FontWeight, FontStyle, BorderStyle}
import ohos.arkui.component.native_struct.{CJBorderRadius, CJBorder}
import ohos.arkui.component.util.{transAppResourceToResourceColor, transResourceStrToString, transAppResourceToLength, normalizeValue, getLengthUnitOrFp}
import ohos.base.{Length, LengthProp, ResourceStr, ResourceColor, Color, LengthProp}
import ohos.labels.APILevel
import ohos.resource.{AppResource}
import std.deriving.Derive
import ohos.business_exception.BusinessException

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

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonType {
    /**
     * Common button (no rounded corners by default).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    /**
     * Capsule button (rounded corners default to half the height).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Capsule |
    /**
     * Round buttons.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Circle |
    /**
     * Rounded rectangle button.
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum for button role.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonRole {
    /**
     * Normal button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    /**
     * Error button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Error |
    ...

    func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Error => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum for button style type.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ButtonStyleMode {
    /**
     * Normal button (with normal background color).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    /**
     * Emphasized button (with emphasized background color).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Emphasized |
    /**
     * Textual button (with none background color).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Textual
    | ...

    func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Emphasized => 1
            case Textual => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the button options.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonOptions {
    /**
     * Describes the button style.
     * @returns { ButtonType } The button shape type.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shape: ?ButtonType
    /**
     * Indicates whether to enable the switchover effect when the button is pressed. When the status is set to false, the switchover effect is disabled.
     * @returns { Bool } Whether the state effect is enabled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var stateEffect: ?Bool
    /**
     * @default true
     */
    /**
     * Describes the button style.
     * @returns { ButtonStyleMode } The button style mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttonStyle: ?ButtonStyleMode
    /**
     * @default ButtonStyleMode.Emphasized
     */
    /**
     * Describes the button size.
     * @returns { ControlSize } The control size of the button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var controlSize: ?ControlSize
    /**
     * @default ControlSize.Normal
     */
    /**
     * Describes the button role.
     * @returns { ButtonRole } The role of the button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var role: ?ButtonRole
    /**
     * @default ButtonRole.Normal
     */

    /**
     * ButtonOptions constructor.
     *
     * @param { ?ButtonType } shape - Describes the button style.
     * @param { ?Bool } stateEffect - Indicates whether to enable the switchover effect when the button is pressed. When the status is set to false, the switchover effect is disabled.
     * @param { ?ButtonStyleMode } buttonStyle - Describes the button style.
     * @param { ?ControlSize } controlSize - Describes the button size.
     * @param { ?ButtonRole } role - Describes the button role.
     * @returns { ButtonOptions } A new instance of ButtonOptions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        shape!: ?ButtonType = None,
        stateEffect!: ?Bool = None,
        buttonStyle!: ?ButtonStyleMode = None,
        controlSize!: ?ControlSize = None,
        role!: ?ButtonRole = None
    ) {
        this.shape = shape ?? ButtonType.Capsule
        this.stateEffect = stateEffect ?? true
        this.buttonStyle = buttonStyle ?? ButtonStyleMode.Emphasized
        this.controlSize = controlSize ?? ControlSize.Normal
        this.role = role ?? ButtonRole.Normal
    }
}

/**
 * Defines Button Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Button <: CommonMethodComponent<Button> & ButtonAttribute {
    /**
     * Button constructor.
     * @returns { Button } A new instance of Button.
     */
    @!APILevel[
        since: "22",
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
     * Button constructor.
     *
     * @param { () -> Unit } child - The child component of the button.
     * @returns { Button } A new instance of Button.
     */
    @!APILevel[
        since: "22",
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
     * @param { ResourceStr } label - The button label value.
     * @returns { Button } A new instance of Button.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?ButtonOptions } options - The options of button.
     * @returns { Button } A new instance of Button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: ?ButtonOptions) {
        let tmpOptions = options ?? ButtonOptions()
        unsafe {
            FfiOHOSAceFrameworkButtonCreateWithButtonOptions(
                ButtonOptional(
                    (tmpOptions.shape ?? ButtonType.Capsule).getValue(),
                    tmpOptions.stateEffect ?? true,
                    (tmpOptions.buttonStyle ?? ButtonStyleMode.Emphasized).getValue(),
                    (tmpOptions.controlSize ?? ControlSize.Normal).getValue(),
                    (tmpOptions.role ?? ButtonRole.Normal).getValue()
                )
            )
        }
    }

    /**
     * Create Button with Text child.
     *
     * @param { ?ButtonOptions } options - The options of button.
     * @param { () -> Unit } child - The child component of the button.
     * @returns { Button } A new instance of Button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: ?ButtonOptions, child: () -> Unit) {
        let tmpOptions = options ?? ButtonOptions()
        unsafe {
            FfiOHOSAceFrameworkButtonCreateWithChildAndOptions(
                ButtonOptional(
                    (tmpOptions.shape ?? ButtonType.Capsule).getValue(),
                    tmpOptions.stateEffect ?? true,
                    (tmpOptions.buttonStyle ?? ButtonStyleMode.Emphasized).getValue(),
                    (tmpOptions.controlSize ?? ControlSize.Normal).getValue(),
                    (tmpOptions.role ?? ButtonRole.Normal).getValue()
                )
            )
        }
        this.child = child
    }

    /**
     * Create Button with inner text label.
     *
     * @param { ?ResourceStr } label - The button label.
     * @param { ?ButtonOptions } options - The options of button.
     * @returns { Button } A new instance of Button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(label: ?ResourceStr, options: ?ButtonOptions) {
        let tmpLabel = label ?? ""
        let tmpOptions = options ?? ButtonOptions()
        let content = transResourceStrToString(tmpLabel)
        unsafe {
            try (unsafeContent = LibC.mallocCString(content).asResource()) {
                FfiOHOSAceFrameworkButtonCreateWithLabelAndOptions(
                    unsafeContent.value,
                    ButtonOptional(
                        (tmpOptions.shape ?? ButtonType.Capsule).getValue(),
                        tmpOptions.stateEffect ?? true,
                        (tmpOptions.buttonStyle ?? ButtonStyleMode.Emphasized).getValue(),
                        (tmpOptions.controlSize ?? ControlSize.Normal).getValue(),
                        (tmpOptions.role ?? ButtonRole.Normal).getValue()
                    )
                )
            }
        }
    }

    /**
     * Text size.
     *
     * @param { ?Length } value - The font size of button.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        // Need get default value from ffi, The value of sys.float.Body_L is from base/global/system_resources
        let tmpValue = value ?? 18.fp
        var size = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontSize(size.value, getLengthUnitOrFp(size).getValue())
        }
        this
    }

    /**
     * Font weight.
     *
     * @param { ?FontWeight } value - The font weight of button.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        let tmpValue = value ?? FontWeight.W500
        unsafe {
            let unsafeContent = LibC.mallocCString(tmpValue.getValue())
            FfiOHOSAceFrameworkButtonSetFontWeight(unsafeContent)
            LibC.free(unsafeContent)
        }
        this
    }

    /**
     * Text color.
     *
     * @param { ?ResourceColor } color - The font color of button.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(color: ?ResourceColor): This {
        let tmpColor = color ?? Color(0xFFFFFF)
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontColor(transAppResourceToResourceColor(tmpColor))
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkButtonSetHeight(normalizeValue(value_.value, 0.0), value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkButtonSetWidth(normalizeValue(value_.value, 0.0), value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    /**
     * Font style.
     *
     * @param { ?FontStyle } value - The font style of button.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        let tmpValue = value ?? FontStyle.Normal
        unsafe {
            FfiOHOSAceFrameworkButtonSetFontStyle(tmpValue.getValue())
        }
        this
    }

    /**
     * Font family.
     *
     * @param { ?ResourceStr } value - The font family of button.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        let tmpValue = value ?? "HarmonyOS Sans"
        let content = transResourceStrToString(tmpValue)
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
     * @param { ?ButtonType } value - The button shape style. 
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shape(value: ?ButtonType): This {
        let tmpValue = value ?? ButtonType.RoundRectangle
        unsafe {
            FfiOHOSAceFrameworkButtonSetType(tmpValue.getValue())
        }
        this
    }

    protected override func paddingInner(value: ?Length): This {
        let content = transAppResourceToLength(value ?? 0.0.vp)
        let value_: Float64 = content.value
        let unitValue_: Int32 = content.unitType.getValue()
        unsafe {
            FfiOHOSAceFrameworkButtonSetPadding(value_, unitValue_, value_, unitValue_, value_, unitValue_, value_, unitValue_)
        }
        this
    }

    protected override func borderRadiusInner(value: ?Length): This {
        let value_ = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkButtonSetRadius(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        if (width.isNone() || height.isNone()) {
            widthInner(width)
            heightInner(height)
        } else {
            let width_ = transAppResourceToLength(width ?? 0.0.vp)
            let height_ = transAppResourceToLength(height ?? 0.0.vp)
            unsafe {
                FfiOHOSAceFrameworkButtonSetSize(normalizeValue(width_.value, 0.0), width_.unitType.getValue(),
                    normalizeValue(height_.value, 0.0), height_.unitType.getValue())
            }
        }
        this
    }

    /**
     * Indicates whether to enable the switchover effect when the button is pressed. When the status is set to false, the switchover effect is disabled.
     *
     * @param { ?Bool } value - Whether to enable button interactive effect. 
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stateEffect(value: ?Bool): This {
        let tmpValue = value ?? true
        unsafe {
            FfiOHOSAceFrameworkButtonSetStateEffect(tmpValue)
        }
        this
    }

    protected override func borderInner(
        width: ?Length,
        color: ?ResourceColor,
        radius: ?Length,
        style: ?BorderStyle
    ): This {
        let width_ = transAppResourceToLength(width ?? 0.vp)
        let radius_ = transAppResourceToLength(radius ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkButtonSetBorder(
                CJBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    transAppResourceToResourceColor(color ?? Color.Black),
                    radius_.value,
                    radius_.unitType.getValue(),
                    (style ?? BorderStyle.Solid).getValue()
                )
            )
        }
        this
    }

    protected override func paddingInner(top: ?Length, right: ?Length, bottom: ?Length, left: ?Length): This {
        let top_ = transAppResourceToLength(top ?? 0.vp)
        let right_ = transAppResourceToLength(right ?? 0.vp)
        let bottom_ = transAppResourceToLength(bottom ?? 0.vp)
        let left_ = transAppResourceToLength(left ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkButtonSetPadding(top_.value, top_.unitType.getValue(), right_.value,
                right_.unitType.getValue(), bottom_.value, bottom_.unitType.getValue(), left_.value,
                left_.unitType.getValue())
        }
        this
    }

    protected func borderRadiusInner(
        topLeft!: ?Length,
        topRight!: ?Length,
        bottomLeft!: ?Length,
        bottomRight!: ?Length
    ): This {
        let topLeft_ = transAppResourceToLength(topLeft ?? 0.vp)
        let topRight_ = transAppResourceToLength(topRight ?? 0.vp)
        let bottomLeft_ = transAppResourceToLength(bottomLeft ?? 0.vp)
        let bottomRight_ = transAppResourceToLength(bottomRight ?? 0.vp)
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
     * @param { ?ButtonStyleMode } value - Button style mode.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func buttonStyle(value: ?ButtonStyleMode): This {
        let tmpValue = value ?? ButtonStyleMode.Emphasized
        unsafe {
            FfiOHOSAceFrameworkButtonSetButtonStyle(tmpValue.getValue())
        }
        this
    }
}
