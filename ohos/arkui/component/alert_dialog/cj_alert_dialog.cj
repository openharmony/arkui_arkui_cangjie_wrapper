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

package ohos.arkui.component.alert_dialog

import ohos.arkui.component.action_sheet.{DismissDialogAction, parseToDismissDialogAction}
import ohos.arkui.component.common.{Rectangle, BlurStyle, BorderRadiuses, TransitionEffect, EdgeStyles, ShadowOptions, WordBreak, DialogAlignment, Offset, DialogButtonStyle, parseOffset, INVALID_CALLBACK_ID}
import ohos.arkui.component.native_struct.{NativeOptionRadius, NativeOptionRectangle, NativeOptionEdgeStyle, NativeOptionOffset, NativeActionSheetShadowOptions}
import ohos.arkui.component.util.{transResourceStrToString, transAppResourceToLength, transAppResourceToResourceColor}
import ohos.base.{ResourceColor, Length, LengthProp, Callback, ResourceStr, VoidCallback, Color, NativeOptionBool, NativeOptionCallBack, NativeOptionInt32, NativeOptionUInt32, NativeOptionLength, NativeOptionCString, NativeOptionInt64, NativeLength}
import ohos.ffi.{Callback0Param, Callback1Param}
import ohos.labels.APILevel
import std.deriving.Derive
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSShowAlertDialogParamWithConfirmV2(
        value: NativeAlertDialogParamV2,
        confirm: NativeAlertDialogButtonOptionsV2
    ): Unit

    func FfiOHOSShowAlertDialogParamWithConfirmShadowStyle(value: NativeAlertDialogParamV2,
        confirm: NativeAlertDialogButtonOptionsV2, shadowStyle: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithConfirmShadowOptions(value: NativeAlertDialogParamV2,
        confirm: NativeAlertDialogButtonOptionsV2, shadowOptions: NativeActionSheetShadowOptions): Unit

    func FfiOHOSShowAlertDialogParamWithButtonsV2(value: NativeAlertDialogParamV2,
        primaryButton: NativeAlertDialogButtonOptionsV2, secondaryButton: NativeAlertDialogButtonOptionsV2): Unit

    func FfiOHOSShowAlertDialogParamWithButtonsShadowStyle(value: NativeAlertDialogParamV2,
        primaryButton: NativeAlertDialogButtonOptionsV2, secondaryButton: NativeAlertDialogButtonOptionsV2,
        shadowStyle: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithButtonsShadowOptions(value: NativeAlertDialogParamV2,
        primaryButton: NativeAlertDialogButtonOptionsV2, secondaryButton: NativeAlertDialogButtonOptionsV2,
        shadowOptions: NativeActionSheetShadowOptions): Unit

    func FfiOHOSShowAlertDialogParamWithOptionsV2(value: NativeAlertDialogParamV2,
        buttons: CArrNativeAlertDialogButtonOptionsV2, buttonDirection: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithOptionsShadowStyle(value: NativeAlertDialogParamV2,
        buttons: CArrNativeAlertDialogButtonOptionsV2, shadowStyle: Int32, buttonDirection: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithOptionsShadowOptions(value: NativeAlertDialogParamV2,
        buttons: CArrNativeAlertDialogButtonOptionsV2, shadowOptions: NativeActionSheetShadowOptions,
        buttonDirection: Int32): Unit
}

func freeButton(button: NativeAlertDialogButtonOptionsV2) {
    unsafe {
        LibC.free(button.value)
        LibC.free(button.style)
        LibC.free(button.fontColor)
        LibC.free(button.backgroundColor)
    }
}

func freeButtonsArr(nativeButtons: CArrNativeAlertDialogButtonOptionsV2) {
    if (nativeButtons.size > 0) {
        unsafe {
            for (i in 0..nativeButtons.size) {
                freeButton(nativeButtons.head.read(i))
            }
            LibC.free(nativeButtons.head)
        }
    }
}

/**
* The arrangement of buttons in dialog.
*/
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogButtonDirection {
    /**
     * Two or fewer buttons are arranged horizontally,
     * and two or more buttons are arranged vertically.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    |
    /**
     * Buttons are arranged horizontally.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    |
    /**
     * Buttons are arranged vertically.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    | ...

    func getValue(): Int32 {
        match (this) {
            case Auto => 0
            case Horizontal => 1
            case Vertical => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the border color for dialog components.
 * Provides a wrapper class for specifying border colors with a default value.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BorderColor {
    /**
     * The color resource used for the border.
     * Defines the visual color of the border around a component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var resourceColor: ResourceColor

    /**
     * BorderColor constructor.
     * Creates a new BorderColor instance with the specified color or defaults to black.
     *
     * @param { ?ResourceColor } color - The color to use for the border
     * @default Color.Black
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(color!: ?ResourceColor = Color.Black) {
        this.resourceColor = color ?? Color.Black
    }
}

@C
struct NativeAlertDialogButtonOptionsV2 {
    NativeAlertDialogButtonOptionsV2(
        let enabled: Bool,
        let defaultFocus: Bool,
        let style: CPointer<Int32>,
        let value: CString,
        let fontColor: CPointer<UInt32>,
        let backgroundColor: CPointer<UInt32>,
        let action: Int64,
        let primary: Bool
    ) {}
}

@C
struct CArrNativeAlertDialogButtonOptionsV2 {
    CArrNativeAlertDialogButtonOptionsV2(
        let head: CPointer<NativeAlertDialogButtonOptionsV2>,
        let size: Int64
    ) {}
}

@C
struct NativeAlertDialogParamV2 {
    NativeAlertDialogParamV2(
        let message: CString,
        let title: NativeOptionCString,
        let subtitle: NativeOptionCString,
        let autoCancel: NativeOptionBool,
        let cancel: NativeOptionCallBack,
        let alignment: NativeOptionInt32,
        let offset: NativeOptionOffset,
        let gridCount: NativeOptionUInt32,
        let maskRect: NativeOptionRectangle,
        let showInSubWindow: NativeOptionBool,
        let isModal: NativeOptionBool,
        let backgroundColor: NativeOptionUInt32,
        let backgroundBlurStyle: NativeOptionInt32,
        let onWillDismiss: NativeOptionCallBack,
        let cornerRadius: NativeOptionRadius,
        let borderWidth: NativeOptionLength,
        let borderColor: NativeOptionUInt32,
        let borderStyle: NativeOptionEdgeStyle,
        let width: NativeOptionLength,
        let height: NativeOptionLength,
        let transition: NativeOptionInt64,
        let textStyle: NativeOptionInt32
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(message)
            LibC.free(title.value)
            LibC.free(subtitle.value)
        }
    }
}

/**
 * Base button param.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class AlertDialogButtonBaseOptions {
    /**
     * Enable switch of button
     * @default true
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enabled: ?Bool
    /**
     * Default focus switch of button
     * @default false
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var defaultFocus: ?Bool
    /**
     * Style of button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?DialogButtonStyle
    /**
     * Text content of button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: ?ResourceStr
    /**
     * Text color of button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: ?ResourceColor
    /**
     * Background color of button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor
    /**
     * Method executed by the callback.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: ?VoidCallback
    /**
     * Constructor of AlertDialogButtonBaseOptions.
     *
     * @param { ?Bool } enabled - Enable switch of button.
     * @param { ?Bool } defaultFocus - Default focus switch of button.
     * @param { ?DialogButtonStyle } style - Style of button.
     * @param { ?ResourceStr } value - Text content of button.
     * @param { ?ResourceColor } fontColor - Text color of button.
     * @param { ?ResourceColor } backgroundColor - Background color of button.
     * @param { ?VoidCallback } action - Method executed by the callback.
     * @returns { AlertDialogButtonBaseOptions } Returns the created AlertDialogButtonBaseOptions instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        enabled!: ?Bool = None,
        defaultFocus!: ?Bool = None,
        style!: ?DialogButtonStyle = Option.None,
        value!: ?ResourceStr,
        fontColor!: ?ResourceColor = None,
        backgroundColor!: ?ResourceColor = None,
        action!: ?VoidCallback
    ) {
        this.enabled = enabled ?? true
        this.defaultFocus = defaultFocus ?? false
        this.style = style ?? DialogButtonStyle.Default
        this.value = value ?? ""
        this.fontColor = fontColor
        this.backgroundColor = backgroundColor
        this.action = action ?? { => }
    }
}

/**
 * Button param used for AlertDialogParamWithOptions.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogButtonOptions <: AlertDialogButtonBaseOptions {
   /**
    * Define whether the button responds to Enter/Space key by default.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primary: ?Bool

    /**
     * Constructor of AlertDialogButtonOptions.
     *
     * @param { Bool } enabled - Enable switch of button.
     * @param { Bool } defaultFocus - Default focus switch of button.
     * @param { DialogButtonStyle } style - Style of button.
     * @param { ResourceStr } value - Text content of button.
     * @param { ?ResourceColor } fontColor - Font color of button.
     * @param { ?ResourceColor } backgroundColor - Background color of button.
     * @param { VoidCallback } action - Action of button.
     * @param { Bool } primary - Define whether the button responds to Enter/Space key by default.
     * @returns { AlertDialogButtonOptions } Returns the created AlertDialogButtonOptions instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        enabled!: ?Bool = None,
        defaultFocus!: ?Bool = None,
        style!: ?DialogButtonStyle = Option.None,
        value!: ?ResourceStr,
        fontColor!: ?ResourceColor = None,
        backgroundColor!: ?ResourceColor = None,
        action!: ?VoidCallback,
        primary!: ?Bool = None
    ) {
        super(
            enabled: enabled ?? true,
            defaultFocus: defaultFocus ?? false,
            style: style ?? DialogButtonStyle.Default,
            value: value ?? "",
            fontColor: fontColor,
            backgroundColor: backgroundColor,
            action: action ?? { =>}
        )
        this.primary = primary ?? false
    }

    func toNative(): NativeAlertDialogButtonOptionsV2 {
        var cValue: CString = try {
            unsafe { LibC.mallocCString(transResourceStrToString(value ?? "")) }
        } catch (e: Exception) {
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }

        var cStyle = CPointer<Int32>()
        unsafe {
            cStyle = LibC.malloc<Int32>(count: 1)
            if (cStyle.isNull()) {
                unsafe { LibC.free(cValue) }
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            cStyle.write((style ?? DialogButtonStyle.Default).getValue())
        }

        var cFontColor = CPointer<UInt32>()
        if (let Some(v) <- fontColor) {
            unsafe {
                cFontColor = LibC.malloc<UInt32>(count: 1)
                if (cFontColor.isNull()) {
                    LibC.free(cValue)
                    LibC.free<Int32>(cStyle)
                    throw BusinessException(100001, "Internal error: failed to allocate memory.")
                }
                cFontColor.write(v.toUInt32())
            }
        }
        var cBackgroundColor = CPointer<UInt32>()
        if (let Some(v) <- backgroundColor) {
            unsafe {
                cBackgroundColor = LibC.malloc<UInt32>(count: 1)
                if (cBackgroundColor.isNull()) {
                    LibC.free(cValue)
                    LibC.free<Int32>(cStyle)
                    LibC.free<UInt32>(cFontColor)
                    throw BusinessException(100001, "Internal error: failed to allocate memory.")
                }
                cBackgroundColor.write(v.toUInt32())
            }
        }
        NativeAlertDialogButtonOptionsV2(
            enabled ?? true,
            defaultFocus ?? false,
            cStyle,
            cValue,
            cFontColor,
            cBackgroundColor,
            Callback0Param<Unit>(action ?? { => }).getID(),
            primary ?? false
        )
    }
}

/**
 * Base param used for AlertDialog.show method.
 * Defines the configuration parameters for displaying an AlertDialog component.
 * Provides comprehensive control over dialog appearance, behavior, and positioning.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class AlertDialogParam {
    /**
     * Title Properties.
     * The main title text displayed at the top of the alert dialog.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ?ResourceStr
    /**
     * Subtitle Properties.
     * Additional descriptive text displayed below the title in the alert dialog.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var subtitle: ?ResourceStr
    /**
     * The main content message displayed in the body of the alert dialog.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ?ResourceStr
    /**
     * Allows users to click the mask layer to exit.
     * When enabled, users can dismiss the dialog by clicking on the semi-transparent overlay outside the dialog.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: ?Bool
    /**
     * Callback function that is executed when the dialog is canceled, either by clicking the mask or pressing the back button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cancel: ?VoidCallback
    /**
     * Alignment in the vertical direction.
     * Controls the positioning of the dialog on the screen using predefined alignment options.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: ?DialogAlignment
    /**
     * Offset of the pop-up window relative to the alignment position.
     * Fine-tunes the dialog position by applying additional x/y offsets to the alignment setting.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Offset
    /**
     * Specifies the grid layout count for the dialog, affecting its sizing and positioning in grid-based layouts.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var gridCount: ?UInt32
    /**
     * Mask Region of dialog. The size cannot exceed the main window.
     * Defines the rectangular area where the dialog mask (overlay) is displayed.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: ?Rectangle
    /**
     * Whether to display in the sub window
     * Controls whether the dialog is displayed in a separate sub-window or as an overlay in the main window.
     * @default false
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool
    /**
     * Whether it is a modal dialog
     * Determines if the dialog blocks interaction with the underlying content when displayed.
     * @default true
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: ?Bool
    /**
     * Defines the alertDialog's background color
     * Sets the background color of the dialog, supporting both solid colors and transparent backgrounds.
     * @default Transparent
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor
    /**
     * Defines the alertDialog's background blur Style
     * Applies a blur effect to the dialog background for a frosted glass appearance.
     * @default BlurStyle.ComponentUltraThick
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle
    /**
     * Callback function when the dialog interactive dismiss.
     * Function called when the dialog is about to be dismissed through user interaction.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: ?Callback<DismissDialogAction, Unit>
    /**
     * Controls the roundness of the dialog corners, creating rounded or sharp corner effects.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: ?BorderRadiuses
    /**
     * Transition parameters of opening/closing AlertDialog.
     * Defines the animation effects used when the dialog is shown or hidden.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: ?TransitionEffect
    /**
     * Sets the width of the dialog, supporting various length units and percentage-based sizing.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length
    /**
     * Sets the height of the dialog, supporting various length units and percentage-based sizing.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Length
    /**
     * Controls the thickness of the dialog border, creating visual separation from the background.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: ?Length
    /**
     * Sets the color of the dialog border for visual customization.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: ?BorderColor
    /**
     * Controls the visual style of the dialog border, such as solid, dashed, or dotted lines.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: ?EdgeStyles
    /**
     * Applies shadow effects to the dialog for depth and visual emphasis.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions
    /**
     * Controls how text within the dialog is broken across lines, affecting readability and layout.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textStyle: ?WordBreak

    /**
     * Constructor of AlertDialogParam.
     *
     * @param { ?ResourceStr } title - Title Properties
     * @param { ?ResourceStr } subtitle - Subtitle Properties
     * @param { ?ResourceStr } message - message Properties
     * @param { ?Bool } autoCancel - Allows users to click the mask layer to exit
     * @param { ?VoidCallback } cancel - Execute Cancel Function
     * @param { ?DialogAlignment } alignment - Alignment in the vertical direction
     * @param { ?Offset } offset - Offset of the pop-up window relative to the alignment position
     * @param { ?UInt32 } gridCount - Grid count of dialog
     * @param { ?Rectangle } maskRect - Mask Region of dialog. The size cannot exceed the main window
     * @param { ?Bool } showInSubWindow - Whether to display in the sub window
     * @param { ?Bool } isModal - Whether it is a modal dialog
     * @param { ?ResourceColor } backgroundColor - Defines the alertDialog's background color
     * @param { ?BlurStyle } backgroundBlurStyle - Defines the alertDialog's background blur Style
     * @param { ?Callback<(DismissDialogAction, Unit)> } onWillDismiss - Callback function when the dialog interactive dismiss.
     * @param { ?BorderRadiuses } cornerRadius - Defines the alertDialog's corner radius.
     * @param { ?TransitionEffect } transition - Transition parameters of opening/closing AlertDialog.
     * @param { ?Length } width - Defines the alertDialog's width.
     * @param { ?Length } height - Defines the alertDialog's height.
     * @param { ?Length } borderWidth - Defines the alertDialog's border width.
     * @param { ?BorderColor } borderColor - Defines the alertDialog's border color.
     * @param { ?EdgeStyles } borderStyle - Defines the alertDialog's border style.
     * @param { ?ShadowOptions } shadow - Defines the alertDialog's shadow.
     * @param { ?WordBreak } textStyle - Set the alertDialog's textStyle.
     * @returns { AlertDialogParam } Returns the created AlertDialogParam instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr = None,
        subtitle!: ?ResourceStr = None,
        message!: ?ResourceStr,
        autoCancel!: ?Bool = None,
        cancel!: ?VoidCallback = None,
        alignment!: ?DialogAlignment = None,
        offset!: ?Offset = None,
        gridCount!: ?UInt32 = None,
        maskRect!: ?Rectangle = None,
        showInSubWindow!: ?Bool = None,
        isModal!: ?Bool = None,
        backgroundColor!: ?ResourceColor = None,
        backgroundBlurStyle!: ?BlurStyle = None,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        cornerRadius!: ?BorderRadiuses = None,
        transition!: ?TransitionEffect = None,
        width!: ?Length = None,
        height!: ?Length = None,
        borderWidth!: ?Length = None,
        borderColor!: ?BorderColor = None,
        borderStyle!: ?EdgeStyles = None,
        shadow!: ?ShadowOptions = None,
        textStyle!: ?WordBreak = None
    ) {
        this.message = message ?? ""
        this.title = title ?? ""
        this.subtitle = subtitle ?? ""
        this.autoCancel = autoCancel ?? true
        this.cancel = cancel ?? {=>}
        this.alignment = alignment ?? DialogAlignment.Default
        this.offset = offset ?? Offset(0, 0)
        this.gridCount = gridCount ?? 4
        this.maskRect = maskRect ?? Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)
        this.showInSubWindow = showInSubWindow ?? false
        this.isModal = isModal ?? true
        this.backgroundColor = backgroundColor ?? Color.Transparent
        this.backgroundBlurStyle = backgroundBlurStyle ?? BlurStyle.ComponentUltraThick
        this.onWillDismiss = onWillDismiss
        this.cornerRadius = cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
            bottomLeft: 32.vp, bottomRight: 32.vp)
        this.transition = transition
        this.width = width
        this.height = height
        this.borderWidth = borderWidth ?? 0
        this.borderColor = borderColor ?? BorderColor(color: Color.Black)
        this.borderStyle = borderStyle ?? EdgeStyles()
        this.shadow = shadow ?? ShadowOptions(radius: 0.0)
        this.textStyle = textStyle ?? WordBreak.BreakAll
    }

    func getNativeParam(): NativeAlertDialogParamV2 {
        let nativeMsg: CString = unsafe { LibC.mallocCString(transResourceStrToString(message ?? "")) }
        let nativeTitle: CString = unsafe { LibC.mallocCString(transResourceStrToString(title ?? "")) }
        let nativeSubtitle: CString = unsafe { LibC.mallocCString(transResourceStrToString(subtitle ?? "")) }
        let nativeAutoCancel = NativeOptionBool(true, autoCancel ?? true)
        let nativeCancel = NativeOptionCallBack(true, Callback0Param<Unit>(cancel ?? {=>}).getID())
        let nativeAlignment = NativeOptionInt32(true, (alignment ?? DialogAlignment.Default).getValue())
        let nativeOffset = NativeOptionOffset(true, parseOffset(offset ?? Offset(0, 0)))
        let nativeGridCount = NativeOptionUInt32(true, (gridCount ?? 4).toUInt32())
        let nativeMaskRect = NativeOptionRectangle(true, (maskRect ?? Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)).parseToNative())
        let nativeShowInSubWindow = NativeOptionBool(true, showInSubWindow ?? false)
        let nativeIsModal = NativeOptionBool(true, isModal ?? true)
        let nativeBackgroundColor = NativeOptionUInt32(true, transAppResourceToResourceColor(backgroundColor ?? Color.Transparent))
        let nativeBackgroundBlurStyle = NativeOptionInt32(true, (backgroundBlurStyle ?? BlurStyle.ComponentUltraThick).getValue())
        let nativeOnWillDismiss = match (onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    action: Int32 => value(parseToDismissDialogAction(action))
                }
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }
        let nativeCornerRadius = NativeOptionRadius(true, (cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
            bottomLeft: 32.vp, bottomRight: 32.vp)).toCBorderRadiuses())
        var value_ = transAppResourceToLength(borderWidth ?? 0)
        let nativeBorderWidth = NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
        let nativeBorderColor = NativeOptionUInt32(true, transAppResourceToResourceColor((borderColor ?? BorderColor(color: Color.Black)).resourceColor))
        let nativeBorderStyle = NativeOptionEdgeStyle(true, (borderStyle ?? EdgeStyles()).toNative())

        let nativeWidth = match (width) {
            case Some(value) =>
                var value_ = transAppResourceToLength(value)
                NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
            case None => NativeOptionLength(false, NativeLength(0.0, 0))
        }
        let nativeHeight = match (height) {
            case Some(value) =>
                var value_ = transAppResourceToLength(value)
                NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
            case None => NativeOptionLength(false, NativeLength(0.0, 0))
        }
        let nativeTransition = match (transition) {
            case Some(value) => NativeOptionInt64(true, value.getID())
            case None => NativeOptionInt64(false, 0)
        }
        let nativeTextStyle = NativeOptionInt32(true, (textStyle ?? WordBreak.BreakAll).getValue())

        NativeAlertDialogParamV2(
            nativeMsg,
            NativeOptionCString(true, nativeTitle),
            NativeOptionCString(true, nativeSubtitle),
            nativeAutoCancel,
            nativeCancel,
            nativeAlignment,
            nativeOffset,
            nativeGridCount,
            nativeMaskRect,
            nativeShowInSubWindow,
            nativeIsModal,
            nativeBackgroundColor,
            nativeBackgroundBlurStyle,
            nativeOnWillDismiss,
            nativeCornerRadius,
            nativeBorderWidth,
            nativeBorderColor,
            nativeBorderStyle,
            nativeWidth,
            nativeHeight,
            nativeTransition,
            nativeTextStyle
        )
    }
}

/**
 * Defines the AlertDialog with confirm button.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogParamWithConfirm <: AlertDialogParam {
    /**
     * Invoke the commit function.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var confirm: ?AlertDialogButtonBaseOptions
    /**
     * Constructor of AlertDialogParamWithConfirm.
     *
     * @param { ?ResourceStr } title - Title Properties.
     * @param { ?ResourceStr } subtitle - Subtitle Properties.
     * @param { ?ResourceStr } message - message Properties.
     * @param { ?Bool } autoCancel - Allows users to click the mask layer to exit.
     * @param { ?VoidCallback } cancel - Execute Cancel Function.
     * @param { ?DialogAlignment } alignment - Alignment in the vertical direction.
     * @param { ?Offset } offset - Offset of the pop-up window relative to the alignment position.
     * @param { ?UInt32 } gridCount - Grid count of dialog.
     * @param { ?Rectangle } maskRect - Mask Region of dialog. The size cannot exceed the main window.
     * @param { ?Bool } showInSubWindow - Whether to display in the sub window.
     * @param { ?Bool } isModal - Whether it is a modal dialog.
     * @param { ?ResourceColor } backgroundColor - Defines the alertDialog's background color.
     * @param { ?BlurStyle } backgroundBlurStyle - Defines the alertDialog's background blur Style
     * @param { ?Callback<(DismissDialogAction, Unit)> } onWillDismiss - Callback function when the dialog interactive dismiss.
     * @param { ?BorderRadiuses } cornerRadius - Defines the alertDialog's corner radius.
     * @param { ?TransitionEffect } transition - Transition parameters of opening/closing AlertDialog.
     * @param { ?Length } width - Defines the alertDialog's width.
     * @param { ?Length } height - Defines the alertDialog's height.
     * @param { ?Length } borderWidth - Defines the alertDialog's border width.
     * @param { ?BorderColor } borderColor - Defines the alertDialog's border color.
     * @param { ?EdgeStyles } borderStyle - Defines the alertDialog's border style.
     * @param { ?ShadowOptions } shadow - Defines the alertDialog's shadow.
     * @param { ?WordBreak } textStyle - Set the alertDialog's textStyle.
     * @param { ?AlertDialogButtonBaseOptions } confirm - Invoke the commit function.
     * @returns { AlertDialogParamWithConfirm } Returns the created AlertDialogParamWithConfirm instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr = None,
        subtitle!: ?ResourceStr = None,
        message!: ?ResourceStr,
        autoCancel!: ?Bool = None,
        cancel!: ?VoidCallback = None,
        alignment!: ?DialogAlignment = None,
        offset!: ?Offset = None,
        gridCount!: ?UInt32 = None,
        maskRect!: ?Rectangle = None,
        showInSubWindow!: ?Bool = None,
        isModal!: ?Bool = None,
        backgroundColor!: ?ResourceColor = None,
        backgroundBlurStyle!: ?BlurStyle = None,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        cornerRadius!: ?BorderRadiuses = None,
        transition!: ?TransitionEffect = None,
        width!: ?Length = None,
        height!: ?Length = None,
        borderWidth!: ?Length = None,
        borderColor!: ?BorderColor = None,
        borderStyle!: ?EdgeStyles = None,
        shadow!: ?ShadowOptions = None,
        textStyle!: ?WordBreak = None,
        confirm!: ?AlertDialogButtonBaseOptions = None
    ) {
        super(
            title: title ?? "",
            subtitle: subtitle ?? "",
            message: message ?? "",
            autoCancel: autoCancel ?? true,
            cancel: cancel ?? {=>},
            alignment: alignment ?? DialogAlignment.Default,
            offset: offset ?? Offset(0, 0),
            gridCount: gridCount ?? 4,
            maskRect: maskRect ?? Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
            showInSubWindow: showInSubWindow ?? false,
            isModal: isModal ?? true,
            backgroundColor: backgroundColor ?? Color.Transparent,
            backgroundBlurStyle: backgroundBlurStyle ?? BlurStyle.ComponentUltraThick,
            onWillDismiss: onWillDismiss,
            cornerRadius: cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp),
            transition: transition,
            width: width,
            height: height,
            borderWidth: borderWidth ?? 0,
            borderColor: borderColor ?? BorderColor(color: Color.Black),
            borderStyle: borderStyle ?? EdgeStyles(),
            shadow: shadow ?? ShadowOptions(radius: 0.0),
            textStyle: textStyle ?? WordBreak.BreakAll
        )
        this.confirm = confirm ?? AlertDialogButtonOptions(value: "", action: {=>})
    }
}

/**
 * Defines the dialog param with buttons.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogParamWithButtons <: AlertDialogParam {
    /**
     * First button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primaryButton: ?AlertDialogButtonBaseOptions
    /**
     * Second button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var secondaryButton: ?AlertDialogButtonBaseOptions
    /**
     * Constructor of AlertDialogParamWithButtons.
     *
     * @param { ?ResourceStr } title - Title Properties.
     * @param { ?ResourceStr } subtitle - Subtitle Properties.
     * @param { ?ResourceStr } message - message Properties.
     * @param { ?Bool } autoCancel - Allows users to click the mask layer to exit.
     * @param { ?VoidCallback } cancel - Execute Cancel Function.
     * @param { ?DialogAlignment } alignment - Alignment in the vertical direction.
     * @param { ?Offset } offset - Offset of the pop-up window relative to the alignment position.
     * @param { ?UInt32 } gridCount - Grid count of dialog.
     * @param { ?Rectangle } maskRect - Mask Region of dialog. The size cannot exceed the main window.
     * @param { ?Bool } showInSubWindow - Whether to display in the sub window.
     * @param { ?Bool } isModal - Whether it is a modal dialog.
     * @param { ?ResourceColor } backgroundColor - Defines the alertDialog's background color.
     * @param { ?BlurStyle } backgroundBlurStyle - Defines the alertDialog's background blur Style
     * @param { ?Callback<(DismissDialogAction, Unit)> } onWillDismiss - Callback function when the dialog interactive dismiss.
     * @param { ?BorderRadiuses } cornerRadius - Defines the alertDialog's corner radius.
     * @param { ?TransitionEffect } transition - Transition parameters of opening/closing AlertDialog.
     * @param { ?Length } width - Defines the alertDialog's width.
     * @param { ?Length } height - Defines the alertDialog's height.
     * @param { ?Length } borderWidth - Defines the alertDialog's border width.
     * @param { ?BorderColor } borderColor - Defines the alertDialog's border color.
     * @param { ?EdgeStyles } borderStyle - Defines the alertDialog's border style.
     * @param { ?ShadowOptions } shadow - Defines the alertDialog's shadow.
     * @param { ?WordBreak } textStyle - Set the alertDialog's textStyle.
     * @param { AlertDialogButtonBaseOptions } primaryButton - First button.
     * @param { AlertDialogButtonBaseOptions } secondaryButton - Second button.
     * @returns { AlertDialogParamWithButtons } Returns the created AlertDialogParamWithButtons instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr = None,
        subtitle!: ?ResourceStr = None,
        message!: ?ResourceStr,
        autoCancel!: ?Bool = None,
        cancel!: ?VoidCallback = None,
        alignment!: ?DialogAlignment = None,
        offset!: ?Offset = None,
        gridCount!: ?UInt32 = None,
        maskRect!: ?Rectangle = None,
        showInSubWindow!: ?Bool = None,
        isModal!: ?Bool = None,
        backgroundColor!: ?ResourceColor = None,
        backgroundBlurStyle!: ?BlurStyle = None,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        cornerRadius!: ?BorderRadiuses = None,
        transition!: ?TransitionEffect = None,
        width!: ?Length = None,
        height!: ?Length = None,
        borderWidth!: ?Length = None,
        borderColor!: ?BorderColor = None,
        borderStyle!: ?EdgeStyles = None,
        shadow!: ?ShadowOptions = None,
        textStyle!: ?WordBreak = None,
        primaryButton!: ?AlertDialogButtonBaseOptions,
        secondaryButton!: ?AlertDialogButtonBaseOptions
    ) {
        super(
            title: title ?? "",
            subtitle: subtitle ?? "",
            message: message ?? "",
            autoCancel: autoCancel ?? true,
            cancel: cancel ?? {=>},
            alignment: alignment ?? DialogAlignment.Default,
            offset: offset ?? Offset(0, 0),
            gridCount: gridCount ?? 4,
            maskRect: maskRect ?? Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
            showInSubWindow: showInSubWindow ?? false,
            isModal: isModal ?? true,
            backgroundColor: backgroundColor ?? Color.Transparent,
            backgroundBlurStyle: backgroundBlurStyle ?? BlurStyle.ComponentUltraThick,
            onWillDismiss: onWillDismiss,
            cornerRadius: cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp),
            transition: transition,
            width: width,
            height: height,
            borderWidth: borderWidth ?? 0,
            borderColor: borderColor ?? BorderColor(color: Color.Black),
            borderStyle: borderStyle ?? EdgeStyles(),
            shadow: shadow ?? ShadowOptions(radius: 0.0),
            textStyle: textStyle ?? WordBreak.BreakAll
        )
        this.primaryButton = primaryButton ?? AlertDialogButtonBaseOptions(value: "", action: {=>})
        this.secondaryButton = secondaryButton ?? AlertDialogButtonBaseOptions(value: "", action: {=>})
    }
}

/**
 * Defines the dialog param with options.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogParamWithOptions <: AlertDialogParam {
    /**
     * The array of buttons.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: ?Array<AlertDialogButtonOptions>
    /**
     * The arrangement of buttons
     * @default DialogButtonDirection.Auto
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttonDirection: ?DialogButtonDirection
    /**
     * Constructor of AlertDialogParamWithOptions.
     *
     * @param { ?ResourceStr } title - Title Properties.
     * @param { ?ResourceStr } subtitle - Subtitle Properties.
     * @param { ?ResourceStr } message - message Properties.
     * @param { ?Bool } autoCancel - Allows users to click the mask layer to exit.
     * @param { ?VoidCallback } cancel - Execute Cancel Function.
     * @param { ?DialogAlignment } alignment - Alignment in the vertical direction.
     * @param { ?Offset } offset - Offset of the pop-up window relative to the alignment position.
     * @param { ?UInt32 } gridCount - Grid count of dialog.
     * @param { ?Rectangle } maskRect - Mask Region of dialog. The size cannot exceed the main window.
     * @param { ?Bool } showInSubWindow - Whether to display in the sub window.
     * @param { ?Bool } isModal - Whether it is a modal dialog.
     * @param { ?ResourceColor } backgroundColor - Defines the alertDialog's background color.
     * @param { ?BlurStyle } backgroundBlurStyle - Defines the alertDialog's background blur Style
     * @param { ?Callback<(DismissDialogAction, Unit)> } onWillDismiss - Callback function when the dialog interactive dismiss.
     * @param { ?BorderRadiuses } cornerRadius - Defines the alertDialog's corner radius.
     * @param { ?TransitionEffect } transition - Transition parameters of opening/closing AlertDialog.
     * @param { ?Length } width - Defines the alertDialog's width.
     * @param { ?Length } height - Defines the alertDialog's height.
     * @param { ?Length } borderWidth - Defines the alertDialog's border width.
     * @param { ?BorderColor } borderColor - Defines the alertDialog's border color.
     * @param { ?EdgeStyles } borderStyle - Defines the alertDialog's border style.
     * @param { ?ShadowOptions } shadow - Defines the alertDialog's shadow.
     * @param { ?WordBreak } textStyle - Set the alertDialog's textStyle.
     * @param { Array<AlertDialogButtonOptions> } buttons - The array of buttons.
     * @param { DialogButtonDirection } buttonDirection - The arrangement of buttons.
     * @returns { AlertDialogParamWithOptions } Returns the created AlertDialogParamWithOptions instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr = None,
        subtitle!: ?ResourceStr = None,
        message!: ?ResourceStr,
        autoCancel!: ?Bool = None,
        cancel!: ?VoidCallback = None,
        alignment!: ?DialogAlignment = None,
        offset!: ?Offset = None,
        gridCount!: ?UInt32 = None,
        maskRect!: ?Rectangle = None,
        showInSubWindow!: ?Bool = None,
        isModal!: ?Bool = None,
        backgroundColor!: ?ResourceColor = None,
        backgroundBlurStyle!: ?BlurStyle = None,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        cornerRadius!: ?BorderRadiuses = None,
        transition!: ?TransitionEffect = None,
        width!: ?Length = None,
        height!: ?Length = None,
        borderWidth!: ?Length = None,
        borderColor!: ?BorderColor = None,
        borderStyle!: ?EdgeStyles = None,
        shadow!: ?ShadowOptions = None,
        textStyle!: ?WordBreak = None,
        buttons!: ?Array<AlertDialogButtonOptions>,
        buttonDirection!: ?DialogButtonDirection = None
    ) {
        super(
            title: title ?? "",
            subtitle: subtitle ?? "",
            message: message ?? "",
            autoCancel: autoCancel ?? true,
            cancel: cancel ?? {=>},
            alignment: alignment ?? DialogAlignment.Default,
            offset: offset ?? Offset(0, 0),
            gridCount: gridCount ?? 4,
            maskRect: maskRect ?? Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
            showInSubWindow: showInSubWindow ?? false,
            isModal: isModal ?? true,
            backgroundColor: backgroundColor ?? Color.Transparent,
            backgroundBlurStyle: backgroundBlurStyle ?? BlurStyle.ComponentUltraThick,
            onWillDismiss: onWillDismiss,
            cornerRadius: cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
                bottomLeft: 32.vp, bottomRight: 32.vp),
            transition: transition,
            width: width,
            height: height,
            borderWidth: borderWidth ?? 0,
            borderColor: borderColor ?? BorderColor(color: Color.Black),
            borderStyle: borderStyle ?? EdgeStyles(),
            shadow: shadow ?? ShadowOptions(radius: 0.0),
            textStyle: textStyle ?? WordBreak.BreakAll
        )
        this.buttons = buttons ?? []
        this.buttonDirection = buttonDirection ?? DialogButtonDirection.Auto
    }
}

protected class AlertDialogInner {
    protected static func show(value: AlertDialogParamWithConfirm): Unit {
        let nativeDialog = value.getNativeParam()
        let nativeConfirm = match (value.confirm as AlertDialogButtonOptions) {
            case Some(v) => v.toNative()
            case None => AlertDialogButtonOptions(value: "", action: {=>}).toNative()
        }
        unsafe {
            FfiOHOSShowAlertDialogParamWithConfirmShadowOptions(
                nativeDialog, nativeConfirm, (value.shadow ?? ShadowOptions(radius: 0.0)).toActionSheetShadowNative())
            nativeDialog.free()
            freeButton(nativeConfirm)
        }
        return
    }

    protected static func show(value: AlertDialogParamWithButtons): Unit {
        let nativeDialog = value.getNativeParam()
        let nativePrimaryButton = match (value.primaryButton as AlertDialogButtonOptions) {
            case Some(v) => v.toNative()
            case None => AlertDialogButtonOptions(value: "", action: {=>}).toNative()
        }
        let nativeSecondaryButton = match (value.secondaryButton as AlertDialogButtonOptions) {
            case Some(v) => v.toNative()
            case None => AlertDialogButtonOptions(value: "", action: {=>}).toNative()
        }
        unsafe {
            FfiOHOSShowAlertDialogParamWithButtonsShadowOptions(nativeDialog, nativePrimaryButton, nativeSecondaryButton,
                (value.shadow ?? ShadowOptions(radius: 0.0)).toActionSheetShadowNative())
            nativeDialog.free()
            freeButton(nativePrimaryButton)
            freeButton(nativeSecondaryButton)
        }
        return
    }

    protected static func show(value: AlertDialogParamWithOptions): Unit {
        let nativeDialog = value.getNativeParam()
        let buttons = value.buttons ?? []
        let buttonSize = buttons.size
        let buttonsArr = Array<NativeAlertDialogButtonOptionsV2>(buttonSize, {index =>
            let res = match(buttons[index] as AlertDialogButtonOptions) {
                case Some(v) => v.toNative()
                case None => AlertDialogButtonOptions(value: "", action: {=>}).toNative()
            }
            return res
        })
        let arr: CPointer<NativeAlertDialogButtonOptionsV2> = unsafe {
            LibC.malloc<NativeAlertDialogButtonOptionsV2>(count: buttonSize)
        }
        if (arr.isNull()) {
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }
        for (i in 0..buttonSize) {
            unsafe {
                arr.write(i, buttonsArr[i])
            }
        }
        let nativeButtons = CArrNativeAlertDialogButtonOptionsV2(arr, buttonSize)
        unsafe {
            FfiOHOSShowAlertDialogParamWithOptionsShadowOptions(
                nativeDialog,
                nativeButtons,
                (value.shadow ?? ShadowOptions(radius: 0.0)).toActionSheetShadowNative(),
                (value.buttonDirection ?? DialogButtonDirection.Auto).getValue())
            nativeDialog.free()
            freeButtonsArr(nativeButtons)
        }
        return
    }
}
