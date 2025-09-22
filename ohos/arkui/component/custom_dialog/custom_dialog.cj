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

package ohos.arkui.component.custom_dialog

import ohos.arkui.component.action_sheet.*
import ohos.arkui.component.view.*
import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

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
/**
* Custom builder function.
* 
* @relation declare interface CustomDialogControllerOptions
*/
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogControllerOptions {
    /**
    * Defines the cancel function.
    *
    * @relation cancel?: () => void
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cancel: ?VoidCallback
    /**
    * Defines if use auto cancel when click on the outside of the dialog.
    *
    * @relation autoCancel?: boolean
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: ?Bool
    /**
    * Defines the dialog alignment of the screen.
    *
    * @relation alignment?: DialogAlignment
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: ?DialogAlignment
    /**
    * Defines the dialog offset.
    *
    * @relation offset?: Offset
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Offset
    /**
    * Defines if use custom style.
    *
    * @relation customStyle?: boolean
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var customStyle: ?Bool
    /**
    * Grid count of dialog.
    *
    * @relation gridCount?: number
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var gridCount: ?UInt32
    /**
    * Mask color of dialog.
    *
    * @relation maskColor?: ResourceColor
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: ?ResourceColor
    /**
    * Mask Region of dialog. The size cannot exceed the main window.
    *
    * @relation maskRect?: Rectangle
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: ?Rectangle
    /**
    * Animation parameters of dialog opening.
    *
    * @relation openAnimation?: AnimateParam
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var openAnimation: ?AnimateParam
    /**
    * Animation parameters of dialog closing.
    *
    * @relation closeAnimation?: AnimateParam
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var closeAnimation: ?AnimateParam
    /**
    * Whether to display in the sub window.
    *
    * @relation showInSubWindow?: boolean
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool
    /**
    * Background color of dialog.
    *
    * @relation backgroundColor?: ResourceColor
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor
    /**
    * Corner radius of dialog.
    *
    * @relation cornerRadius?: Dimension | BorderRadiuses
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cornerRadius: ?Length
    /**
    * Whether it is a modal dialog
    *
    * @relation isModal?: boolean
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isModal: ?Bool
    /**
    * Callback function when the CustomDialog interactive dismiss.
    *
    * @relation onWillDismiss?: Callback<DismissDialogAction>
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: ?Callback<DismissDialogAction, Unit>
    /**
    * Defines the custom dialog's border width.
    *
    * @relation borderWidth?: Dimension | EdgeWidths
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: ?Length
    /**
    * Defines the custom dialog's border color.
    *
    * @relation borderColor?: ResourceColor | EdgeColors
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: ?ResourceColor
    /**
    * Defines the custom dialog's border style.
    *
    * @relation borderStyle?: BorderStyle | EdgeStyles
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderStyle: ?EdgeStyles
    /**
    * Defines the custom dialog's width.
    *
    * @relation width?: Dimension
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length
    /**
    * Defines the custom dialog's height.
    *
    * @relation height?: Dimension
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Length
    /**
    * Defines the custom dialog's shadow.
    *
    * @relation shadow?: ShadowOptions | ShadowStyle
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions
    /**
    * Defines the customDialog's background blur Style
    *
    * @relation backgroundBlurStyle?: BlurStyle
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle
    /**
    * Defines the options of CustomDialogController.
    *
    * @param { VoidCallback } cancel
    * @param { Bool } autoCancel
    * @param { Offset } offset
    * @param { Bool } customStyle
    * @param { UInt32 } gridCount
    * @param { ResourceColor } maskColor
    * @param { Rectangle } maskRect
    * @param { AnimateParam } openAnimation
    * @param { AnimateParam } closeAnimation
    * @param { Bool } showInSubWindow
    * @param { ResourceColor } backgroundColor
    * @param { Length } cornerRadius
    * @param { Bool } isModal
    * @param { Callback<DismissDialogAction, Unit> } onWillDismiss
    * @param { Length } borderWidth
    * @param { ResourceColor } borderColor
    * @param { EdgeStyles } borderStyle
    * @param { Length } width
    * @param { Length } height
    * @param { ShadowOptions } shadow
    * @param { BlurStyle } backgroundBlurStyle
    * @returns { This } 
    * @relation constructor(value: CustomDialogControllerOptions)
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        cancel!: ?VoidCallback = None,
        autoCancel!: ?Bool = None,
        alignment!: ?DialogAlignment = None,
        offset!: ?Offset = None,
        customStyle!: ?Bool = None,
        gridCount!: ?UInt32 = None,
        maskColor!: ?ResourceColor = None,
        maskRect!: ?Rectangle = None,
        openAnimation!: ?AnimateParam = None,
        closeAnimation!: ?AnimateParam = None,
        showInSubWindow!: ?Bool = None,
        backgroundColor!: ?ResourceColor = None,
        cornerRadius!: ?Length = None,
        isModal!: ?Bool = None,
        onWillDismiss!: ?Callback<DismissDialogAction, Unit> = None,
        borderWidth!: ?Length = None,
        borderColor!: ?ResourceColor = None,
        borderStyle!: ?EdgeStyles = None,
        width!: ?Length = None,
        height!: ?Length = None,
        shadow!: ?ShadowOptions = None,
        backgroundBlurStyle!: ?BlurStyle = None
    ) {
        this.cancel = cancel ?? {=>}
        this.autoCancel = autoCancel ?? true
        this.alignment = alignment ?? DialogAlignment.Default
        this.offset = offset ?? Offset(0.vp, 0.vp)
        this.customStyle = customStyle ?? false
        this.gridCount = gridCount
        this.maskColor = maskColor ?? Color(0x33000000)
        this.maskRect = maskRect ?? Rectangle()
        this.openAnimation = openAnimation
        this.closeAnimation = closeAnimation
        this.showInSubWindow = showInSubWindow ?? false
        this.backgroundColor = backgroundColor ?? Color.Transparent
        this.cornerRadius = cornerRadius ?? 32.vp
        this.isModal = isModal ?? true
        this.onWillDismiss = onWillDismiss
        this.width = width
        this.height = height
        this.borderWidth = borderWidth ?? 0.vp
        this.borderColor = borderColor ?? Color.Black
        this.borderStyle = borderStyle ?? EdgeStyles()
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle ?? BlurStyle.ComponentUltraThick
    }
}

func parseNativeShadowOptions(shadowOptions: ShadowOptions): NativeShadowOptions {
    return NativeShadowOptions(
        shadowOptions.radius ?? 0.0,
        (shadowOptions.shadowType ?? ShadowType.Color).getValue(),
        (shadowOptions.color ?? Color.Black).toUInt32(),
        shadowOptions.offsetX ?? 0.0,
        shadowOptions.offsetY ?? 0.0,
        shadowOptions.fill ?? false
    )
}

foreign {
    func FfiOHOSAceFrameworkCustomDialogControllerCtorV2(options: NativeCustomDialogControllerOptions): Int64

    func FfiOHOSAceFrameworkCustomDialogControllerBindView(controllerId: Int64, nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkCustomDialogControllerSetBuilder(controllerId: Int64, builder: Int64): Unit

    func FfiOHOSAceFrameworkCustomDialogControllerOpen(id: Int64): Unit

    func FfiOHOSAceFrameworkCustomDialogControllerClose(id: Int64): Unit
}
/**
* Use the CustomDialogController class to display the custom pop-up window.
*
* @relation declare class CustomDialogController
*/
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomDialogController <: RemoteDataLite {
    private var ffiCancel_: Option<FFIData> = Option.None

    func parseCustomDialogControllerOptions(options: CustomDialogControllerOptions): NativeCustomDialogControllerOptions {
        let nativeGridCount = match (options.gridCount) {
            case Some(value) => NativeOptionInt32(true, Int32(value))
            case None => NativeOptionInt32(false, 0)
        }

        let nativeBackgroundColor = NativeOptionUInt32(true, transAppResourceToResourceColor(options.backgroundColor ?? Color.Transparent))

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
        let nativeIsModal = NativeOptionBool(true, options.isModal ?? true)
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
        var value_ = transAppResourceToLength(options.borderWidth ?? 0.vp)
        let nativeBorderWidth = NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
        let nativeBorderColor = NativeOptionUInt32(true, transAppResourceToResourceColor(options.borderColor ?? Color.Black))
        let nativeBorderStyle = NativeOptionEdgeStyle(true, (options.borderStyle ?? EdgeStyles()).toNative())
        let nativeBackgroundBlurStyle = NativeOptionInt32(true, (options.backgroundBlurStyle ?? BlurStyle.ComponentUltraThick).getValue())
        let nativeOptionShadow = match (options.shadow) {
            case Some(value) => NativeOptionShadow(true, parseNativeShadowOptions(value))
            case None => NativeOptionShadow(false, parseNativeShadowOptions(ShadowOptions(radius: 0.0, shadowType: ShadowType.Color)))
        }
        let cancelLambda = Callback0Param<Unit>(options.cancel ?? {=>})
        this.ffiCancel_ = cancelLambda
        return NativeCustomDialogControllerOptions(
            cancelLambda.getID(),
            options.autoCancel ?? true,
            (options.alignment ?? DialogAlignment.Default).getValue(),
            parseOffset(options.offset ?? Offset(0.vp, 0.vp)),
            options.customStyle ?? false,
            nativeGridCount,
            transAppResourceToResourceColor(options.maskColor ?? Color(0x33000000)),
            (options.maskRect ?? Rectangle()).parseToNative(),
            openAnimation,
            closeAnimation,
            options.showInSubWindow ?? false,
            nativeBackgroundColor,
            NativeLength(
                (options.cornerRadius ?? 32.vp).value,
                (options.cornerRadius ?? 32.vp).unitType.getValue()
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
    /**
    * The constructor transfers parameter settings.
    * 
    * @param { CustomDialogControllerOptions } value
    * @returns { This } 
    * @relation constructor(value: CustomDialogControllerOptions)
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: CustomDialogControllerOptions) {
        super(
            unsafe {
                let nativeOptions = parseCustomDialogControllerOptions(value)
                let id = FfiOHOSAceFrameworkCustomDialogControllerCtorV2(nativeOptions)
                nativeOptions.free()
                id
            })
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setBuilder(builder: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerSetBuilder(this.getID(), Callback0Param<Unit>(builder).getID())
        }
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindView(view: CustomView) {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerBindView(this.getID(), view.getView().getID())
        }
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func openDialog() {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerOpen(this.getID())
        }
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeDialog() {
        unsafe {
            FfiOHOSAceFrameworkCustomDialogControllerClose(this.getID())
        }
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func releaseSelf(): Unit {
        if (let Some(v) <- ffiCancel_) {
            FFIDataManager.getInstance().releaseData(v.getID())
            this.ffiCancel_ = Option.None
        }
    }
}
