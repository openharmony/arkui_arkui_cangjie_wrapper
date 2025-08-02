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

protected package ohos.arkui.component.action_sheet

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.ui_resource.*
import ohos.resource_manager.AppResource
import ohos.labels.APILevel

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
                throw IllegalMemoryException("malloc memory")
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
struct NativeDismissDialogAction {
    NativeDismissDialogAction(let reason: Int32) {}
}

@C
struct NativeOptionConfirm {
    NativeOptionConfirm(
        let hasValue: Bool,
        let value: NativeConfirm
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheetShadowOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowType: ShadowType = ShadowType.COLOR
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: Color = Color.BLACK
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: Float64 = 0.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: Float64 = 0.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: Bool = false

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        radius: Float64,
        shadowType!: ShadowType = ShadowType.COLOR,
        color!: Color = Color.BLACK,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        fill!: Bool = false
    ) {
        this.radius = radius
        this.shadowType = shadowType
        this.color = color
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.fill = fill
    }

    protected func toNative(): NativeActionSheetShadowOptions {
        NativeActionSheetShadowOptions(
            radius,
            Int32(shadowType.getValue()),
            color.toUInt32(),
            offsetX,
            offsetY,
            fill
        )
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: () -> Unit
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icon: Option<AppResource> = Option.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title: String,
        action: () -> Unit,
        icon!: Option<AppResource> = Option.None
    ) {
        this.title = title
        this.action = action
        this.icon = icon
    }

    func toNative(): NativeSheetInfo {
        let cTitle: CString = unsafe { LibC.mallocCString(title) }
        let cIcon = match (icon) {
            case Some(value) => unsafe { LibC.mallocCString(getResourceMedia(value)) }
            case None => unsafe { LibC.mallocCString("") }
        }
        var ret = NativeSheetInfo(
            cTitle,
            cIcon,
            Callback0Param<Unit>(action).getID()
        )
        ret
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Confirm {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: () -> Unit
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enabled: Bool = true
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var defaultFocus: Bool = false
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: DialogButtonStyle = DialogButtonStyle.DEFAULT
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value: String,
        action: () -> Unit,
        enabled!: Bool = true,
        defaultFocus!: Bool = false,
        style!: DialogButtonStyle = DialogButtonStyle.DEFAULT
    ) {
        this.value = value
        this.action = action
        this.enabled = enabled
        this.defaultFocus = defaultFocus
        this.style = style
    }

    func toNative(): NativeConfirm {
        let cValue: CString = unsafe { LibC.mallocCString(value) }
        var ret = NativeConfirm(
            cValue,
            Callback0Param<Unit>(action).getID(),
            enabled,
            defaultFocus,
            style.getValue()
        )
        ret
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissDialogAction {
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
    public DismissDialogAction(reason: DismissReason) {
        this.reason = reason
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss() {
        unsafe {
            FfiOHOSAceFrameworkActionSheetDismiss()
        }
    }
}

protected func parseToDismissDialogAction(reason: Int32): DismissDialogAction {
    return DismissDialogAction(DismissReason.toEnum(reason))
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheetOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sheets: Array<SheetInfo>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var subtitle: Option<String> = Option.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var confirm: Option<Confirm> = Option.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Option<Bool> = true
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cancel: Option<() -> Unit> = Option.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: Option<DialogAlignment> = DialogAlignment.Bottom
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Option<Offset> = Option.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent)
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Option<Bool> = false
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Option<Bool> = true
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: Option<Color> = Color.TRANSPARENT
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: Option<(DismissDialogAction) -> Unit> = None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
        bottomLeft: 32.vp, bottomRight: 32.vp)
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: Option<Length> = 0.vp
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: Option<Color> = Color.BLACK
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: Option<EdgeStyle> = EdgeStyle.SOLID
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Option<Length> = Option<Length>.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Option<Length> = Option<Length>.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: Option<TransitionEffect> = Option.None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        title: String,
        message: String,
        sheets: Array<SheetInfo>,
        subtitle!: Option<String> = Option.None,
        confirm!: Option<Confirm> = Option.None,
        autoCancel!: Option<Bool> = true,
        cancel!: Option<() -> Unit> = Option.None,
        alignment!: Option<DialogAlignment> = DialogAlignment.Bottom,
        offset!: Option<Offset> = Option.None,
        maskRect!: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow!: Option<Bool> = false,
        isModal!: Option<Bool> = true,
        backgroundColor!: Option<Color> = Color.TRANSPARENT,
        backgroundBlurStyle!: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK,
        onWillDismiss!: Option<(DismissDialogAction) -> Unit> = None,
        cornerRadius!: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
            bottomLeft: 32.vp, bottomRight: 32.vp),
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        width!: Option<Length> = Option<Length>.None,
        height!: Option<Length> = Option<Length>.None,
        transition!: Option<TransitionEffect> = Option.None
    ) {
        this.title = title
        this.message = message
        this.sheets = sheets
        this.subtitle = subtitle
        this.confirm = confirm
        this.autoCancel = autoCancel
        this.cancel = cancel
        this.alignment = alignment
        this.offset = offset
        this.maskRect = maskRect
        this.showInSubWindow = showInSubWindow
        this.isModal = isModal
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.onWillDismiss = onWillDismiss
        this.cornerRadius = cornerRadius
        this.borderWidth = borderWidth
        this.borderColor = borderColor
        this.borderStyle = borderStyle
        this.width = width
        this.height = height
        this.transition = transition
    }

    func getNativeParam(): NativeActionSheetOptions {
        let cTitle: CString = try {
            unsafe { LibC.mallocCString(title) }
        } catch (e: Exception) {
            throw IllegalMemoryException("malloc memory")
        }

        let cMessage: CString = try {
            unsafe { LibC.mallocCString(message) }
        } catch (e: Exception) {
            unsafe { LibC.free(cTitle) }
            throw IllegalMemoryException("malloc memory")
        }

        let nativeSubtitle = match (subtitle) {
            case Some(value) =>
                let cStr = try {
                    unsafe { LibC.mallocCString(value) }
                } catch (e: Exception) {
                    unsafe { LibC.free(cTitle) }
                    unsafe { LibC.free(cMessage) }
                    throw IllegalMemoryException("malloc memory")
                }
                NativeOptionCString(true, cStr)
            case None =>
                let emptyStr = try {
                    unsafe { LibC.mallocCString("") }
                } catch (e: Exception) {
                    unsafe { LibC.free(cTitle) }
                    unsafe { LibC.free(cMessage) }
                    throw IllegalMemoryException("malloc memory")
                }
                NativeOptionCString(false, emptyStr)
        }
        let nativeConfirm = match (confirm) {
            case Some(value) => NativeOptionConfirm(true, value.toNative())
            case None => NativeOptionConfirm(false, Confirm("", {=>}).toNative())
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
        var nativeActionSheetOptions = NativeActionSheetOptions(
            cTitle,
            cMessage,
            NativeSheetInfoArray(sheets),
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheet {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(value: ActionSheetOptions, shadow: ActionSheetShadowOptions): Unit {
        let nativeOptions = value.getNativeParam()
        unsafe {
            FfiOHOSAceFrameworkActionSheetShowWithShadowOptions(nativeOptions, shadow.toNative())
            nativeOptions.free(value.sheets.size)
        }
        return
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(value: ActionSheetOptions, shadow: ShadowStyle): Unit {
        let nativeOptions = value.getNativeParam()
        unsafe {
            FfiOHOSAceFrameworkActionSheetShowWithShadowStyle(nativeOptions, shadow.getValue())
            nativeOptions.free(value.sheets.size)
        }
        return
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(value: ActionSheetOptions): Unit {
        let nativeOptions = value.getNativeParam()
        unsafe {
            FfiOHOSAceFrameworkActionSheetShow(nativeOptions)
            nativeOptions.free(value.sheets.size)
        }
        return
    }
}
