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

package ohos.arkui.component.action_sheet

import ohos.arkui.component.common.{DialogButtonStyle, DismissReason, DialogAlignment, Rectangle, BlurStyle, BorderRadiuses, EdgeStyles, ShadowOptions, TransitionEffect, INVALID_CALLBACK_ID}
import ohos.arkui.component.native_struct.{NativeActionSheetShadowOptions, NativeOptionOffset, NativeOptionRectangle, NativeOptionEdgeStyle, NativeOptionRadius, NativeConfirm}
import ohos.arkui.component.util.{transAppResourceToLength, transResourceStrToString, transResourceMediaToString}
import ohos.base.{NativeOptionLength, NativeOptionUInt32, NativeOffset, NativeOptionInt64, ResourceStr, VoidCallback, Length, NativeOptionCString, NativeOptionBool, NativeOptionCallBack, NativeOptionInt32, ResourceColor, Callback, NativeLength, Color, LengthProp}
import ohos.ffi.{Callback0Param, Callback1Param}
import ohos.labels.APILevel
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkActionSheetShowWithShadowOptions(
        options: NativeActionSheetOptions,
        shadowStyle: NativeActionSheetShadowOptions
    ): Unit

    func FfiOHOSAceFrameworkActionSheetShowWithShadowStyle(options: NativeActionSheetOptions, shadowStyle: Int32): Unit

    func FfiOHOSAceFrameworkActionSheetShow(options: NativeActionSheetOptions): Unit

    func FfiOHOSAceFrameworkActionSheetDismiss(): Unit
}

@C
struct NativeActionSheetOptions {
    NativeActionSheetOptions(
        let title: CString,
        let message: CString,
        let sheets: NativeSheetInfoArray,
        let subtitle: NativeOptionCString,
        let confirm: NativeOptionConfirm,
        let autoCancel: NativeOptionBool,
        let cancel: NativeOptionCallBack,
        let alignment: NativeOptionInt32,
        let offset: NativeOptionOffset,
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
        let transition: NativeOptionInt64
    ) {}

    func free(_: Int64): Unit {
        unsafe {
            LibC.free(title)
            LibC.free(message)
            LibC.free(subtitle.value)
            sheets.free()
            confirm.value.free()
        }
    }
}

@C
struct NativeSheetInfo {
    NativeSheetInfo(
        let title: CString,
        let icon: CString,
        let cancel: Int64
    ) {}

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(icon)
        }
    }
}

@C
struct NativeSheetInfoArray {
    NativeSheetInfoArray(
        let size: Int64,
        let sheetInfo: CPointer<NativeSheetInfo>
    ) {}

    init(infos: Array<SheetInfo>) {
        this.size = infos.size
        this.sheetInfo = if (size > 0) {
            let ptr = unsafe { LibC.malloc<NativeSheetInfo>(count: size) }
            if (ptr.isNull()) {
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            for (i in 0..size) {
                unsafe { ptr.write(i, infos[i].toNative()) }
            }
            ptr
        } else {
            CPointer<NativeSheetInfo>()
        }
    }

    func free(): Unit {
        if (!sheetInfo.isNull()) {
            for (i in 0..size) {
                unsafe { sheetInfo.read(i).free() }
            }
            unsafe { LibC.free<NativeSheetInfo>(sheetInfo) }
        }
    }
}

@C
struct NativeOptionConfirm {
    NativeOptionConfirm(
        let hasValue: Bool,
        let value: NativeConfirm
    ) {}
}

/**
 * The information of sheet.
 * Each sheet represents an option in the ActionSheet dialog with text, optional icon, and action callback.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetInfo {
    /**
     * Sheet text.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ?ResourceStr
    /**
     * Callback when the sheet is selected.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: ?VoidCallback
    /**
     * Sheet icon. By default, no icon is displayed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icon: ?ResourceStr
    /**
     * Constructor of SheetInfo.
     *
     * @param { ?ResourceStr } title - Sheet text.
     * @param { ?VoidCallback } action - Callback when the sheet is selected.
     * @param { ?ResourceStr } [icon] - Sheet icon. By default, no icon is displayed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr,
        icon!: ?ResourceStr = None,
        action!: ?VoidCallback
    ) {
        this.title = title ?? ""
        this.action = action ?? { => }
        this.icon = icon
    }

    func toNative(): NativeSheetInfo {
        let cTitle: CString = unsafe { LibC.mallocCString(transResourceStrToString(title ?? "")) }
        let cIcon = match (icon) {
            case Some(value) => unsafe { LibC.mallocCString(transResourceMediaToString(value)) }
            case None => unsafe { LibC.mallocCString("") }
        }
        var ret = NativeSheetInfo(
            cTitle,
            cIcon,
            Callback0Param<Unit>(action ?? { => }).getID()
        )
        ret
    }
}

/**
 * Base button params used for ActionSheet.
 * Defines the properties of buttons used in the ActionSheet dialog, including text, action callback, 
 * enabled state, focus behavior, and styling.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheetButtonOptions {
    /**
     * Button text.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: ?ResourceStr
    /**
     * Callback invoked when the button is selected.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: ?VoidCallback
    /**
     * Whether to respond when the button is clicked. The value true means to respond when the button is clicked,
     * and false means the opposite.
     * The default value is true.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enabled: ?Bool
    /**
     * Whether the button is the default focus. The value true means that the button is the default focus,
     * and false means the opposite.
     * The default value is false.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var defaultFocus: ?Bool
    /**
     * Button style.
     * The default value is DialogButtonStyle.Default.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?DialogButtonStyle
    /**
     * Constructor of ActionSheetButtonOptions.
     *
     * @param { ?ResourceStr } value - Button text.
     * @param { ?VoidCallback } action - Callback invoked when the button is selected.
     * @param { ?Bool } [enabled] - Whether to respond when the button is clicked. The value true means to respond when the button is clicked, and false means the opposite.
     * @param { ?Bool } [defaultFocus] - Whether the button is the default focus. The value true means that the button is the default focus, and false means the opposite.
     * @param { ?DialogButtonStyle } [style] - Button style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value!: ?ResourceStr,
        action!: ?VoidCallback,
        enabled!: ?Bool = None,
        defaultFocus!: ?Bool = None,
        style!: ?DialogButtonStyle = None
    ) {
        this.value = value ?? ""
        this.action = action ?? { => }
        this.enabled = enabled ?? true
        this.defaultFocus = defaultFocus ?? false
        this.style = style ?? DialogButtonStyle.Default
    }

    func toNative(): NativeConfirm {
        let cValue: CString = unsafe { LibC.mallocCString(transResourceStrToString(value ?? "")) }
        var ret = NativeConfirm(
            cValue,
            Callback0Param<Unit>(action ?? { => }).getID(),
            enabled ?? true,
            defaultFocus ?? false,
            (style ?? DialogButtonStyle.Default).getValue()
        )
        ret
    }
}

/**
 * Provides information about the action to dismiss the dialog box.
 * Used in the onWillDismiss callback to control whether the dialog should be dismissed based on the reason.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissDialogAction {
    /**
     * Reason why the dialog box cannot be dismissed. You must specify whether to close the dialog box for each of the
     * listed actions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var reason: DismissReason
    /**
     * Constructor of DismissDialogAction
     *
     * @param { DismissReason } reason - Reason why the dialog box cannot be dismissed. You must specify whether to close the dialog box for each of the listed actions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(reason: DismissReason) {
        this.reason = reason
    }
    /**
     * Defines dialog dismiss function.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss(): Unit {
        unsafe {
            FfiOHOSAceFrameworkActionSheetDismiss()
        }
    }
}

protected func parseToDismissDialogAction(reason: Int32): DismissDialogAction {
    return DismissDialogAction(DismissReason.toEnum(reason))
}

/**
 * The options of ActionSheet.
 * Contains all configurable properties for the ActionSheet dialog, including title, message, sheet options,
 * styling, positioning, and callbacks.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheetOptions {
    /**
     * Title of the dialog box.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ?ResourceStr
    /**
     * Content of the dialog box.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ?ResourceStr
    /**
     * Options in the dialog box. Each option supports the image, text, and callback.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sheets: ?Array<SheetInfo>
    /**
     * Subtitle of the dialog box.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var subtitle: ?ResourceStr
    /**
     * Information about the confirm button. When the dialog box has focus and focus has not been shifted using the Tab
     * key, the button responds to the Enter key by default, and multiple dialog boxes can gain focus consecutively
     * to respond automatically. The default response to the Enter key does not work when defaultFocus is set to true.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var confirm: ?ActionSheetButtonOptions
    /**
     * Whether to close the dialog box when the overlay is clicked.
     * The default value is true.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: ?Bool
    /**
     * Callback invoked when the dialog box is closed after the overlay is clicked.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cancel: ?VoidCallback
    /**
     * Alignment mode of the dialog box in the vertical direction.
     * <p><strong>NOTE</strong>:
     * <br>If showInSubWindow is set to true in UIExtension, the dialog box is aligned with the host window based
     * on UIExtension.
     * </p>
     * The default value is DialogAlignment.Bottom
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: ?DialogAlignment
    /**
     * Offset of the dialog box relative to the alignment position.
     * <br>When alignment is set to Top, TopStart, or TopEnd: dx: 0, dy: 40.vp
     * <br>When alignment is set to any other value: dx: 0,dy: -40.vp
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?ActionSheetOffset
    /**
     * Mask area of the dialog box. Events outside the mask area are transparently transmitted,
     * and events within the mask area are not.
     * <p><strong>NOTE</strong>:
     * <br>maskRect does not take effect when showInSubWindow is set to true.
     * </p>
     * The default value: x is 0, y is 0, width is 100.percent, height is 100.percent.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: ?Rectangle
    /**
     * Whether to show the dialog box in a subwindow when the dialog box needs to be displayed outside the main window.
     * <p><strong>NOTE</strong>:
     * <br>A dialog box whose showInSubWindow attribute is true cannot trigger the display of another dialog box whose
     * showInSubWindow attribute is also true.
     * The default value is false.
     * </p>
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool
    /**
     * Whether the dialog box is a modal. A modal dialog box has a mask applied, while a non-modal dialog box does not.
     * The default value is true.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: ?Bool
    /**
     * Background color of the dialog box.
     * <p><strong>NOTE</strong>:
     * <br>When backgroundColor is set to a non-transparent color, backgroundBlurStyle must be set to BlurStyle.NONE;
     * otherwise, the color display may not meet the expected effect.
     * </p>
     * The default value is Color.Transparent
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor
    /**
     * Background blur style of the dialog box.
     * <p><strong>NOTE</strong>:
     * <br>Setting this parameter to BlurStyle.NONE disables the background blur. When backgroundBlurStyle is set to a
     * value other than NONE, do not set backgroundColor. If you do, the color display may not produce the expected
     * visual effect.
     * </p>
     * The default value is BlurStyle.ComponentUltraThick
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle
    /**
     * Callback for interactive closure of the dialog box.
     * <p><strong>NOTE</strong>:
     * 1. If this callback is registered, the dialog box will not be closed immediately after the user touches the
     * mask or the Back button, presses the Esc key, or swipes left or right on the screen. The reason parameter in
     * the callback is used to determine whether the dialog box can be closed. The reason returned by the component
     * does not support the value CLOSE_BUTTON.
     * 2. In the onWillDismiss callback, another onWillDismiss callback is not allowed.
     * </p>
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: ?Callback<DismissDialogAction, Unit>
    /**
     * Corner radius of the background. You can set the radius for each of the four corners individually.
     * The value is a multiple of vp or a percentage. The value is multiplied by the component size, with the maximum 
     * value being half of the component width or height. If the value is negative, the default value is used. 
     * When set to a percentage, the value defines the radius as a percentage of the parent component's width or height.
     * In the default values, topLeft is 32.vp, topRight is 32.vp, bottomLeft is 32.vp, bottomRight is 32.vp.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: ?BorderRadiuses
    /**
     * Border width of the dialog box.
     * You can set the width for all four sides or set separate widths for individual sides.
     * The value is a multiple of vp or a percentage. The value is multiplied by the dialog 
     * box's width. If the left and right borders are greater than its width, or the top and bottom borders are greater
     * than its height, the dialog box may not display as expected.
     * The default value is 0, When set to a percentage, the value defines the border width as a percentage of the parent dialog.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: ?Length
    /**
     * Border color of the dialog box.
     * <p><strong>NOTE</strong>:
     * <br>When borderColor is of type LocalizedEdgeColors, the layout order can be dynamically adjusted based on the
     * user's language settings.
     * </p>
     * The default value is Color.Black - borderColor must be used with borderWidth in pairs.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: ?ResourceColor
    /**
     * Border style of the dialog box.
     * The default value is BorderStyle.Solid - borderStyle must be used with borderWidth in pairs.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: ?EdgeStyles
    /**
     * Width of the dialog box.
     *
     * When this parameter is set to a percentage, the reference width of the dialog box is the width of the window
     * where the dialog box is located. You can decrease or increase the width as needed.
     * Default maximum width of the dialog box: 400.vp
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length
    /**
     * Height of the dialog box.
     *
     * When this parameter is set to a percentage, the reference height of the dialog box is the height of the
     * window where the dialog box is located minus the safe area. You can decrease or increase the height as needed.
     * Default maximum height of the dialog box: 0.9 x (Window height – Safe area)
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Length
    /**
     * Shadow of the dialog box.
     * Default value on 2-in-1 devices: ShadowStyle.OuterFloatingSM when the dialog box is focused and ShadowStyle.OuterFloatingSM otherwise.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions
    /**
     * Transition effect for the entrance and exit of the dialog box.
     * 
     * NOTE:
     * 1. If this parameter is not set, the default effect is used.
     * 2. Touching the Back button during the entrance animation pauses the entrance animation and starts the exit
     * animation. The final effect is one obtained after the curves of the entrance and exit animations are combined.
     * 3. Touching the Back button during the exit animation does not affect the animation playback. Touching the
     * Back button again closes the application.
     * </p>
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: ?TransitionEffect
    /**
     * Constructor of ActionSheetOptions.
     *
     * @param { ?ResourceStr } title - Title of the dialog box.
     * @param { ?ResourceStr } message - Content of the dialog box.
     * @param { ?Array<SheetInfo> } sheets - Options in the dialog box.
     * @param { ?ResourceStr } [subtitle] - Subtitle of the dialog box.
     * @param { ?ActionSheetButtonOptions } [confirm] - Information about the confirm button.
     * @param { ?Bool } [autoCancel] - Whether to close the dialog box when the overlay is clicked.
     * @param { ?VoidCallback } [cancel] - Callback invoked when the dialog box is closed after the overlay is clicked.
     * @param { ?DialogAlignment } [alignment] - Alignment mode of the dialog box in the vertical direction.
     * @param { ?ActionSheetOffset } [offset] - Offset of the dialog box relative to the alignment position.
     * @param { ?Rectangle } [maskRect] - Mask area of the dialog box.
     * @param { ?Bool } [showInSubWindow] - Whether to show the dialog box in a subwindow when the dialog box needs to be displayed outside the main window.
     * @param { ?Bool } [isModal] - Whether the dialog box is a modal.
     * @param { ?ResourceColor } [backgroundColor] - Background color of the dialog box.
     * @param { ?BlurStyle } [backgroundBlurStyle] - Background blur style of the dialog box.
     * @param { ?Callback<DismissDialogAction, Unit> } [onWillDismiss] - Callback for interactive closure of the dialog box.
     * @param { ?BorderRadiuses } [cornerRadius] - Corner radius of the background.
     * @param { ?Length } [borderWidth] - Border width of the dialog box.
     * @param { ?ResourceColor } [borderColor] - Border color of the dialog box.
     * @param { ?EdgeStyles } [borderStyle] - Border style of the dialog box.
     * @param { ?Length } [width] - Width of the dialog box.
     * @param { ?Length } [height] - Height of the dialog box.
     * @param { ?ShadowOptions } [shadow] - Shadow of the dialog box.
     * @param { ?TransitionEffect } [transition] - Transition effect for the entrance and exit of the dialog box.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr,
        subtitle!: ?ResourceStr = None,
        message!: ?ResourceStr,
        confirm!: ?ActionSheetButtonOptions = None,
        cancel!: ?VoidCallback = None,
        sheets!: ?Array<SheetInfo>,
        autoCancel!: ?Bool = None,
        alignment!: ?DialogAlignment = None,
        offset!: ?ActionSheetOffset = None,
        maskRect!: ?Rectangle = None,
        showInSubWindow!: ?Bool = None,
        isModal!: ?Bool = None,
        backgroundColor!: ?ResourceColor = None,
        backgroundBlurStyle!: ?BlurStyle = None,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        transition!: ?TransitionEffect = None,
        cornerRadius!: ?BorderRadiuses = None,
        width!: ?Length = None,
        height!: ?Length = None,
        borderWidth!: ?Length = None,
        borderColor!: ?ResourceColor = None,
        borderStyle!: ?EdgeStyles = None,
        shadow!: ?ShadowOptions = None
    ) {
        this.title = title ?? ""
        this.message = message ?? ""
        this.sheets = sheets ?? []
        this.subtitle = subtitle ?? ""
        this.confirm = confirm ?? ActionSheetButtonOptions(value: "", action: {=>})
        this.autoCancel = autoCancel ?? true
        this.cancel = cancel ?? {=>}
        this.alignment = alignment ?? DialogAlignment.Bottom
        this.offset = offset.getOrDefault({ =>
            match(alignment ?? DialogAlignment.Bottom) {
                case DialogAlignment.Top => ActionSheetOffset(dx: 0.vp, dy: 40.vp)
                case DialogAlignment.TopStart => ActionSheetOffset(dx: 0.vp, dy: 40.vp)
                case DialogAlignment.TopEnd => ActionSheetOffset(dx: 0.vp, dy: 40.vp)
                case _ => ActionSheetOffset(dx: 0.vp, dy: (-40).vp)
            }
        })
        this.maskRect = maskRect ?? Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)
        this.showInSubWindow = showInSubWindow ?? false
        this.isModal = isModal ?? true
        this.backgroundColor = backgroundColor ?? Color.Transparent
        this.backgroundBlurStyle = backgroundBlurStyle ?? BlurStyle.ComponentUltraThick
        this.onWillDismiss = onWillDismiss
        this.cornerRadius = cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
            bottomLeft: 32.vp, bottomRight: 32.vp)
        this.borderWidth = borderWidth ?? 0.vp
        this.borderColor = borderColor ?? Color.Black
        this.borderStyle = borderStyle ?? EdgeStyles()
        this.width = width
        this.height = height
        this.shadow = shadow ?? ShadowOptions(radius: 0.0)
        this.transition = transition
    }

    func getNativeParam(): NativeActionSheetOptions {
        let cTitle: CString = try {
            unsafe { LibC.mallocCString(transResourceStrToString(title ?? "")) }
        } catch (e: Exception) {
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }

        let cMessage: CString = try {
            unsafe { LibC.mallocCString(transResourceStrToString(message ?? "")) }
        } catch (e: Exception) {
            unsafe { LibC.free(cTitle) }
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }

        let cStr: CString = try {
            unsafe { LibC.mallocCString(transResourceStrToString(subtitle ?? "")) }
        } catch (e: Exception) {
            unsafe { LibC.free(cTitle) }
            unsafe { LibC.free(cMessage) }
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }
        let nativeSubtitle = NativeOptionCString(true, cStr)
        let nativeConfirm = NativeOptionConfirm(true, (confirm ?? ActionSheetButtonOptions(value: "", action: {=>})).toNative())
        let nativeAutoCancel = NativeOptionBool(true, autoCancel ?? true)
        let nativeCancel = NativeOptionCallBack(true, Callback0Param<Unit>(cancel ?? {=>}).getID())
        let nativeAlignment = NativeOptionInt32(true, (alignment ?? DialogAlignment.Bottom).getValue())
        let nativeOffset = NativeOptionOffset(true, (offset ?? ActionSheetOffset(dx: 0.vp, dy: 40.vp)).toNative())
        let nativeMaskRect = NativeOptionRectangle(true, (maskRect ?? Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)).parseToNative())
        let nativeShowInSubWindow = NativeOptionBool(true, showInSubWindow ?? false)
        let nativeIsModal = NativeOptionBool(true, isModal ?? true)
        let nativeBackgroundColor = NativeOptionUInt32(true, (backgroundColor ?? Color.Transparent).toUInt32())
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
        let nativeCornerRadius = NativeOptionRadius(true, (cornerRadius?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
            bottomLeft: 32.vp, bottomRight: 32.vp)).toCBorderRadiuses())
        let value_ = transAppResourceToLength(borderWidth ?? 0.vp)
        let nativeBorderWidth = NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
        let nativeBorderColor = NativeOptionUInt32(true, (borderColor ?? Color.Black).toUInt32())
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
        var nativeActionSheetOptions = NativeActionSheetOptions(
            cTitle,
            cMessage,
            NativeSheetInfoArray(sheets ?? []),
            nativeSubtitle,
            nativeConfirm,
            nativeAutoCancel,
            nativeCancel,
            nativeAlignment,
            nativeOffset,
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
            nativeTransition
        )
        nativeActionSheetOptions
    }
}

/**
 * ActionSheet offset.
 * Defines the offset of the action sheet relative to its alignment position.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheetOffset {
    /**
     * Offset of the action sheet along the x-axis relative to the alignment position.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dx: ?Length
    /**
     * Offset of the action sheet along the y-axis relative to the alignment position.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dy: ?Length
    /**
     * Constructor of ActionSheetOffset.
     *
     * @param { ?Length } dx - Offset of the action sheet along the x-axis relative to the alignment position.
     * @param { ?Length } dy - Offset of the action sheet along the y-axis relative to the alignment position.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        dx!: ?Length,
        dy!: ?Length
    ) {
        let tmpDx = dx ?? 0.vp
        let tmpDy = dy ?? 0.vp
        this.dx = transAppResourceToLength(tmpDx)
        this.dy = transAppResourceToLength(tmpDy)
    }

    protected func toNative(): NativeOffset {
        return NativeOffset(
            NativeLength(
                (this.dx ?? 0.vp).value,
                (this.dx ?? 0.vp).unitType.getValue()
            ),
            NativeLength(
                (this.dy ?? 0.vp).value,
                (this.dy ?? 0.vp).unitType.getValue()
            )
        )
    }
}

protected class ActionSheetInner {
    protected static func show(value: ActionSheetOptions): Unit {
        let nativeOptions = value.getNativeParam()
        unsafe {
            FfiOHOSAceFrameworkActionSheetShowWithShadowOptions(nativeOptions, (value.shadow ?? ShadowOptions(radius: 0.0)).toActionSheetShadowNative())
            nativeOptions.free((value.sheets ?? []).size)
        }
        return
    }
}
