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
    func FfiOHOSAceFrameworkActionSheetShowWithShadowOptions(
        options: NativeActionSheetOptions,
        shadowStyle: NativeActionSheetShadowOptions
    ): Unit

    func FfiOHOSAceFrameworkActionSheetShowWithShadowStyle(options: NativeActionSheetOptions, shadowStyle: Int32): Unit

    func FfiOHOSAceFrameworkActionSheetShow(options: NativeActionSheetOptions): Unit

    func FfiOHOSAceFrameworkActionSheetDismiss(): Unit
}

@C
struct NativeActionSheetShadowOptions {
    NativeActionSheetShadowOptions(
        let radius: Float64,
        let shadowType: Int32,
        let color: UInt32,
        let offsetX: Float64,
        let offsetY: Float64,
        let fill: Bool
    ) {}
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
struct NativeConfirm {
    NativeConfirm(
        let value: CString,
        let action: Int64,
        let enabled: Bool,
        let defaultFocus: Bool,
        let style: Int32
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(value)
        }
    }
}

@C
struct NativeEdgeStyle {
    NativeEdgeStyle(
        let top: Int32,
        let right: Int32,
        let bottom: Int32,
        let left: Int32
    ) {}
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

@C
struct NativeOptionOffset {
    NativeOptionOffset(
        let hasValue: Bool,
        let value: NativeOffset
    ) {}
}

@C
struct NativeOptionRectangle {
    NativeOptionRectangle(
        let hasValue: Bool,
        let value: NativeRectangle
    ) {}
}

@C
struct NativeOptionRadius {
    NativeOptionRadius(
        let hasValue: Bool,
        let value: CBorderRadiuses
    ) {}
}

@C
struct NativeOptionEdgeStyle {
    NativeOptionEdgeStyle(
        let hasValue: Bool,
        let value: NativeEdgeStyle
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheetShadowOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ActionSheetShadowOptions(
        public var radius: Float64,
        public var shadowType!: ShadowType = ShadowType.COLOR,
        public var color!: Color = Color.BLACK,
        public var offsetX!: Float64 = 0.0,
        public var offsetY!: Float64 = 0.0,
        public var fill!: Bool = false
    ) {}

    func toNative(): NativeActionSheetShadowOptions {
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
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetInfo {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public SheetInfo(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var title: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var action: () -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var icon!: Option<AppResource> = Option.None
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Confirm {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public Confirm(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var value: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var action: () -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var enabled!: Bool = true,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var defaultFocus!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var style!: DialogButtonStyle = DialogButtonStyle.DEFAULT
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public EdgeStyle(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var top: BorderStyle,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var right: BorderStyle,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var bottom: BorderStyle,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var left: BorderStyle
    ) {}

    func toNative(): NativeEdgeStyle {
        NativeEdgeStyle(
            top.getValue(),
            right.getValue(),
            bottom.getValue(),
            left.getValue()
        )
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let SOLID = EdgeStyle(
        BorderStyle.Solid,
        BorderStyle.Solid,
        BorderStyle.Solid,
        BorderStyle.Solid
    )
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let DASHED = EdgeStyle(
        BorderStyle.Dashed,
        BorderStyle.Dashed,
        BorderStyle.Dashed,
        BorderStyle.Dashed
    )
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let DOTTED = EdgeStyle(
        BorderStyle.Dotted,
        BorderStyle.Dotted,
        BorderStyle.Dotted,
        BorderStyle.Dotted
    )
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DismissReason {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PRESS_BACK
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOUCH_OUTSIDE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CLOSE_BUTTON
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SLIDE_DOWN
    | ...

    func toValue(): Int32 {
        match (this) {
            case PRESS_BACK => 0
            case TOUCH_OUTSIDE => 1
            case CLOSE_BUTTON => 2
            case SLIDE_DOWN => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func toEnum(value: Int32): DismissReason {
        if (value == 0) {
            return DismissReason.PRESS_BACK
        } else if (value == 1) {
            return DismissReason.TOUCH_OUTSIDE
        } else if (value == 2) {
            return DismissReason.CLOSE_BUTTON
        } else if (value == 3) {
            return DismissReason.SLIDE_DOWN
        } else {
            return DismissReason.PRESS_BACK
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissDialogAction {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DismissDialogAction(public let reason: DismissReason) {}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss() {
        unsafe {
            FfiOHOSAceFrameworkActionSheetDismiss()
        }
    }
}

func parseToDismissDialogAction(reason: Int32): DismissDialogAction {
    return DismissDialogAction(DismissReason.toEnum(reason))
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheetOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ActionSheetOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var title: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var message: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var sheets: Array<SheetInfo>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var subtitle!: Option<String> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var confirm!: Option<Confirm> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var autoCancel!: Option<Bool> = true,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var cancel!: Option<() -> Unit> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var alignment!: Option<DialogAlignment> = DialogAlignment.Bottom,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var offset!: Option<Offset> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var maskRect!: Option<Rectangle> = Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var showInSubWindow!: Option<Bool> = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var isModal!: Option<Bool> = true,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundColor!: Option<Color> = Color.TRANSPARENT,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundBlurStyle!: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var onWillDismiss!: Option<(DismissDialogAction) -> Unit> = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var cornerRadius!: Option<BorderRadiuses> = BorderRadiuses(topLeft: 32.vp, topRight: 32.vp,
            bottomLeft: 32.vp, bottomRight: 32.vp),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var borderWidth!: Option<Length> = 0.vp,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var borderColor!: Option<Color> = Color.BLACK,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var width!: Option<Length> = Option<Length>.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var height!: Option<Length> = Option<Length>.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var transition!: Option<TransitionEffect> = Option.None
    ) {}

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
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ActionSheet {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
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
