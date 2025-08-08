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

foreign {
    func FfiOHOSShowAlertDialogParamWithConfirmV2(
        alertDialog: NativeAlertDialogParamV2,
        confirm: NativeAlertDialogButtonOptionsV2
    ): Unit

    func FfiOHOSShowAlertDialogParamWithConfirmShadowStyle(alertDialog: NativeAlertDialogParamV2,
        confirm: NativeAlertDialogButtonOptionsV2, shadowStyle: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithConfirmShadowOptions(alertDialog: NativeAlertDialogParamV2,
        confirm: NativeAlertDialogButtonOptionsV2, shadowOptions: NativeActionSheetShadowOptions): Unit

    func FfiOHOSShowAlertDialogParamWithButtonsV2(alertDialog: NativeAlertDialogParamV2,
        primaryButton: NativeAlertDialogButtonOptionsV2, secondaryButton: NativeAlertDialogButtonOptionsV2): Unit

    func FfiOHOSShowAlertDialogParamWithButtonsShadowStyle(alertDialog: NativeAlertDialogParamV2,
        primaryButton: NativeAlertDialogButtonOptionsV2, secondaryButton: NativeAlertDialogButtonOptionsV2,
        shadowStyle: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithButtonsShadowOptions(alertDialog: NativeAlertDialogParamV2,
        primaryButton: NativeAlertDialogButtonOptionsV2, secondaryButton: NativeAlertDialogButtonOptionsV2,
        shadowOptions: NativeActionSheetShadowOptions): Unit

    func FfiOHOSShowAlertDialogParamWithOptionsV2(alertDialog: NativeAlertDialogParamV2,
        buttons: CArrNativeAlertDialogButtonOptionsV2, buttonDirection: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithOptionsShadowStyle(alertDialog: NativeAlertDialogParamV2,
        buttons: CArrNativeAlertDialogButtonOptionsV2, shadowStyle: Int32, buttonDirection: Int32): Unit

    func FfiOHOSShowAlertDialogParamWithOptionsShadowOptions(alertDialog: NativeAlertDialogParamV2,
        buttons: CArrNativeAlertDialogButtonOptionsV2, shadowOptions: NativeActionSheetShadowOptions,
        buttonDirection: Int32): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialog {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithConfirm): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let nativeConfirm = alertDialog.confirm.toNative()
        unsafe {
            FfiOHOSShowAlertDialogParamWithConfirmV2(nativeDialog, nativeConfirm)
            nativeDialog.free()
            freeButton(nativeConfirm)
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithConfirm, shadow: ActionSheetShadowOptions): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let nativeConfirm = alertDialog.confirm.toNative()
        unsafe {
            FfiOHOSShowAlertDialogParamWithConfirmShadowOptions(nativeDialog, nativeConfirm, shadow.toNative())
            nativeDialog.free()
            freeButton(nativeConfirm)
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithConfirm, shadow: ShadowStyle): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let nativeConfirm = alertDialog.confirm.toNative()
        unsafe {
            FfiOHOSShowAlertDialogParamWithConfirmShadowStyle(nativeDialog, nativeConfirm, shadow.getValue())
            nativeDialog.free()
            freeButton(nativeConfirm)
        }
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithButtons): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let nativePrimaryButton = alertDialog.primaryButton.toNative()
        let nativeSecondaryButton = alertDialog.secondaryButton.toNative()
        unsafe {
            FfiOHOSShowAlertDialogParamWithButtonsV2(nativeDialog, nativePrimaryButton, nativeSecondaryButton)
            nativeDialog.free()
            freeButton(nativePrimaryButton)
            freeButton(nativeSecondaryButton)
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithButtons, shadow: ActionSheetShadowOptions): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let nativePrimaryButton = alertDialog.primaryButton.toNative()
        let nativeSecondaryButton = alertDialog.secondaryButton.toNative()
        unsafe {
            FfiOHOSShowAlertDialogParamWithButtonsShadowOptions(nativeDialog, nativePrimaryButton, nativeSecondaryButton,
                shadow.toNative())
            nativeDialog.free()
            freeButton(nativePrimaryButton)
            freeButton(nativeSecondaryButton)
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithButtons, shadow: ShadowStyle): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let nativePrimaryButton = alertDialog.primaryButton.toNative()
        let nativeSecondaryButton = alertDialog.secondaryButton.toNative()
        unsafe {
            FfiOHOSShowAlertDialogParamWithButtonsShadowStyle(nativeDialog, nativePrimaryButton, nativeSecondaryButton,
                shadow.getValue())
            nativeDialog.free()
            freeButton(nativePrimaryButton)
            freeButton(nativeSecondaryButton)
        }
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithOptions): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let buttons = alertDialog.buttons
        let buttonSize = buttons.size
        let buttonsArr = Array<NativeAlertDialogButtonOptionsV2>(buttonSize, {index => buttons[index].toNative()})
        let arr: CPointer<NativeAlertDialogButtonOptionsV2> = unsafe {
            LibC.malloc<NativeAlertDialogButtonOptionsV2>(count: buttonSize)
        }
        if (arr.isNull()) {
            nativeDialog.free()
            throw IllegalMemoryException("malloc memory")
        }
        for (i in 0..buttonSize) {
            unsafe {
                arr.write(i, buttonsArr[i])
            }
        }
        let nativeButtons = CArrNativeAlertDialogButtonOptionsV2(arr, buttonSize)
        unsafe {
            FfiOHOSShowAlertDialogParamWithOptionsV2(
                nativeDialog,
                nativeButtons,
                alertDialog.buttonDirection.getValue()
            )
            nativeDialog.free()
            freeButtonsArr(nativeButtons)
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithOptions, shadow: ActionSheetShadowOptions): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let buttons = alertDialog.buttons
        let buttonSize = buttons.size
        let buttonsArr = Array<NativeAlertDialogButtonOptionsV2>(buttonSize, {index => buttons[index].toNative()})
        let arr: CPointer<NativeAlertDialogButtonOptionsV2> = unsafe {
            LibC.malloc<NativeAlertDialogButtonOptionsV2>(count: buttonSize)
        }
        if (arr.isNull()) {
            nativeDialog.free()
            throw IllegalMemoryException("malloc memory")
        }
        for (i in 0..buttonSize) {
            unsafe {
                arr.write(i, buttonsArr[i])
            }
        }
        let nativeButtons = CArrNativeAlertDialogButtonOptionsV2(arr, buttonSize)
        unsafe {
            FfiOHOSShowAlertDialogParamWithOptionsShadowOptions(nativeDialog, nativeButtons, shadow.toNative(),
                alertDialog.buttonDirection.getValue())
            nativeDialog.free()
            freeButtonsArr(nativeButtons)
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(alertDialog: AlertDialogParamWithOptions, shadow: ShadowStyle): Unit {
        let nativeDialog = alertDialog.getNativeParam()
        let buttons = alertDialog.buttons
        let buttonSize = buttons.size
        let buttonsArr = Array<NativeAlertDialogButtonOptionsV2>(buttonSize, {index => buttons[index].toNative()})
        let arr: CPointer<NativeAlertDialogButtonOptionsV2> = unsafe {
            LibC.malloc<NativeAlertDialogButtonOptionsV2>(count: buttonSize)
        }
        if (arr.isNull()) {
            nativeDialog.free()
            throw IllegalMemoryException("malloc memory")
        }
        for (i in 0..buttonSize) {
            unsafe {
                arr.write(i, buttonsArr[i])
            }
        }
        let nativeButtons = CArrNativeAlertDialogButtonOptionsV2(arr, buttonSize)
        unsafe {
            FfiOHOSShowAlertDialogParamWithOptionsShadowStyle(nativeDialog, nativeButtons, shadow.getValue(),
                alertDialog.buttonDirection.getValue())
            nativeDialog.free()
            freeButtonsArr(nativeButtons)
        }
        return
    }
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BlurStyle {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thin
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thick
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_THIN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_REGULAR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_THICK
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_ULTRA_THICK
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_ULTRA_THIN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_THIN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_REGULAR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_THICK
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_ULTRA_THICK
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Thin => 1
            case Regular => 2
            case Thick => 3
            case BACKGROUND_THIN => 4
            case BACKGROUND_REGULAR => 5
            case BACKGROUND_THICK => 6
            case BACKGROUND_ULTRA_THICK => 7
            case NONE => 0
            case COMPONENT_ULTRA_THIN => 8
            case COMPONENT_THIN => 9
            case COMPONENT_REGULAR => 10
            case COMPONENT_THICK => 11
            case COMPONENT_ULTRA_THICK => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogButtonDirection {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AUTO
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HORIZONTAL
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    VERTICAL
    | ...

    func getValue(): Int32 {
        match (this) {
            case AUTO => 0
            case HORIZONTAL => 1
            case VERTICAL => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogButtonOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enabled: Bool = true
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var defaultFocus: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: Option<DialogButtonStyle> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String = ""
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: Option<Color> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: Option<Color> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: () -> Unit = {=>}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primary: Bool = false

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        enabled!: Bool = true,
        defaultFocus!: Bool = false,
        style!: Option<DialogButtonStyle> = None,
        value!: String = "",
        fontColor!: Option<Color> = None,
        backgroundColor!: Option<Color> = None,
        action!: () -> Unit = {=>}
    ) {
        this.enabled = enabled
        this.defaultFocus = defaultFocus
        this.style = style
        this.value = value
        this.fontColor = fontColor
        this.backgroundColor = backgroundColor
        this.action = action
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        enabled!: Bool = true,
        defaultFocus!: Bool = false,
        style!: Option<DialogButtonStyle> = None,
        value!: String = "",
        fontColor!: Option<Color> = None,
        backgroundColor!: Option<Color> = None,
        action!: () -> Unit = {=>},
        primary!: Bool
    ) {
        this.primary = primary
        this.enabled = enabled
        this.defaultFocus = defaultFocus
        this.style = style
        this.value = value
        this.fontColor = fontColor
        this.backgroundColor = backgroundColor
        this.action = action
    }

    func toNative(): NativeAlertDialogButtonOptionsV2 {
        let cValue: CString = try {
            unsafe { LibC.mallocCString(value) }
        } catch (e: Exception) {
            throw IllegalMemoryException("malloc memory")
        }

        var cStyle = CPointer<Int32>()
        if (let Some(v) <- style) {
            unsafe {
                cStyle = LibC.malloc<Int32>(count: 1)
                if (cStyle.isNull()) {
                    LibC.free(cValue)
                    throw IllegalMemoryException("malloc memory")
                }
                cStyle.write(v.getValue())
            }
        }
        var cFontColor = CPointer<UInt32>()
        if (let Some(v) <- fontColor) {
            unsafe {
                cFontColor = LibC.malloc<UInt32>(count: 1)
                if (cFontColor.isNull()) {
                    LibC.free(cValue)
                    LibC.free<Int32>(cStyle)
                    throw IllegalMemoryException("malloc memory")
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
                    throw IllegalMemoryException("malloc memory")
                }
                cBackgroundColor.write(v.toUInt32())
            }
        }
        NativeAlertDialogButtonOptionsV2(
            enabled,
            defaultFocus,
            cStyle,
            cValue,
            cFontColor,
            cBackgroundColor,
            Callback0Param<Unit>(action).getID(),
            primary
        )
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class AlertDialogParam {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: String = ""
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: Option<String> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var subtitle: Option<String> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Option<Bool> = true
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cancel: Option<() -> Unit> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: Option<DialogAlignment> = DialogAlignment.Bottom
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Option<Offset> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var gridCount: Option<UInt32> = 4
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Option<Bool> = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Option<Bool> = true
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: Option<Color> = Color.TRANSPARENT
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: Option<(DismissDialogAction) -> Unit> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
        bottomRight: 32.vp)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: Option<TransitionEffect> = Option.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Option<Length> = Option<Length>.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Option<Length> = Option<Length>.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: Option<Length> = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: Option<Color> = Color.BLACK
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: Option<EdgeStyle> = EdgeStyle.SOLID
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textStyle: Option<WordBreak> = WordBreak.Normal

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: String = "",
        subtitle!: String = "",
        autoCancel!: Bool = true,
        cancel!: () -> Unit = {=>},
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        gridCount!: Int32 = 4,
        maskRect!: Rectangle = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: Color = Color.TRANSPARENT,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
    ) {
        this.message = message
        this.title = title
        this.subtitle = subtitle
        this.autoCancel = autoCancel
        this.cancel = cancel
        this.alignment = alignment
        this.offset = offset
        this.gridCount = UInt32(gridCount)
        this.maskRect = maskRect
        this.showInSubWindow = showInSubWindow
        this.isModal = isModal
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: Option<String> = Option.None,
        subtitle!: Option<String> = Option.None,
        autoCancel!: Option<Bool> = true,
        cancel!: Option<() -> Unit> = Option.None,
        alignment!: Option<DialogAlignment> = DialogAlignment.Bottom,
        offset!: Option<Offset> = Option.None,
        gridCount!: Option<UInt32> = 4,
        maskRect!: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Option<Bool> = false,
        isModal!: Option<Bool> = true,
        backgroundColor!: Option<Color> = Color.TRANSPARENT,
        backgroundBlurStyle!: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK,
        onWillDismiss!: Option<(DismissDialogAction) -> Unit>,
        cornerRadius!: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        transition!: Option<TransitionEffect> = Option.None,
        width!: Option<Length> = Option<Length>.None,
        height!: Option<Length> = Option<Length>.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        textStyle!: Option<WordBreak> = WordBreak.Normal
    ) {
        this.message = message
        this.title = title
        this.subtitle = subtitle
        this.autoCancel = autoCancel
        this.cancel = cancel
        this.alignment = alignment
        this.offset = offset
        this.gridCount = gridCount
        this.maskRect = maskRect
        this.showInSubWindow = showInSubWindow
        this.isModal = isModal
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.onWillDismiss = onWillDismiss
        this.cornerRadius = cornerRadius
        this.transition = transition
        this.width = width
        this.height = height
        this.borderWidth = borderWidth
        this.borderColor = borderColor
        this.borderStyle = borderStyle
        this.textStyle = textStyle
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}

    func getNativeParam(): NativeAlertDialogParamV2 {
        let cMessage: CString = unsafe { LibC.mallocCString(message) }
        let nativeTitle = match (title) {
            case Some(value) => NativeOptionCString(true, unsafe { LibC.mallocCString(value) })
            case None => NativeOptionCString(false, unsafe { LibC.mallocCString("") })
        }
        let nativeSubtitle = match (subtitle) {
            case Some(value) => NativeOptionCString(true, unsafe { LibC.mallocCString(value) })
            case None => NativeOptionCString(false, unsafe { LibC.mallocCString("") })
        }
        let nativeAutoCancel = match (autoCancel) {
            case Some(value) => NativeOptionBool(true, value)
            case None => NativeOptionBool(false, true)
        }
        let nativeCancel = match (cancel) {
            case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }
        let nativeAlignment = match (alignment) {
            case Some(value) => NativeOptionInt32(true, value.getValue())
            case None => NativeOptionInt32(false, 0)
        }
        let nativeOffset = match (offset) {
            case Some(value) => NativeOptionOffset(true, parseOffset(value))
            case None => NativeOptionOffset(false, parseOffset(Offset(0.vp, 0.vp)))
        }
        let nativeGridCount = match (gridCount) {
            case Some(value) => NativeOptionUInt32(true, value.toUInt32())
            case None => NativeOptionUInt32(false, 4)
        }
        let nativeMaskRect = match (maskRect) {
            case Some(value) => NativeOptionRectangle(true, value.parseToNative())
            case None => NativeOptionRectangle(false, Rectangle().parseToNative())
        }
        let nativeShowInSubWindow = match (showInSubWindow) {
            case Some(value) => NativeOptionBool(true, value)
            case None => NativeOptionBool(false, false)
        }
        let nativeIsModal = match (isModal) {
            case Some(value) => NativeOptionBool(true, value)
            case None => NativeOptionBool(false, false)
        }
        let nativeBackgroundColor = match (backgroundColor) {
            case Some(value) => NativeOptionUInt32(true, value.toUInt32())
            case None => NativeOptionUInt32(false, 0)
        }
        let nativeBackgroundBlurStyle = match (backgroundBlurStyle) {
            case Some(value) => NativeOptionInt32(true, value.getValue())
            case None => NativeOptionInt32(false, 0)
        }
        let nativeOnWillDismiss = match (onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    action: Int32 => value(parseToDismissDialogAction(action))
                }
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }
        let nativeCornerRadius = match (cornerRadius) {
            case Some(value) => NativeOptionRadius(true, value.toCBorderRadiuses())
            case None => NativeOptionRadius(false, BorderRadiuses().toCBorderRadiuses())
        }
        let nativeBorderWidth = match (borderWidth) {
            case Some(value) =>
                var value_ = transAppResourceToLength(value)
                NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
            case None => NativeOptionLength(false, NativeLength(0.0, 0))
        }
        let nativeBorderColor = match (borderColor) {
            case Some(value) => NativeOptionUInt32(true, value.toUInt32())
            case None => NativeOptionUInt32(false, 0)
        }
        let nativeBorderStyle = match (borderStyle) {
            case Some(value) => NativeOptionEdgeStyle(true, value.toNative())
            case None => NativeOptionEdgeStyle(false, NativeEdgeStyle(0, 0, 0, 0))
        }
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
        let nativeTextStyle = match (textStyle) {
            case Some(value) => NativeOptionInt32(true, value.getValue())
            case None => NativeOptionInt32(false, 0)
        }

        NativeAlertDialogParamV2(
            cMessage,
            nativeTitle,
            nativeSubtitle,
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogParamWithConfirm <: AlertDialogParam {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var confirm: AlertDialogButtonOptions = AlertDialogButtonOptions()
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: String = "",
        subtitle!: String = "",
        autoCancel!: Bool = true,
        cancel!: () -> Unit = {=>},
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        gridCount!: Int32 = 4,
        maskRect!: Rectangle = Rectangle(),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: Color = Color.TRANSPARENT,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        confirm!: AlertDialogButtonOptions = AlertDialogButtonOptions()
    ) {
        super(
            message,
            title: title,
            subtitle: subtitle,
            autoCancel: autoCancel,
            cancel: cancel,
            alignment: alignment,
            offset: offset,
            gridCount: gridCount,
            maskRect: maskRect,
            showInSubWindow: showInSubWindow,
            isModal: isModal,
            backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle
        )
        this.confirm = confirm
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: Option<String> = Option.None,
        subtitle!: Option<String> = Option.None,
        autoCancel!: Option<Bool> = true,
        cancel!: Option<() -> Unit> = Option.None,
        alignment!: Option<DialogAlignment> = DialogAlignment.Bottom,
        offset!: Option<Offset> = Option.None,
        gridCount!: Option<UInt32> = 4,
        maskRect!: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Option<Bool> = false,
        isModal!: Option<Bool> = true,
        backgroundColor!: Option<Color> = Color.TRANSPARENT,
        backgroundBlurStyle!: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK,
        onWillDismiss!: Option<(DismissDialogAction) -> Unit>, // 5.1 start
        cornerRadius!: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        transition!: Option<TransitionEffect> = Option.None,
        width!: Option<Length> = Option<Length>.None,
        height!: Option<Length> = Option<Length>.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        textStyle!: Option<WordBreak> = WordBreak.Normal,
        confirm!: AlertDialogButtonOptions = AlertDialogButtonOptions()
    ) {
        super(
            message,
            title: title,
            subtitle: subtitle,
            autoCancel: autoCancel,
            cancel: cancel,
            alignment: alignment,
            offset: offset,
            gridCount: gridCount,
            maskRect: maskRect,
            showInSubWindow: showInSubWindow,
            isModal: isModal,
            backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle,
            onWillDismiss: onWillDismiss,
            cornerRadius: cornerRadius,
            transition: transition,
            width: width,
            height: height,
            borderWidth: borderWidth,
            borderColor: borderColor,
            borderStyle: borderStyle,
            textStyle: textStyle
        )
        this.confirm = confirm
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogParamWithButtons <: AlertDialogParam {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primaryButton: AlertDialogButtonOptions = AlertDialogButtonOptions()

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var secondaryButton: AlertDialogButtonOptions = AlertDialogButtonOptions()

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: String = "",
        subtitle!: String = "",
        autoCancel!: Bool = true,
        cancel!: () -> Unit = {=>},
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        gridCount!: Int32 = 4,
        maskRect!: Rectangle = Rectangle(),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: Color = Color.TRANSPARENT,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        primaryButton!: AlertDialogButtonOptions = AlertDialogButtonOptions(),
        secondaryButton!: AlertDialogButtonOptions = AlertDialogButtonOptions()
    ) {
        super(
            message,
            title: title,
            subtitle: subtitle,
            autoCancel: autoCancel,
            cancel: cancel,
            alignment: alignment,
            offset: offset,
            gridCount: gridCount,
            maskRect: maskRect,
            showInSubWindow: showInSubWindow,
            isModal: isModal,
            backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle
        )
        this.primaryButton = primaryButton
        this.secondaryButton = secondaryButton
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: Option<String> = Option.None,
        subtitle!: Option<String> = Option.None,
        autoCancel!: Option<Bool> = true,
        cancel!: Option<() -> Unit> = Option.None,
        alignment!: Option<DialogAlignment> = DialogAlignment.Bottom,
        offset!: Option<Offset> = Option.None,
        gridCount!: Option<UInt32> = 4,
        maskRect!: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Option<Bool> = false,
        isModal!: Option<Bool> = true,
        backgroundColor!: Option<Color> = Color.TRANSPARENT,
        backgroundBlurStyle!: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK,
        onWillDismiss!: Option<(DismissDialogAction) -> Unit>,
        cornerRadius!: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        transition!: Option<TransitionEffect> = Option.None,
        width!: Option<Length> = Option<Length>.None,
        height!: Option<Length> = Option<Length>.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        textStyle!: Option<WordBreak> = WordBreak.Normal,
        primaryButton!: AlertDialogButtonOptions = AlertDialogButtonOptions(),
        secondaryButton!: AlertDialogButtonOptions = AlertDialogButtonOptions()
    ) {
        super(
            message,
            title: title,
            subtitle: subtitle,
            autoCancel: autoCancel,
            cancel: cancel,
            alignment: alignment,
            offset: offset,
            gridCount: gridCount,
            maskRect: maskRect,
            showInSubWindow: showInSubWindow,
            isModal: isModal,
            backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle,
            onWillDismiss: onWillDismiss,
            cornerRadius: cornerRadius,
            transition: transition,
            width: width,
            height: height,
            borderWidth: borderWidth,
            borderColor: borderColor,
            borderStyle: borderStyle,
            textStyle: textStyle
        )
        this.primaryButton = primaryButton
        this.secondaryButton = secondaryButton
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlertDialogParamWithOptions <: AlertDialogParam {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttons: Array<AlertDialogButtonOptions> = Array<AlertDialogButtonOptions>()

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var buttonDirection: DialogButtonDirection = DialogButtonDirection.AUTO

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: String = "",
        subtitle!: String = "",
        autoCancel!: Bool = true,
        cancel!: () -> Unit = {=>},
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        gridCount!: Int32 = 4,
        maskRect!: Rectangle = Rectangle(),
        showInSubWindow!: Bool = false,
        isModal!: Bool = true,
        backgroundColor!: Color = Color.TRANSPARENT,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        buttons!: Array<AlertDialogButtonOptions> = Array<AlertDialogButtonOptions>(),
        buttonDirection!: DialogButtonDirection = DialogButtonDirection.AUTO
    ) {
        super(
            message,
            title: title,
            subtitle: subtitle,
            autoCancel: autoCancel,
            cancel: cancel,
            alignment: alignment,
            offset: offset,
            gridCount: gridCount,
            maskRect: maskRect,
            showInSubWindow: showInSubWindow,
            isModal: isModal,
            backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle
        )
        this.buttons = buttons
        this.buttonDirection = buttonDirection
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message: String,
        title!: Option<String> = Option.None,
        subtitle!: Option<String> = Option.None,
        autoCancel!: Option<Bool> = true,
        cancel!: Option<() -> Unit> = Option.None,
        alignment!: Option<DialogAlignment> = DialogAlignment.Bottom,
        offset!: Option<Offset> = Option.None,
        gridCount!: Option<UInt32> = 4,
        maskRect!: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Option<Bool> = false,
        isModal!: Option<Bool> = true,
        backgroundColor!: Option<Color> = Color.TRANSPARENT,
        backgroundBlurStyle!: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK,
        onWillDismiss!: Option<(DismissDialogAction) -> Unit>,
        cornerRadius!: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
            bottomRight: 32.vp),
        transition!: Option<TransitionEffect> = Option.None,
        width!: Option<Length> = Option<Length>.None,
        height!: Option<Length> = Option<Length>.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        textStyle!: Option<WordBreak> = WordBreak.Normal,
        buttons!: Array<AlertDialogButtonOptions> = Array<AlertDialogButtonOptions>(),
        buttonDirection!: DialogButtonDirection = DialogButtonDirection.AUTO
    ) {
        super(
            message,
            title: title,
            subtitle: subtitle,
            autoCancel: autoCancel,
            cancel: cancel,
            alignment: alignment,
            offset: offset,
            gridCount: gridCount,
            maskRect: maskRect,
            showInSubWindow: showInSubWindow,
            isModal: isModal,
            backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle,
            onWillDismiss: onWillDismiss,
            cornerRadius: cornerRadius,
            transition: transition,
            width: width,
            height: height,
            borderWidth: borderWidth,
            borderColor: borderColor,
            borderStyle: borderStyle,
            textStyle: textStyle
        )
        this.buttons = buttons
        this.buttonDirection = buttonDirection
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }
}
