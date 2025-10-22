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

protected package ohos.arkui.component.native_struct

import ohos.base.*

protected type VectorNativeRectangleHandle = CPointer<Unit>

@C
protected struct CJBorderRadius {
    protected CJBorderRadius(
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
protected struct CJTranslate {
    protected CJTranslate(
        let x: Float64,
        let xUnit: Int32,
        let y: Float64,
        let yUnit: Int32,
        let z: Float64,
        let zUnit: Int32
    ) {}
}

@C
protected struct CJBindPopupParamsV2 {
    protected CJBindPopupParamsV2(
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
protected struct CJBindCustomPopupV2 {
    protected CJBindCustomPopupV2(
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
protected struct CJResponseRegion {
    protected CJResponseRegion(
        protected let x: Float64,
        protected let xUnit: Int32,
        protected let y: Float64,
        protected let yUnit: Int32,
        protected let width: Float64,
        protected let widthUnit: Int32,
        protected let height: Float64,
        protected let heightUnit: Int32
    ) {}
}

@C
protected struct VectorToCFFIArray {
    protected VectorToCFFIArray(
        protected let size: IntNative,
        protected let buffer: CPointer<Unit>,
        protected let free: CFunc<(CPointer<Unit>) -> Unit>
    ) {}
}

@C
protected struct CJEdge {
    protected let top: Float64
    protected let topUnit: Int32
    protected let right: Float64
    protected let rightUnit: Int32
    protected let bottom: Float64
    protected let bottomUnit: Int32
    protected let left: Float64
    protected let leftUnit: Int32

    protected init(top: Float64, topUnit: Int32, right: Float64, rightUnit: Int32, bottom: Float64, bottomUnit: Int32,
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

    protected init(topLength: Length, rightLength: Length, bottomLength: Length, leftLength: Length) {
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
protected struct CJConstraintSize {
    protected CJConstraintSize(
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
protected struct NativeRectangle {
    protected NativeRectangle(
        protected let x: Float64,
        protected let xUnit: Int32,
        protected let y: Float64,
        protected let yUnit: Int32,
        protected let width: Float64,
        protected let widthUnit: Int32,
        protected let height: Float64,
        protected let heightUnit: Int32
    ) {}
}

@C
protected struct CJContextMenuOptions {
    protected CJContextMenuOptions(
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
protected struct CColors {
    protected CColors(
        let color: UInt32,
        let location: Float64
    ) {}
}

@C
protected struct CArrCColors {
    protected CArrCColors(
        protected let head: CPointer<CColors>,
        protected let size: Int64
    ) {}
}

@C
protected struct NativeOptionCJContextMenuAnimationOptions {
    protected NativeOptionCJContextMenuAnimationOptions(
        let hasValue: Bool,
        let value: CJContextMenuAnimationOptions
    ) {}
}

@C
protected struct NativePosition {
    protected NativePosition(
        let x: Float64,
        let y: Float64
    ) {}
}

@C
protected struct NativeOptionMargin {
    protected NativeOptionMargin(
        let hasValue: Bool,
        let value: NativeMargin
    ) {}
}

@C
protected struct NativeMargin {
    protected NativeMargin(
        let top: Float64,
        let topUnit: Int32,
        let right: Float64,
        let rightUnit: Int32,
        let bottom: Float64,
        let bottomUnit: Int32,
        let left: Float64,
        let leftUnit: Int32
    ) {}
}

@C
protected struct CJContextMenuAnimationOptions {
    protected CJContextMenuAnimationOptions(
        let scaleFrom: NativeOptionFloat64,
        let scaleTo: NativeOptionFloat64,
        let transition: NativeOptionInt64,
        let hoverScaleFrom: NativeOptionFloat64,
        let hoverScaleTo: NativeOptionFloat64
    ) {}
}

@C
protected struct CBindOptions {
    protected CBindOptions(
        protected let backgroundColor: NativeOptionUInt32,
        protected let onAppear: NativeOptionCallBack,
        protected let onDisappear: NativeOptionCallBack,
        protected let onWillAppear: NativeOptionCallBack,
        protected let onWillDisappear: NativeOptionCallBack
    ) {}
}

@C
protected struct NativeShadow {
    protected NativeShadow(
        let hasValue: Bool,
        let value: NativeShadowOptions
    ) {}
}

@C
protected struct NativeEdgeStyles {
    protected NativeEdgeStyles(
        let top: Int32,
        let right: Int32,
        let bottom: Int32,
        let left: Int32
    ) {}
}

@C
protected struct NativeOptionEdgeStyle {
    protected NativeOptionEdgeStyle(
        let hasValue: Bool,
        let value: NativeEdgeStyles
    ) {}
}

@C
protected struct CSheetOptionsV2 {
    protected CSheetOptionsV2(
        protected let backgroundColor: NativeOptionUInt32,
        protected let onAppear: NativeOptionCallBack,
        protected let onDisappear: NativeOptionCallBack,
        protected let onWillAppear: NativeOptionCallBack,
        protected let onWillDisappear: NativeOptionCallBack,
        protected let height: NativeOptionInt32,
        protected let detents: NativeOptionCArrInt32,
        protected let preferType: NativeOptionInt32,
        protected let showClose: NativeOptionBool,
        protected let dragBar: NativeOptionBool,
        protected let blurStyle: NativeOptionInt32,
        protected let maskColor: NativeOptionUInt32,
        protected let title: NativeOptionCallBack,
        protected let enableOutsideInteractive: NativeOptionBool,
        protected let shouldDismiss: NativeOptionCallBack,
        protected let onWillDismiss: NativeOptionCallBack,
        protected let onWillSpringBackWhenDismiss: NativeOptionCallBack,
        protected let onHeightDidChange: NativeOptionCallBack,
        protected let onDetentsDidChange: NativeOptionCallBack,
        protected let onWidthDidChang: NativeOptionCallBack,
        protected let onTypeDidChange: NativeOptionCallBack,
        protected let borderWidth: NativeOptionLength,
        protected let borderColor: NativeOptionUInt32,
        protected let borderStyle: NativeOptionEdgeStyle,
        protected let width: NativeOptionLength,
        protected let shadow: NativeShadow,
        protected let mode: NativeOptionUInt32,
        protected let scrollSizeMode: NativeOptionUInt32
    ) {}
}

@C
protected struct CJPixelRoundPolicy {
    protected CJPixelRoundPolicy(
        let start: Int32,
        let top: Int32,
        let end: Int32,
        let bottom: Int32
    ) {}
}

@C
protected struct CJMotionBlurAnchor {
    protected CJMotionBlurAnchor(
        let x: Float64,
        let y: Float64
    ) {}
}

@C
protected struct CJMotionBlurOptions {
    protected CJMotionBlurOptions(
        let radius: Float64,
        let anchor: CJMotionBlurAnchor
    ) {}
}

@C
protected struct CJBorder {
    protected CJBorder(
        let width: Float64,
        let widthUnit: Int32,
        let color: UInt32,
        let radius: Float64,
        let radiusUnit: Int32,
        let style: Int32
    ) {}
}

@C
protected struct CJForegroundBlurStyleOptions {
    protected CJForegroundBlurStyleOptions(
        let colorMode: Int32,
        let adaptiveColor: Int32,
        let blurOptions: CJBlurOptions,
        let scale: Float32
    ) {}
}

@C
protected struct CJBlurOptions {
    protected CJBlurOptions(let grayscale: VArray<Float32, $2>) {}
}

@C
protected struct CJBackgroundBlurStyleOptions {
    protected CJBackgroundBlurStyleOptions(
        let colorMode: Int32,
        let adaptiveColor: Int32,
        let blurOptions: CJBlurOptions,
        let scale: Float32,
        let policy: Int32,
        let inactiveColor: UInt32
    ) {}
}

@C
protected struct CJBackgroundEffectOptions {
    protected CJBackgroundEffectOptions(
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
protected struct LinearGradientParam {
    protected LinearGradientParam(
        let angle: CPointer<Float64>,
        let direction: Int32,
        let colors: CArrCColors,
        let repeating: Bool
    ) {}
}

@C
protected struct CTupleLength {
    protected CTupleLength(
        let rowValue: Float64,
        let rowUnitType: Int32,
        let column: Float64,
        let columnUnitType: Int32
    ) {}
}

@C
protected struct SweepGradientParam {
    protected SweepGradientParam(
        let center: CTupleLength,
        let start: Float64,
        let end: Float64,
        let rotation: Float64,
        let colors: CArrCColors,
        let repeating: Bool
    ) {}
}

@C
protected struct RadialGradientParam {
    protected RadialGradientParam(
        let center: CTupleLength,
        let radius: Float64,
        let radiusUnit: Int32,
        let colors: CArrCColors,
        let repeating: Bool
    ) {}
}

@C
protected struct NativeMenuElement {
    protected NativeMenuElement(
        let value: NativeOptionCString,
        let icon: NativeOptionCString,
        let enabled: NativeOptionBool,
        let action: NativeOptionCallBack
    ) {}
}

@C
protected struct CArrNativeMenuElement {
    protected CArrNativeMenuElement(
        let head: CPointer<NativeMenuElement>,
        let size: Int64
    ) {}
}

@C
protected struct CJMenuOptions {
    protected CJMenuOptions(
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
protected struct CJOutline {
    protected CJOutline(
        let width: Float64,
        let widthUnit: Int32,
        let color: UInt32,
        let radius: Float64,
        let radiusUnit: Int32,
        let style: Int32
    ) {}
}

@C
protected struct CJSetScale {
    protected CJSetScale(
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
protected struct CJSetRotate {
    protected CJSetRotate(
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
protected struct CJFocusBoxStyle {
    protected CJFocusBoxStyle(
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
protected struct CBorderImageOption {
    protected CBorderImageOption(
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

}

protected class FFIVectorNativeRectangle {
    private let vecHandle: VectorNativeRectangleHandle

    protected init(vec: VectorNativeRectangleHandle) {
        vecHandle = vec
    }

    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeRectangle(size) }
    }

    protected func setElement(index: Int64, value: NativeRectangle): Unit {
        unsafe { FFICJVectorNativeRectangleSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    protected func free(): Unit {
        unsafe { FFICJVectorNativeRectangleDelete(vecHandle) }
    }

    protected func getNativeHandle(): VectorNativeRectangleHandle {
        vecHandle
    }
}
