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

package ohos.arkui.component.common

import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive

protected const INVALID_CALLBACK_ID = 0

/**
 * Defines modal transition type.
 *
 * @relation declare enum ModalTransition
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ModalTransition {
    /**
     * Use default animation.
     *
     * @relation DEFAULT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default |
    /**
     * No transition animation for the modal.
     *
     * @relation NONE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None |
    /**
     * Use alpha animation.
     *
     * @relation ALPHA
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alpha |
    ...

    func getValue(): UInt32 {
        match (this) {
            case Default => 0
            case None => 1
            case _ => 2
        }
    }
}

/**
 * Defines sheet size type.
 *
 * @relation declare enum SheetSize
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetSize {
    /**
     * The sheet height is half of the screen height.
     *
     * @relation MEDIUM
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium |
    /**
     * The sheet height is half of the screen height.
     *
     * @relation LARGE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Large |
    /**
     * The sheet height is half of the screen height.
     *
     * @relation FIT_CONTENT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FitContent
    | ...

    func getValue(): Int32 {
        match (this) {
            case Medium => 0
            case Large => 1
            case _ => 2
        }
    }
}

/**
 * Defines the sheet type.
 *
 * @relation declare enum SheetType.
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetType {
    /**
     * Bottom sheet.
     *
     * @relation BOTTOM = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom |
    /**
     * Center sheet.
     *
     * @relation CENTER = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center |
    /**
     * Popup sheet. The popup sheet cannot be dismissed with a pull-down gesture.
     *
     * @relation POPUP = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Popup
    | ...

    func getValue(): Int32 {
        match (this) {
            case Bottom => 0
            case Center => 1
            case _ => 2
        }
    }
}

/**
 * Defines the options of blur
 *
 * @relation declare interface BlurOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BlurOptions {
    /**
     * Fuzzy gray scale parameter
     *
     * @relation grayscale: [number, number]
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var grayscale: VArray<Float32, $2>

    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(grayscale: VArray<Float32, $2>) {
        this.grayscale = grayscale
    }
}

/**
 * Defines the options of ForegroundBlurStyle
 *
 * @relation declare interface ForegroundBlurStyleOptions extends BlurStyleOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ForegroundBlurStyleOptions {
    /**
     * Color mode used for the foreground blur.
     * <br>Default value: **ThemeColorMode.System**.
     *
     * @relation colorMode?: ThemeColorMode;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colorMode: ThemeColorMode = ThemeColorMode.System

    /**
     * Adaptive color mode.
     * <br>Default value: **AdaptiveColor.Default**.
     *
     * @relation colorMode?: ThemeColorMode;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var adaptiveColor: AdaptiveColor = AdaptiveColor.Default

    /**
     * Defines the options of blur
     *
     * @relation blurOptions?: BlurOptions;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var blurOptions: BlurOptions = BlurOptions([0.0, 0.0])

    /**
     * Foreground blur scale.
     * <br>Default value: **1.0**.
     * <br>Value range: [0.0, 1.0].
     *
     * @relation scale?: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: Float32 = 1.0

    /**
     * constructor
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        colorMode!: ThemeColorMode = ThemeColorMode.System,
        adaptiveColor!: AdaptiveColor = AdaptiveColor.Default,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        scale!: Float32 = 1.0
    ) {
        this.colorMode = colorMode
        this.adaptiveColor = adaptiveColor
        this.blurOptions = blurOptions
        this.scale = scale
    }
}

/**
 * Defines the popup options.
 *
 * @relation declare interface PopupButton
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupButton {
    let value: String
    let action: () -> Unit

    /**
     * constructor
     *
     * @param {String} value - Button text value
     * @param { () -> Unit } action - action
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String, action!: () -> Unit) {
        this.value = value
        this.action = action
    }
}

/**
 * Popup state change param
 *
 * @relation declare interface PopupStateChangeParam
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupStateChangeParam {
    /**
     * is Visible.
     * Anonymous Object Rectification.
     *
     * @relation isVisible: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isVisible: Bool

    /**
     * constructor
     *
     * @param {Bool} value
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: Bool) {
        this.isVisible = value
    }
}

/**
 * Defines the popup options.
 *
 * @relation declare interface PopupOptions
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupOptions {
    /**
     * Content of the popup message.
     *
     * @relation message: string;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: String = ""

    /**
     * The first button.
     *
     *
     * @relation primaryButton?: PopupButton;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primaryButton: PopupButton = PopupButton(value: "", action: {=>})

    /**
     * The second button.
     *
     *
     * @relation secondaryButton?:PopupButton
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var secondaryButton: PopupButton = PopupButton(value: "", action: {=>})

    /**
     * on State Change
     *
     * @relation onStateChange?: PopupStateChangeCallback;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onStateChange: ?(PopupStateChangeParam) -> Unit = Option.None

    /**
     * Parameters of the popup message
     *
     * @relation messageOptions?: PopupMessageOptions
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var messageOptions: PopupMessageOptions = PopupMessageOptions()

    /**
     * The offset of the sharp corner of popup.
     *
     * @relation arrowOffset?: Length;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: Length = 0.vp

    /**
     * Whether to display in the sub window.
     *
     * @relation showInSubWindow?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool = false

    /**
     * Whether to apply a mask to the popup.
     * and a color value means to apply a mask in the corresponding color to the popup.
     *
     * @relation mask?: boolean | { color: ResourceColor };
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var mask: ResourceColor = Color(0x1000000)

    /**
     * Sets the space of between the popup and target.
     *
     * @relation targetSpace?: Length
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetSpace: Length = 0.vp

    /**
     * The placement of popup.
     * Supports all positions defined in Placement.
     *
     * @relation placement?: Placement;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: Placement = Placement.BottomLeft

    /**
     * Sets the position offset of the popup.
     *
     * @relation offset?: Position
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Position = Position(0.0, 0.0)

    /**
     * whether show arrow
     *
     * @relation enableArrow?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: Bool = true

    /**
     * Sets the position offset of the popup.
     *
     * @relation popupColor?: Color | string | Resource | number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var popupColor: ResourceColor = Color(0x1000000)

    /**
     * Whether hide popup when click mask.
     *
     * @relation autoCancel?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool = true

    /**
     * Set the width of the popup.
     *
     * @relation width?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length = 0.vp

    /**
     * The position of the sharp corner of popup.
     *
     * @relation arrowPointPosition?: ArrowPointPosition;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowPointPosition: Option<ArrowPointPosition> = None

    /**
     * The width of the arrow.
     *
     * @relation arrowWidth?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowWidth: Length = 16.0.vp

    /**
     * The height of the arrow.
     *
     * @relation arrowWidth?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowHeight: Length = 8.0.vp

    /**
     * The round corners of the popup.
     *
     * @relation adius?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Length = 20.0.vp

    /**
     * The style of popup Shadow.
     *
     * @relation shadow?: ShadowOptions | ShadowStyle;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD

    /**
     * Defines popup background blur Style
     *
     * @relation backgroundBlurStyle?: BlurStyle;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
    /**
     * Defines the transition effect of popup opening and closing
     *
     * @relation transition?: TransitionEffect;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: ?TransitionEffect = Option.None

    /**
     * Callback function when the popup interactive dismiss
     *
     * @relation onWillDismiss?: boolean | Callback<DismissPopupAction>;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: ?(DismissPopupAction) -> Unit = None

    /**
     * Determine if popup can follow the target node when it has rotation or scale
     *
     * @relation followTransformOfTarget?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var followTransformOfTarget: Bool = false

    /**
     * constructor
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message!: String,
        primaryButton!: PopupButton = PopupButton(value: "", action: {=>}),
        secondaryButton!: PopupButton = PopupButton(value: "", action: {=>}),
        onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
        arrowOffset!: Length = 0.vp,
        showInSubWindow!: Bool,
        messageOptions!: PopupMessageOptions = PopupMessageOptions(),
        mask!: Color = Color(0x1000000),
        targetSpace!: Length = 0.vp,
        placement!: Placement = Placement.BottomLeft,
        offset!: Position = Position(0.0, 0.0),
        enableArrow!: Bool = true,
        popupColor!: Color = Color(0x1000000),
        autoCancel!: Bool = true,
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 8.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OuterDefaultMD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        transition!: ?TransitionEffect = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    ) {
        this.message = message
        this.primaryButton = primaryButton
        this.secondaryButton = secondaryButton
        this.onStateChange = onStateChange
        this.messageOptions = messageOptions
        this.arrowOffset = arrowOffset
        this.showInSubWindow = showInSubWindow
        this.mask = mask
        this.targetSpace = targetSpace
        this.placement = placement
        this.offset = offset
        this.enableArrow = enableArrow
        this.popupColor = popupColor
        this.autoCancel = autoCancel
        this.width = width
        this.arrowPointPosition = arrowPointPosition
        this.arrowWidth = arrowWidth
        this.arrowHeight = arrowHeight
        this.radius = radius
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle
        this.transition = transition
        this.onWillDismiss = onWillDismiss
        this.followTransformOfTarget = followTransformOfTarget
    }
}

/**
 * Defines the menu element.
 *
 * @relation declare interface MenuElement
 */
public class MenuElement {
    let value: String
    let action: () -> Unit

    let icon: ResourceStr = ""
    let enabled: Bool = true
    /**
     * constructor
     *
     * @param {ResourceStr} value
     * @param { () -> Unit } action - action
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ResourceStr, action!: () -> Unit) {
        this.value = transResourceStrToString(value)
        this.action = action
    }
}

/**
 * Defines the custom popup options.
 *
 * @relation declare interface CustomPopupOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomPopupOptions {
    /**
     * Popup builder.
     * <br>The popup attribute is a universal attribute. A custom popup does not support display of another popup.
     * <br>The position attribute cannot be used for the first-layer container in the builder.
     * <br>If the position attribute is used, the popup will not be displayed.
     * <br>If a custom component is used in the builder, the aboutToAppear and aboutToDisappear lifecycle callbacks
     * of the custom component are irrelevant to the visibility of the popup. As such, the lifecycle of the
     * custom component cannot be used to determine whether the popup is displayed or not.
     *
     * @relation builder: CustomBuilder;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: CustomBuilder = {=>}

    /**
     * Preferred position of the popup. If the set position is insufficient for holding the popup,
     * it will be automatically adjusted.
     *
     * @relation placement?: Placement;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: Placement = Placement.Bottom

    /**
     * mask color of popup
     *
     * @relation maskColor?: Color | string | Resource | number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: ResourceColor = Color(0x1000000)

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: Color = Color(0x1000000)

    /**
     * whether show arrow
     *
     * @relation enableArrow?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: Bool = true

    /**
     * Whether to automatically dismiss the popup when an operation is performed on the page.
     * <br>To enable the popup to disappear upon a click on it, place a layout component in the builder place the
     * <Popup> component in the layout component, and modify the value of the bindPopup variable (show: boolean)
     * in the onClick event of the layout component.
     *
     * @relation autoCancel?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool = true
    /**
     * on State Change
     *
     * @relation onStateChange?: PopupStateChangeCallback;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onStateChange: Option<(PopupStateChangeParam) -> Unit> = Option.None
    /**
     * Color of the popup. To remove the background blur, set backgroundBlurStyle to BlurStyle.NONE.
     *
     * @relation popupColor?: Color | string | Resource | number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var popupColor: ?Color = None
    /**
     * The offset of the sharp corner of popup.
     *
     * Offset of the popup arrow relative to the popup. When the arrow is at the top or bottom of the popup:
     * <br>The value 0 indicates that the arrow is located on the leftmost, and any other value indicates the distance
     * from the arrow to the leftmost; the arrow is centered by default. When the arrow is on the left or right
     * side of the popup: The value indicates the distance from the arrow to the top; the arrow is centered by
     * default. When the popup is displayed on either edge of the screen, it will automatically deviate leftward
     * or rightward to stay within the safe area. When the value is 0, the arrow always points to the bound component.
     *
     * @relation arrowOffset?: Length;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: Length = 0.vp

    /**
     * Whether to display in the sub window.
     *
     * @relation showInSubWindow?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool = false
    /**
     * Whether to apply a mask to the popup.
     *
     * @relation mask?: boolean | { color: ResourceColor };
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var mask: ?Color = None
    /**
     * Sets the space of between the popup and target.
     *
     * @relation targetSpace?: Length
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetSpace: Length = 0.vp
    /**
     * Sets the position offset of the popup.
     *
     * @relation offset?: Position
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Position = Position(0.0, 0.0)
    /**
     * Set the width of the popup.
     *
     * @relation width?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length = 0.vp
    /**
     * Position of the popup arrow relative to its parent component. Available positions are Start, Center, and End,
     * in both vertical and horizontal directions. All these positions are within the parent component area.
     *
     * @type { ?ArrowPointPosition }
     * @relation arrowPointPosition?: ArrowPointPosition;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowPointPosition: Option<ArrowPointPosition> = None
    /**
     * Arrow thickness. If the arrow thickness exceeds the length of the edge minus twice the size of the popup
     * rounded corner, the arrow is not drawn.
     *
     * @type { Length }
     * @relation arrowWidth?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowWidth: Length = 16.vp
    /**
     * The height of the arrow.
     *
     * @type { Length }
     * @relation arrowHeight?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowHeight: Length = 8.vp
    /**
     * The round corners of the popup.
     *
     * @type { Length }
     * @relation radius?: Dimension;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Length = 20.vp
    /**
     * The style of popup Shadow.
     * @type { ShadowStyle }
     * @relation shadow?: ShadowOptions | ShadowStyle;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ShadowStyle = ShadowStyle.OuterDefaultMD
    /**
     * Background blur style of the popup.
     * @type { BlurStyle }
     * @relation backgroundBlurStyle?: BlurStyle;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick
    /**
     * Set popup focusable
     * @type { Bool }
     * @relation focusable?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var focusable: Bool = false
    /**
     * Defines the transition effect of popup opening and closing
     *
     * @type { ?TransitionEffect }
     * @relation transition?: TransitionEffect;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: Option<TransitionEffect> = Option.None
    /**
     * * Whether to perform dismissal event interception and interception callback.
     * 1. If this parameter is set to false, the system does not respond to the dismissal event initiated by
     * touching the Back button, swiping left or right on the screen, or pressing the Esc key; and the system
     * dismisses the popup only when show is set to false. If this parameter is set to true, the system responds
     * to the dismissal event as expected.
     * 2. If this parameter is set to a function, the dismissal event is intercepted and the callback function
     * is executed.
     * @type { Option<(DismissPopupAction) -> Unit> }
     * @relation onWillDismiss?: boolean | Callback<DismissPopupAction>;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: Option<(DismissPopupAction) -> Unit> = None
    /**
     * Determine if popup can follow the target node when it has rotation or scale.
     *
     * @type { Bool }
     * @default false
     * @relation followTransformOfTarget?: boolean;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var followTransformOfTarget: Bool = false
    /**
     * constructor
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        builder!: () -> Unit,
        placement!: Placement = Placement.Bottom,
        maskColor!: Color = Color(0x1000000),
        popupColor!: Color = Color(0x1000000),
        enableArrow!: Bool = true,
        autoCancel!: Bool = true,
        onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
        showInSubWindow!: Bool, // 5.1 start
        backgroundColor!: Color = Color(0x1000000),
        arrowOffset!: Length = 0.vp,
        mask!: ?Color = None,
        targetSpace!: Length = 0.vp,
        offset!: Position = Position(0.0, 0.0),
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 16.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OuterDefaultMD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        focusable!: Bool = false,
        transition!: Option<TransitionEffect> = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    ) {
        this.builder = builder
        this.placement = placement
        this.maskColor = maskColor
        this.popupColor = popupColor
        this.enableArrow = enableArrow
        this.autoCancel = autoCancel
        this.onStateChange = onStateChange
        this.backgroundColor = backgroundColor
        this.arrowOffset = arrowOffset
        this.showInSubWindow = showInSubWindow
        this.mask = mask
        this.targetSpace = targetSpace
        this.offset = offset
        this.width = width
        this.arrowPointPosition = arrowPointPosition
        this.arrowWidth = arrowWidth
        this.arrowHeight = arrowHeight
        this.radius = radius
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle
        this.focusable = focusable
        this.transition = transition
        this.onWillDismiss = onWillDismiss
        this.followTransformOfTarget = followTransformOfTarget
    }
}

/**
 * Defines the options of popup message.
 *
 * @relation declare interface PopupMessageOptions
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupMessageOptions {
    /**
     * Sets the color of popup text.
     *
     * @type { ResourceColor }
     * @relation textColor?: ResourceColor;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textColor: ResourceColor
    /**
     * Sets the color of popup text.
     *
     * @type { Fonts }
     * @relation font?: Font;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var font: Fonts
    /**
     * constructor
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textColor!: ResourceColor = Color(0x000000), font!: Font = Font()) {
        this.textColor = textColor
        this.font = font
    }
}

/**
 * Defines the OverlayOffset.
 *
 * @relation declare interface OverlayOffset
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OverlayOffset {
    /**
     * Defines x.
     *
     * @type { Float64 }
     * @relation x?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64
    /**
     * Defines x.
     *
     * @type { Float64 }
     * @relation y?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Float64 = 0.0, y!: Float64 = 0.0) {
        this.x = x
        this.y = y
    }
}

/**
 * Defines the border width property.
 *
 * @relation declare interface EdgeWidths
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeWidths {
    /**
     * top property.
     *
     * @type { Length }
     * @relation top?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Length
    /**
     * right property.
     *
     * @type { Length }
     * @relation right?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Length
    /**
     * bottom property.
     *
     * @type { Length }
     * @relation bottom?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Length
    /**
     * left property.
     *
     * @type { Length }
     * @relation left?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Length
    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp) {
        this.top = transAppResourceToLength(top)
        this.right = transAppResourceToLength(right)
        this.bottom = transAppResourceToLength(bottom)
        this.left = transAppResourceToLength(left)
    }

    func toCJEdge(): CJEdge {
        return CJEdge(top, right, bottom, left)
    }
}

/**
 * Overlay module options
 *
 * @relation declare interface BindOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BindOptions {
    let backgroundColor: ?ResourceColor
    let onAppear: ?() -> Unit
    let onDisappear: ?() -> Unit
    let onWillAppear: ?() -> Unit
    let onWillDisappear: ?() -> Unit

    /**
     * constructor
     *
     * @param {ResourceColor} backgroundColor - Background color of the sheet. Default value: **Color.White**.
     * @param {?() -> Unit} onAppear - Callback for when the sheet is displayed (after the animation ends).
     * @param {?() -> Unit} onDisappear - Callback for when the sheet disappears (after the animation ends).
     * @param {?() -> Unit} onWillAppear - Callback for when the sheet is about to be displayed (before the animation starts).
     * @param {?() -> Unit} onWillDisappear - Callback function before overlay popAnimation starts.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(backgroundColor!: ?ResourceColor = Option.None, onAppear!: ?() -> Unit = Option.None,
        onDisappear!: ?() -> Unit = Option.None, onWillAppear!: ?() -> Unit = Option.None,
        onWillDisappear!: ?() -> Unit = Option.None) {
        this.backgroundColor = backgroundColor
        this.onAppear = onAppear
        this.onDisappear = onDisappear
        this.onWillAppear = onWillAppear
        this.onWillDisappear = onWillDisappear
    }

    func parseCBindOptions(bindOption: BindOptions): CBindOptions {
        let backgroundColor = if (let Some(v) <- bindOption.backgroundColor) {
            NativeOptionUInt32(true, v.toUInt32())
        } else {
            NativeOptionUInt32(false, 0)
        }

        let getCallBack = {
            callback: ?() -> Unit => return if (let Some(v) <- callback) {
                NativeOptionCallBack(true, Callback0Param<Unit>(v).getID())
            } else {
                NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
        }
        let onAppear = getCallBack(bindOption.onDisappear)
        let onDisappear = getCallBack(bindOption.onDisappear)
        let onWillAppear = getCallBack(bindOption.onWillAppear)
        let onWillDisappear = getCallBack(bindOption.onWillDisappear)
        return CBindOptions(backgroundColor, onAppear, onDisappear, onWillAppear, onWillDisappear)
    }
}

/**
 * Component content cover options
 *
 * @relation declare interface ContentCoverOptions extends BindOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContentCoverOptions <: BindOptions {
    let modalTransition: ModalTransition
    let onWillDismiss: Option<(DismissContentCoverAction) -> Unit>
    let transition: Option<TransitionEffect>
    /**
     * constructor
     *
     * @param {ModalTransition} modalTransition - Defines transition type
     * @param {?(DismissContentCoverAction) -> Unit} onWillDismiss - Callback function when the content cover interactive dismiss.
     * @param {?TransitionEffect} transition
     * @param {ResourceColor} backgroundColor - Background color of the sheet. Default value: **Color.White**.
     * @param {?() -> Unit} onAppear - Callback for when the sheet is displayed (after the animation ends).
     * @param {?() -> Unit} onDisappear - Callback for when the sheet disappears (after the animation ends).
     * @param {?() -> Unit} onWillAppear - Callback for when the sheet is about to be displayed (before the animation starts).
     * @param {?() -> Unit} onWillDisappear - Callback function before overlay popAnimation starts.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        modalTransition!: ModalTransition = ModalTransition.Default,
        onWillDismiss!: ?(DismissContentCoverAction) -> Unit = Option.None,
        transition!: ?TransitionEffect = Option.None,
        backgroundColor!: ?ResourceColor = Option.None,
        onAppear!: ?() -> Unit = Option.None,
        onDisappear!: ?() -> Unit = Option.None,
        onWillAppear!: ?() -> Unit = Option.None,
        onWillDisappear!: ?() -> Unit = Option.None
    ) {
        super(backgroundColor: backgroundColor, onAppear: onAppear, onDisappear: onDisappear, onWillAppear: onWillAppear,
            onWillDisappear: onWillDisappear)
        this.modalTransition = modalTransition
        this.onWillDismiss = onWillDismiss
        this.transition = transition
    }

    func parseCJContentCoverOptions(contentCoverOptions: ContentCoverOptions): CJContentCoverOptionsV2 {
        let bindOptions = BindOptions(
            backgroundColor: contentCoverOptions.backgroundColor,
            onAppear: contentCoverOptions.onAppear,
            onDisappear: contentCoverOptions.onDisappear,
            onWillAppear: contentCoverOptions.onWillAppear,
            onWillDisappear: contentCoverOptions.onWillDisappear
        )
        let cjBindOptions = contentCoverOptions.parseCBindOptions(bindOptions)
        let modalTransition = contentCoverOptions.modalTransition.getValue()

        let transition = match (contentCoverOptions.transition) {
            case Some(value) => NativeOptionInt64(true, value.getID())
            case None => NativeOptionInt64(false, 0)
        }

        let onWillDismiss = match (contentCoverOptions.onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    proxy: CJDismissContentCoverAction => value(proxy.parseToCJ())
                }
                let lambdaData = Callback1Param<CJDismissContentCoverAction, Unit>(wrapper);
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }
        return CJContentCoverOptionsV2(
            modalTransition,
            onWillDismiss,
            transition,
            cjBindOptions.backgroundColor,
            cjBindOptions.onAppear,
            cjBindOptions.onDisappear,
            cjBindOptions.onWillAppear,
            cjBindOptions.onWillDisappear
        )
    }
}

/**
 * Component sheet dismiss
 *
 * @relation declare interface SheetDismiss
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetDismiss {
    init() {}

    /**
     * Defines sheet dismiss function
     *
     * @relation dismiss: VoidCallback;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss(): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractDismiss()
        }
    }
}

/**
 * Defines sheet spring back action
 *
 * @relation declare interface SpringBackAction
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SpringBackAction {
    init() {}

    /**
     * Defines spring back function
     *
     * @relation springBack: Callback<void>;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func springBack() {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSpringBack()
        }
    }
}

/**
 * Define the display mode of the sheet.
 *
 * @relation declare enum SheetMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetMode {
    /**
     * The sheet is displayed at the top of the window corresponding to the current **UIContext** instance,
     * above all pages. It is displayed at the same level as dialog boxes.
     *
     * @relation OVERLAY
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overlay
    |
        /**
         * The sheet is displayed at the top of the current page.
         *
         * @relation EMBEDDED = 1,
         */
        @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Embedded
    | ...

    func toValue(): UInt32 {
        match (this) {
            case Overlay => 0
            case Embedded => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func toEnum(value: UInt32): SheetMode {
        if (value == 0) {
            return SheetMode.Overlay
        } else if (value == 1) {
            return SheetMode.Embedded
        } else {
            return SheetMode.Overlay
        }
    }
}

/**
 * Define the scroll size mode of the sheet.
 *
 * @relation declare enum ScrollSizeMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollSizeMode {
    /**
     * Sheet change scroll size after the slide ends.
     *
     * @relation OLLOW_DETENT = 0,
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FollowDetent
    |
        /**
         * Sheet change scroll size during the sliding process.
         *
         * @relation CONTINUOUS = 1,
         */
        @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Continuous
    | ...

    func toValue(): UInt32 {
        match (this) {
            case FollowDetent => 0
            case Continuous => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func toEnum(value: UInt32): ScrollSizeMode {
        if (value == 0) {
            return ScrollSizeMode.FollowDetent
        } else if (value == 1) {
            return ScrollSizeMode.Continuous
        } else {
            return ScrollSizeMode.FollowDetent
        }
    }
}

func parseToDismissSheetAction(reason: Int32): DismissSheetAction {
    return DismissSheetAction(DismissReason.toEnum(reason))
}

func parseShadowOptions(shadowOptions: ShadowOptions): NativeShadow {
    NativeShadow(
        true,
        NativeShadowOptions(
            shadowOptions.radius,
            shadowOptions.shadowType.getValue(),
            shadowOptions.color.toUInt32(),
            shadowOptions.offsetX,
            shadowOptions.offsetY,
            shadowOptions.fill
        )
    )
}

/**
 * Component sheet options
 *
 * @relation declare interface SheetOptions extends BindOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetOptions <: BindOptions {
    let height: Option<SheetSize>
    let detents: Option<Array<SheetSize>>
    let preferType: Option<SheetType>
    let showClose: Option<Bool>
    let dragBar: Option<Bool>
    let blurStyle: Option<BlurStyle>
    let maskColor: Option<Color>
    let title: Option<() -> Unit>
    let enableOutsideInteractive: Option<Bool>
    let shouldDismiss: Option<(SheetDismiss) -> Unit>
    let onWillDismiss: Option<(DismissSheetAction) -> Unit>
    let onWillSpringBackWhenDismiss: Option<(SpringBackAction) -> Unit>
    let onHeightDidChange: Option<(Float32) -> Unit>
    let onDetentsDidChange: Option<(Float32) -> Unit>
    let onWidthDidChange: Option<(Float32) -> Unit>
    let onTypeDidChange: Option<(Float32) -> Unit>
    let borderWidth: Option<Length>
    let borderColor: Option<Color>
    let borderStyle: Option<EdgeStyles>
    let width: Option<Length>
    let shadow: Option<ShadowOptions>
    let mode: Option<SheetMode>
    let scrollSizeMode: Option<ScrollSizeMode>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        backgroundColor!: Option<ResourceColor> = Color.White,
        onAppear!: Option<() -> Unit> = Option.None,
        onDisappear!: Option<() -> Unit> = Option.None,
        onWillAppear!: Option<() -> Unit> = Option.None,
        onWillDisappear!: Option<() -> Unit> = Option.None,
        height!: Option<SheetSize> = Option.None,
        detents!: Option<Array<SheetSize>> = Option.None,
        preferType!: Option<SheetType> = Option.None,
        showClose!: Option<Bool> = Option.None,
        dragBar!: Option<Bool> = Option.None,
        blurStyle!: Option<BlurStyle> = Option.None,
        maskColor!: Option<Color> = Option.None,
        title!: Option<() -> Unit> = Option.None,
        enableOutsideInteractive!: Option<Bool> = Option.None,
        shouldDismiss!: Option<(SheetDismiss) -> Unit> = Option.None,
        onWillDismiss!: Option<(DismissSheetAction) -> Unit> = Option.None,
        onWillSpringBackWhenDismiss!: Option<(SpringBackAction) -> Unit> = Option.None,
        onHeightDidChange!: Option<(Float32) -> Unit> = Option.None,
        onDetentsDidChange!: Option<(Float32) -> Unit> = Option.None,
        onWidthDidChange!: Option<(Float32) -> Unit> = Option.None,
        onTypeDidChange!: Option<(Float32) -> Unit> = Option.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.Black,
        borderStyle!: Option<EdgeStyles> = EdgeStyles(),
        width!: Option<Length> = Option.None,
        shadow!: Option<ShadowOptions> = Option.None,
        mode!: Option<SheetMode> = SheetMode.Overlay,
        scrollSizeMode!: Option<ScrollSizeMode> = ScrollSizeMode.FollowDetent
    ) {
        super(backgroundColor: backgroundColor, onAppear: onAppear, onDisappear: onDisappear, onWillAppear: onWillAppear,
            onWillDisappear: onWillDisappear)
        this.height = height
        this.detents = detents
        this.preferType = preferType
        this.showClose = showClose
        this.dragBar = dragBar
        this.blurStyle = blurStyle
        this.maskColor = maskColor
        this.title = title
        this.enableOutsideInteractive = enableOutsideInteractive
        this.shouldDismiss = shouldDismiss
        this.onWillDismiss = onWillDismiss
        this.onWillSpringBackWhenDismiss = onWillSpringBackWhenDismiss
        this.onHeightDidChange = onHeightDidChange
        this.onDetentsDidChange = onDetentsDidChange
        this.onWidthDidChange = onWidthDidChange
        this.onTypeDidChange = onTypeDidChange
        this.borderWidth = borderWidth
        this.borderColor = borderColor
        this.borderStyle = borderStyle
        this.width = width
        this.shadow = shadow
        this.mode = mode
        this.scrollSizeMode = scrollSizeMode
    }

    static func parse(sheetOption: SheetOptions): CSheetOptionsV2 {
        var bindOption: BindOptions = BindOptions(
            backgroundColor: sheetOption.backgroundColor,
            onAppear: sheetOption.onAppear,
            onDisappear: sheetOption.onDisappear,
            onWillAppear: sheetOption.onWillAppear,
            onWillDisappear: sheetOption.onWillDisappear
        )
        var cbindOption: CBindOptions = sheetOption.parseCBindOptions(bindOption)

        unsafe {
            let height = match (sheetOption.height) {
                case Some(value) => NativeOptionInt32(true, value.getValue())
                case None => NativeOptionInt32(false, 0)
            }
            let detents = match (sheetOption.detents) {
                case Some(value) =>
                    let ptr = LibC.malloc<Int32>(count: 3)
                    for (i in 0..2) {
                        ptr.write(i, value[i].getValue())
                    }
                    NativeOptionCArrInt32(true, CArrInt32(CPointer<Int32>(ptr), 3))
                case None => NativeOptionCArrInt32(false, CArrInt32(CPointer<Int32>(), 0))
            }
            let preferType = match (sheetOption.preferType) {
                case Some(value) => NativeOptionInt32(true, value.getValue())
                case None => NativeOptionInt32(false, 0)
            }
            let showClose = match (sheetOption.showClose) {
                case Some(value) => NativeOptionBool(true, value)
                case None => NativeOptionBool(false, false)
            }
            let dragBar = match (sheetOption.dragBar) {
                case Some(value) => NativeOptionBool(true, value)
                case None => NativeOptionBool(false, false)
            }
            let blurStyle = match (sheetOption.blurStyle) {
                case Some(value) => NativeOptionInt32(true, value.getValue())
                case None => NativeOptionInt32(false, 0)
            }
            let maskColor = match (sheetOption.maskColor) {
                case Some(value) => NativeOptionUInt32(true, value.toUInt32())
                case None => NativeOptionUInt32(false, 0)
            }
            let title = match (sheetOption.title) {
                case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let enableOutsideInteractive = match (sheetOption.enableOutsideInteractive) {
                case Some(value) => NativeOptionBool(true, value)
                case None => NativeOptionBool(false, false)
            }
            let shouldDismiss = match (sheetOption.shouldDismiss) {
                case Some(value) =>
                    let wrapper = {
                        => value(SheetDismiss())
                    }
                    let lambdaData = Callback0Param<Unit>(wrapper)
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onWillDismiss = match (sheetOption.onWillDismiss) {
                case Some(value) =>
                    let wrapper = {
                        action: Int32 => value(parseToDismissSheetAction(action))
                    }
                    let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let springBack = match (sheetOption.onWillSpringBackWhenDismiss) {
                case Some(value) =>
                    let wrapper = {
                        => value(SpringBackAction())
                    }
                    let lambdaData = Callback0Param<Unit>(wrapper)
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onHeightDidChange = match (sheetOption.onHeightDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onDetentsDidChange = match (sheetOption.onDetentsDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onWidthDidChange = match (sheetOption.onWidthDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onTypeDidChange = match (sheetOption.onTypeDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let borderWidth = match (sheetOption.borderWidth) {
                case Some(value) =>
                    var value_ = transAppResourceToLength(value)
                    NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
                case None => NativeOptionLength(false, NativeLength(0.0, 0))
            }
            let borderColor = match (sheetOption.borderColor) {
                case Some(value) => NativeOptionUInt32(true, value.toUInt32())
                case None => NativeOptionUInt32(false, 0)
            }
            let borderStyle = match (sheetOption.borderStyle) {
                case Some(value) => NativeOptionEdgeStyle(true, value.toNative())
                case None => NativeOptionEdgeStyle(false, NativeEdgeStyles(0, 0, 0, 0))
            }
            let width = match (sheetOption.width) {
                case Some(value) =>
                    var value_ = transAppResourceToLength(value)
                    NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
                case None => NativeOptionLength(false, NativeLength(0.0, 0))
            }
            let shadow = match (sheetOption.shadow) {
                case Some(value) => parseShadowOptions(value)
                case None => parseShadowOptions(ShadowOptions(radius: 0.0, shadowType: ShadowType.COLOR))
            }
            let mode = match (sheetOption.mode) {
                case Some(value) => NativeOptionUInt32(true, value.toValue())
                case None => NativeOptionUInt32(false, 0)
            }
            let scrollSizeMode = match (sheetOption.scrollSizeMode) {
                case Some(value) => NativeOptionUInt32(true, value.toValue())
                case None => NativeOptionUInt32(false, 0)
            }
            return CSheetOptionsV2(
                cbindOption.backgroundColor,
                cbindOption.onAppear,
                cbindOption.onDisappear,
                cbindOption.onWillAppear,
                cbindOption.onWillDisappear,
                height,
                detents,
                preferType,
                showClose,
                dragBar,
                blurStyle,
                maskColor,
                title,
                enableOutsideInteractive,
                shouldDismiss,
                onWillDismiss,
                springBack,
                onHeightDidChange,
                onDetentsDidChange,
                onWidthDidChange,
                onTypeDidChange,
                borderWidth,
                borderColor,
                borderStyle,
                width,
                shadow,
                mode,
                scrollSizeMode,
            )
        }
    }
}

/**
 * Defines the data type of the interface restriction.
 *
 * @relation declare interface Rectangle
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Rectangle {
    /**
     * x:Horizontal coordinate
     *
     * @type { Length }
     * @relation x?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Length

    /**
     * y:Vertical axis coordinate.
     *
     * @type { Length }
     * @relation y?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Length

    /**
     * Sets the width of the current touchRect.
     *
     * @type { Length }
     * @relation width?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length

    /**
     * Sets the height of the current touchRect.
     *
     * @type { Length }
     * @relation height?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Length

    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Length = 0.vp, y!: Length = 0.vp, width!: Length = 100.percent, height!: Length = 100.percent) {
        this.x = transAppResourceToLength(x)
        this.y = transAppResourceToLength(y)
        this.width = transAppResourceToLength(width)
        this.height = transAppResourceToLength(height)
    }

    protected func parseToNative(): NativeRectangle {
        return NativeRectangle(
            x.value,
            x.unitType.getValue(),
            y.value,
            y.unitType.getValue(),
            width.value,
            width.unitType.getValue(),
            height.value,
            height.unitType.getValue()
        )
    }
}

class MenuActionData <: FFIData {
    private var actionList: HashMap<String, () -> Unit> = HashMap<String, () -> Unit>()
    init(menuList: Array<MenuElement>) {
        super()
        registerSelf()
        menuList |> forEach<MenuElement> {menus: MenuElement => actionList.add(menus.value, menus.action)}
    }

    func actionHandle(value: String): Unit {
        let actionOption = actionList.get(value)
        match (actionOption) {
            case None => throwNativeError("no action of this menu item: " + value)
            case Some(action) => action()
        }
    }
}

/**
 * Component popup dismiss
 *
 * @relation declare interface DismissPopupAction
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissPopupAction {
    /**
     * Defines popup dismiss reason
     * @relation reason: DismissReason;
     */
    public let reason: DismissReason
    init(reason!: DismissReason) {
        this.reason = reason
    }

    /**
     * Defines popup dismiss function
     * @relation dismiss(): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss(): Unit {
        unsafe {
            FfiOHOSAceFrameworkPopupDismiss()
        }
    }
}

/**
 * Defines the context menu options.
 *
 * @relation declare interface ContextMenuOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContextMenuOptions {
    /**
     * Sets the position offset of the context menu window.
     *
     * @type { Position }
     * @relation offset?: Position;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Position = Position(0.0, 0.0)

    /**
     * Preferred position of the context menu. If the set position is insufficient for holding the component, it will be
     * automatically adjusted
     *
     * @type { ?Placement }
     * @relation placement?: Placement;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: Option<Placement> = Option.None

    /**
     * whether show arrow belong to the menu.
     *
     * @type { ?Bool }
     * @relation enableArrow?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: Bool = false

    /**
     * The horizontal offset to the left of menu or vertical offset to the top of menu
     *
     * @type { Length }
     * @relation arrowOffset?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: Length = 0.vp

    /**
    * The preview content of context menu.
    * 
    * @type { ?CustomBuilder }
    * @relation preview?: MenuPreviewMode | CustomBuilder;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var preview: ?CustomBuilder = Option.None

    /**
     * The preview animator options.
     *
     * @type { ?ContextMenuAnimationOptions }
     * @relation previewAnimationOptions?: ContextMenuAnimationOptions;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var previewAnimationOptions: ?ContextMenuAnimationOptions = None

    /**
     * Callback triggered when the menu is displayed.
     *
     * @type { ?() -> Unit }
     * @relation onAppear?: () => void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onAppear: ?() -> Unit = None

    /**
     * Callback function when the context menu disappear.
     *
     * @type { ?() -> Unit }
     * @relation onDisappear?: () => void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDisappear: ?() -> Unit = None

    /**
     * Callback triggered when the menu is about to appear.
     *
     * @type { ?() -> Unit }
     * @relation aboutToAppear?: () => void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var aboutToAppear: ?() -> Unit = None

    /**
     * Callback triggered when the menu is about to disappear.
     *
     * @type { ?() -> Unit }
     * @relation aboutToDisappear?: () => void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var aboutToDisappear: ?() -> Unit = None

    /**
     * Background color of the menu.
     *
     * @type { ResourceColor }
     * @relation backgroundColor?: ResourceColor;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor = Color.Transparent

    /**
     * Background blur style of the menu.
     *
     * @type { BlurStyle }
     * @relation backgroundBlurStyle?: BlurStyle;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle = BlurStyle.ComponentUltraThick

    /**
     * Defines the transition effect of menu opening and closing.
     *
     * @type { ?TransitionEffect }
     * @relation transition?: TransitionEffect;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: ?TransitionEffect = None

    var borderRadius: ?BorderRadiuses = None
    var layoutRegionMargin: ?Margin = None

    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        offset!: Position = Position(0.0, 0.0),
        placement!: Option<Placement> = Option.None,
        enableArrow!: Bool = false,
        arrowOffset!: Length = 0.vp,
        preview!: Option<() -> Unit> = Option.None,
        onAppear!: ?() -> Unit = None,
        onDisappear!: ?() -> Unit = None,
        aboutToAppear!: ?() -> Unit = None,
        aboutToDisappear!: ?() -> Unit = None,
        backgroundColor!: ResourceColor = Color.Transparent,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        transition!: ?TransitionEffect = None,
        borderRadius!: ?BorderRadiuses = None,
        layoutRegionMargin!: ?Margin = None
    ) {
        this.offset = offset
        this.placement = placement
        this.enableArrow = enableArrow
        this.arrowOffset = arrowOffset
        this.preview = preview
        this.onAppear = onAppear
        this.onDisappear = onDisappear
        this.aboutToAppear = aboutToAppear
        this.aboutToDisappear = aboutToDisappear
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.transition = transition
        this.borderRadius = borderRadius
        this.layoutRegionMargin = layoutRegionMargin
    }

    func parseContextMenuOptions(): CJContextMenuOptions {
        CJContextMenuOptions(
            NativePosition(offset.x, offset.y),
            unsafe { parsePlacement(placement) },
            enableArrow,
            NativeLength(transAppResourceToLength(arrowOffset).value,
                transAppResourceToLength(arrowOffset).unitType.getValue()),
            unsafe { parseCallBack(preview) },
            unsafe { parsePreviewAnimationOptions(previewAnimationOptions) },
            unsafe { parseCallBack(onAppear) },
            unsafe { parseCallBack(onDisappear) },
            unsafe { parseCallBack(aboutToAppear) },
            unsafe { parseCallBack(aboutToDisappear) },
            transAppResourceToResourceColor(backgroundColor),
            backgroundBlurStyle.getValue(),
            unsafe { parseTransition(transition) },
            unsafe { parseBorderRadius(borderRadius) },
            unsafe { parseLayoutRegionMargin(layoutRegionMargin) }
        )
    }
}

/**
 * Component content cover dismiss
 *
 * @relation declare interface DismissContentCoverAction
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissContentCoverAction {
    /**
     * Defines content cover dismiss reason
     *
     * @relation reason: DismissReason;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let reason: DismissReason

    let mDismissContentCover: CFunc<() -> Unit>

    init(reason: DismissReason, dismissContentCover: CFunc<() -> Unit>) {
        this.reason = reason
        this.mDismissContentCover = dismissContentCover
    }

    /**
     *  Defines content cover dismiss function
     * @relation dismiss: Callback<void>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss(): Unit {
        unsafe {
            this.mDismissContentCover()
        }
    }
}

/**
 * Defines the ContextMenu's preview animator options.
 *
 * @relation interface ContextMenuAnimationOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContextMenuAnimationOptions {
    /**
     * Sets the start animator scale and end animator scale.
     *
     * @type { ?VArray<Float64, $2> }
     * @relation scale?: AnimationRange<number>;
     */
    public var scale: ?VArray<Float64, $2> = None
    /**
     * Defines the transition effect of menu preview opening and closing.
     *
     * @type { ?TransitionEffect }
     * @relation transition?: TransitionEffect;
     */
    public var transition: ?TransitionEffect = None
    /**
     * Sets the scale start and end animator of the image displayed before the custom builder preview is displayed.
     *
     * @type { ?VArray<Float64, $2>  }
     * @relation hoverScale?: AnimationRange<number>;
     */
    public var hoverScale: ?VArray<Float64, $2> = None

    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scale!: ?VArray<Float64, $2> = None, transition!: ?TransitionEffect = None,
        hoverScale!: ?VArray<Float64, $2> = None) {
        this.scale = scale
        this.transition = transition
        this.hoverScale = hoverScale
    }

    func parseCContextMenuAnimationOptions(): CJContextMenuAnimationOptions {
        var scaleFrom: NativeOptionFloat64
        var scaleTo: NativeOptionFloat64
        unsafe {
            match (scale) {
                case Some(value) =>
                    scaleFrom = NativeOptionFloat64(true, value[0])
                    scaleTo = NativeOptionFloat64(true, value[1])
                case None =>
                    scaleFrom = NativeOptionFloat64(false, 0.0)
                    scaleTo = NativeOptionFloat64(false, 0.0)
            }
        }
        let transition = unsafe {
            match (transition) {
                case Some(value) => NativeOptionInt64(true, value.getID())
                case None => NativeOptionInt64(false, 0)
            }
        }
        var hoverScaleFrom: NativeOptionFloat64
        var hoverScaleTo: NativeOptionFloat64
        unsafe {
            match (hoverScale) {
                case Some(value) =>
                    hoverScaleFrom = NativeOptionFloat64(true, value[0])
                    hoverScaleTo = NativeOptionFloat64(true, value[1])
                case None =>
                    hoverScaleFrom = NativeOptionFloat64(false, 0.0)
                    hoverScaleTo = NativeOptionFloat64(false, 0.0)
            }
        }
        return CJContextMenuAnimationOptions(scaleFrom, scaleTo, transition, hoverScaleFrom, hoverScaleTo)
    }
}

/**
 * Component sheet dismiss
 *
 * @relation declare interface DismissSheetAction
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissSheetAction {
    /**
     * Dismiss reason type.
     *
     * @relation reason: DismissReason;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var reason: DismissReason
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    init(reason: DismissReason) {
        this.reason = reason
    }

    /**
     *  Defines sheet dismiss function
     *
     * @relation reason: DismissReason;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss(): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractDismiss()
        }
    }
}

protected interface CombinationKeyType {}

extend FunctionKey <: CombinationKeyType {}

extend String <: CombinationKeyType {}

func parsePlacement(placement: Option<Placement>): NativeOptionInt32 {
    return match (placement) {
        case Some(value) => NativeOptionInt32(true, value.getValue())
        case None => NativeOptionInt32(false, 0)
    }
}

func parsePreviewAnimationOptions(previewAnimationOptions: ?ContextMenuAnimationOptions): NativeOptionCJContextMenuAnimationOptions {
    return match (previewAnimationOptions) {
        case Some(value) => NativeOptionCJContextMenuAnimationOptions(true, value.parseCContextMenuAnimationOptions())
        case None => NativeOptionCJContextMenuAnimationOptions(false,
            ContextMenuAnimationOptions().parseCContextMenuAnimationOptions())
    }
}

func parseCallBack(callBack: ?() -> Unit): NativeOptionCallBack {
    return match (callBack) {
        case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
        case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
    }
}

func parseTransition(transition: ?TransitionEffect): NativeOptionInt64 {
    return match (transition) {
        case Some(value) => NativeOptionInt64(true, value.getID())
        case None => NativeOptionInt64(false, 0)
    }
}

func parseBorderRadius(borderRadius: ?BorderRadiuses): NativeOptionRadius {
    return match (borderRadius) {
        case Some(value) => NativeOptionRadius(true, value.toCBorderRadiuses())
        case None => NativeOptionRadius(false, BorderRadiuses().toCBorderRadiuses())
    }
}

func parseLayoutRegionMargin(layoutRegionMargin: ?Margin): NativeOptionMargin {
    return match (layoutRegionMargin) {
        case Some(value) => NativeOptionMargin(
            true,
            NativeMargin(
                value.top.value,
                value.top.unitType.getValue(),
                value.right.value,
                value.right.unitType.getValue(),
                value.bottom.value,
                value.bottom.unitType.getValue(),
                value.left.value,
                value.left.unitType.getValue()
            )
        )
        case None => NativeOptionMargin(
            false,
            NativeMargin(
                Margin().top.value,
                Margin().top.unitType.getValue(),
                Margin().right.value,
                Margin().right.unitType.getValue(),
                Margin().bottom.value,
                Margin().bottom.unitType.getValue(),
                Margin().left.value,
                Margin().left.unitType.getValue()
            )
        )
    }
}
