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

package ohos.prompt_action

import ohos.base.*
import ohos.ffi.*
import ohos.component.*
import ohos.image.*
import ohos.labels.APILevel

@C
struct CButtonInfo {
    CButtonInfo(
        let text: CString,
        let textColor: UInt32,
        let primary: Bool
    ) {}
}

@C
struct NativeBaseDialogOptions {
    NativeBaseDialogOptions(
        let maskRect: NativeRectangle,
        let alignment: Int32,
        let offset: NativeOffset,
        let isModal: Bool,
        let showInSubWindow: Bool
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
struct NativeEdgeStyles {
    NativeEdgeStyles(
        let top: Int32,
        let right: Int32,
        let bottom: Int32,
        let left: Int32
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

    func FfiPromptOpenCustomDialog(builder: Int64, options: NativeBaseDialogOptions, callBack: Int64): Unit

    func FfiPromptCloseCustomDialog(id: Int32): Unit

    func FfiPromptShowToastWithOption(options: NativeShowToastOptions): Unit

    func FfiPromptShowDialogWithOption(options: NativeShowDialogOptions, callBack: Int64): Unit

    func FfiPromptShowActionMenuWithOption(options: NativeActionMenuOptions, callBack: Int64): Unit

    func FfiPromptOpenCustomDialogWithOption(options: NativeCustomDialogOptions, callBack: Int64): Unit

    func free(cptr: CPointer<Unit>): Unit
}

public type ShowDialogCallBack = AsyncCallback<Int32>

public type ShowActionMenuCallBack = AsyncCallback<Int32>

@!APILevel[
    12,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonInfo {
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let text: String
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let color: UInt32
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let primary: Bool

    /**
     * Constructs a menu item button in a menu.
     *
     * @param text: Button text content.
     * @param color: Button text color.
     * @since 11
     */
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(text: String, color: UInt32, primary!: Bool = false) {
        this.text = text
        this.color = Color.alphaAdapt(color)
        this.primary = primary
    }

    /**
     * Constructs a menu item button in a menu.
     *
     * @param text: Button text content.
     * @param color: Button text color.
     * @since 11
     */
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(text: String, color: Color, primary!: Bool = false) {
        this.text = text
        this.color = color.toUInt32()
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
            let text = LibC.mallocCString(buttons[i].text)
            let color = Color.alphaAdapt(buttons[i].color)
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShadowStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_XS
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_SM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_MD
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_LG
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_FLOATING_SM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_FLOATING_MD
    | ...

    func getValue(): Int32 {
        match (this) {
            case OUTER_DEFAULT_XS => 0
            case OUTER_DEFAULT_SM => 1
            case OUTER_DEFAULT_MD => 2
            case OUTER_DEFAULT_LG => 3
            case OUTER_FLOATING_SM => 4
            case OUTER_FLOATING_MD => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ToastShowMode {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopMost
    | ...

    func getValue(): Int32 {
        match (this) {
            case Default => 0
            case TopMost => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeStyles {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: BorderStyle
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: BorderStyle
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: BorderStyle
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: BorderStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(top!: BorderStyle = BorderStyle.Solid, right!: BorderStyle = BorderStyle.Solid,
        bottom!: BorderStyle = BorderStyle.Solid, left!: BorderStyle = BorderStyle.Solid) {
        this.top = top
        this.right = right
        this.bottom = bottom
        this.left = left
    }

    func toCEdgeStyles(): NativeEdgeStyles {
        return NativeEdgeStyles(top.getValue(), right.getValue(), bottom.getValue(), left.getValue())
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeColor {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Color
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Color
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Color
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Color
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(top!: Color = Color.BLACK, right!: Color = Color.BLACK, bottom!: Color = Color.BLACK,
        left!: Color = Color.BLACK) {
        this.top = top
        this.right = right
        this.bottom = bottom
        this.left = left
    }

    func toCEdgeColor(): NativeEdgeColor {
        return NativeEdgeColor(top.toUInt32(), right.toUInt32(), bottom.toUInt32(), left.toUInt32())
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum HoverModeAreaType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP_SCREEN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM_SCREEN
    | ...

    func getValue(): Int32 {
        match (this) {
            case TOP_SCREEN => 0
            case BOTTOM_SCREEN => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeyboardAvoidMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | ...

    func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case NONE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BaseDialogOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent)
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: DialogAlignment = DialogAlignment.Default
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Offset = Offset(0.vp, 0.vp)
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Bool = true
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool = false
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool = true
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: Color = Color(0x33000000)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: TransitionEffect = TransitionEffect.OPACITY
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidAppear: () -> Unit = {=>}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidDisappear: () -> Unit = {=>}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillAppear: () -> Unit = {=>}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDisappear: () -> Unit = {=>}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyboardAvoidMode: KeyboardAvoidMode = KeyboardAvoidMode.DEFAULT
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableHoverMode: Bool = false
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hoverModeArea: HoverModeAreaType = HoverModeAreaType.BOTTOM_SCREEN

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false
    ) {
        this.maskRect = maskRect
        this.alignment = alignment
        this.offset = offset
        this.isModal = isModal
        this.showInSubWindow = showInSubWindow
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false,
        autoCancel!: Bool, //5.1
        maskColor!: Color = Color(0x33000000),
        transition!: TransitionEffect = TransitionEffect.OPACITY,
        onDidAppear!: () -> Unit = {=>},
        onDidDisappear!: () -> Unit = {=>},
        onWillAppear!: () -> Unit = {=>},
        onWillDisappear!: () -> Unit = {=>},
        keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.DEFAULT,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BOTTOM_SCREEN
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogOptions <: BaseDialogOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: () -> Unit = {=>}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: UInt32 = Color.TRANSPARENT.toUInt32()
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
        bottomRight: 32.vp)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: EdgeWidths = EdgeWidths()
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: EdgeColor = EdgeColor()
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: Option<BorderStyle> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderEdgeStyle: Option<EdgeStyles> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length = 400.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Length = 100.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowOption: Option<ShadowOptions> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowStyle: Option<ShadowStyle> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false,
        builder!: () -> Unit
    ) {
        super(
            maskRect: maskRect,
            alignment: alignment,
            offset: offset,
            isModal: isModal,
            showInSubWindow: showInSubWindow
        )
        this.builder = builder
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        isModal!: Bool = true,
        showInSubWindow!: Bool = false,
        builder!: () -> Unit,
        autoCancel!: Bool, // 5.1 start
        maskColor!: Color = Color(0x33000000),
        transition!: TransitionEffect = TransitionEffect.OPACITY,
        onDidAppear!: () -> Unit = {=>},
        onDidDisappear!: () -> Unit = {=>},
        onWillAppear!: () -> Unit = {=>},
        onWillDisappear!: () -> Unit = {=>},
        keyboardAvoidMode!: KeyboardAvoidMode = KeyboardAvoidMode.DEFAULT,
        enableHoverMode!: Bool = false,
        hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BOTTOM_SCREEN,
        backgroundColor!: Color = Color.TRANSPARENT,
        cornerRadius!: BorderRadiuses = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        borderWidth!: EdgeWidths = EdgeWidths(top: 0.vp, right: 0.vp, bottom: 0.vp, left: 0.vp),
        borderColor!: EdgeColor = EdgeColor(top: Color.BLACK, right: Color.BLACK, bottom: Color.BLACK, left: Color.BLACK),
        borderStyle!: Option<BorderStyle> = Option.None,
        borderEdgeStyle!: Option<EdgeStyles> = Option.None,
        width!: Length = 400.vp,
        height!: Length = 100.vp,
        shadowOption!: Option<ShadowOptions> = Option.None,
        shadowStyle!: Option<ShadowStyle> = Option.None,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
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
        this.backgroundColor = backgroundColor.toUInt32()
        this.cornerRadius = cornerRadius
        this.borderWidth = borderWidth
        this.borderColor = borderColor
        this.borderStyle = borderStyle
        this.borderEdgeStyle = borderEdgeStyle
        this.width = width
        this.height = height
        this.shadowOption = shadowOption
        this.shadowStyle = shadowStyle
        this.backgroundBlurStyle = backgroundBlurStyle
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ShowDialogOptions {
    let buttonsSize: UInt32

    public ShowDialogOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let title!: String = '',
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let message!: String = '',
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let buttons!: Array<ButtonInfo> = [ButtonInfo("button", Color(0x31463146))],
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let alignment!: DialogAlignment = DialogAlignment.Default,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let offset!: Offset = Offset(0.vp, 0.vp),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let maskRect!: Rectangle = Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let showInSubWindow!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let isModal!: Bool = true,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let backgroundColor!: Color = Color.TRANSPARENT,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let shadowOption!: Option<ShadowOptions> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let shadowStyle!: Option<ShadowStyle> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let enableHoverMode!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BOTTOM_SCREEN
    ) {
        this.buttonsSize = UInt32(buttons.size)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ActionMenuOptions {
    let buttonsSize: UInt32

    public ActionMenuOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let title!: String = '',
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let buttons!: Array<ButtonInfo>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let showInSubWindow!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let isModal!: Bool = true
    ) {
        this.buttonsSize = UInt32(buttons.size)
    }
}

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShowToastOptions {
    public ShowToastOptions(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let message!: String = 'ShowToast',
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let duration!: UInt32 = 1500,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let bottom!: String = '80vp',
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let showMode!: ToastShowMode = ToastShowMode.Default,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let alignment!: Alignment = Alignment.Bottom,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let offset!: Offset = Offset(0.vp, 0.vp),
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let backgroundColor!: Color = Color.TRANSPARENT,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let textColor!: Color = Color.BLACK,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let shadowOption!: Option<ShadowOptions> = Option.None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let shadowStyle!: Option<ShadowStyle> = Option.None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let enableHoverMode!: Bool = false,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let hoverModeArea!: HoverModeAreaType = HoverModeAreaType.BOTTOM_SCREEN
    ) {}
}

func parseShadowOptions(shadowOptions: ShadowOptions): NativeShadowOptions {
    return NativeShadowOptions(
        shadowOptions.radius,
        shadowOptions.shadowType,
        shadowOptions.color,
        shadowOptions.offsetX,
        shadowOptions.offsetY,
        shadowOptions.fill
    )
}

func parseBorderRadiuses(borderRadiuses: BorderRadiuses): CBorderRadiuses {
    return CBorderRadiuses(
        borderRadiuses.topLeft,
        borderRadiuses.topRight,
        borderRadiuses.bottomLeft,
        borderRadiuses.bottomRight
    )
}

func parseEdgeWidths(edgeWidths: EdgeWidths): CJEdge {
    return CJEdge(
        edgeWidths.top,
        edgeWidths.right,
        edgeWidths.bottom,
        edgeWidths.left
    )
}

func parseOffset(offset: Offset): NativeOffset {
    return NativeOffset(
        NativeLength(
            offset.dx.value,
            offset.dx.unitType.getValue()
        ),
        NativeLength(
            offset.dy.value,
            offset.dy.unitType.getValue()
        )
    )
}

func parseRectangle(rectangle: Rectangle): NativeRectangle {
    return NativeRectangle(
        rectangle.x.value,
        rectangle.x.unitType.getValue(),
        rectangle.y.value,
        rectangle.y.unitType.getValue(),
        rectangle.width.value,
        rectangle.width.unitType.getValue(),
        rectangle.height.value,
        rectangle.height.unitType.getValue()
    )
}

func parseCustomDialogOptions(options: CustomDialogOptions): NativeCustomDialogOptions {
    let borderEdgeStyle = match (options.borderEdgeStyle) {
        case Some(edge) => edge.toCEdgeStyles()
        case None => match (options.borderStyle) {
            case Some(value) => EdgeStyles(top: value, right: value, bottom: value, left: value).toCEdgeStyles()
            case None => EdgeStyles(top: BorderStyle.Solid, right: BorderStyle.Solid, bottom: BorderStyle.Solid,
                left: BorderStyle.Solid).toCEdgeStyles()
        }
    }
    let shadowOption = match (options.shadowOption) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions())
    }
    let shadowStyle = match (options.shadowStyle) {
        case Some(value) => value.getValue()
        case None => Int32(100)
    }
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
        options.backgroundColor,
        parseBorderRadiuses(options.cornerRadius),
        parseEdgeWidths(options.borderWidth),
        options.borderColor.toCEdgeColor(),
        borderEdgeStyle,
        options.width.value,
        options.width.unitType.getValue(),
        options.height.value,
        options.height.unitType.getValue(),
        shadowOption,
        shadowStyle,
        options.backgroundBlurStyle.getValue()
    )
}

func parseBaseDialogOptions(options: CustomDialogOptions): NativeBaseDialogOptions {
    return NativeBaseDialogOptions(
        parseRectangle(options.maskRect),
        options.alignment.getValue(),
        parseOffset(options.offset),
        options.isModal,
        options.showInSubWindow
    )
}

func parseShowToastOptions(options: ShowToastOptions): NativeShowToastOptions {
    let shadowOption = match (options.shadowOption) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions())
    }
    let shadowStyle = match (options.shadowStyle) {
        case Some(value) => value.getValue()
        case None => Int32(100)
    }
    unsafe {
        return NativeShowToastOptions(
            LibC.mallocCString(options.message),
            options.duration,
            LibC.mallocCString(options.bottom),
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
            => IllegalArgumentException("Fail to create buttons")
        })
    let shadowOption = match (options.shadowOption) {
        case Some(value) => parseShadowOptions(value)
        case None => parseShadowOptions(ShadowOptions())
    }
    let shadowStyle = match (options.shadowStyle) {
        case Some(value) => value.getValue()
        case None => Int32(100)
    }
    unsafe {
        return NativeShowDialogOptions(
            LibC.mallocCString(options.title),
            LibC.mallocCString(options.message),
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
            => IllegalArgumentException("Fail to create buttons")
        })
    unsafe {
        return NativeActionMenuOptions(
            LibC.mallocCString(options.title),
            pButtons,
            options.buttonsSize,
            options.showInSubWindow,
            options.isModal
        )
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PromptAction {
    private static let defaultCallback = {_: Option<AsyncError>, _: Option<Int32> =>}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func showToast(message!: String, duration!: Int32 = 1500, bottom!: String = "80vp",
        showMode!: ToastShowMode = ToastShowMode.Default): Unit {
        unsafe {
            let cmessage = LibC.mallocCString(message)
            let cbottom = LibC.mallocCString(bottom)
            FfiPromptShowToast(cmessage, duration, cbottom, showMode.getValue())
            cmessage.free()
            cbottom.free()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func showDialog(title!: String = "", message!: String = "", buttons!: Array<ButtonInfo>,
        callback!: ShowDialogCallBack = defaultCallback) {
        unsafe {
            let ctitle = LibC.mallocCString(title)
            let cmessage = LibC.mallocCString(message)
            let size = buttons.size
            var pButtons: CPointer<CButtonInfo> = CreateCButtons(buttons).getOrThrow(
                {
                    =>
                    ctitle.free()
                    cmessage.free()
                    IllegalArgumentException("Fail to create buttons")
                }
            )
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<AsyncError>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<AsyncError>.Some(AsyncError(code)), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper);

            FfiPromptShowDialog(ctitle, cmessage, Int32(size), pButtons, lambdaData.getID())
            ctitle.free()
            cmessage.free()
            DestoryCButtons(pButtons, size)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func showActionMenu(title!: String = "", buttons!: Array<ButtonInfo>,
        callback!: ShowActionMenuCallBack = defaultCallback) {
        unsafe {
            let ctitle = LibC.mallocCString(title)
            let size = buttons.size
            var pButtons: CPointer<CButtonInfo> = CreateCButtons(buttons).getOrThrow(
                {
                    =>
                    ctitle.free()
                    IllegalArgumentException("Fail to create buttons")
                }
            )
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<AsyncError>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<AsyncError>.Some(AsyncError(code)), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper);
            FfiPromptShowActionMenu(ctitle, Int32(size), pButtons, lambdaData.getID())
            ctitle.free()
            DestoryCButtons(pButtons, size)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func openCustomDialog(options: CustomDialogOptions, callBack: (Int32) -> Unit): Unit {
        let builder = Callback0Param<Unit>(options.builder)
        let baseOptions = parseBaseDialogOptions(options)
        let callBackLambda = Callback1Param<Int32, Unit>(callBack)
        unsafe {
            FfiPromptOpenCustomDialog(builder.getID(), baseOptions, callBackLambda.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func openCustomDialogWithOption(options: CustomDialogOptions, callBack: (Int32) -> Unit): Unit {
        let cOptions = parseCustomDialogOptions(options)
        let callBackLambda = Callback1Param<Int32, Unit>(callBack)
        unsafe {
            FfiPromptOpenCustomDialogWithOption(cOptions, callBackLambda.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func closeCustomDialog(dialogId: Int32): Unit {
        unsafe {
            FfiPromptCloseCustomDialog(dialogId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func showToast(option: ShowToastOptions): Unit {
        unsafe {
            let cOption = parseShowToastOptions(option)
            FfiPromptShowToastWithOption(cOption)
            cOption.message.free()
            cOption.bottom.free()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func showDialog(option: ShowDialogOptions, callback!: ShowDialogCallBack = defaultCallback) {
        unsafe {
            let cOption = parseShowDialogOptions(option);
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<AsyncError>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<AsyncError>.Some(AsyncError(code)), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper);

            FfiPromptShowDialogWithOption(cOption, lambdaData.getID())
            cOption.title.free()
            cOption.message.free()
            DestoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func showActionMenu(option: ActionMenuOptions, callback!: ShowActionMenuCallBack = defaultCallback) {
        unsafe {
            let cOption = parseActionMenuOptions(option);
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<AsyncError>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<AsyncError>.Some(AsyncError(code)), Option<Int32>.None)
                }
            }
            let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper);
            FfiPromptShowActionMenuWithOption(cOption, lambdaData.getID())
            cOption.title.free()
            DestoryCButtons(cOption.buttons, Int64(cOption.buttonsSize))
        }
    }
}
