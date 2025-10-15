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

protected package ohos.arkui.ui_context.prompt_action

import ohos.base.*
import ohos.business_exception.*
import ohos.callback_invoke.*
import ohos.ffi.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.arkui.component.common.*
import ohos.multimedia.image.*
import ohos.labels.APILevel
import std.deriving.Derive

@C
struct CButtonInfo {
    CButtonInfo(
        let text: CString,
        let textColor: UInt32,
        let primary: Bool
    ) {}
}

@C
struct NativeCustomDialogOptions {
    NativeCustomDialogOptions(
        let maskRect: NativeRectangle,
        let alignment: Int32,
        let offset: NativeOffset,
        let isModal: Bool,
        let showInSubWindow: Bool,
        let autoCancel: Bool,
        let maskColor: UInt32,
        let transition: Int64,
        let onDidAppear: Int64,
        let onDidDisappear: Int64,
        let onWillAppear: Int64,
        let onWillDisappear: Int64,
        let keyboardAvoidMode: Int32,
        let enableHoverMode: Bool,
        let hoverModeArea: Int32,
        let builder: Int64,
        let backgroundColor: UInt32,
        let cornerRadius: CBorderRadiuses,
        let borderWidth: CJEdge,
        let borderColor: NativeEdgeColor,
        let borderEdgeStyle: NativeEdgeStyles,
        let widthValue: Float64,
        let widthUnit: Int32,
        let heightValue: Float64,
        let heightUnit: Int32,
        let shadowOption: NativeShadowOptions,
        let shadowStyle: Int32,
        let backgroundBlurStyle: Int32
    ) {}
}

@C
struct CBorderRadiuses {
    let topLeftRadiuses: Float64
    let topLeftUnit: Int32
    let topRightRadiuses: Float64
    let topRightUnit: Int32
    let bottomLeftRadiuses: Float64
    let bottomLeftUnit: Int32
    let bottomRightRadiuses: Float64
    let bottomRightUnit: Int32

    init(topLeft: Length, topRight: Length, bottomLeft: Length, bottomRight: Length) {
        topLeftRadiuses = topLeft.value
        topLeftUnit = topLeft.unitType.getValue()
        topRightRadiuses = topRight.value
        topRightUnit = topRight.unitType.getValue()
        bottomLeftRadiuses = bottomLeft.value
        bottomLeftUnit = bottomLeft.unitType.getValue()
        bottomRightRadiuses = bottomRight.value
        bottomRightUnit = bottomRight.unitType.getValue()
    }
}

@C
struct NativeShadowOptions {
    NativeShadowOptions(
        let radius: Float64,
        let shadowType: UInt32,
        let color: UInt32,
        let offsetX: Float64,
        let offsetY: Float64,
        let fill: Bool
    ) {}
}

@C
struct NativeEdgeColor {
    NativeEdgeColor(
        let top: UInt32,
        let right: UInt32,
        let bottom: UInt32,
        let left: UInt32
    ) {}
}

@C
struct NativeShowToastOptions {
    NativeShowToastOptions(
        let message: CString,
        let duration: UInt32,
        let bottom: CString,
        let showMode: Int32,
        let alignment: Int32,
        let offset: NativeOffset,
        let backgroundColor: UInt32,
        let textColor: UInt32,
        let backgroundBlurStyle: Int32,
        let shadowOption: NativeShadowOptions,
        let shadowStyle: Int32,
        let enableHoverMode: Bool,
        let hoverModeArea: Int32
    ) {}
}

@C
struct NativeShowDialogOptions {
    NativeShowDialogOptions(
        let title: CString,
        let message: CString,
        let buttons: CPointer<CButtonInfo>,
        let buttonsSize: UInt32,
        let alignment: Int32,
        let offset: NativeOffset,
        let maskRect: NativeRectangle,
        let showInSubWindow: Bool,
        let isModal: Bool,
        let backgroundColor: UInt32,
        let backgroundBlurStyle: Int32,
        let shadowOption: NativeShadowOptions,
        let shadowStyle: Int32,
        let enableHoverMode: Bool,
        let hoverModeArea: Int32
    ) {}
}

@C
struct NativeActionMenuOptions {
    NativeActionMenuOptions(
        let title: CString,
        let buttons: CPointer<CButtonInfo>, // Array<Button>
        let buttonsSize: UInt32,
        let showInSubWindow: Bool,
        let isModal: Bool
    ) {}
}

foreign {
    func FfiPromptMallocButtons(size: Int64): CPointer<CButtonInfo>

    func FfiPromptShowToast(message: CString, duration: Int32, bottom: CString, showMode: Int32): Unit

    func FfiPromptShowDialog(title: CString, message: CString, size: Int32, buttonsInfo: CPointer<CButtonInfo>,
        callback: Int64): Unit

    func FfiPromptShowActionMenu(title: CString, size: Int32, buttonsInfo: CPointer<CButtonInfo>, callback: Int64): Unit

    func FfiPromptCloseCustomDialog(id: Int32): Unit

    func FfiPromptShowToastWithOption(options: NativeShowToastOptions): Unit

    func FfiPromptShowDialogWithOption(options: NativeShowDialogOptions, callBack: Int64): Unit

    func FfiPromptShowActionMenuWithOption(options: NativeActionMenuOptions, callBack: Int64): Unit

    func FfiPromptOpenCustomDialogWithOption(options: NativeCustomDialogOptions, callBack: Int64): Unit

    func free(cptr: CPointer<Unit>): Unit
}

/**
 * The callBack of a showDialog.
 */
public type ShowDialogCallBack = AsyncCallback<Int32>


/**
 * The callBack of a showActionMenu.
 */
public type ShowActionMenuCallBack = AsyncCallback<Int32>

/**
 * Provides a ButtonInfo component..
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonInfo {
    /**
     * The text displayed in the button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var text: ResourceStr

    /**
     * The foreground color of button.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor

    /**
     * Define whether the button responds to Enter/Space key by default.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primary: Bool

    /**
     * Constructs a menu item button in a menu.
     *
     * @param { ResourceStr } text: Button text content.
     * @param { ResourceColor } color: Button text color.
     * @param { Bool } primary: Whether the button responds to the Enter/Space key by default.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(text!: ResourceStr, color!: ResourceColor, primary!: Bool = false) {
        this.text = text
        this.color = color
        this.primary = primary
    }
}

func CreateCButtons(buttons: Array<ButtonInfo>): Option<CPointer<CButtonInfo>> {
    let size = buttons.size
    var pButtons: CPointer<CButtonInfo> = unsafe { FfiPromptMallocButtons(size) }
    if (pButtons.isNull()) {
        return Option<CPointer<CButtonInfo>>.None
    }
    unsafe {
        for (i in 0..size) {
            var text = LibC.mallocCString(transResourceStrToString(buttons[i].text))
            let color = transAppResourceToResourceColor(buttons[i].color)
            let primary = buttons[i].primary
            var cButton = CButtonInfo(text, color, primary)
            pButtons.write(i, cButton)
        }
        Option<CPointer<CButtonInfo>>.Some(pButtons)
    }
}

unsafe func DestoryCButtons(pButtons: CPointer<CButtonInfo>, size: Int64) {
    for (i in 0..size) {
        let cButton = pButtons.read(i)
        LibC.free(cButton.text)
    }
    free(CPointer<Unit>(pButtons))
}

/**
 * Enum for the toast showMode.
 *
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ToastShowMode {

    /**
     * Toast shows in app.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default

    /**
     * Toast shows at the top.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopMost
    | ...

    func getValue(): Int32 {
        match (this) {
            case Default => 0
            case TopMost => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Provides a EdgeColor component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeColors {

    /**
     * The top of the EdgeColor.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ResourceColor

    /**
     * The right of the EdgeColor.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: ResourceColor

    /**
     * The bottom of the EdgeColor.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: ResourceColor

    /**
     * The left of the EdgeColor.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ResourceColor

    /**
     * EdgeColor constructor
     *
     * @param { ResourceColor } top
     * @param { ResourceColor } right
     * @param { ResourceColor } bottom
     * @param { ResourceColor } left
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: ResourceColor = Color.Black,
        right!: ResourceColor = Color.Black,
        bottom!: ResourceColor = Color.Black,
        left!: ResourceColor = Color.Black
    ) {
        this.top = top
        this.right = right
        this.bottom = bottom
        this.left = left
    }

    func toCEdgeColor(): NativeEdgeColor {
        return NativeEdgeColor(
            transAppResourceToResourceColor(top),
            transAppResourceToResourceColor(right),
            transAppResourceToResourceColor(bottom),
            transAppResourceToResourceColor(left)
        )
    }
}

/**
 * Provides a EdgeColor component.
 *
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum HoverModeAreaType {

    /**
     * TopScreen HoverModeAreaType.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopScreen

    /**
     * BottomScreen HoverModeAreaType.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomScreen
    | ...

    func getValue(): Int32 {
        match (this) {
            case TopScreen => 0
            case BottomScreen => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Provides a KeyboardAvoidMode component.
 *
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeyboardAvoidMode {
    /**
     * Default KeyboardAvoidMode.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default

    /**
     * None KeyboardAvoidMode.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    func getValue(): Int32 {
        match (this) {
            case Default => 0
            case None => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Dialog base options
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BaseDialogOptions {

    /**
     * Mask Region of dialog. The size can't exceed the main window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Rectangle

    /**
     * Defines the dialog alignment of the screen.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: DialogAlignment

    /**
     * Defines the dialog offset.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Offset

    /**
     * Whether it is a modal dialog
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Bool
    /**
     * Whether to display in the sub window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool

    /**
     * Allows users to click the mask layer to exit.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool

    /**
     * Defines custom dialog maskColor
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: ResourceColor

    /**
     * Transition parameters of opening/closing custom dialog.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: TransitionEffect

    /**
     * Callback function when the dialog appears.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidAppear: () -> Unit

    /**
     * Callback function when the dialog disappears.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidDisappear: () -> Unit

    /**
     * Callback function before the dialog openAnimation starts.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillAppear: () -> Unit

    /**
     * Callback function before the dialog closeAnimation starts.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDisappear: () -> Unit

    /**
     * Defines the customDialog's keyboard avoid mode
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyboardAvoidMode: KeyboardAvoidMode

    /**
     * Defines whether to respond to the hover mode.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: Bool

    /**
     * Defines the dialog's display area in hover mode.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: HoverModeAreaType

    /**
     * BaseDialogOptions constructor
     *
     * @param { Rectangle } maskRect
     * @param { DialogAlignment } alignment
     * @param { Offset } offset
     * @param { Bool } isModal
     * @param { Bool } showInSubWindow
     * @param { Bool } autoCancel
     * @param { ResourceColor } maskColor
     * @param { TransitionEffect } transition
     * @param { function } onDidAppear
     * @param { function } onDidDisappear
     * @param { function } onWillAppear
     * @param { function } onWillDisappear
     * @param { KeyboardAvoidMode } keyboardAvoidMode
     * @param { Bool } enableHoverMode
     * @param { HoverModeAreaType } hoverModeArea
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false,
        autoCancel!: Bool = true,
        maskColor!: ResourceColor = Color(0x33000000),
        transition!: TransitionEffect = TransitionEffect.OPACITY,
        onDidAppear!: () -> Unit = {=>},
        onDidDisappear!: () -> Unit = {=>},
        onWillAppear!: () -> Unit = {=>},
        onWillDisappear!: () -> Unit = {=>},
        keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.Default,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
    ) {
        this.maskRect = maskRect
        this.alignment = alignment
        this.offset = offset
        this.isModal = isModal
        this.showInSubWindow = showInSubWindow
        this.autoCancel = autoCancel
        this.maskColor = maskColor
        this.transition = transition
        this.onDidAppear = onDidAppear
        this.onDidDisappear = onDidDisappear
        this.onWillAppear = onWillAppear
        this.onWillDisappear = onWillDisappear
        this.keyboardAvoidMode = keyboardAvoidMode
        this.enableHoverMode = enableHoverMode
        this.hoverModeArea = hoverModeArea
    }
}

/**
 * Dialog's custom content options.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogOptions <: BaseDialogOptions {

    /**
     * Allow developer custom dialog's content.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: () -> Unit

    /**
     * Defines the custom dialog's background color.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor

    /**
     * Defines the custom dialog's corner radius.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: BorderRadiuses

    /**
     * Defines the custom dialog's border width.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: EdgeWidths

    /**
     * Defines the custom dialog's border color.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: EdgeColors

    /**
     * Defines the custom dialog's border style.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: EdgeStyles

    /**
     * Defines the dialog's width.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length

    /**
     * Defines the dialog's height.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Length

    /**
     * Defines the dialog's shadow.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions

    /**
     * Defines the dialog's background blur Style.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle

    /**
     * Dialog constructor.
     *
     * @param { function } builder
     * @param { Rectangle } maskRect
     * @param { DialogAlignment } alignment
     * @param { Offset } offset
     * @param { Bool } isModal
     * @param { Bool } showInSubWindow
     * @param { Bool } autoCancel
     * @param { ResourceColor } maskColor
     * @param { TransitionEffect } transition
     * @param { function } onDidAppear
     * @param { function } onDidDisappear
     * @param { function } onWillAppear
     * @param { function } onWillDisappear
     * @param { KeyboardAvoidMode } keyboardAvoidMode
     * @param { Bool } enableHoverMode
     * @param { HoverModeAreaType } hoverModeArea
     * @param { ResourceColor } backgroundColor
     * @param { BorderRadiuses } cornerRadius
     * @param { EdgeWidths } borderWidth
     * @param { EdgeColors } borderColor
     * @param { EdgeStyles } borderStyle
     * @param { Length } width
     * @param { Length } height
     * @param { ShadowOptions } shadow
     * @param { BlurStyle } backgroundBlurStyle
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        builder!: () -> Unit,
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false,
        autoCancel!: Bool = true,
        maskColor!: ResourceColor = Color(0x33000000),
        transition!: TransitionEffect = TransitionEffect.OPACITY,
        onDidAppear!: () -> Unit = {=>},
        onDidDisappear!: () -> Unit = {=>},
        onWillAppear!: () -> Unit = {=>},
        onWillDisappear!: () -> Unit = {=>},
        keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.Default,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen,
        backgroundColor!: ResourceColor = Color.Transparent,
        cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        borderWidth!: EdgeWidths = EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp),
        borderColor!: EdgeColors = EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black),
        borderStyle!: EdgeStyles = EdgeStyles(),
        width!: Length = 400.vp,
        height!: Length = 100.vp,
        shadow!: ?ShadowOptions = None,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick
    ) {
        super(
            maskRect: maskRect,
            alignment: alignment,
            offset: offset,
            isModal: isModal,
            showInSubWindow: showInSubWindow,
            autoCancel: autoCancel,
            maskColor: maskColor,
            transition: transition,
            onDidAppear: onDidAppear,
            onDidDisappear: onDidDisappear,
            onWillAppear: onWillAppear,
            onWillDisappear: onWillDisappear,
            keyboardAvoidMode: keyboardAvoidMode,
            enableHoverMode: enableHoverMode,
            hoverModeArea: hoverModeArea
        )
        this.builder = builder
        this.backgroundColor = backgroundColor
        this.cornerRadius = cornerRadius
        this.borderWidth = borderWidth
        this.borderColor = borderColor
        this.borderStyle = borderStyle
        this.width = width
        this.height = height
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle
    }
}

/**
 * Dialog's show options.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ShowDialogOptions {
    let buttonsSize: UInt32

    /**
     * Title of the text to display.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ResourceStr

    /**
     * Text body.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ResourceStr

    /**
     * Array of buttons in the dialog box.
     * More than one buttons are supported.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: Array<ButtonInfo>

    /**
     * Defines the dialog alignment of the screen.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: DialogAlignment

    /**
     * Defines the dialog offset.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Offset

    /**
     * Mask Region of dialog. The size can't exceed the main window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Rectangle

    /**
     * Whether to display in the sub window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool

    /**
     * Whether it is a modal dialog.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Bool

    /**
     * Defines the dialog's background color.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor

    /**
     * Defines the dialog's background blur Style.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle

    /**
     * Defines the dialog's shadow option.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions

   /**
     * Defines whether to respond to the hover mode.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: Bool

    /**
     * Defines the dialog's display area in hover mode.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: HoverModeAreaType

    /**
     * Dialog's show options constructor.
     *
     * @param { ResourceStr } title
     * @param { ResourceStr } message
     * @param { Array<ButtonInfo> } buttons
     * @param { DialogAlignment } alignment
     * @param { Offset } offset
     * @param { Rectangle } maskRect
     * @param { Bool } showInSubWindow
     * @param { Bool } isModal
     * @param { Color } backgroundColor
     * @param { BlurStyle } backgroundBlurStyle
     * @param { ShadowOptions } shadow
     * @param { Bool } enableHoverMode
     * @param { HoverModeAreaType } hoverModeArea
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ResourceStr = '',
        message!: ResourceStr = '',
        buttons!: Array<ButtonInfo> = [],
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: Color = Color.Transparent,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        shadow!: ?ShadowOptions = None,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
    ) {
        this.buttonsSize = UInt32(buttons.size)
        this.title = title
        this.message = message
        this.buttons = buttons
        this.alignment = alignment
        this.offset = offset
        this.maskRect = maskRect
        this.showInSubWindow = showInSubWindow
        this.isModal = isModal
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.shadow = shadow
        this.enableHoverMode = enableHoverMode
        this.hoverModeArea = hoverModeArea
    }
}

/**
 * Menu's Action options.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ActionMenuOptions {
    let buttonsSize: UInt32

    /**
     * Title of the text to display.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ResourceStr

    /**
     * Array of buttons in the dialog box.
     * One to six buttons are supported.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: Array<ButtonInfo>

    /**
     * Whether to display in the sub window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool

    /**
     * Whether it is a modal dialog.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Bool

    /**
     * Menu's Action options constructor.
     *
     * @param { ResourceStr } title
     * @param { Array<ButtonInfo> } buttons
     * @param { Bool } showInSubWindow
     * @param { Bool } isModal
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ResourceStr = '',
        buttons!: Array<ButtonInfo>,
        showInSubWindow!: Bool = false,
        isModal!: Bool = true
    ) {
        this.buttonsSize = UInt32(buttons.size)
        this.title = title
        this.buttons = buttons
        this.showInSubWindow = showInSubWindow
        this.isModal = isModal
    }
}

/**
 * Toast's show options.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShowToastOptions {

    /**
     * Text to display.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ResourceStr

    /**
     * Duration of toast dialog box.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: UInt32

    /**
     * The distance between toast dialog box and the bottom of screen.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Length

    /**
     * Determine the show mode of the toast.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showMode: ToastShowMode

    /**
     * Defines the toast alignment of the screen.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: Alignment

    /**
     * Defines the toast offset.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Offset

    /**
     * Background color of toast.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor

    /**
     * Text color of toast.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textColor: ResourceColor

    /**
     * Background blur Style of toast.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle

    /**
     * Shadow of toast's option.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions = None

    /**
     * Define whether to respond to the hover mode.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: Bool

    /**
     * Defines the toast's display area in hover mode.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: HoverModeAreaType

    /**
     * Toast's show options constructor.
     *
     * @param { ResourceStr } message
     * @param { UInt32 } duration
     * @param { Length } bottom
     * @param { ToastShowMode } showMode
     * @param { Alignment } alignment
     * @param { Offset } offset
     * @param { Color } backgroundColor
     * @param { Color } textColor
     * @param { BlurStyle } backgroundBlurStyle
     * @param { ShadowOptions } shadow
     * @param { Bool } enableHoverMode
     * @param { HoverModeAreaType } hoverModeArea
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message!: ResourceStr,
        duration!: UInt32 = 1500,
        bottom!: Length = 80.vp,
        showMode!: ToastShowMode = ToastShowMode.Default,
        alignment!: Alignment = Alignment.Bottom,
        offset!: Offset = Offset(0.vp, 0.vp),
        backgroundColor!: Color = Color.Transparent,
        textColor!: Color = Color.Black,
        backgroundBlurStyle!: BlurStyle = BlurStyle.ComponentUltraThick,
        shadow!: ?ShadowOptions = None,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BottomScreen
    ) {
        this.message = message
        this.duration = duration
        this.bottom = bottom
        this.showMode = showMode
        this.alignment = alignment
        this.offset = offset
        this.backgroundColor = backgroundColor
        this.textColor = textColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.shadow = shadow
        this.enableHoverMode = enableHoverMode
        this.hoverModeArea = hoverModeArea
    }
}

func parseShadowOptions(shadowOptions: ShadowOptions): NativeShadowOptions {
    return NativeShadowOptions(
        shadowOptions.radius ?? 0.0,
        (shadowOptions.shadowType ?? ShadowType.Color).getValue(),
        transAppResourceToResourceColor(shadowOptions.color ?? Color.Black),
        shadowOptions.offsetX ?? 0.0,
        shadowOptions.offsetY ?? 0.0,
        shadowOptions.fill ?? false
    )
}

func parseBorderRadiuses(borderRadiuses: BorderRadiuses): CBorderRadiuses {
    return CBorderRadiuses(
        borderRadiuses.topLeft ?? 0.vp,
        borderRadiuses.topRight ?? 0.vp,
        borderRadiuses.bottomLeft ?? 0.vp,
        borderRadiuses.bottomRight ?? 0.vp
    )
}

func parseEdgeWidths(edgeWidths: EdgeWidths): CJEdge {
    return CJEdge(
        edgeWidths.top ?? 0.vp,
        edgeWidths.right ?? 0.vp,
        edgeWidths.bottom ?? 0.vp,
        edgeWidths.left ?? 0.vp
    )
}

func parseOffset(offset: Offset): NativeOffset {
    return NativeOffset(
        NativeLength(
            (offset.dx ?? 0.vp).value,
            (offset.dx ?? 0.vp).unitType.getValue()
        ),
        NativeLength(
            (offset.dy ?? 0.vp).value,
            (offset.dy ?? 0.vp).unitType.getValue()
        )
    )
}

func parseRectangle(rectangle: Rectangle): NativeRectangle {
    return NativeRectangle(
        (rectangle.x ?? 0.vp).value,
        (rectangle.x ?? 0.vp).unitType.getValue(),
        (rectangle.y ?? 0.vp).value,
        (rectangle.y ?? 0.vp).unitType.getValue(),
        (rectangle.width ?? 100.percent).value,
        (rectangle.width ?? 100.percent).unitType.getValue(),
        (rectangle.height ?? 100.percent).value,
        (rectangle.height ?? 100.percent).unitType.getValue()
    )
}

func parseCustomDialogOptions(options: CustomDialogOptions): NativeCustomDialogOptions {
    let borderEdgeStyle = options.borderStyle.toNative()

    let shadowOption = match (options.shadow) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions(radius: 0.0, shadowType: ShadowType.Color))
    }
    let shadowStyle = Int32(100)
    let widthLength = transAppResourceToLength(options.width)
    let heightLength = transAppResourceToLength(options.height)
    return NativeCustomDialogOptions(
        parseRectangle(options.maskRect),
        options.alignment.getValue(),
        parseOffset(options.offset),
        options.isModal,
        options.showInSubWindow,
        options.autoCancel,
        options.maskColor.toUInt32(),
        options.transition.getID(),
        Callback0Param<Unit>(options.onDidAppear).getID(),
        Callback0Param<Unit>(options.onDidDisappear).getID(),
        Callback0Param<Unit>(options.onWillAppear).getID(),
        Callback0Param<Unit>(options.onWillDisappear).getID(),
        options.keyboardAvoidMode.getValue(),
        options.enableHoverMode,
        options.hoverModeArea.getValue(),
        Callback0Param<Unit>(options.builder).getID(),
        transAppResourceToResourceColor(options.backgroundColor),
        parseBorderRadiuses(options.cornerRadius),
        parseEdgeWidths(options.borderWidth),
        options.borderColor.toCEdgeColor(),
        borderEdgeStyle,
        widthLength.value,
        widthLength.unitType.getValue(),
        heightLength.value,
        heightLength.unitType.getValue(),
        shadowOption,
        shadowStyle,
        options.backgroundBlurStyle.getValue()
    )
}

func length2String(value: Length): String {
    let length = transAppResourceToLength(value)
        return match (length.unitType) {
            case Px => "${length.value}px"
            case Vp => "${length.value}vp"
            case Fp => "${length.value}fp"
            case Percent => "${length.value}%"
            case Lpx => "${length.value}lpx"
            case _ => "${length.value}"
        }
}

func parseShowToastOptions(options: ShowToastOptions): NativeShowToastOptions {
    let shadowOption = match (options.shadow) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions(radius: 0.0, shadowType: ShadowType.Color))
    }
    let shadowStyle = Int32(100)
    unsafe {
        var cMsg = CString(CPointer<UInt8>())
        var cBottom = CString(CPointer<UInt8>())
        try {
            cMsg = LibC.mallocCString(transResourceStrToString(options.message))
            cBottom = LibC.mallocCString(length2String(options.bottom))
        } catch (e: Exception) {
            LibC.free(cMsg)
            LibC.free(cBottom)
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }
        return NativeShowToastOptions(
            cMsg,
            options.duration,
            cBottom,
            options.showMode.getValue(),
            options.alignment.getValue(),
            parseOffset(options.offset),
            options.backgroundColor.toUInt32(),
            Color.alphaAdapt(options.textColor.toUInt32()),
            options.backgroundBlurStyle.getValue(),
            shadowOption,
            shadowStyle,
            options.enableHoverMode,
            options.hoverModeArea.getValue()
        )
    }
}

func parseShowDialogOptions(options: ShowDialogOptions): NativeShowDialogOptions {
    var pButtons: CPointer<CButtonInfo> = CreateCButtons(options.buttons).getOrThrow(
        {
            => BusinessException(100001, "Fail to create buttons")
        })
    let shadowOption = match (options.shadow) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions(radius: 0.0, shadowType: ShadowType.Color))
    }
    let shadowStyle = Int32(100)
    unsafe {
        var cTitle = CString(CPointer<UInt8>())
        var cMsg = CString(CPointer<UInt8>())
        try {
            cTitle = LibC.mallocCString(transResourceStrToString(options.title))
            cMsg = LibC.mallocCString(transResourceStrToString(options.message))
        } catch (e: Exception) {
            LibC.free(cTitle)
            LibC.free(cMsg)
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }
        return NativeShowDialogOptions(
            cTitle,
            cMsg,
            pButtons,
            options.buttonsSize,
            options.alignment.getValue(),
            parseOffset(options.offset),
            parseRectangle(options.maskRect),
            options.showInSubWindow,
            options.isModal,
            options.backgroundColor.toUInt32(),
            options.backgroundBlurStyle.getValue(),
            shadowOption,
            shadowStyle,
            options.enableHoverMode,
            options.hoverModeArea.getValue()
        )
    }
}

func parseActionMenuOptions(options: ActionMenuOptions): NativeActionMenuOptions {
    var pButtons: CPointer<CButtonInfo> = CreateCButtons(options.buttons).getOrThrow(
        {
            => BusinessException(100001, "Fail to create buttons")
        })
    unsafe {
        let cTitle = LibC.mallocCString(transResourceStrToString(options.title))
        return NativeActionMenuOptions(
            cTitle,
            pButtons,
            options.buttonsSize,
            options.showInSubWindow,
            options.isModal
        )
    }
}

/**
 * class PromptAction.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PromptAction {
    private var instanceId_: Int64 = 0
    private static let defaultCallback = {_: Option<BusinessException>, _: Option<Int32> =>}

    protected init(instanceId: Int64) {
        this.instanceId_ = instanceId
    }

  /**
   * Open the custom dialog.
   *
   * isModal = true and showInSubWindow = true cannot be used at the same time.
   *
   * @param { CustomDialogOptions } options - Options.
   * @param { (Int32) -> Unit } callBack
   */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func openCustomDialog(options: CustomDialogOptions, callBack: (Int32) -> Unit): Unit {
        let cOptions = parseCustomDialogOptions(options)
        let callBackLambda = Callback1Param<Int32, Unit>(callBack)
        unsafe {
            FfiPromptOpenCustomDialogWithOption(cOptions, callBackLambda.getID())
        }
    }

    /**
     * Close the custom dialog.
     *
     * @param { Int32 } dialogId - the dialog id that returned by openCustomDialog.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeCustomDialog(dialogId: Int32): Unit {
        unsafe {
            FfiPromptCloseCustomDialog(dialogId)
        }
    }

    /**
     * Shows a toast in the given settings.
     *
     * @param { ShowToastOptions } options - Toast options.
     * @throws { BussnessException } - 100001 - Internal error. Possible causes: Failed to allocate memory.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showToast(option: ShowToastOptions): Unit {
        unsafe {
            let cOption = parseShowToastOptions(option)
            FfiPromptShowToastWithOption(cOption)
            cOption.message.free()
            cOption.bottom.free()
        }
    }

    /**
     * Shows a dialog box in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ShowDialogOptions } options - Dialog box options.
     * @param { ShowDialogCallBack } callback - Callback used to return the dialog.
     * box response result.
     * @throws { BussnessException } - 100001 - Internal error. Possible causes: Failed to allocate memory.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showDialog(option: ShowDialogOptions, callback!: ShowDialogCallBack = defaultCallback) {
        unsafe {
            let cOption = parseShowDialogOptions(option)
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<BusinessException>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<BusinessException>.Some(BusinessException(code, "")), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)

            FfiPromptShowDialogWithOption(cOption, lambdaData.getID())
            cOption.title.free()
            cOption.message.free()
            DestoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }

    /**
     * Shows an action menu in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ActionMenuOptions } options - Action menu options.
     * @param { ShowActionMenuCallBack } callback - Callback used to return the action menu
     * response result.
     * @throws { BussnessException } - 100001 - Internal error. Possible causes: Failed to allocate memory.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showActionMenu(option: ActionMenuOptions, callback!: ShowActionMenuCallBack = defaultCallback) {
        unsafe {
            let cOption = parseActionMenuOptions(option)
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<BusinessException>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<BusinessException>.Some(BusinessException(code, "")), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
            FfiPromptShowActionMenuWithOption(cOption, lambdaData.getID())
            cOption.title.free()
            DestoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }
}
