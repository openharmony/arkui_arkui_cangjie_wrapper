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

@C
struct NativeOptionShadow {
    NativeOptionShadow(
        let hasValue: Bool,
        let value: NativeShadowOptions
    ) {}
}

@C
struct NativeCustomDialogControllerOptions {
    NativeCustomDialogControllerOptions(
        let cancel: Int64,
        let autoCancel: Bool,
        let alignment: Int32,
        let offset: NativeOffset,
        let customStyle: Bool,
        let gridCount: NativeOptionInt32,
        let maskColor: UInt32,
        let maskRect: NativeRectangle,
        let openAnimation: NativeOptionAnimateParam,
        let closeAnimation: NativeOptionAnimateParam,
        let showInSubWindow: Bool,
        let backgroundColor: NativeOptionUInt32,
        let cornerRadius: NativeLength,
        let isModal: NativeOptionBool,
        let onWillDismiss: NativeOptionCallBack,
        let borderWidth: NativeOptionLength,
        let borderColor: NativeOptionUInt32,
        let borderStyle: NativeOptionEdgeStyle,
        let width: NativeOptionLength,
        let height: NativeOptionLength,
        let shadow: NativeOptionShadow,
        let backgroundBlurStyle: NativeOptionInt32
    ) {}

    func free() {
        this.openAnimation.free()
        this.closeAnimation.free()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Offset {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dx: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dy: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(dx: Length, dy: Length) {
        this.dx = transAppResourceToLength(dx)
        this.dy = transAppResourceToLength(dy)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogControllerOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cancel: () -> Unit = {=>}
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool = true
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
    public var customStyle: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var gridCount: Option<Int32> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: ResourceColor = Color(0x33000000)
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: Rectangle = Rectangle()
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var openAnimation: Option<AnimateParam> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var closeAnimation: Option<AnimateParam> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: Option<ResourceColor> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: Length = 24.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: Option<Bool> = true
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: Option<(DismissDialogAction) -> Unit> = Option.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: Option<Length> = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: Option<ResourceColor> = Color.BLACK
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: Option<EdgeStyle> = EdgeStyle.SOLID
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Option<Length> = Option<Length>.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Option<Length> = Option<Length>.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: Option<ShadowOptions> = Option<ShadowOptions>.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        cancel!: () -> Unit = {=>},
        autoCancel!: Bool = true,
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        customStyle!: Bool = false,
        gridCount!: Option<Int32> = Option.None,
        maskColor!: ResourceColor = Color(0x33000000),
        maskRect!: Rectangle = Rectangle(),
        openAnimation!: Option<AnimateParam> = Option.None,
        closeAnimation!: Option<AnimateParam> = Option.None,
        showInSubWindow!: Bool = false,
        backgroundColor!: Option<ResourceColor> = Option.None,
        cornerRadius!: Length = 24.vp
    ) {
        this.cancel = cancel
        this.autoCancel = autoCancel
        this.alignment = alignment
        this.offset = offset
        this.customStyle = customStyle
        this.gridCount = gridCount
        this.maskColor = maskColor
        this.maskRect = maskRect
        this.openAnimation = openAnimation
        this.closeAnimation = closeAnimation
        this.showInSubWindow = showInSubWindow
        this.backgroundColor = backgroundColor
        this.cornerRadius = cornerRadius
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        cancel!: () -> Unit = {=>},
        autoCancel!: Bool = true,
        alignment!: DialogAlignment = DialogAlignment.Default,
        offset!: Offset = Offset(0.vp, 0.vp),
        customStyle!: Bool = false,
        gridCount!: Option<Int32> = Option.None,
        maskColor!: ResourceColor = Color(0x33000000),
        maskRect!: Rectangle = Rectangle(),
        openAnimation!: Option<AnimateParam> = Option.None,
        closeAnimation!: Option<AnimateParam> = Option.None,
        showInSubWindow!: Bool = false,
        backgroundColor!: Option<ResourceColor> = Option.None,
        cornerRadius!: Length = 24.vp,
        isModal!: Option<Bool>, // 5.1 start
        onWillDismiss!: Option<(DismissDialogAction) -> Unit> = Option.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<ResourceColor> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        width!: Option<Length> = Option.None,
        height!: Option<Length> = Option.None,
        shadow!: Option<ShadowOptions> = Option.None,
        backgroundBlurStyle!: Option<BlurStyle> = BlurStyle.COMPONENT_ULTRA_THICK
    ) {
        this.cancel = cancel
        this.autoCancel = autoCancel
        this.alignment = alignment
        this.offset = offset
        this.customStyle = customStyle
        this.gridCount = gridCount
        this.maskColor = maskColor
        this.maskRect = maskRect
        this.openAnimation = openAnimation
        this.closeAnimation = closeAnimation
        this.showInSubWindow = showInSubWindow
        this.backgroundColor = backgroundColor
        this.cornerRadius = transAppResourceToLength(cornerRadius)
        this.isModal = isModal
        this.onWillDismiss = onWillDismiss
        this.width = width
        this.height = height
        this.borderWidth = borderWidth
        this.borderColor = borderColor
        this.borderStyle = borderStyle
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle
    }
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

func parseNativeShadowOptions(shadowOptions: ShadowOptions): NativeShadowOptions {
    return NativeShadowOptions(
        shadowOptions.radius,
        shadowOptions.shadowType,
        shadowOptions.color,
        shadowOptions.offsetX,
        shadowOptions.offsetY,
        shadowOptions.fill
    )
}

foreign {
    func FfiOHOSAceFrameworkCustomDialogControllerCtorV2(options: NativeCustomDialogControllerOptions): Int64

    func FfiOHOSAceFrameworkCustomDialogControllerBindView(controllerId: Int64, nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkCustomDialogControllerSetBuilder(controllerId: Int64, builder: Int64): Unit

    func FfiOHOSAceFrameworkCustomDialogControllerOpen(id: Int64): Unit

    func FfiOHOSAceFrameworkCustomDialogControllerClose(id: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogController <: RemoteDataLite {
    private var ffiBuilder_: Option<FFIData> = Option.None
    private var ffiCancel_: Option<FFIData> = Option.None

    func parseCustomDialogControllerOptions(options: CustomDialogControllerOptions): NativeCustomDialogControllerOptions {
        let nativeGridCount = match (options.gridCount) {
            case Some(value) => NativeOptionInt32(true, value)
            case None => NativeOptionInt32(false, 0)
        }

        let nativeBackgroundColor = match (options.backgroundColor) {
            case Some(value) => NativeOptionUInt32(true, transAppResourceToResourceColor(value))
            case None => NativeOptionUInt32(false, 0)
        }

        let openAnimation = match (options.openAnimation) {
            case Some(value) => NativeOptionAnimateParam(true, parseAnimateParam(value))
            case None => NativeOptionAnimateParam(false, NativeAnimateParam())
        }

        let closeAnimation = match (options.closeAnimation) {
            case Some(value) => NativeOptionAnimateParam(true, parseAnimateParam(value))
            case None => NativeOptionAnimateParam(false, NativeAnimateParam())
        }

        let nativeOnWillDismiss = match (options.onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    action: Int32 => value(parseToDismissDialogAction(action))
                }
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, 0)
        }
        let nativeIsModal = match (options.isModal) {
            case Some(value) => NativeOptionBool(true, value)
            case None => NativeOptionBool(false, false)
        }
        let nativeWidth = match (options.width) {
            case Some(value) =>
                var value_ = transAppResourceToLength(value)
                NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
            case None => NativeOptionLength(false, NativeLength(0.0, 0))
        }
        let nativeHeight = match (options.height) {
            case Some(value) =>
                var value_ = transAppResourceToLength(value)
                NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
            case None => NativeOptionLength(false, NativeLength(0.0, 0))
        }
        let nativeBorderWidth = match (options.borderWidth) {
            case Some(value) =>
                var value_ = transAppResourceToLength(value)
                NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
            case None => NativeOptionLength(false, NativeLength(0.0, 0))
        }
        let nativeBorderColor = match (options.borderColor) {
            case Some(value) => NativeOptionUInt32(true, transAppResourceToResourceColor(value))
            case None => NativeOptionUInt32(false, 0)
        }
        let nativeBorderStyle = match (options.borderStyle) {
            case Some(value) => NativeOptionEdgeStyle(true, value.toNative())
            case None => NativeOptionEdgeStyle(false, NativeEdgeStyle(0, 0, 0, 0))
        }
        let nativeBackgroundBlurStyle = match (options.backgroundBlurStyle) {
            case Some(value) => NativeOptionInt32(true, value.getValue())
            case None => NativeOptionInt32(false, 0)
        }
        let nativeOptionShadow = match (options.shadow) {
            case Some(value) => NativeOptionShadow(true, parseNativeShadowOptions(value))
            case None => NativeOptionShadow(false, parseNativeShadowOptions(ShadowOptions()))
        }
        let cancelLambda = Callback0Param<Unit>(options.cancel)
        this.ffiCancel_ = cancelLambda
        return NativeCustomDialogControllerOptions(
            cancelLambda.getID(),
            options.autoCancel,
            options.alignment.getValue(),
            parseOffset(options.offset),
            options.customStyle,
            nativeGridCount,
            transAppResourceToResourceColor(options.maskColor),
            options.maskRect.parseToNative(),
            openAnimation,
            closeAnimation,
            options.showInSubWindow,
            nativeBackgroundColor,
            NativeLength(
                options.cornerRadius.value,
                options.cornerRadius.unitType.getValue()
            ),
            nativeIsModal,
            nativeOnWillDismiss,
            nativeBorderWidth,
            nativeBorderColor,
            nativeBorderStyle,
            nativeWidth,
            nativeHeight,
            nativeOptionShadow,
            nativeBackgroundBlurStyle
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: CustomDialogControllerOptions) {
        super(
            unsafe {
                let nativeOptions = parseCustomDialogControllerOptions(options)
                let id = FfiOHOSAceFrameworkCustomDialogControllerCtorV2(nativeOptions)
                nativeOptions.free()
                id
            })
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setBuilder(builder: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerSetBuilder(this.getID(), Callback0Param<Unit>(builder).getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindView(view: CustomView) {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerBindView(this.getID(), view.getView().getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func `open`() {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerOpen(this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func close() {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerClose(this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func releaseSelf(): Unit {
        if (let Some(v) <- ffiBuilder_) {
            FFIDataManager.getInstance().releaseData(v.getID())
            this.ffiBuilder_ = Option.None
        }

        if (let Some(v) <- ffiCancel_) {
            FFIDataManager.getInstance().releaseData(v.getID())
            this.ffiCancel_ = Option.None
        }
    }
}
