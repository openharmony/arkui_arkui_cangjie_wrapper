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

import std.math.*

public type VectorNativeRectangleHandle = CPointer<Unit>

@C
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public struct NativeRectangle {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NativeRectangle(
        let x: Float64,
        let xUnit: Int32,
        let y: Float64,
        let yUnit: Int32,
        let width: Float64,
        let widthUnit: Int32,
        let height: Float64,
        let heightUnit: Int32
    ) {}
}

@C
struct CJBorder {
    CJBorder(
        let width: Float64,
        let widthUnit: Int32,
        let color: UInt32,
        let radius: Float64,
        let radiusUnit: Int32,
        let style: Int32
    ) {}
}

@C
struct NativeOptionMargin {
    NativeOptionMargin(
        let hasValue: Bool,
        let value: NativeMargin
    ) {}
}

@C
struct NativePosition {
    NativePosition(
        let x: Float64,
        let y: Float64
    ) {}
}

@C
struct NativeMenuElement {
    NativeMenuElement(
        let value: NativeOptionCString,
        let icon: NativeOptionCString,
        let enabled: NativeOptionBool,
        let action: NativeOptionCallBack
    ) {}
}

@C
struct CArrNativeMenuElement {
    CArrNativeMenuElement(
        let head: CPointer<NativeMenuElement>,
        let size: Int64
    ) {}
}

@C
struct CJContextMenuAnimationOptions {
    CJContextMenuAnimationOptions(
        let scaleFrom: NativeOptionFloat64,
        let scaleTo: NativeOptionFloat64,
        let transition: NativeOptionInt64,
        let hoverScaleFrom: NativeOptionFloat64,
        let hoverScaleTo: NativeOptionFloat64
    ) {}
}

@C
struct NativeOptionCJContextMenuAnimationOptions {
    NativeOptionCJContextMenuAnimationOptions(
        let hasValue: Bool,
        let value: CJContextMenuAnimationOptions
    ) {}
}

@C
struct CJContextMenuOptions {
    CJContextMenuOptions(
        let offset: NativePosition,
        let placement: NativeOptionInt32,
        let enableArrow: Bool,
        let arrowOffset: NativeLength,
        let preview: NativeOptionCallBack,
        let previewAnimationOptions: NativeOptionCJContextMenuAnimationOptions,
        let onAppear: NativeOptionCallBack,
        let onDisappear: NativeOptionCallBack,
        let aboutToAppear: NativeOptionCallBack,
        let aboutToDisappear: NativeOptionCallBack,
        let backgroundColor: UInt32,
        let backgroundBlurStyle: Int32,
        let transition: NativeOptionInt64,
        let borderRadius: NativeOptionRadius,
        let layoutRegionMargin: NativeOptionMargin
    ) {}
}

@C
struct CJMenuOptions {
    CJMenuOptions(
        let offset: NativePosition,
        let placement: NativeOptionInt32,
        let enableArrow: Bool,
        let arrowOffset: NativeLength,
        let preview: NativeOptionCallBack,
        let previewAnimationOptions: NativeOptionCJContextMenuAnimationOptions,
        let onAppear: NativeOptionCallBack,
        let onDisappear: NativeOptionCallBack,
        let aboutToAppear: NativeOptionCallBack,
        let aboutToDisappear: NativeOptionCallBack,
        let backgroundColor: UInt32,
        let backgroundBlurStyle: Int32,
        let transition: NativeOptionInt64,
        let borderRadius: NativeOptionRadius,
        let layoutRegionMargin: NativeOptionMargin,
        let title: NativeOptionCString,
        let showInSubWindow: NativeOptionBool
    ) {}
}

@C
struct CJOutline {
    CJOutline(
        let width: Float64,
        let widthUnit: Int32,
        let color: UInt32,
        let radius: Float64,
        let radiusUnit: Int32,
        let style: Int32
    ) {}
}

@C
struct CJBorderRadius {
    CJBorderRadius(
        let topLeft: Float64,
        let topLeftUnit: Int32,
        let topRight: Float64,
        let topRightUnit: Int32,
        let bottomLeft: Float64,
        let bottomLeftUnit: Int32,
        let bottomRight: Float64,
        let bottomRightUnit: Int32
    ) {}
}

@C
struct CJTranslate {
    CJTranslate(
        let x: Float64,
        let xUnit: Int32,
        let y: Float64,
        let yUnit: Int32,
        let z: Float64,
        let zUnit: Int32
    ) {}
}

@C
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public struct CJEdge {
    let top: Float64
    let topUnit: Int32
    let right: Float64
    let rightUnit: Int32
    let bottom: Float64
    let bottomUnit: Int32
    let left: Float64
    let leftUnit: Int32

    init(top: Float64, topUnit: Int32, right: Float64, rightUnit: Int32, bottom: Float64, bottomUnit: Int32,
        left: Float64, leftUnit: Int32) {
        this.top = top
        this.topUnit = topUnit
        this.right = right
        this.rightUnit = rightUnit
        this.bottom = bottom
        this.bottomUnit = bottomUnit
        this.left = left
        this.leftUnit = leftUnit
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(topLength: Length, rightLength: Length, bottomLength: Length, leftLength: Length) {
        this.top = topLength.value
        this.topUnit = topLength.unitType.getValue()
        this.right = rightLength.value
        this.rightUnit = rightLength.unitType.getValue()
        this.bottom = bottomLength.value
        this.bottomUnit = bottomLength.unitType.getValue()
        this.left = leftLength.value
        this.leftUnit = leftLength.unitType.getValue()
    }
}

@C
struct CJBindPopupParamsV2 {
    CJBindPopupParamsV2(
        let message: CString,
        let placementOnTop: Bool,
        let primaryValue: CString,
        let primaryAction: Int64,
        let secondaryValue: CString,
        let secondaryAction: Int64,
        let onStateChange: Int64,
        let textColor: UInt32,
        let fontWeight: CString,
        let fontSize: Float64,
        let fontSizeUnit: Int32,
        let fontStyle: Int32,
        let arrowOffset: Float64,
        let arrowOffsetUnit: Int32,
        let showInSubWindow: Bool,
        let mask: UInt32,
        let targetSpace: Float64,
        let targetSpacetUnit: Int32,
        let placement: Int32,
        let offsetX: Float64,
        let offsetY: Float64,
        let enableArrow: Bool,
        let popupColor: UInt32,
        let autoCancel: Bool,
        let width: Float64,
        let widthUnit: Int32,
        let arrowPointPosition: CString,
        let arrowWidth: Float64,
        let arrowWidthUnit: Int32,
        let arrowHeight: Float64,
        let arrowHeightUnit: Int32,
        let radius: Float64,
        let radiusUnit: Int32,
        let shadow: Int32,
        let backgroundBlurStyle: Int32,
        let transition: NativeOptionInt64,
        let onWillDismiss: NativeOptionCallBack,
        let followTransformOfTarget: Bool
    ) {}
}

@C
struct CJBindCustomPopupV2 {
    CJBindCustomPopupV2(
        let isShow: Bool,
        let builder: Int64,
        let placement: Int32,
        let maskColor: UInt32,
        let backgroundColor: UInt32,
        let enableArrow: Bool,
        let autoCancel: Bool,
        let onStateChange: Int64,
        let popupColor: UInt32,
        let arrowOffset: Float64,
        let arrowOffsetUnit: Int32,
        let showInSubWindow: Bool,
        let mask: UInt32,
        let targetSpace: Float64,
        let targetSpacetUnit: Int32,
        let offsetX: Float64,
        let offsetY: Float64,
        let width: Float64,
        let widthUnit: Int32,
        let arrowPointPosition: CString,
        let arrowWidth: Float64,
        let arrowWidthUnit: Int32,
        let arrowHeight: Float64,
        let arrowHeightUnit: Int32,
        let radius: Float64,
        let radiusUnit: Int32,
        let shadow: Int32,
        let backgroundBlurStyle: Int32,
        let focusable: Bool,
        let transition: NativeOptionInt64,
        let onWillDismiss: NativeOptionCallBack,
        let followTransformOfTarget: Bool
    ) {}
}

@C
struct CJBlurOptions {
    CJBlurOptions(let grayscale: VArray<Float32, $2>) {}
}

@C
struct CJForegroundBlurStyleOptions {
    CJForegroundBlurStyleOptions(
        let colorMode: Int32,
        let adaptiveColor: Int32,
        let blurOptions: CJBlurOptions,
        let scale: Float32
    ) {}
}

@C
struct CJBackgroundBlurStyleOptions {
    CJBackgroundBlurStyleOptions(
        let colorMode: Int32,
        let adaptiveColor: Int32,
        let blurOptions: CJBlurOptions,
        let scale: Float32,
        let policy: Int32,
        let inactiveColor: UInt32
    ) {}
}

@C
struct CJBackgroundEffectOptions {
    CJBackgroundEffectOptions(
        let radius: Float64,
        let saturation: Float64,
        let brightness: Float64,
        let color: UInt32,
        let adaptiveColor: Int32,
        let blurOptions: CJBlurOptions,
        let policy: Int32,
        let inactiveColor: UInt32
    ) {}
}

@C
struct CJResponseRegion {
    CJResponseRegion(
        let x: Float64,
        let xUnit: Int32,
        let y: Float64,
        let yUnit: Int32,
        let width: Float64,
        let widthUnit: Int32,
        let height: Float64,
        let heightUnit: Int32
    ) {}
}

@C
struct CJConstraintSize {
    CJConstraintSize(
        let minWidth: Float64,
        let minWidthUnit: Int32,
        let maxWidth: Float64,
        let maxWidthUnit: Int32,
        let minHeight: Float64,
        let minHeightUnit: Int32,
        let maxHeight: Float64,
        let maxHeightUnit: Int32
    ) {}
}

@C
struct CJPixelRoundPolicy {
    CJPixelRoundPolicy(
        let start: Int32,
        let top: Int32,
        let end: Int32,
        let bottom: Int32
    ) {}
}

@C
struct CJMotionBlurAnchor {
    CJMotionBlurAnchor(
        let x: Float64,
        let y: Float64
    ) {}
}

@C
struct CJMotionBlurOptions {
    CJMotionBlurOptions(
        let radius: Float64,
        let anchor: CJMotionBlurAnchor
    ) {}
}

@C
struct CJSetScale {
    CJSetScale(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let centerX: Float64,
        let centerXUnit: Int32,
        let centerY: Float64,
        let centerYUnit: Int32
    ) {}
}

@C
struct CColors {
    CColors(
        let color: UInt32,
        let location: Float64
    ) {}
}

@C
struct CArrCColors {
    CArrCColors(
        let head: CPointer<CColors>,
        let size: Int64
    ) {}
}

@C
struct LinearGradientParam {
    LinearGradientParam(
        let angle: CPointer<Float64>,
        let direction: Int32,
        let colors: CArrCColors,
        let repeating: Bool
    ) {}
}

@C
struct CTupleLength {
    CTupleLength(
        let rowValue: Float64,
        let rowUnitType: Int32,
        let column: Float64,
        let columnUnitType: Int32
    ) {}
}

@C
struct SweepGradientParam {
    SweepGradientParam(
        let center: CTupleLength,
        let start: Float64,
        let end: Float64,
        let rotation: Float64,
        let colors: CArrCColors,
        let repeating: Bool
    ) {}
}

@C
struct RadialGradientParam {
    RadialGradientParam(
        let center: CTupleLength,
        let radius: Float64,
        let radiusUnit: Int32,
        let colors: CArrCColors,
        let repeating: Bool
    ) {}
}

@C
struct CBindOptions {
    CBindOptions(
        let backgroundColor: NativeOptionUInt32,
        let onAppear: NativeOptionCallBack,
        let onDisappear: NativeOptionCallBack,
        let onWillAppear: NativeOptionCallBack,
        let onWillDisappear: NativeOptionCallBack
    ) {}
}

@C
struct CJContentCoverOptionsV2 {
    CJContentCoverOptionsV2(
        let modalTransition: UInt32,
        let onWillDismiss: NativeOptionCallBack,
        let transition: NativeOptionInt64,
        let backgroundColor: NativeOptionUInt32,
        let onAppear: NativeOptionCallBack,
        let onDisappear: NativeOptionCallBack,
        let onWillAppear: NativeOptionCallBack,
        let onWillDisappear: NativeOptionCallBack
    ) {}
}

@C
struct CJSetRotate {
    CJSetRotate(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let angle: Float32,
        let centerX: Float64,
        let centerXUnit: Int32,
        let centerY: Float64,
        let centerYUnit: Int32
    ) {}
}

@C
struct NativeShadow {
    NativeShadow(
        let hasValue: Bool,
        let value: NativeShadowOptions
    ) {}
}

@C
struct CSheetOptionsV2 {
    CSheetOptionsV2(
        let backgroundColor: NativeOptionUInt32,
        let onAppear: NativeOptionCallBack,
        let onDisappear: NativeOptionCallBack,
        let onWillAppear: NativeOptionCallBack,
        let onWillDisappear: NativeOptionCallBack,
        let height: NativeOptionInt32,
        let detents: NativeOptionCArrInt32,
        let preferType: NativeOptionInt32,
        let showClose: NativeOptionBool,
        let dragBar: NativeOptionBool,
        let blurStyle: NativeOptionInt32,
        let maskColor: NativeOptionUInt32,
        let title: NativeOptionCallBack,
        let enableOutsideInteractive: NativeOptionBool,
        let shouldDismiss: NativeOptionCallBack,
        let onWillDismiss: NativeOptionCallBack,
        let onWillSpringBackWhenDismiss: NativeOptionCallBack,
        let onHeightDidChange: NativeOptionCallBack,
        let onDetentsDidChange: NativeOptionCallBack,
        let onWidthDidChang: NativeOptionCallBack,
        let onTypeDidChange: NativeOptionCallBack,
        let borderWidth: NativeOptionLength,
        let borderColor: NativeOptionUInt32,
        let borderStyle: NativeOptionEdgeStyle,
        let width: NativeOptionLength,
        let shadow: NativeShadow,
        let mode: NativeOptionUInt32,
        let scrollSizeMode: NativeOptionUInt32
    ) {}
}

@C
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public struct CJCaretOffset {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public CJCaretOffset(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var index: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var x: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var y: Float64
    ) {}
}

@C
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public struct CJRectResult {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public CJRectResult(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var x: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var y: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var width: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var height: Float64
    ) {}
}

@C
struct CJDismissContentCoverAction {
    CJDismissContentCoverAction(
        let reason: Int32,
        let dismissContentCover: CFunc<() -> Unit>
    ) {}

    func parseToCJ(): DismissContentCoverAction {
        return DismissContentCoverAction(
            DismissReason.toEnum(reason),
            dismissContentCover
        )
    }
}

@C
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
struct CJVisibleAreaEventOptions {
    var ratios: VectorFloat64Handle
    var expectedUpdateInterval: Float64 = 1000.0
    init(ratios!: Array<Float64>, expectedUpdateInterval!: Float64 = 1000.0) {
        let vecRatios = FFIVectorFloat64(ratios.size)
        var index = 0
        for (i in 0..ratios.size) {
            vecRatios.setElement(i, ratios[i])
            index++
        }
        this.ratios = vecRatios.getNativeHandle()
        unsafe { vecRatios.free() }
        this.expectedUpdateInterval = expectedUpdateInterval
    }
}

@C
struct CJMultiShadowOptions {
    var radiusValue: Float64
    var offsetXValue: Float64
    var offsetYValue: Float64
    var radiusUnit: Int32
    var offsetXUnit: Int32
    var offsetYUnit: Int32
    init(
        radius!: Length = 20.vp,
        offsetX!: Length = 5.vp,
        offsetY!: Length = 5.vp
    ) {
        this.radiusValue = radius.value
        this.radiusUnit = radius.unitType.getValue()
        this.offsetXValue = offsetX.value
        this.offsetXUnit = offsetX.unitType.getValue()
        this.offsetYValue = offsetY.value
        this.offsetYUnit = offsetY.unitType.getValue()
    }
}

@C
struct CJFocusBoxStyle {
    CJFocusBoxStyle(
        let hasMargin: Bool,
        let hasStrokeColor: Bool,
        let hasStrokeWidth: Bool,
        let margin: Float64,
        let marginUnit: Int32,
        let strokeColor: UInt32,
        let strokeWidth: Float64,
        let strokeWidthUnit: Int32
    ) {}
}

@C
struct CBorderImageOption {
    CBorderImageOption(
        let slice: CJEdge,
        let width: CJEdge,
        let outset: CJEdge,
        let repeat: Int32,
        let fill: Bool
    ) {}
}

foreign {

    func FFICJCreateVectorNativeRectangle(size: Int64): VectorNativeRectangleHandle

    func FFICJVectorNativeRectangleSetElement(vec: VectorNativeRectangleHandle, index: Int64, rectangle: NativeRectangle): Unit

    func FFICJVectorNativeRectangleDelete(vec: VectorNativeRectangleHandle): Unit

    func FfiOHOSAceFrameworkViewAbstractSetWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetHeight(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetResponseRegion(value: CJResponseRegion): Unit

    func FfiOHOSAceFrameworkViewAbstractSetResponseRegionArray(array: VectorNativeRectangleHandle): Unit

    func FfiOHOSAceFrameworkViewAbstractSetConstraintSize(value: CJConstraintSize): Unit

    func FfiOHOSAceFrameworkViewAbstractSetLayoutPriority(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetPixelRound(cjValue: CJPixelRoundPolicy): Unit

    func FfiOHOSAceFrameworkViewAbstractSetMotionBlur(value: CJMotionBlurOptions): Unit

    func FfiOHOSAceFrameworkViewAbstractSetLayoutWeight(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorder(params: CJBorder): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorderWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorderWidthWithCJEdge(params: CJEdge): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorderColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorderRadius(radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAllBorderRadius(value: CJBorderRadius): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorderStyle(style: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetMargin(margin: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetMargins(params: CJEdge): Unit

    func FfiOHOSAceFrameworkViewAbstractSetPadding(padding: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetPaddings(params: CJEdge): Unit

    func FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyleOption(value: Int32, options: CJForegroundBlurStyleOptions): Unit

    func FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyle(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetForegroundColor(strategy: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractSetForegroundResourceColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundImage(src: CString, repeat: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSizeType(imageSize: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSize(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionAlign(align: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionXY(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetScale(value: CJSetScale): Unit

    func FfiOHOSAceFrameworkViewAbstractSetScaleSingle(scale: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetScaleX(scaleVal: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetScaleY(scaleVal: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOpacity(opacity: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetRotate(value: CJSetRotate): Unit

    func FfiOHOSAceFrameworkViewAbstractSetRotateSingle(rotateZ: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetRotateX(rotateVal: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetRotateY(rotateVal: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetTranslate(value: CJTranslate): Unit

    func FfiOHOSAceFrameworkViewAbstractSetTranslateSingle(translateValue: Float64, translateUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetTranslateX(translateValue: Float64, translateUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetTranslateY(translateValue: Float64, translateUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetTransition(): Unit

    func FfiOHOSAceFrameworkViewAbstractTransition(id: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractTransitionWithBack(id: Int64, onFinish: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetTransform(matrix4: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAlign(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetDirection(dirValue: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetPosition(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetMarkAnchor(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOffset(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAlignRules(value: CJAlignRuleOption): Unit

    func FfiOHOSAceFrameworkViewAbstractSetChainMode(option: CJChainInfo): Unit

    func FfiOHOSAceFrameworkViewAbstractSetEnabled(value: Bool): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAspectRatio(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetDisplayPriority(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBlur(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetColorBlend(color: UInt32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackdropBlur(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetWindowBlur(progress: Float32, styleValue: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetShadow(radius: Float64, color: UInt32, offsetX: Float64, offsetY: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetGrayScale(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBrightness(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetSaturate(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetContrast(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetInvert(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetSepia(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetHueRotate(deg: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetFlexBasis(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetFlexGrow(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetFlexShrink(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAlignSelf(alignValue: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetZIndex(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetVisibility(visibility: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetClip(isClip: Bool): Unit

    func FfiOHOSAceFrameworkViewAbstractSetClipByShape(shapeId: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetMaskByShape(shapeId: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetLinearGradientBlur(radius: Float64, direction: Int32,
        blurVec: VectorFloat64Handle, positionVec: VectorFloat64Handle): Unit

    func FfiOHOSAceFrameworkViewAbstractSetInvertWithOptions(low: Float64, high: Float64, threshold: Float64,
        thresholdRange: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBlendMode(value: Int32, `type`: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetUseShadowBatching(value: Bool): Unit

    func FfiOHOSAceFrameworkViewAbstractSetSphericalEffect(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetLightUpEffect(value: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetPixelStretchEffect(params: CJEdge): Unit

    func FfiOHOSAceFrameworkViewAbstractSetSystemBarEffect(): Unit

    func FfiOHOSAceFrameworkViewAbstractSetFreeze(value: Bool): Unit

    func FfiOHOSAceFrameworkViewAbstractSetRenderGroup(value: Bool): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutline(param: CJOutline): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineStyle(style: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineStyles(styleTop: Int32, styleRight: Int32, styleBottom: Int32,
        styleLeft: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineWidths(params: CJEdge): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineColors(colorTop: UInt32, colorRight: UInt32, colorBottom: UInt32,
        colorLeft: UInt32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineRadius(radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOutlineRadiuses(params: CJBorderRadius): Unit

    func FfiOHOSAceFrameworkViewAbstractSetMaskByProgressMask(progressId: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAccessibilityDescription(value: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAccessibilityText(value: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAccessibilityGroup(value: Bool): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAccessibilityLevel(value: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAccessibilityTextHint(value: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractSetAccessibilityVirtualNode(builder: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetClickEffect(level: Int32, scale: Float32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetMotionPath(options: CJMotionPathOptions): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackground(builder: Int64, align: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundBlurStyleOption(
        blurStyle: Int32,
        options: CJBackgroundBlurStyleOptions
    ): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundBlurStyle(blurStyle: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundImageResizable(slice: CJEdge): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundBrightness(rate: Float64, lightUpDegree: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundEffect(value: CJBackgroundEffectOptions): Unit

    func FfiOHOSAceFrameworkViewAbstractPop(): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOverlay(title: CString, align: Int32, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkViewAbstractBindPopupV2(show: Bool, CJBindPopupParams: CJBindPopupParamsV2): Unit

    func FfiOHOSAceFrameworkViewAbstractBindCustomPopupV2(value: CJBindCustomPopupV2): Unit

    func FfiOHOSAceFrameworkViewAbstractBindMenu(valueHandle: VectorStringHandle, menuActionDataId: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractBindCustomMenu(builder: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractBindContextMenu(builder: Int64, responseType: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractBindMenuElement(elements: CArrNativeMenuElement, options: CJMenuOptions): Unit

    func FfiOHOSAceFrameworkViewAbstractBindContextMenuOption(builder: Int64, responseType: Int32,
        options: CJContextMenuOptions): Unit

    func FfiOHOSAceFrameworkViewAbstractLinearGradient(linearGradientParam: LinearGradientParam): Unit

    func FfiOHOSAceFrameworkViewAbstractSweepGradient(sweepGradientParam: SweepGradientParam): Unit

    func FfiOHOSAceFrameworkViewAbstractRadialGradient(radialGradientParam: RadialGradientParam): Unit

    func FfiOHOSAceFrameworkViewAbstractSetInspectorKey(key: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractRenderFit(fitMode: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractSetId(id: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractExpandSafeArea(safeAreaType: UInt32, safeAreaEdge: UInt32): Unit

    func FFIOHOSAceFrameworkMonopolizeEvents(monopolize: Bool): Unit

    func FFIOHOSAceFrameworkFocusable(isFocusable: Bool): Unit

    func FFIOHOSAceFrameworkTabIndex(index: Int32): Unit

    func FFIOHOSAceFrameworkDefaultFocus(isDefaultFocus: Bool): Unit

    func FFIOHOSAceFrameworkGroupDefaultFocus(isGroupDefaultFocus: Bool): Unit

    func FFIOHOSAceFrameworkFocusOnTouch(isFocusOnTouch: Bool): Unit

    func FFIOHOSAceFrameworkFocusBox(style: CJFocusBoxStyle): Unit

    func FFIOHOSAceFrameworkFocusScopePriority(scopeId: CString, priority: Int32): Unit

    func FFIOHOSAceFrameworkFocusScopeId(id: CString, isGroup: Bool, arrowStepOut: Bool): Unit

    func FFIOHOSAceFrameworkBlendColor(color: UInt32, overlayColor: UInt32): UInt32

    func FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(value: Int32, keysArray: CPointer<Int32>, size: Int64,
        callback: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(value: CString, keysArray: CPointer<Int32>, size: Int64,
        callback: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractbindSheetParamV2(isShow: Bool, builder: Int64, options: CSheetOptionsV2): Unit

    func FFIOHOSAceFrameworkBindContentCoverV2(isShow: Bool, builder: Int64,
        cjContentCoverOptions: CJContentCoverOptionsV2): Unit

    func FfiOHOSAceFrameworkViewAbstractSetSharedTransition(id: CString, option: CJSharedTransitionOptions): Unit

    func FfiOHOSAceFrameworkViewAbstractSetGeometryTransition(id: CString, followWithoutTransition: Bool): Unit

    func FfiOHOSAceFrameworkPopupDismiss(): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit

    func FfiOHOSAceFrameworkViewAbstractDismiss(): Unit

    func FfiOHOSAceFrameworkViewAbstractSpringBack(): Unit

    func FfiOHOSAceFrameworkViewAbstractSetDraggable(value: Bool): Unit

    func FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithBuilder(builder: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithDragItemInfo(value: CJDragItemInfo): Unit

    func FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithString(value: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorderImageWithString(source: CString, option: CBorderImageOption): Unit

    func FfiOHOSAceFrameworkViewAbstractShouldBuiltInRecognizerParallelWith(elemId: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetBorderImageWithLinearGradient(
        source: LinearGradientParam,
        option: CBorderImageOption
    ): Unit

    func FfiOHOSAceFrameworkViewAbstractHoverEffect(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractHitTestBehavior(value: Int32): Unit
}

class FFIVectorNativeRectangle {
    private let vecHandle: VectorNativeRectangleHandle

    init(vec: VectorNativeRectangleHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeRectangle(size) }
    }

    func setElement(index: Int64, value: NativeRectangle): Unit {
        unsafe { FFICJVectorNativeRectangleSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorNativeRectangleDelete(vecHandle) }
    }

    func getNativeHandle(): VectorNativeRectangleHandle {
        vecHandle
    }
}
