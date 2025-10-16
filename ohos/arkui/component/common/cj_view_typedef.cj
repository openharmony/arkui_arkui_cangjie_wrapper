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

package ohos.arkui.component.common

import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive
import std.collection.HashMap
import std.collection.forEach

protected const INVALID_CALLBACK_ID = 0

/**
 * Defines modal transition type.
 *
 */
@Derive[Equatable]
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ModalTransition {
    /**
     * Use default animation.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default |
    /**
     * No transition animation for the modal.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None |
    /**
     * Use alpha animation.
     *
     */
    @!APILevel[
        since:"22",
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
 */
@Derive[Equatable]
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetSize {
    /**
     * The sheet height is half of the screen height.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium |
    /**
     * The sheet height is half of the screen height.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Large |
    /**
     * The sheet height is half of the screen height.
     *
     */
    @!APILevel[
        since:"22",
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
 */
@Derive[Equatable]
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetType {
    /**
     * Bottom sheet.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom |
    /**
     * Center sheet.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center |
    /**
     * Popup sheet. The popup sheet cannot be dismissed with a pull-down gesture.
     *
     */
    @!APILevel[
        since:"22",
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
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BlurOptions {
    /**
     * Fuzzy gray scale parameter
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var grayscale: ?VArray<Float32, $2>

    /**
     * BlurOptions constructor.
     *
     * @param { ?VArray<Float32, $2> } grayscale
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(grayscale: ?VArray<Float32, $2>) {
        this.grayscale = grayscale ?? [0.0, 0.0]
    }
}

/**
 * Defines the options of ForegroundBlurStyle.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ForegroundBlurStyleOptions {
    /**
     * Color mode used for the foreground blur.
     * <br>Default value: **ThemeColorMode.System**.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colorMode: ?ThemeColorMode

    /**
     * Adaptive color mode.
     * <br>Default value: **AdaptiveColor.Default**.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var adaptiveColor: ?AdaptiveColor

    /**
     * Defines the options of blur.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var blurOptions: ?BlurOptions

    /**
     * Foreground blur scale.
     * <br>Default value: **1.0**.
     * <br>Value range: [0.0, 1.0].
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: ?Float32

    /**
     * ForegroundBlurStyleOptions constructor.
     *
     * @param { ?ThemeColorMode } colorMode
     * @param { ?AdaptiveColor } adaptiveColor
     * @param { ?BlurOptions } blurOptions
     * @param { ?Float32 } scale
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        colorMode!: ?ThemeColorMode = None,
        adaptiveColor!: ?AdaptiveColor = None,
        blurOptions!: ?BlurOptions = None,
        scale!: ?Float32 = None
    ) {
        this.colorMode = colorMode ?? ThemeColorMode.System
        this.adaptiveColor = adaptiveColor ?? AdaptiveColor.Default
        this.blurOptions = blurOptions ?? BlurOptions([0.0, 0.0])
        this.scale = scale ?? 1.0
    }
}

/**
 * Defines the popup options.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupButton {
    let value: String
    let action: () -> Unit

    /**
     * PopupButton constructor.
     *
     * @param { ?String } value - Button text value
     * @param { () -> Unit } action - action
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?String, action!: () -> Unit) {
        this.value = value ?? ""
        this.action = action
    }
}

/**
 * Popup state change param.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupStateChangeParam {
    /**
     * is Visible.
     * Anonymous Object Rectification.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isVisible: Bool

    /**
     * PopupStateChangeParam constructor.
     *
     * @param {Bool} value
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: Bool) {
        this.isVisible = value
    }
}

/**
 * Defines the popup options.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupOptions {
    /**
     * Content of the popup message.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ?String

    /**
     * The first button.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primaryButton: ?PopupButton

    /**
     * The second button.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var secondaryButton: ?PopupButton

    /**
     * on State Change.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onStateChange: ?(PopupStateChangeParam) -> Unit

    /**
     * Parameters of the popup message.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var messageOptions: ?PopupMessageOptions

    /**
     * The offset of the sharp corner of popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: ?Length

    /**
     * Whether to display in the sub window.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool

    /**
     * Whether to apply a mask to the popup.
     * and a color value means to apply a mask in the corresponding color to the popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var mask: ?ResourceColor

    /**
     * Sets the space of between the popup and target.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetSpace: ?Length

    /**
     * The placement of popup.
     * Supports all positions defined in Placement.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: ?Placement

    /**
     * Sets the position offset of the popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Position

    /**
     * whether show arrow.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: ?Bool

    /**
     * Sets the position offset of the popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var popupColor: ?ResourceColor

    /**
     * Whether hide popup when click mask.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: ?Bool

    /**
     * Set the width of the popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length

    /**
     * The position of the sharp corner of popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowPointPosition: Option<ArrowPointPosition>

    /**
     * The width of the arrow.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowWidth: ?Length

    /**
     * The height of the arrow.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowHeight: ?Length

    /**
     * The round corners of the popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: ?Length

    /**
     * The style of popup Shadow.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowStyle

    /**
     * Defines popup background blur Style
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle
    /**
     * Defines the transition effect of popup opening and closing
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: ?TransitionEffect

    /**
     * Callback function when the popup interactive dismiss.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: ?(DismissPopupAction) -> Unit

    /**
     * Determine if popup can follow the target node when it has rotation or scale.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var followTransformOfTarget: ?Bool

    /**
     * PopupOptions constructor.
     *
     * @param { ?String } message
     * @param { ?PopupButton } primaryButton
     * @param { ?PopupButton } secondaryButton
     * @param { ?(PopupStateChangeParam) -> Unit } onStateChange
     * @param { ?Length } arrowOffset
     * @param { ?Bool } showInSubWindow
     * @param { ?PopupMessageOptions } messageOptions
     * @param { ?ResourceColor } mask
     * @param { ?Length } targetSpace
     * @param { ?Placement } placement
     * @param { ?Position } offset
     * @param { ?Bool } enableArrow
     * @param { ?Color } popupColor
     * @param { ?Bool } autoCancel
     * @param { ?Length } width
     * @param { ?ArrowPointPosition } arrowPointPosition
     * @param { ?Length } arrowWidth
     * @param { ?Length } arrowHeight
     * @param { ?Length } radius
     * @param { ?ShadowStyle } shadow
     * @param { ?BlurStyle } backgroundBlurStyle
     * @param { ?TransitionEffect } transition
     * @param { ?(DismissPopupAction) -> Unit } onWillDismiss
     * @param { ?Bool } followTransformOfTarget
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message!: ?String,
        primaryButton!: ?PopupButton = None,
        secondaryButton!: ?PopupButton = None,
        onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
        arrowOffset!: ?Length = None,
        showInSubWindow!: ?Bool = None,
        messageOptions!: ?PopupMessageOptions = None,
        mask!: ?Color = None,
        targetSpace!: ?Length = None,
        placement!: ?Placement = Option.None,
        offset!: ?Position = None,
        enableArrow!: ?Bool = None,
        popupColor!: ?Color = None,
        autoCancel!: ?Bool = None,
        width!: ?Length = None,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: ?Length = None,
        arrowHeight!: ?Length = None,
        radius!: ?Length = None,
        shadow!: ?ShadowStyle = None,
        backgroundBlurStyle!: ?BlurStyle = Option.None,
        transition!: ?TransitionEffect = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: ?Bool = None
    ) {
        this.message = message ?? ""
        this.primaryButton = primaryButton ?? PopupButton(value: "", action: {=>})
        this.secondaryButton = secondaryButton ?? PopupButton(value: "", action: {=>})
        this.onStateChange = onStateChange
        this.messageOptions = messageOptions ?? PopupMessageOptions()
        this.arrowOffset = arrowOffset ?? 0.vp
        this.showInSubWindow = showInSubWindow ?? false
        this.mask = mask ?? Color(0x1000000)
        this.targetSpace = targetSpace ?? 0.vp
        this.placement = placement ?? Placement.BottomLeft
        this.offset = offset ?? Position(x:0.0, y: 0.0)
        this.enableArrow = enableArrow ?? true
        this.popupColor = popupColor ?? Color(0x1000000)
        this.autoCancel = autoCancel ?? true
        this.width = width ?? 0.vp
        this.arrowPointPosition = arrowPointPosition
        this.arrowWidth = arrowWidth ?? 16.vp
        this.arrowHeight = arrowHeight ?? 8.vp
        this.radius = radius ?? 20.vp
        this.shadow = shadow ?? ShadowStyle.OuterDefaultMD
        this.backgroundBlurStyle = backgroundBlurStyle ?? BlurStyle.ComponentUltraThick
        this.transition = transition
        this.onWillDismiss = onWillDismiss
        this.followTransformOfTarget = followTransformOfTarget ?? false
    }
}

/**
 * Defines the menu element.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuElement {
    let value: String
    let action: () -> Unit

    let icon: ResourceStr = ""
    let enabled: Bool = true
    /**
     * MenuElement constructor.
     *
     * @param { ?ResourceStr } value
     * @param { () -> Unit } action - action
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?ResourceStr, action!: () -> Unit) {
        this.value = transResourceStrToString(value ?? "")
        this.action = action
    }
}

/**
 * Defines the custom popup options.
 *
 */
@!APILevel[
    since:"22",
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
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: CustomBuilder

    /**
     * Preferred position of the popup. If the set position is insufficient for holding the popup,
     * it will be automatically adjusted.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: ?Placement

    /**
     * mask color of popup.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: ?ResourceColor

    /**
     * backgroundColor of popup.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?Color

    /**
     * Whether show arrow.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: ?Bool

    /**
     * Whether to automatically dismiss the popup when an operation is performed on the page.
     * <br>To enable the popup to disappear upon a click on it, place a layout component in the builder place the
     * <Popup> component in the layout component, and modify the value of the bindPopup variable (show: boolean)
     * in the onClick event of the layout component.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: ?Bool
    /**
     * on State Change.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onStateChange: Option<(PopupStateChangeParam) -> Unit>
    /**
     * Color of the popup. To remove the background blur, set backgroundBlurStyle to BlurStyle.NONE.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var popupColor: ?Color
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
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: ?Length

    /**
     * Whether to display in the sub window.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool
    /**
     * Whether to apply a mask to the popup.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var mask: ?Color
    /**
     * Sets the space of between the popup and target.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetSpace: ?Length
    /**
     * Sets the position offset of the popup.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Position
    /**
     * Set the width of the popup.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length
    /**
     * Position of the popup arrow relative to its parent component. Available positions are Start, Center, and End,
     * in both vertical and horizontal directions. All these positions are within the parent component area.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowPointPosition: Option<ArrowPointPosition>
    /**
     * Arrow thickness. If the arrow thickness exceeds the length of the edge minus twice the size of the popup
     * rounded corner, the arrow is not drawn.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowWidth: ?Length
    /**
     * The height of the arrow.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowHeight: ?Length
    /**
     * The round corners of the popup.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: ?Length
    /**
     * The style of popup Shadow.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowStyle
    /**
     * Background blur style of the popup.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle
    /**
     * Set popup focusable.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var focusable: ?Bool
    /**
     * Defines the transition effect of popup opening and closing.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: Option<TransitionEffect>
    /**
     * * Whether to perform dismissal event interception and interception callback.
     * 1. If this parameter is set to false, the system does not respond to the dismissal event initiated by
     * touching the Back button, swiping left or right on the screen, or pressing the Esc key; and the system
     * dismisses the popup only when show is set to false. If this parameter is set to true, the system responds
     * to the dismissal event as expected.
     * 2. If this parameter is set to a function, the dismissal event is intercepted and the callback function
     * is executed.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: Option<(DismissPopupAction) -> Unit>
    /**
     * Determine if popup can follow the target node when it has rotation or scale.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var followTransformOfTarget: ?Bool
    /**
     * CustomPopupOptions constructor.
     *
     * @param { () -> Unit } builder
     * @param { ?Placement } placement
     * @param { ?Color } maskColor
     * @param { ?Color } backgroundColor
     * @param { ?Bool } enableArrow
     * @param { ?Bool } autoCancel
     * @param { ?(PopupStateChangeParam) -> Unit } onStateChange
     * @param { ?Bool } showInSubWindow
     * @param { ?Color } backgroundColor
     * @param { ?Length } arrowOffset
     * @param { ?Color } mask
     * @param { ?Length } targetSpace
     * @param { ?Position } offset
     * @param { ?Length } width
     * @param { ?ArrowPointPosition } arrowPointPosition
     * @param { ?Length } arrowWidth
     * @param { ?Length } arrowHeight
     * @param { ?Length } radius
     * @param { ?ShadowStyle } shadow
     * @param { ?BlurStyle } backgroundBlurStyle
     * @param { ?Bool } focusable
     * @param { ?TransitionEffect } transition
     * @param { Option<(DismissPopupAction) -> Unit> } onWillDismiss
     * @param { ?Bool } followTransformOfTarget
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        builder!: () -> Unit,
        placement!: ?Placement = Option.None,
        maskColor!: ?Color = None,
        popupColor!: ?Color = None,
        enableArrow!: ?Bool = None,
        autoCancel!: ?Bool = None,
        onStateChange!: Option<(PopupStateChangeParam) -> Unit> = Option.None,
        showInSubWindow!: ?Bool = None,
        backgroundColor!: ?Color = None,
        arrowOffset!: ?Length = None,
        mask!: ?Color = None,
        targetSpace!: ?Length = None,
        offset!: ?Position = None,
        width!: ?Length = None,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: ?Length = None,
        arrowHeight!: ?Length = None,
        radius!: ?Length = None,
        shadow!: ?ShadowStyle = None,
        backgroundBlurStyle!: ?BlurStyle = Option.None,
        focusable!: ?Bool = None,
        transition!: Option<TransitionEffect> = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: ?Bool = None
    ) {
        this.builder = builder
        this.placement = placement ?? Placement.Bottom
        this.maskColor = maskColor ?? Color(0x1000000)
        this.popupColor = popupColor ?? Color(0x1000000)
        this.enableArrow = enableArrow ?? true
        this.autoCancel = autoCancel ?? true
        this.onStateChange = onStateChange
        this.backgroundColor = backgroundColor ?? Color(0x1000000)
        this.arrowOffset = arrowOffset ?? 0.vp
        this.showInSubWindow = showInSubWindow ?? false
        this.mask = mask
        this.targetSpace = targetSpace ?? 0.vp
        this.offset = offset ?? Position(x: 0.0, y: 0.0)
        this.width = width ?? 0.vp
        this.arrowPointPosition = arrowPointPosition
        this.arrowWidth = arrowWidth ?? 16.vp
        this.arrowHeight = arrowHeight ?? 16.vp
        this.radius = radius ?? 20.vp
        this.shadow = shadow ?? ShadowStyle.OuterDefaultMD
        this.backgroundBlurStyle = backgroundBlurStyle ?? BlurStyle.ComponentUltraThick
        this.focusable = focusable ?? false
        this.transition = transition
        this.onWillDismiss = onWillDismiss
        this.followTransformOfTarget = followTransformOfTarget ?? false
    }
}

/**
 * Defines the options of popup message.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupMessageOptions {
    /**
     * Sets the color of popup text.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textColor: ?ResourceColor
    /**
     * Sets the color of popup text.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var font: ?Font
    /**
     * PopupMessageOptions constructor.
     *
     * @param { ?ResourceColor } textColor
     * @param { ?Font } font
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textColor!: ?ResourceColor = None, font!: ?Font = None) {
        this.textColor = textColor ?? Color(0x000000)
        this.font = font ?? Font()
    }
}

/**
 * Defines the OverlayOffset.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OverlayOffset {
    /**
     * Defines x.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float64
    /**
     * Defines y.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float64

    /**
     * OverlayOffset constructor.
     *
     * @param { ?Float64 } x
     * @param { ?Float64 } y
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?Float64 = None, y!: ?Float64 = None) {        
        this.x = x ?? 0.0
        this.y = y ?? 0.0
    }
}

/**
 * Defines the border width property.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeWidths {
    /**
     * top property.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ?Length
    /**
     * right property.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: ?Length
    /**
     * bottom property.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: ?Length
    /**
     * left property.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ?Length
    /**
     * EdgeWidths constructor.
     *
     * @param { ?Length } top
     * @param { ?Length } right
     * @param { ?Length } bottom
     * @param { ?Length } left
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(top!: ?Length = None, right!: ?Length = None, bottom!: ?Length = None, left!: ?Length = None) {
        this.top = transAppResourceToLength(top ?? 0.vp)
        this.right = transAppResourceToLength(right ?? 0.vp)
        this.bottom = transAppResourceToLength(bottom ?? 0.vp)
        this.left = transAppResourceToLength(left ?? 0.vp)
    }

    func toCJEdge(): CJEdge {
        return CJEdge(top ?? 0.vp, right ?? 0.vp, bottom ?? 0.vp, left ?? 0.vp)
    }
}

/**
 * Overlay module options.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BindOptions {
    let backgroundColor: ?ResourceColor
    let onAppear: ?() -> Unit
    let onDisappear: ?() -> Unit
    let onWillAppear: ?() -> Unit
    let onWillDisappear: ?() -> Unit

    /**
     * BindOptions constructor.
     *
     * @param {ResourceColor} backgroundColor - Background color of the sheet. Default value: **Color.White**.
     * @param {?() -> Unit} onAppear - Callback for when the sheet is displayed (after the animation ends).
     * @param {?() -> Unit} onDisappear - Callback for when the sheet disappears (after the animation ends).
     * @param {?() -> Unit} onWillAppear - Callback for when the sheet is about to be displayed (before the animation starts).
     * @param {?() -> Unit} onWillDisappear - Callback function before overlay popAnimation starts.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(backgroundColor!: ?ResourceColor = None, onAppear!: ?() -> Unit = None,
        onDisappear!: ?() -> Unit = None, onWillAppear!: ?() -> Unit = None,
        onWillDisappear!: ?() -> Unit = None) {
        this.backgroundColor = backgroundColor
        this.onAppear = onAppear
        this.onDisappear = onDisappear
        this.onWillAppear = onWillAppear
        this.onWillDisappear = onWillDisappear
    }

    func parseCBindOptions(bindOption: BindOptions): CBindOptions {
        let backgroundColor = if (let Some(v) <- bindOption.backgroundColor) {
            NativeOptionUInt32(true, transAppResourceToResourceColor(v))
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
 * Component content cover options.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContentCoverOptions <: BindOptions {
    let modalTransition: ModalTransition
    let onWillDismiss: Option<(DismissContentCoverAction) -> Unit>
    let transition: Option<TransitionEffect>
    /**
     * ContentCoverOptions constructor.
     *
     * @param {?ModalTransition} modalTransition - Defines transition type
     * @param {?(DismissContentCoverAction) -> Unit} onWillDismiss - Callback function when the content cover interactive dismiss.
     * @param {?TransitionEffect} transition
     * @param {?ResourceColor} backgroundColor - Background color of the sheet. Default value: **Color.White**.
     * @param {?() -> Unit} onAppear - Callback for when the sheet is displayed (after the animation ends).
     * @param {?() -> Unit} onDisappear - Callback for when the sheet disappears (after the animation ends).
     * @param {?() -> Unit} onWillAppear - Callback for when the sheet is about to be displayed (before the animation starts).
     * @param {?() -> Unit} onWillDisappear - Callback function before overlay popAnimation starts.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        modalTransition!: ?ModalTransition = Option.None,
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
        this.modalTransition = modalTransition ?? ModalTransition.Default
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
 * Component sheet dismiss.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetDismiss {
    init() {}

    /**
     * Defines sheet dismiss function.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss(): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractDismiss()
        }
    }
}

/**
 * Defines sheet spring back action.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SpringBackAction {
    init() {}

    /**
     * Defines spring back function.
     *
     */
    @!APILevel[
        since:"22",
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
 */
@Derive[Equatable]
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetMode {
    /**
     * The sheet is displayed at the top of the window corresponding to the current **UIContext** instance,
     * above all pages. It is displayed at the same level as dialog boxes.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overlay
    |
    /**
     * The sheet is displayed at the top of the current page.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Embedded
    | ...

    func toValue(): UInt32 {
        match (this) {
            case Overlay => 0
            case Embedded => 1
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollSizeMode {
    /**
     * Sheet change scroll size after the slide ends.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FollowDetent
    |
    /**
     * Sheet change scroll size during the sliding process.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Continuous
    | ...

    func toValue(): UInt32 {
        match (this) {
            case FollowDetent => 0
            case Continuous => 1
            case _ => throw BusinessException(100001, "Internal error.")
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
            shadowOptions.radius ?? 0.0,
            (shadowOptions.shadowType ?? ShadowType.Color).getValue(),
            transAppResourceToResourceColor(shadowOptions.color ?? Color.Black),
            shadowOptions.offsetX ?? 0.0,
            shadowOptions.offsetY ?? 0.0,
            shadowOptions.fill ?? false
        )
    )
}

/**
 * Component sheet options.
 *
 */
@!APILevel[
    since:"22",
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

    /**
     * Defines sheet options.
     *
     * @param { Option<ResourceColor> } backgroundColor
     * @param { Option<() -> Unit> } onAppear
     * @param { Option<() -> Unit> } onDisappear
     * @param { Option<() -> Unit> } onWillAppear
     * @param { Option<() -> Unit> } onWillDisappear
     * @param { Option<SheetSize> } height
     * @param { Option<Array<SheetSize>> } detents
     * @param { Option<SheetType> } preferType
     * @param { Option<Bool> } showClose
     * @param { Option<Bool> } dragBar
     * @param { Option<BlurStyle> } blurStyle
     * @param { Option<Color> } maskColor
     * @param { Option<() -> Unit> } title
     * @param { Option<Bool> } enableOutsideInteractive
     * @param { Option<(SheetDismiss) -> Unit> } shouldDismiss
     * @param { Option<(SheetDismiss) -> Unit> } onWillDismiss
     * @param { Option<(SpringBackAction) -> Unit> } onWillSpringBackWhenDismiss
     * @param { Option<(Float32) -> Unit> } onHeightDidChange
     * @param { Option<(Float32) -> Unit> } onDetentsDidChange
     * @param { Option<(Float32) -> Unit> } onWidthDidChange
     * @param { Option<(Float32) -> Unit> } onTypeDidChange
     * @param { Option<Length> } borderWidth
     * @param { Option<Color> } borderColor
     * @param { Option<EdgeStyles> } borderStyle
     * @param { Option<Length> } width
     * @param { Option<ShadowOptions> } shadow
     * @param { Option<SheetMode> } mode
     * @param { Option<ScrollSizeMode> } scrollSizeMode
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        backgroundColor!: Option<ResourceColor> = Option.None,
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
        borderWidth!:  Option<Length> = None,
        borderColor!: Option<Color> = None,
        borderStyle!: Option<EdgeStyles> = None,
        width!: Option<Length> = None,
        shadow!: Option<ShadowOptions> = None,
        mode!: Option<SheetMode> = None,
        scrollSizeMode!: Option<ScrollSizeMode> = None
    ) {
        super(backgroundColor: backgroundColor ?? Color.White, onAppear: onAppear, onDisappear: onDisappear, onWillAppear: onWillAppear,	
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
        this.borderWidth = borderWidth ?? 0.vp
        this.borderColor = borderColor ?? Color.Black
        this.borderStyle = borderStyle ?? EdgeStyles()
        this.width = width
        this.shadow = shadow
        this.mode = mode ?? SheetMode.Overlay
        this.scrollSizeMode = scrollSizeMode ?? ScrollSizeMode.FollowDetent
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
                case None => parseShadowOptions(ShadowOptions(radius: 0.0, shadowType: ShadowType.Color))
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
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Rectangle {
    /**
     * x:Horizontal coordinate.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Length

    /**
     * y:Vertical axis coordinate.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Length

    /**
     * Sets the width of the current touchRect.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length

    /**
     * Sets the height of the current touchRect.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Length

    /**
     * Rectangle constructor.
     *
     * @param { ?Length } x
     * @param { ?Length } y
     * @param { ?Length } width
     * @param { ?Length } height
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?Length = None, y!: ?Length = None, width!: ?Length = None, height!: ?Length = None) {
        this.x = transAppResourceToLength(x ?? 0.vp)
        this.y = transAppResourceToLength(y ?? 0.vp)
        this.width = transAppResourceToLength(width ?? 100.percent)
        this.height = transAppResourceToLength(height ?? 100.percent)
    }

    protected func parseToNative(): NativeRectangle {
        return NativeRectangle(
            (x ?? 0.vp).value,
            (x ?? 0.vp).unitType.getValue(),
            (y ?? 0.vp).value,
            (y ?? 0.vp).unitType.getValue(),
            (width ?? 100.percent).value,
            (width ?? 100.percent).unitType.getValue(),
            (height ?? 100.percent).value,
            (height ?? 100.percent).unitType.getValue()
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
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissPopupAction {
    /**
     * Defines popup dismiss reason.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let reason: DismissReason
    init(reason!: DismissReason) {
        this.reason = reason
    }

    /**
     * Defines popup dismiss function.
     */
    @!APILevel[
        since:"22",
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
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContextMenuOptions {
    /**
     * Sets the position offset of the context menu window.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Position

    /**
     * Preferred position of the context menu. If the set position is insufficient for holding the component, it will be
     * automatically adjusted.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: Option<Placement>

    /**
     * whether show arrow belong to the menu.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: ?Bool

    /**
     * The horizontal offset to the left of menu or vertical offset to the top of menu.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: ?Length

    /**
    * The preview content of context menu.
    * 
    */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var preview: ?CustomBuilder

    /**
     * The preview animator options.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var previewAnimationOptions: ?ContextMenuAnimationOptions

    /**
     * Callback triggered when the menu is displayed.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onAppear: ?() -> Unit

    /**
     * Callback function when the context menu disappear.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDisappear: ?() -> Unit

    /**
     * Callback triggered when the menu is about to appear.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var aboutToAppear: ?() -> Unit

    /**
     * Callback triggered when the menu is about to disappear.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var aboutToDisappear: ?() -> Unit

    /**
     * Background color of the menu.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor

    /**
     * Background blur style of the menu.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle

    /**
     * Defines the transition effect of menu opening and closing.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: ?TransitionEffect

    var borderRadius: ?BorderRadiuses = None
    var layoutRegionMargin: ?Margin = None

    /**
     * ContextMenuOptions constructor.
     *
     * @param { ?Position } offset
     * @param { Option<Placement> } placement
     * @param { ?Bool } enableArrow
     * @param { ?Length } arrowOffset
     * @param { Option<CustomBuilder> } preview
     * @param { ?ContextMenuAnimationOptions } previewAnimationOptions
     * @param { ?() -> Unit } onAppear
     * @param { ?() -> Unit } onDisappear
     * @param { ?() -> Unit } aboutToAppear
     * @param { ?() -> Unit } aboutToDisappear
     * @param { ?ResourceColor } backgroundColor
     * @param { ?BlurStyle } backgroundBlurStyle
     * @param { ?TransitionEffect } transition
     * @param { ?BorderRadiuses } borderRadius
     * @param { ?Margin } layoutRegionMargin
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        offset!: ?Position = None,
        placement!: Option<Placement> = Option.None,
        enableArrow!: ?Bool = None,
        arrowOffset!: ?Length = None,
        preview!: Option<() -> Unit> = Option.None,
        previewAnimationOptions!: ?ContextMenuAnimationOptions = None,
        onAppear!: ?() -> Unit = None,
        onDisappear!: ?() -> Unit = None,
        aboutToAppear!: ?() -> Unit = None,
        aboutToDisappear!: ?() -> Unit = None,
        backgroundColor!: ?ResourceColor = None,
        backgroundBlurStyle!: ?BlurStyle = Option.None,
        transition!: ?TransitionEffect = None,
        borderRadius!: ?BorderRadiuses = None,
        layoutRegionMargin!: ?Margin = None
    ) {
        this.offset = offset ?? Position()
        this.placement = placement
        this.enableArrow = enableArrow ?? false
        this.arrowOffset = arrowOffset ?? 0.vp
        this.preview = preview
        this.previewAnimationOptions = previewAnimationOptions
        this.onAppear = onAppear
        this.onDisappear = onDisappear
        this.aboutToAppear = aboutToAppear
        this.aboutToDisappear = aboutToDisappear
        this.backgroundColor = backgroundColor ?? Color.Transparent
        this.backgroundBlurStyle = backgroundBlurStyle ?? BlurStyle.ComponentUltraThick
        this.transition = transition
        this.borderRadius = borderRadius
        this.layoutRegionMargin = layoutRegionMargin
    }

    func parseContextMenuOptions(): CJContextMenuOptions {
        CJContextMenuOptions(
            NativePosition(((offset ?? Position()).x ?? 0).value, ((offset ?? Position()).y ?? 0).value),
            unsafe { parsePlacement(placement) },
            enableArrow ?? false,
            NativeLength(transAppResourceToLength(arrowOffset ?? 0.vp).value,
                transAppResourceToLength(arrowOffset ?? 0.vp).unitType.getValue()),
            unsafe { parseCallBack(preview) },
            unsafe { parsePreviewAnimationOptions(previewAnimationOptions) },
            unsafe { parseCallBack(onAppear) },
            unsafe { parseCallBack(onDisappear) },
            unsafe { parseCallBack(aboutToAppear) },
            unsafe { parseCallBack(aboutToDisappear) },
            transAppResourceToResourceColor(backgroundColor ?? Color.Transparent),
            (backgroundBlurStyle ?? BlurStyle.ComponentUltraThick).getValue(),
            unsafe { parseTransition(transition) },
            unsafe { parseBorderRadius(borderRadius) },
            unsafe { parseLayoutRegionMargin(layoutRegionMargin) }
        )
    }
}

/**
 * Component content cover dismiss.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissContentCoverAction {
    /**
     * Defines content cover dismiss reason.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let reason: DismissReason

    let mDismissContentCover: CFunc<() -> Unit>

    init(reason: DismissReason, dismissContentCover: CFunc<() -> Unit>) {
        this.reason = reason
        this.mDismissContentCover = dismissContentCover
    }

    /**
     *  Defines content cover dismiss function.
     */
    @!APILevel[
        since:"22",
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
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContextMenuAnimationOptions {
    /**
     * Sets the start animator scale and end animator scale.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: ?VArray<Float64, $2>
    /**
     * Defines the transition effect of menu preview opening and closing.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: ?TransitionEffect
    /**
     * Sets the scale start and end animator of the image displayed before the custom builder preview is displayed.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverScale: ?VArray<Float64, $2>

    /**
     * Defines the ContextMenu's preview animator options.
     *
     * @param { ?VArray<Float64, $2> } scale
     * @param { ?TransitionEffect } transition
     * @param { ?VArray<Float64, $2> } hoverScale
     */
    @!APILevel[
        since:"22",
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
 * Component sheet dismiss.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissSheetAction {
    /**
     * Dismiss reason type.
     *
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var reason: ?DismissReason

    init(reason: DismissReason) {
        this.reason = reason
    }

    /**
     *  Defines sheet dismiss function.
     *
     */
    @!APILevel[
        since:"22",
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
