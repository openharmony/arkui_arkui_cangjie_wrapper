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

package ohos.arkui.ui_context

import ohos.base.{ResourceColor, Length, ResourceStr, Color, NativeOffset, LengthProp, CStringExtend, NativeLength, LengthUnit}
import ohos.business_exception.{BusinessException, AsyncCallback}
import ohos.ffi.{Callback1Param, Callback2Param, Callback0Param}
import ohos.arkui.component.native_struct.{NativeEdgeStyles}
import ohos.arkui.component.native_struct.{CJEdge, NativeRectangle}
import ohos.arkui.component.util.{transResourceStrToString, transAppResourceToResourceColor, transAppResourceToLength}
import ohos.arkui.component.common.{Rectangle, DialogAlignment, Offset, TransitionEffect, BorderRadiuses, EdgeWidths, EdgeStyles, ShadowOptions, BlurStyle, Alignment, ShadowType}
import ohos.labels.APILevel
import std.deriving.Derive

const SHADOW_NONE: Int32 = 1000
const SHADOWOPTIONS_EXIST: Int32 = 1001

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
struct NativeCustomDialogOptionsV2 {
    NativeCustomDialogOptionsV2(
        let maskRect: NativeRectangle,
        let alignment: Int32,
        let offset: NativeOffset,
        let isModal: Bool,
        let showInSubWindow: Bool,
        let autoCancel: Bool,
        let maskColor: UInt32,
        let transition: Int64,
        let hasTransition: Bool,
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
        let hasHeight: Bool,
        let shadowOption: NativeShadowOptions,
        let shadowStyle: Int32,
        let backgroundBlurStyle: Int32,
        let levelMode: Int32
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
        let duration: Int32,
        let bottom: CString,
        let showMode: Int32,
        let alignment: Int32,
        let offset: NativeOffset,
        let backgroundColor: UInt32,
        let textColor: UInt32,
        let backgroundBlurStyle: Int32,
        let shadowStyle: Int32,
        let shadowOption: NativeShadowOptions,
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
struct NativeShowDialogOptionsV2 {
    NativeShowDialogOptionsV2(
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
        let hoverModeArea: Int32,
        let levelMode: Int32
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

@C
struct NativeActionMenuOptionsV2 {
    NativeActionMenuOptionsV2(
        let title: CString,
        let buttons: CPointer<CButtonInfo>, // Array<Button>
        let buttonsSize: UInt32,
        let showInSubWindow: Bool,
        let isModal: Bool,
        let levelMode: Int32
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

    func FfiPromptShowToastWithOptionV2(options: NativeShowToastOptions): Unit

    func FfiPromptShowDialogWithOption(options: NativeShowDialogOptions, callback: Int64): Unit

    func FfiPromptShowActionMenuWithOption(options: NativeActionMenuOptions, callback: Int64): Unit

    func FfiPromptOpenCustomDialogWithOption(options: NativeCustomDialogOptions, callback: Int64): Unit

    func FfiPromptShowDialogWithOptionV2(options: NativeShowDialogOptionsV2, callback: Int64): Unit

    func FfiPromptShowActionMenuWithOptionV2(options: NativeActionMenuOptionsV2, callback: Int64): Unit

    func FfiPromptOpenCustomDialogWithOptionV2(options: NativeCustomDialogOptionsV2, callback: Int64): Unit

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
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonInfo {
    /**
     * The text displayed in the button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var text: ResourceStr

    /**
     * The foreground color of button.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor

    /**
     * Define whether the button responds to Enter/Space key by default.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primary: Bool

    /**
     * Constructs a menu item button in a menu.
     *
     * @param { ResourceStr } text - Button text content.
     * @param { ResourceColor } color - Button text color.
     * @param { Bool } [primary] - Whether the button responds to the Enter/Space key by default.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(text!: ResourceStr, color!: ResourceColor, primary!: Bool = false) {
        this.text = text
        this.color = color
        this.primary = primary
    }
}

func createCButtons(buttons: Array<ButtonInfo>): Option<CPointer<CButtonInfo>> {
    let size = buttons.size
    var pButtons: CPointer<CButtonInfo> = unsafe { FfiPromptMallocButtons(size) }
    if (pButtons.isNull()) {
        return Option<CPointer<CButtonInfo>>.None
    }
    unsafe {
        for (i in 0..size) {
            var text = LibC.mallocCString(transResourceStrToString(buttons[i].text))
            if (text.isNull()) {
                for (j in 0..i) {
                    let prevButton = pButtons.read(j)
                    LibC.free(prevButton.text)
                }
                free(CPointer<Unit>(pButtons))
                return Option<CPointer<CButtonInfo>>.None
            }
            let color = transAppResourceToResourceColor(buttons[i].color)
            let primary = buttons[i].primary
            var cButton = CButtonInfo(text, color, primary)
            pButtons.write(i, cButton)
        }
        Option<CPointer<CButtonInfo>>.Some(pButtons)
    }
}

unsafe func destoryCButtons(pButtons: CPointer<CButtonInfo>, size: Int64) {
    for (i in 0..size) {
        let cButton = pButtons.read(i)
        LibC.free(cButton.text)
    }
    free(CPointer<Unit>(pButtons))
}

/**
 * Enum for the toast showMode.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ToastShowMode {

    /**
     * Toast shows in app.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default

    /**
     * Toast shows at the top.
     */
    | @!APILevel[
        since: "22",
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
 * Define the display mode of all kind of dialog.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "26.0.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LevelMode {
    /**
     * Display above all page levels.
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overlay
    |
    /**
     * Display within the current page.
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Embedded
    | ...

    func getValue(): Int32 {
        match (this) {
            case Overlay => 0
            case Embedded => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Provides a EdgeColor component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeColors {

    /**
     * The top of the EdgeColor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ResourceColor

    /**
     * The right of the EdgeColor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: ResourceColor

    /**
     * The bottom of the EdgeColor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: ResourceColor

    /**
     * The left of the EdgeColor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ResourceColor

    /**
     * EdgeColor constructor
     *
     * @param { ResourceColor } [top]
     * @param { ResourceColor } [right]
     * @param { ResourceColor } [bottom]
     * @param { ResourceColor } [left]
     */
    @!APILevel[
        since: "22",
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum HoverModeAreaType {

    /**
     * TopScreen HoverModeAreaType.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopScreen

    /**
     * BottomScreen HoverModeAreaType.
     */
    | @!APILevel[
        since: "22",
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeyboardAvoidMode {
    /**
     * Default KeyboardAvoidMode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default

    /**
     * None KeyboardAvoidMode.
     */
    | @!APILevel[
        since: "22",
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BaseDialogOptions {

    /**
     * Mask Region of dialog. The size can't exceed the main window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Rectangle

    /**
     * Defines the dialog alignment of the screen.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: DialogAlignment

    /**
     * Defines the dialog offset.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Offset

    /**
     * Whether it is a modal dialog
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Bool
    /**
     * Whether to display in the sub window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool

    /**
     * Allows users to click the mask layer to exit.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool

    /**
     * Defines custom dialog maskColor
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: ResourceColor

    /**
     * Transition parameters of opening/closing custom dialog.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: TransitionEffect

    /**
     * Callback function when the dialog appears.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidAppear: () -> Unit

    /**
     * Callback function when the dialog disappears.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidDisappear: () -> Unit

    /**
     * Callback function before the dialog openAnimation starts.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillAppear: () -> Unit

    /**
     * Callback function before the dialog closeAnimation starts.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDisappear: () -> Unit

    /**
     * Defines the customDialog's keyboard avoid mode
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyboardAvoidMode: KeyboardAvoidMode

    /**
     * Defines whether to respond to the hover mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: Bool

    /**
     * Defines the dialog's display area in hover mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: HoverModeAreaType

    /**
     * BaseDialogOptions constructor
     *
     * @param { Rectangle } [maskRect]
     * @param { DialogAlignment } [alignment]
     * @param { Offset } [offset]
     * @param { Bool } [isModal]
     * @param { Bool } [showInSubWindow]
     * @param { Bool } [autoCancel]
     * @param { ResourceColor } [maskColor]
     * @param { TransitionEffect } [transition]
     * @param { function } [onDidAppear]
     * @param { function } [onDidDisappear]
     * @param { function } [onWillAppear]
     * @param { function } [onWillDisappear]
     * @param { KeyboardAvoidMode } [keyboardAvoidMode]
     * @param { Bool } [enableHoverMode]
     * @param { HoverModeAreaType } [hoverModeArea]
     */
    @!APILevel[
        since: "22",
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogOptions <: BaseDialogOptions {

    /**
     * Allow developer custom dialog's content.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: () -> Unit

    /**
     * Defines the custom dialog's background color.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor

    /**
     * Defines the custom dialog's corner radius.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: BorderRadiuses

    /**
     * Defines the custom dialog's border width.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: EdgeWidths

    /**
     * Defines the custom dialog's border color.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: EdgeColors

    /**
     * Defines the custom dialog's border style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: EdgeStyles

    /**
     * Defines the dialog's width.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length

    /**
     * Defines the dialog's height.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Length

    /**
     * Defines the dialog's shadow.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions

    /**
     * Defines the dialog's background blur Style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle

    /**
     * Dialog constructor.
     *
     * @param { function } builder
     * @param { Rectangle } [maskRect]
     * @param { DialogAlignment } [alignment]
     * @param { Offset } [offset]
     * @param { Bool } [isModal]
     * @param { Bool } [showInSubWindow]
     * @param { Bool } [autoCancel]
     * @param { ResourceColor } [maskColor]
     * @param { TransitionEffect } [transition]
     * @param { function } [onDidAppear]
     * @param { function } [onDidDisappear]
     * @param { function } [onWillAppear]
     * @param { function } [onWillDisappear]
     * @param { KeyboardAvoidMode } [keyboardAvoidMode]
     * @param { Bool } [enableHoverMode]
     * @param { HoverModeAreaType } [hoverModeArea]
     * @param { ResourceColor } [backgroundColor]
     * @param { BorderRadiuses } [cornerRadius]
     * @param { EdgeWidths } [borderWidth]
     * @param { EdgeColors } [borderColor]
     * @param { EdgeStyles } [borderStyle]
     * @param { Length } [width]
     * @param { Length } [height]
     * @param { ShadowOptions } [shadow]
     * @param { BlurStyle } [backgroundBlurStyle]
     */
    @!APILevel[
        since: "22",
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ShowDialogOptions {
    let buttonsSize: UInt32

    /**
     * Title of the text to display.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ResourceStr

    /**
     * Text body.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ResourceStr

    /**
     * Array of buttons in the dialog box.
     * More than one buttons are supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: Array<ButtonInfo>

    /**
     * Defines the dialog alignment of the screen.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: DialogAlignment

    /**
     * Defines the dialog offset.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Offset

    /**
     * Mask Region of dialog. The size can't exceed the main window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Rectangle

    /**
     * Whether to display in the sub window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool

    /**
     * Whether it is a modal dialog.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Bool

    /**
     * Defines the dialog's background color.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor

    /**
     * Defines the dialog's background blur Style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle

    /**
     * Defines the dialog's shadow option.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions

   /**
     * Defines whether to respond to the hover mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: Bool

    /**
     * Defines the dialog's display area in hover mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: HoverModeAreaType

    /**
     * Dialog's show options constructor.
     *
     * @param { ResourceStr } [title]
     * @param { ResourceStr } [message]
     * @param { Array<ButtonInfo> } [buttons]
     * @param { DialogAlignment } [alignment]
     * @param { Offset } [offset]
     * @param { Rectangle } [maskRect]
     * @param { Bool } [showInSubWindow]
     * @param { Bool } [isModal]
     * @param { Color } [backgroundColor]
     * @param { BlurStyle } [backgroundBlurStyle]
     * @param { ShadowOptions } [shadow]
     * @param { Bool } [enableHoverMode]
     * @param { HoverModeAreaType } [hoverModeArea]
     */
    @!APILevel[
        since: "22",
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ActionMenuOptions {
    let buttonsSize: UInt32

    /**
     * Title of the text to display.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ResourceStr

    /**
     * Array of buttons in the dialog box.
     * One to six buttons are supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: Array<ButtonInfo>

    /**
     * Whether to display in the sub window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool

    /**
     * Whether it is a modal dialog.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Bool

    /**
     * Menu's Action options constructor.
     *
     * @param { ResourceStr } [title]
     * @param { Array<ButtonInfo> } [buttons]
     * @param { Bool } [showInSubWindow]
     * @param { Bool } [isModal]
     */
    @!APILevel[
        since: "22",
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShowToastOptions {

    /**
     * Text to display.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ResourceStr

    /**
     * Duration of toast dialog box.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: UInt32

    /**
     * The distance between toast dialog box and the bottom of screen.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Length

    /**
     * Determine the show mode of the toast.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showMode: ToastShowMode

    /**
     * Defines the toast alignment of the screen.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: Alignment

    /**
     * Defines the toast offset.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Offset

    /**
     * Background color of toast.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor

    /**
     * Text color of toast.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textColor: ResourceColor

    /**
     * Background blur Style of toast.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle

    /**
     * Shadow of toast's option.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions = None

    /**
     * Define whether to respond to the hover mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: Bool

    /**
     * Defines the toast's display area in hover mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: HoverModeAreaType

    /**
     * Toast's show options constructor.
     *
     * @param { ResourceStr } message
     * @param { UInt32 } [duration]
     * @param { Length } [bottom]
     * @param { ToastShowMode } [showMode]
     * @param { Alignment } [alignment]
     * @param { Offset } [offset]
     * @param { Color } [backgroundColor]
     * @param { Color } [textColor]
     * @param { BlurStyle } [backgroundBlurStyle]
     * @param { ShadowOptions } [shadow]
     * @param { Bool } [enableHoverMode]
     * @param { HoverModeAreaType } [hoverModeArea]
     */
    @!APILevel[
        since: "22",
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

protected class BaseDialogConfigInner {
    protected var maskRect: ?Rectangle
    protected var alignment: ?DialogAlignment
    protected var offset: ?Offset
    protected var isModal: ?Bool
    protected var showInSubWindow: ?Bool
    protected var autoCancel: ?Bool
    protected var maskColor: ?ResourceColor
    protected var transition: ?TransitionEffect
    protected var onDidAppear: ?() -> Unit
    protected var onDidDisappear: ?() -> Unit
    protected var onWillAppear: ?() -> Unit
    protected var onWillDisappear: ?() -> Unit
    protected var keyboardAvoidMode: ?KeyboardAvoidMode
    protected var enableHoverMode: ?Bool
    protected var hoverModeArea: ?HoverModeAreaType
    protected var levelMode: ?LevelMode

    protected init(
        maskRect!: ?Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: ?DialogAlignment = DialogAlignment.Default,
        offset!: ?Offset = Offset(0.vp, 0.vp),
        isModal!: ?Bool = true,
        showInSubWindow!: ?Bool = false,
        autoCancel!: ?Bool = true,
        maskColor!: ?ResourceColor = Color(0x33000000),
        transition!: ?TransitionEffect = TransitionEffect.OPACITY,
        onDidAppear!: ?() -> Unit = {=>},
        onDidDisappear!: ?() -> Unit = {=>},
        onWillAppear!: ?() -> Unit = {=>},
        onWillDisappear!: ?() -> Unit = {=>},
        keyboardAvoidMode!: ?KeyboardAvoidMode = KeyboardAvoidMode.Default,
        enableHoverMode!: ?Bool = false,
        hoverModeArea!: ?HoverModeAreaType = HoverModeAreaType.BottomScreen,
        levelMode!: ?LevelMode = LevelMode.Overlay
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
        this.levelMode = levelMode
    }
}

/**
 * Dialog base options
 *
 */
@!APILevel[
    since: "26.0.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BaseDialogConfig {
    var innerConfig_: BaseDialogConfigInner

    /**
     * Mask Region of dialog. The size can't exceed the main window.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop maskRect: ?Rectangle {
        get() {
            return this.innerConfig_.maskRect
        }
        set(value) {
            this.innerConfig_.maskRect = value
        }
    }

    /**
     * Defines the dialog alignment of the screen.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop alignment: ?DialogAlignment {
        get() {
            return this.innerConfig_.alignment
        }
        set(value) {
            this.innerConfig_.alignment = value
        }
    }

    /**
     * Defines the dialog offset.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop offset: ?Offset {
        get() {
            return this.innerConfig_.offset
        }
        set(value) {
            this.innerConfig_.offset = value
        }
    }

    /**
     * Whether it is a modal dialog
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop isModal: ?Bool {
        get() {
            return this.innerConfig_.isModal
        }
        set(value) {
            this.innerConfig_.isModal = value
        }
    }
    /**
     * Whether to display in the sub window.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop showInSubWindow: ?Bool {
        get() {
            return this.innerConfig_.showInSubWindow
        }
        set(value) {
            this.innerConfig_.showInSubWindow = value
        }
    }

    /**
     * Allows users to click the mask layer to exit.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop autoCancel: ?Bool {
        get() {
            return this.innerConfig_.autoCancel
        }
        set(value) {
            this.innerConfig_.autoCancel = value
        }
    }

    /**
     * Defines custom dialog maskColor
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop maskColor: ?ResourceColor {
        get() {
            return this.innerConfig_.maskColor
        }
        set(value) {
            this.innerConfig_.maskColor = value
        }
    }

    /**
     * Transition parameters of opening/closing custom dialog.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop transition: ?TransitionEffect {
        get() {
            return this.innerConfig_.transition
        }
        set(value) {
            this.innerConfig_.transition = value
        }
    }

    /**
     * Callback function when the dialog appears.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onDidAppear: ?() -> Unit {
        get() {
            return this.innerConfig_.onDidAppear
        }
        set(value) {
            this.innerConfig_.onDidAppear = value
        }
    }

    /**
     * Callback function when the dialog disappears.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onDidDisappear: ?() -> Unit {
        get() {
            return this.innerConfig_.onDidDisappear
        }
        set(value) {
            this.innerConfig_.onDidDisappear = value
        }
    }

    /**
     * Callback function before the dialog openAnimation starts.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onWillAppear: ?() -> Unit {
        get() {
            return this.innerConfig_.onWillAppear
        }
        set(value) {
            this.innerConfig_.onWillAppear = value
        }
    }

    /**
     * Callback function before the dialog closeAnimation starts.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onWillDisappear: ?() -> Unit {
        get() {
            return this.innerConfig_.onWillDisappear
        }
        set(value) {
            this.innerConfig_.onWillDisappear = value
        }
    }

    /**
     * Defines the customDialog's keyboard avoid mode
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop keyboardAvoidMode: ?KeyboardAvoidMode {
        get() {
            return this.innerConfig_.keyboardAvoidMode
        }
        set(value) {
            this.innerConfig_.keyboardAvoidMode = value
        }
    }

    /**
     * Defines whether to respond to the hover mode.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop enableHoverMode: ?Bool {
        get() {
            return this.innerConfig_.enableHoverMode
        }
        set(value) {
            this.innerConfig_.enableHoverMode = value
        }
    }

    /**
     * Defines the dialog's display area in hover mode.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop hoverModeArea: ?HoverModeAreaType {
        get() {
            return this.innerConfig_.hoverModeArea
        }
        set(value) {
            this.innerConfig_.hoverModeArea = value
        }
    }

    /**
     * Determine the display level of the dialog.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop levelMode: ?LevelMode {
        get() {
            return this.innerConfig_.levelMode
        }
        set(value) {
            this.innerConfig_.levelMode = value
        }
    }
    
    /**
     * BaseDialogOptions constructor
     *
     * @param { ?Rectangle } [maskRect]
     * @param { ?DialogAlignment } [alignment]
     * @param { ?Offset } [offset]
     * @param { ?Bool } [isModal]
     * @param { ?Bool } [showInSubWindow]
     * @param { ?Bool } [autoCancel]
     * @param { ?ResourceColor } [maskColor]
     * @param { ?TransitionEffect } [transition]
     * @param { ?() -> Unit } [onDidAppear]
     * @param { ?() -> Unit } [onDidDisappear]
     * @param { ?() -> Unit } [onWillAppear]
     * @param { ?() -> Unit } [onWillDisappear]
     * @param { ?KeyboardAvoidMode } [keyboardAvoidMode]
     * @param { ?Bool } [enableHoverMode]
     * @param { ?HoverModeAreaType } [hoverModeArea]
     * @param { ?LevelMode } [levelMode]
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        maskRect!: ?Rectangle = Option.None,
        alignment!: ?DialogAlignment = Option.None,
        offset!: ?Offset = Option.None,
        isModal!: ?Bool = Option.None,
        showInSubWindow!: ?Bool = Option.None,
        autoCancel!: ?Bool = Option.None,
        maskColor!: ?ResourceColor = Option.None,
        transition!: ?TransitionEffect = Option.None,
        onDidAppear!: ?() -> Unit = Option.None,
        onDidDisappear!: ?() -> Unit = Option.None,
        onWillAppear!: ?() -> Unit = Option.None,
        onWillDisappear!: ?() -> Unit = Option.None,
        keyboardAvoidMode!: ?KeyboardAvoidMode = Option.None,
        enableHoverMode!: ?Bool = Option.None,
        hoverModeArea!: ?HoverModeAreaType = Option.None,
        levelMode!: ?LevelMode = Option.None
    ) {
        this.innerConfig_ = BaseDialogConfigInner(
            maskRect: maskRect ?? Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
            alignment: alignment ?? DialogAlignment.Default,
            offset: offset ?? Offset(0.vp, 0.vp),
            isModal: isModal ?? true,
            showInSubWindow: showInSubWindow ?? false,
            autoCancel: autoCancel ?? true,
            maskColor: maskColor ?? Color(0x33000000),
            transition: transition,
            onDidAppear: onDidAppear ?? {=>},
            onDidDisappear: onDidDisappear ?? {=>},
            onWillAppear: onWillAppear ?? {=>},
            onWillDisappear: onWillDisappear ?? {=>},
            keyboardAvoidMode: keyboardAvoidMode ?? KeyboardAvoidMode.Default,
            enableHoverMode: enableHoverMode ?? false,
            hoverModeArea: hoverModeArea ?? HoverModeAreaType.BottomScreen,
            levelMode: levelMode ?? LevelMode.Overlay
        )
    }
}

/**
 * Dialog's custom content options.
 *
 */
@!APILevel[
    since: "26.0.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogConfig <: BaseDialogConfig {

    /**
     * Allow developer custom dialog's content.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: () -> Unit

    /**
     * Defines the custom dialog's background color.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor

    /**
     * Defines the custom dialog's corner radius.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: ?BorderRadiuses

    /**
     * Defines the custom dialog's border width.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: ?EdgeWidths

    /**
     * Defines the custom dialog's border color.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: ?EdgeColors

    /**
     * Defines the custom dialog's border style.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: ?EdgeStyles

    /**
     * Defines the dialog's width.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length

    /**
     * Defines the dialog's height.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Length

    /**
     * Defines the dialog's shadow.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions

    /**
     * Defines the dialog's background blur Style.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle

    /**
     * Dialog constructor.
     *
     * @param { ?() -> Unit } builder
     * @param { ?Rectangle } [maskRect]
     * @param { ?DialogAlignment } [alignment]
     * @param { ?Offset } [offset]
     * @param { ?Bool } [isModal]
     * @param { ?Bool } [showInSubWindow]
     * @param { ?Bool } [autoCancel]
     * @param { ?ResourceColor } [maskColor]
     * @param { ?TransitionEffect } [transition]
     * @param { ?() -> Unit } [onDidAppear]
     * @param { ?() -> Unit } [onDidDisappear]
     * @param { ?() -> Unit } [onWillAppear]
     * @param { ?() -> Unit } [onWillDisappear]
     * @param { ?KeyboardAvoidMode } [keyboardAvoidMode]
     * @param { ?Bool } [enableHoverMode]
     * @param { ?HoverModeAreaType } [hoverModeArea]
     * @param { ?ResourceColor } [backgroundColor]
     * @param { ?BorderRadiuses } [cornerRadius]
     * @param { ?EdgeWidths } [borderWidth]
     * @param { ?EdgeColors } [borderColor]
     * @param { ?EdgeStyles } [borderStyle]
     * @param { ?Length } [width]
     * @param { ?Length } [height]
     * @param { ?ShadowOptions } [shadow]
     * @param { ?BlurStyle } [backgroundBlurStyle]
     * @param { ?LevelMode } [levelMode]
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        builder!: () -> Unit,
        maskRect!: ?Rectangle = Option.None,
        alignment!: ?DialogAlignment = Option.None,
        offset!: ?Offset = Option.None,
        isModal!: ?Bool = Option.None,
        showInSubWindow!: ?Bool = Option.None,
        autoCancel!: ?Bool = Option.None,
        maskColor!: ?ResourceColor = Option.None,
        transition!: ?TransitionEffect = Option.None,
        onDidAppear!: ?() -> Unit = Option.None,
        onDidDisappear!: ?() -> Unit = Option.None,
        onWillAppear!: ?() -> Unit = Option.None,
        onWillDisappear!: ?() -> Unit = Option.None,
        keyboardAvoidMode!: ?KeyboardAvoidMode = Option.None,
        enableHoverMode!: ?Bool = Option.None,
        hoverModeArea!: ?HoverModeAreaType = Option.None,
        backgroundColor!: ?ResourceColor = Option.None,
        cornerRadius!: ?BorderRadiuses = Option.None,
        borderWidth!: ?EdgeWidths = Option.None,
        borderColor!: ?EdgeColors = Option.None,
        borderStyle!: ?EdgeStyles = Option.None,
        width!: ?Length = Option.None,
        height!: ?Length = Option.None,
        shadow!: ?ShadowOptions = Option.None,
        backgroundBlurStyle!: ?BlurStyle = Option.None,
        levelMode!: ?LevelMode = Option.None
    ) {
        super(
            maskRect: maskRect ?? Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
            alignment: alignment ?? DialogAlignment.Default,
            offset: offset ?? Offset(0.vp, 0.vp),
            isModal: isModal ?? true,
            showInSubWindow: showInSubWindow ?? false,
            autoCancel: autoCancel ?? true,
            maskColor: maskColor ?? Color(0x33000000),
            transition: transition ?? TransitionEffect.OPACITY,
            onDidAppear: onDidAppear ?? {=>},
            onDidDisappear: onDidDisappear ?? {=>},
            onWillAppear: onWillAppear ?? {=>},
            onWillDisappear: onWillDisappear ?? {=>},
            keyboardAvoidMode: keyboardAvoidMode ?? KeyboardAvoidMode.Default,
            enableHoverMode: enableHoverMode ?? false,
            hoverModeArea: hoverModeArea ?? HoverModeAreaType.BottomScreen,
            levelMode: levelMode ?? LevelMode.Overlay
        )
        this.builder = builder
        this.backgroundColor = backgroundColor ?? Color.Transparent
        this.cornerRadius = cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp)
        this.borderWidth = borderWidth ?? EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp)
        this.borderColor = borderColor ?? EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black)
        this.borderStyle = borderStyle ?? EdgeStyles()
        this.width = width ?? 400.vp
        this.height = height
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle ?? BlurStyle.ComponentUltraThick
    }
}

/**
 * Dialog's show options.
 *
 */
@!APILevel[
    since: "26.0.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShowDialogConfig {
    /**
     * Title of the text to display.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ?ResourceStr

    /**
     * Text body.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: ?ResourceStr

    /**
     * Array of buttons in the dialog box.
     * More than one buttons are supported.
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: ?Array<ButtonInfo>

    /**
     * Defines the dialog alignment of the screen.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: ?DialogAlignment

    /**
     * Defines the dialog offset.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Offset

    /**
     * Mask Region of dialog. The size can't exceed the main window.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: ?Rectangle

    /**
     * Whether to display in the sub window.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool

    /**
     * Whether it is a modal dialog.
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: ?Bool

    /**
     * Defines the dialog's background color.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor

    /**
     * Defines the dialog's background blur Style.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle

    /**
     * Defines the dialog's shadow option.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions

   /**
     * Defines whether to respond to the hover mode.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: ?Bool

    /**
     * Defines the dialog's display area in hover mode.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: ?HoverModeAreaType

    /**
     * Defines the dialog's display layer mode.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var levelMode: ?LevelMode

    /**
     * Dialog's show options constructor.
     *
     * @param { ?ResourceStr } [title]
     * @param { ?ResourceStr } [message]
     * @param { ?Array<ButtonInfo> } [buttons]
     * @param { ?DialogAlignment } [alignment]
     * @param { ?Offset } [offset]
     * @param { ?Rectangle } [maskRect]
     * @param { ?Bool } [showInSubWindow]
     * @param { ?Bool } [isModal]
     * @param { ?Color } [backgroundColor]
     * @param { ?BlurStyle } [backgroundBlurStyle]
     * @param { ?ShadowOptions } [shadow]
     * @param { ?Bool } [enableHoverMode]
     * @param { ?HoverModeAreaType } [hoverModeArea]
     * @param { ?levelMode } [LevelMode]
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr = Option.None,
        message!: ?ResourceStr = Option.None,
        buttons!: ?Array<ButtonInfo> = Option.None,
        alignment!: ?DialogAlignment = Option.None,
        offset!: ?Offset = Option.None,
        maskRect!: ?Rectangle = Option.None,
        showInSubWindow!: ?Bool = Option.None,
        isModal!: ?Bool = Option.None,
        backgroundColor!: ?ResourceColor = Option.None,
        backgroundBlurStyle!: ?BlurStyle = Option.None,
        shadow!: ?ShadowOptions = Option.None,
        enableHoverMode!: ?Bool = Option.None,
        hoverModeArea!: ?HoverModeAreaType = Option.None,
        levelMode!: ?LevelMode = Option.None
    ) {
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
        this.levelMode = levelMode
    }
}

/**
 * Menu's Action options.
 *
 */
@!APILevel[
    since: "26.0.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionMenuConfig {
    /**
     * Title of the text to display.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ?ResourceStr

    /**
     * Array of buttons in the dialog box.
     * One to six buttons are supported.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: ?Array<ButtonInfo>

    /**
     * Whether to display in the sub window.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool

    /**
     * Whether it is a modal dialog.
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: ?Bool

    /**
     * Defines the dialog's display layer mode.
     *
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var levelMode: ?LevelMode

    /**
     * Menu's Action options constructor.
     *
     * @param { ?ResourceStr } [title]
     * @param { ?Array<ButtonInfo> } [buttons]
     * @param { ?Bool } [showInSubWindow]
     * @param { ?Bool } [isModal]
     * @param { ?LevelMode } [levelMode]
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title!: ?ResourceStr = Option.None,
        buttons!: ?Array<ButtonInfo> = Option.None,
        showInSubWindow!: ?Bool = Option.None,
        isModal!: ?Bool = Option.None,
        levelMode!: ?LevelMode = Option.None
    ) {
        this.title = title
        this.buttons = buttons
        this.showInSubWindow = showInSubWindow
        this.isModal = isModal
        this.levelMode = levelMode
    }
}

func parseShadowOptions(shadowOptions: ShadowOptions): NativeShadowOptions {
    return NativeShadowOptions(
        shadowOptions.radius ?? -1.0,
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
        case None => parseShadowOptions(ShadowOptions(radius: -1.0, shadowType: ShadowType.Color))
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
            case LengthUnit.Px => "${length.value}px"
            case LengthUnit.Vp => "${length.value}vp"
            case LengthUnit.Fp => "${length.value}fp"
            case LengthUnit.Percent => "${length.value * 100.0}%"       // set percent value same with input
            case LengthUnit.Lpx => "${length.value}lpx"
            case _ => "${length.value}"
        }
}

@OverflowWrapping
func parseShowToastOptions(options: ShowToastOptions): NativeShowToastOptions {
    var shadowStyle = SHADOW_NONE
    let shadowOption = match (options.shadow) {
        case Some(value) =>
            shadowStyle = SHADOWOPTIONS_EXIST
            parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions(radius: -1.0))
    }
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
            Int32(options.duration),
            cBottom,
            options.showMode.getValue(),
            options.alignment.getValue(),
            parseOffset(options.offset),
            options.backgroundColor.toUInt32(),
            Color.alphaAdapt(options.textColor.toUInt32()),
            options.backgroundBlurStyle.getValue(),
            shadowStyle,
            shadowOption,
            options.enableHoverMode,
            options.hoverModeArea.getValue()
        )
    }
}

func parseShowDialogOptions(options: ShowDialogOptions): NativeShowDialogOptions {
    var pButtons: CPointer<CButtonInfo> = createCButtons(options.buttons).getOrThrow(
        {
            => BusinessException(100001, "Fail to create buttons")
        })
    let shadowOption = match (options.shadow) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions(radius: -1.0, shadowType: ShadowType.Color))
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
    var pButtons: CPointer<CButtonInfo> = createCButtons(options.buttons).getOrThrow(
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

func parseCustomDialogConfig(options: CustomDialogConfig): NativeCustomDialogOptionsV2 {
    let borderEdgeStyle = match (options.borderStyle) {
        case Some(value) => value.toNative()
        case None => EdgeStyles().toNative()
    }

    let shadowOption = match (options.shadow) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions(radius: -1.0, shadowType: ShadowType.Color))
    }
    let shadowStyle = Int32(100)
    let widthLength = transAppResourceToLength(options.width ?? 400.vp)
    let heightLength = transAppResourceToLength(options.height ?? 0.vp)
    let cornerRadius = match (options.cornerRadius) {
        case Some(value) => parseBorderRadiuses(value)
        case None => parseBorderRadiuses(BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp))
    }
    let borderWidth = match (options.borderWidth) {
        case Some(value) => parseEdgeWidths(value)
        case None => parseEdgeWidths(EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp))
    }
    let borderColor = match (options.borderColor) {
        case Some(value) => value.toCEdgeColor()
        case None => EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black).toCEdgeColor()
    }
    let backgroundColor = match (options.backgroundColor) {
        case Some(value) => transAppResourceToResourceColor(value)
        case None => Color.Transparent
    }
    let backgroundBlurStyle = match (options.backgroundBlurStyle) {
        case Some(value) => value.getValue()
        case None => BlurStyle.ComponentUltraThick.getValue()
    }
    return NativeCustomDialogOptionsV2(
        parseRectangle(options.maskRect ?? Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent)),
        (options.alignment ?? DialogAlignment.Default).getValue(),
        parseOffset(options.offset ?? Offset(0.vp, 0.vp)),
        options.isModal ?? true,
        options.showInSubWindow ?? false,
        options.autoCancel ?? true,
        (options.maskColor ?? Color(0x33000000)).toUInt32(),
        (options.transition ?.getID() ?? 0),
        options.transition.isSome(),
        Callback0Param<Unit>(options.onDidAppear ?? {=>}).getID(),
        Callback0Param<Unit>(options.onDidDisappear ?? {=>}).getID(),
        Callback0Param<Unit>(options.onWillAppear ?? {=>}).getID(),
        Callback0Param<Unit>(options.onWillDisappear ?? {=>}).getID(),
        (options.keyboardAvoidMode ?? KeyboardAvoidMode.Default).getValue(),
        options.enableHoverMode ?? false,
        (options.hoverModeArea ?? HoverModeAreaType.BottomScreen).getValue(),
        Callback0Param<Unit>(options.builder).getID(),
        transAppResourceToResourceColor((options.backgroundColor ?? Color.Transparent)),
        parseBorderRadiuses(options.cornerRadius ?? BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp)),
        parseEdgeWidths(options.borderWidth ?? EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp)),
        (options.borderColor ?? EdgeColors(top: Color.Black, right: Color.Black, bottom: Color.Black, left: Color.Black)).toCEdgeColor(),
        borderEdgeStyle,
        widthLength.value,
        widthLength.unitType.getValue(),
        heightLength.value,
        heightLength.unitType.getValue(),
        options.height.isSome(),
        shadowOption,
        shadowStyle,
        (options.backgroundBlurStyle ?? BlurStyle.ComponentUltraThick).getValue(),
        (options.levelMode ?? LevelMode.Overlay).getValue()
    )
}

func parseShowDialogConfig(options: ShowDialogConfig): NativeShowDialogOptionsV2 {
    var pButtons: CPointer<CButtonInfo> = createCButtons(options.buttons ?? []) ?? CPointer<CButtonInfo>()
    let shadowOption = match (options.shadow) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions(radius: -1.0, shadowType: ShadowType.Color))
    }
    let shadowStyle = Int32(100)
    let backgroundColor = match (options.backgroundColor) {
        case Some(value) => value.toUInt32()
        case None => Color.Transparent.toUInt32()
    }
    let backgroundBlurStyle = match (options.backgroundBlurStyle) {
        case Some(value) => value.getValue()
        case None => BlurStyle.ComponentUltraThick.getValue()
    }
    let alignment = match (options.alignment) {
        case Some(value) => value.getValue()
        case None => DialogAlignment.Default.getValue()
    }
    let offset = match (options.offset) {
        case Some(value) => parseOffset(value)
        case None => parseOffset(Offset(0.vp, 0.vp))
    }
    let maskRect = match (options.maskRect) {
        case Some(value) => parseRectangle(value)
        case None => parseRectangle(Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent))
    }
    let showInSubWindow = options.showInSubWindow ?? false
    let isModal = options.isModal ?? true
    let enableHoverMode = options.enableHoverMode ?? false
    let hoverModeArea = match (options.hoverModeArea) {
        case Some(value) => value.getValue()
        case None => HoverModeAreaType.BottomScreen.getValue()
    }
    let levelMode = match (options.levelMode) {
        case Some(value) => value.getValue()
        case None => LevelMode.Overlay.getValue()
    }
    unsafe {
        var cTitle = CString(CPointer<UInt8>())
        var cMsg = CString(CPointer<UInt8>())
        try {
            cTitle = LibC.mallocCString(transResourceStrToString(options.title ?? ''))
            cMsg = LibC.mallocCString(transResourceStrToString(options.message ?? ''))
        } catch (e: Exception) {
            LibC.free(cTitle)
            LibC.free(cMsg)
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }
        return NativeShowDialogOptionsV2(
            cTitle,
            cMsg,
            pButtons,
            UInt32((options.buttons ?? []).size),
            alignment,
            offset,
            maskRect,
            showInSubWindow,
            isModal,
            backgroundColor,
            backgroundBlurStyle,
            shadowOption,
            shadowStyle,
            enableHoverMode,
            hoverModeArea,
            levelMode
        )
    }
}

func parseActionMenuConfig(options: ActionMenuConfig): NativeActionMenuOptionsV2 {
    var pButtons: CPointer<CButtonInfo> = createCButtons(options.buttons ?? []) ?? CPointer<CButtonInfo>()
    let showInSubWindow = options.showInSubWindow ?? false
    let isModal = options.isModal ?? true
    let levelMode = match (options.levelMode) {
        case Some(value) => value.getValue()
        case None => LevelMode.Overlay.getValue()
    }
    unsafe {
        let cTitle = LibC.mallocCString(transResourceStrToString(options.title ?? ''))
        return NativeActionMenuOptionsV2(
            cTitle,
            pButtons,
            UInt32((options.buttons ?? []).size),
            showInSubWindow,
            isModal,
            levelMode
        )
    }
}

/**
 * class PromptAction.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PromptAction {
    private var instanceId_: Int64 = 0
    private static let DEFAULT_CALLBACK = {_: Option<BusinessException>, _: Option<Int32> =>}

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
        since: "22",
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
     * Open the custom dialog.
     *
     * isModal = true and showInSubWindow = true cannot be used at the same time.
     *
     * @param { CustomDialogConfig } options - Options.
     * @param { (Int32) -> Unit } callback
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func openCustomDialog(options: CustomDialogConfig, callback: (Int32) -> Unit): Unit {
        let cOptions = parseCustomDialogConfig(options)
        let callBackLambda = Callback1Param<Int32, Unit>(callback)
        unsafe {
            FfiPromptOpenCustomDialogWithOptionV2(cOptions, callBackLambda.getID())
        }
    }

    /**
     * Close the custom dialog.
     *
     * @param { Int32 } dialogId - the dialog id that returned by openCustomDialog.
     */
    @!APILevel[
        since: "22",
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
     * @param { ShowToastOptions } option - Toast options.
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> Failed to allocate memory.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showToast(option: ShowToastOptions): Unit {
        unsafe {
            let cOption = parseShowToastOptions(option)
            FfiPromptShowToastWithOptionV2(cOption)
            cOption.message.free()
            cOption.bottom.free()
        }
    }

    /**
     * Shows a dialog box in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ShowDialogOptions } option - Dialog box options.
     * @param { ShowDialogCallBack } [callback] - Callback used to return the dialog box response result.
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> Failed to allocate memory.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showDialog(option: ShowDialogOptions, callback!: ShowDialogCallBack = DEFAULT_CALLBACK): Unit {
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
            destoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }

    /**
     * Shows a dialog box in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ShowDialogConfig } option - Dialog box options.
     * @param { ShowDialogCallBack } [callback] - Callback used to return the dialog box response result.
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> Failed to allocate memory.
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showDialog(option: ShowDialogConfig, callback!: ShowDialogCallBack = DEFAULT_CALLBACK): Unit {
        unsafe {
            let cOption = parseShowDialogConfig(option)
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<BusinessException>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<BusinessException>.Some(BusinessException(code, "")), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)

            FfiPromptShowDialogWithOptionV2(cOption, lambdaData.getID())
            cOption.title.free()
            cOption.message.free()
            destoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }

    /**
     * Shows an action menu in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ActionMenuOptions } option - Action menu options.
     * @param { ShowActionMenuCallBack } [callback] - Callback used to return the action menu
     * response result.
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> Failed to allocate memory.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showActionMenu(option: ActionMenuOptions, callback!: ShowActionMenuCallBack = DEFAULT_CALLBACK): Unit {
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
            destoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }
    
    /**
     * Shows an action menu in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ActionMenuConfig } option - Action menu options.
     * @param { ShowActionMenuCallBack } [callback] - Callback used to return the action menu
     * response result.
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> Failed to allocate memory.
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showActionMenu(option: ActionMenuConfig, callback!: ShowActionMenuCallBack = DEFAULT_CALLBACK): Unit {
        unsafe {
            let cOption = parseActionMenuConfig(option)
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<BusinessException>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<BusinessException>.Some(BusinessException(code, "")), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
            FfiPromptShowActionMenuWithOptionV2(cOption, lambdaData.getID())
            cOption.title.free()
            destoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }
}
