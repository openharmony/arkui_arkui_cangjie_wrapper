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

package ohos.arkui.component.common

import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.hi_trace_meter.*
import ohos.labels.APILevel
import ohos.arkui.shape.*
import std.regex.*
import std.math.*
import std.convert.*

foreign {
    func FfiOHOSAceFrameworkViewContextAnimation(option: NativeOptionAnimateParam): Unit
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
    func FfiOHOSAceFrameworkViewAbstractSetLinearGradientBlur(radius: Float64, direction: Int32, blurVec: VectorFloat64Handle, positionVec: VectorFloat64Handle): Unit
    func FfiOHOSAceFrameworkViewAbstractSetInvertWithOptions(low: Float64, high: Float64, threshold: Float64, thresholdRange: Float64): Unit
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
    func FfiOHOSAceFrameworkViewAbstractSetOutlineStyles(styleTop: Int32, styleRight: Int32, styleBottom: Int32, styleLeft: Int32): Unit
    func FfiOHOSAceFrameworkViewAbstractSetOutlineWidth(width: Float64, unit: Int32): Unit
    func FfiOHOSAceFrameworkViewAbstractSetOutlineWidths(params: CJEdge): Unit
    func FfiOHOSAceFrameworkViewAbstractSetOutlineColor(value: UInt32): Unit
    func FfiOHOSAceFrameworkViewAbstractSetOutlineColors(colorTop: UInt32, colorRight: UInt32, colorBottom: UInt32, colorLeft: UInt32): Unit
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
    func FfiOHOSAceFrameworkViewAbstractSetBackgroundBlurStyleOption(blurStyle: Int32, options: CJBackgroundBlurStyleOptions): Unit
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
    func FfiOHOSAceFrameworkViewAbstractBindContextMenuOption(builder: Int64, responseType: Int32, options: CJContextMenuOptions): Unit
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
    func FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(value: Int32, keysArray: CPointer<Int32>, size: Int64, callback: Int64): Unit
    func FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(value: CString, keysArray: CPointer<Int32>, size: Int64, callback: Int64): Unit
    func FfiOHOSAceFrameworkViewAbstractbindSheetParamV2(isShow: Bool, builder: Int64, options: CSheetOptionsV2): Unit
    func FFIOHOSAceFrameworkBindContentCoverV2(isShow: Bool, builder: Int64, cjContentCoverOptions: CJContentCoverOptionsV2): Unit
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
    func FfiOHOSAceFrameworkViewAbstractSetBorderImageWithLinearGradient(source: LinearGradientParam, option: CBorderImageOption): Unit
    func FfiOHOSAceFrameworkViewAbstractHoverEffect(value: Int32): Unit
    func FfiOHOSAceFrameworkViewAbstractHitTestBehavior(value: Int32): Unit
}

/**
 * Defines the CustomBuilder Type.
 *
 */
public type CustomBuilder = () -> Unit

/**
 * Defines the finish callback type used in transition.
 *
 */
public type TransitionFinishCallback = (Bool) -> Unit

@OverflowWrapping
func decode(data: Array<UInt8>): Option<Array<UInt8>> {
    var arrLength: Int64 = data.size
    var index: Int64 = 0
    var temp: Array<UInt8> = Array<UInt8>(arrLength / 2, repeat: 0)
    var i: Int64 = 0
    while (i < arrLength) {
        var highFour: UInt8 = unhex(data[i])
        i++
        var lowFour: UInt8 = unhex(data[i])
        i++
        var str: UInt8 = UInt8((highFour << 4) | lowFour)
        temp[index] = str
        index++
    }
    return Option<Array<UInt8>>.Some(temp)
}

@OverflowWrapping
func unhex(c: UInt8): UInt8 {
    match {
        case UInt8(UInt32(r'0')) <= c && c <= UInt8(UInt32(r'9')) => UInt8(UInt32(c) - UInt32(r'0'))
        case UInt8(UInt32(r'a')) <= c && c <= UInt8(UInt32(r'f')) => UInt8(UInt32(c) - UInt32(r'a') + UInt32(10))
        case UInt8(UInt32(r'A')) <= c && c <= UInt8(UInt32(r'F')) => UInt8(UInt32(c) - UInt32(r'A') + UInt32(10))
        case _ => UInt8(0)
    }
}

func processDataBeforeDecode(data: Array<UInt8>): Array<UInt8> {
    var temp: Array<UInt8> = Array<UInt8>(data.size, repeat: 0)
    var index: Int64 = 0
    for (i in 0..data.size) {
        let ch = data[i]
        if (ch.isAsciiHex()) {
            temp[index] = ch
            index++
        } else if (ch == UInt8(UInt32(r'\0'))) {
            break
        } else if (ch == UInt8(UInt32(r'\r')) || ch == UInt8(UInt32(r'\n')) || ch == UInt8(UInt32(r' ')) || ch == UInt8(UInt32(r'\t'))) {
            continue
        } else {
            return Array<UInt8>()
        }
    }
    if (index <= 0 || index % 2 != 0) {
        return Array<UInt8>()
    }
    return temp[0..index]
}

func fromHexStringToArray(data: String): Option<Array<Byte>> {
    var strChArr: Array<UInt8> = unsafe { data.rawData() }
    if (strChArr.size == 0) {
        return Option<Array<UInt8>>.Some(Array<UInt8>())
    }
    var temp: Array<UInt8> = processDataBeforeDecode(strChArr)
    if (temp.size == 0) {
        return Option<Array<UInt8>>.None
    }
    return decode(temp)
}
