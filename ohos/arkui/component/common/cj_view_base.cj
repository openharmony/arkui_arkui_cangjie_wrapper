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

package ohos.arkui.component.common

import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.hi_trace_meter.*
import ohos.labels.APILevel
import ohos.matrix4.*
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

    func FfiOHOSAceFrameworkViewAbstractSetBackgroundBlurStyleOption(blurStyle: Int32,
        options: CJBackgroundBlurStyleOptions): Unit

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

    func FfiOHOSAceFrameworkViewAbstractSetBorderImageWithLinearGradient(source: LinearGradientParam,
        option: CBorderImageOption): Unit

    func FfiOHOSAceFrameworkViewAbstractHoverEffect(value: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractHitTestBehavior(value: Int32): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public const MAX_CHANNEL_VALUE: UInt8 = 0xff

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public const MAX_ALPHA_VALUE: Float32 = 1.0

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

public type CustomBuilder = () -> Unit

/**
 * Defines the common method of Component.
 *
 * @relation declare class CommonMethod<T>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ViewBase <: InteractableView & UINodeBase {
    /**
     * Sets the width of the component. By default, the width required to fully hold the
     * component content is used.If the width of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Length } value
     * @returns { This }
     * @relation width(value: Length): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width(value: Option<Length>): This {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => widthInner(i64)
                case f64: Float64 => widthInner(f64)
                case res: AppResource => widthInner(res)
                case length: Length => widthInner(length)
            }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected open func widthInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWidth(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Sets the height of the component. By default, the height required to fully hold the
     * component content is used. If the height of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Length } value
     * @returns { This }
     * @relation height(value: Length): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height(value: Option<Length>): This {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => heightInner(i64)
                case f64: Float64 => heightInner(f64)
                case res: AppResource => heightInner(res)
                case length: Length => heightInner(length)
            }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    protected open func heightInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHeight(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * The size of the current component.
     *
     * @param { Length } width
     * @param { Length } height
     * @returns { This }
     * @relation size(value: SizeOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(width!: Length, height!: Length): This {
        sizeInner(width, height)
        this
    }

    protected open func sizeInner(width: Length, height: Length) {
        var w = transAppResourceToLength(width)
        var h = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSize(w.value, w.unitType.getValue(), h.value, h.unitType.getValue())
        }
        this
    }

    /**
     * Sets the padding of the component.
     *
     * @param { Length } value
     * @returns { This }
     * @relation padding(value: Padding | Length | LocalizedPadding): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: Length): This {
        paddingInner(value)
    }

    protected open func paddingInner(value: Length): This {
        unsafe {
            var v = transAppResourceToLength(value)
            FfiOHOSAceFrameworkViewAbstractSetPadding(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Sets the padding of the component.
     *
     * @param { Length, Length, Length, Length } Indicates safeArea padding values.
     * @returns { This }
     * @relation padding(value: Padding | Length | LocalizedPadding): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This {
        paddingInner(top, right, bottom, left)
        this
    }

    protected open func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var topInner = transAppResourceToLength(top)
        var rightInner = transAppResourceToLength(right)
        var bottomInner = transAppResourceToLength(bottom)
        var leftInner = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPaddings(
                CJEdge(
                    topInner.value,
                    topInner.unitType.getValue(),
                    rightInner.value,
                    rightInner.unitType.getValue(),
                    bottomInner.value,
                    bottomInner.unitType.getValue(),
                    leftInner.value,
                    leftInner.unitType.getValue()
                )
            )
        }
        this
    }

    /**
     * Sets the margin of the component.
     *
     * @param { Length } value
     * @returns { This }
     * @relation margin(value: Margin | Length | LocalizedMargin): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func margin(value: Length): This {
        marginInner(value)
        this
    }

    protected open func marginInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargin(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Sets the margin of the component.
     *
     * @param { Length, Length, Length, Length } Indicates safeArea margin values.
     * @returns { This }
     * @relation margin(value: Margin | Length | LocalizedMargin): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This {
        marginInner(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected open func marginInner(top!: Length, right!: Length, bottom!: Length, left!: Length): This {
        var topInner = transAppResourceToLength(top)
        var rightInner = transAppResourceToLength(right)
        var bottomInner = transAppResourceToLength(bottom)
        var leftInner = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargins(
                CJEdge(
                    topInner.value,
                    topInner.unitType.getValue(),
                    rightInner.value,
                    rightInner.unitType.getValue(),
                    bottomInner.value,
                    bottomInner.unitType.getValue(),
                    leftInner.value,
                    leftInner.unitType.getValue()
                )
            )
        }
        this
    }
    /**
     * Sets the weight of the component during layout. A component with this attribute is allocated space
     * along the main axis of its parent container (Row, Column, or Flex) based on its specified weight.
     *
     * @param { Int32 } value
     * @returns { This }
     * @relation layoutWeight(value: number | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func layoutWeight(value: Int32): This {
        layoutWeightInner(value)
        this
    }

    protected open func layoutWeightInner(value: Int32): This {
        // Note: ViewAbstract::SetLayoutWeight(float value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLayoutWeight(value)
        }
        this
    }

    /**
     * Sets the constraint size of the component, which is used to limit the size range during component layout.
     * Default value: **{minWidth: 0, maxWidth: Infinity, minHeight: 0, maxHeight: Infinity}**.
     *
     * @returns { This }
     * @relation constraintSize(value: ConstraintSizeOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func constraintSize(minWidth!: Length = 0.vp, maxWidth!: Length = (Float64.Inf).vp,
        minHeight!: Length = 0.vp, maxHeight!: Length = (Float64.Inf).vp): This {
        constraintSizeInner(minWidth, maxWidth, minHeight, maxHeight)
        this
    }

    protected open func constraintSizeInner(minWidth: Length, maxWidth: Length, minHeight: Length, maxHeight: Length): This {
        var minWidthInner = transAppResourceToLength(minWidth)
        var maxWidthInner = transAppResourceToLength(maxWidth)
        var minHeightInner = transAppResourceToLength(minHeight)
        var maxHeightInner = transAppResourceToLength(maxHeight)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetConstraintSize(
                CJConstraintSize(
                    minWidthInner.value,
                    minWidthInner.unitType.getValue(),
                    maxWidthInner.value,
                    maxWidthInner.unitType.getValue(),
                    minHeightInner.value,
                    minHeightInner.unitType.getValue(),
                    maxHeightInner.value,
                    maxHeightInner.unitType.getValue()
                )
            )
        }
        this
    }

    /**
     * Sets the alignment mode of the component content in the drawing area.
     * Default value: **Alignment.Center**.
     *
     * @param { Alignment } value
     * @returns { This }
     * @relation align(value: Alignment): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func align(value: Alignment): This {
        alignInner(value)
        this
    }

    protected open func alignInner(value: Alignment): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlign(value.getValue())
        }
        this
    }

    /**
     * Sets how elements are laid out along the main axis of the container.
     * Default value: **Direction.Auto**.
     *
     * @param { Direction } value
     * @returns { This }
     * @relation direction(value: Direction): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func direction(value: Direction): This {
        directionInner(value)
        this
    }

    protected open func directionInner(value: Direction): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDirection(value.getValue())
        }
        this
    }

    /**
     * Sets the absolute position of the component relative to the position of the parent component.
     * The attribute is not available for a layout container whose width and height are zero.
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation position(value: Position | Edges | LocalizedEdges): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func position(x!: Length, y!: Length): This {
        positionInner(x, y)
        this
    }

    protected open func positionInner(xAxis: Length, yAxis: Length): This {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPosition(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        this
    }

    /**
     * Sets the anchor for locating the component, which is used to move the component
     * further away from the position specified by position or offset.
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation markAnchor(value: Position | LocalizedPosition): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func markAnchor(x!: Length, y!: Length): This {
        markAnchorInner(x, y)
        this
    }

    protected open func markAnchorInner(xAxis: Length, yAxis: Length): This {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMarkAnchor(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        this
    }

    /**
     * Sets the offset of the component relative to its original position.
     * <br>The offset attribute does not affect the layout of the parent container.
     * It adjusts the component position only during drawing.
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation offset(value: Position | Edges | LocalizedEdges): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offset(x!: Length, y!: Length): This {
        offsetInner(x, y)
        this
    }

    protected open func offsetInner(xAxis: Length, yAxis: Length): This {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOffset(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        this
    }

    /**
     * Sets the alignment rules in the relative container.
     * This API is valid only when the container is RelativeContainer.
     *
     * @param { AlignRuleOption } value
     * @returns { This }
     * @relation alignRules(value: AlignRuleOption): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignRules(value: AlignRuleOption): This {
        alignRulesInner(value)
        this
    }

    protected open func alignRulesInner(value: AlignRuleOption): This {
        let option = CJAlignRuleOption(value)
        unsafe { FfiOHOSAceFrameworkViewAbstractSetAlignRules(option) }
        option.free()
        this
    }

    /**
     * Sets the aspect ratio of the component, which can be obtained using the following formula: width/height.
     * If only width and aspectRatio are set, the height is calculated using the following formula: width/aspectRatio.
     * If only height and aspectRatio are set, the width is calculated using the following formula: height x aspectRatio.
     * If width, height, and aspectRatio are all set, the explicitly set height is ignored, and the effective height is calculated using the following formula: width/aspectRatio.
     * This parameter takes effect only when a valid value greater than 0 is specified.
     *
     * @relation aspectRatio(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aspectRatio(value: Float64): This {
        aspectRatioInner(value)
        this
    }

    protected open func aspectRatioInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAspectRatio(value)
        }
        this
    }

    /**
     * Sets the display priority for the component in the layout container.
     * This parameter is only effective in Row, Column, and Flex (single-line) container components.
     *
     * @relation displayPriority(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayPriority(value: Int32): This {
        displayPriorityInner(value)
        this
    }

    protected open func displayPriorityInner(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDisplayPriority(value)
        }
        this
    }

    /**
     * Sets the base size of the component in the main axis of the parent container.
     *
     * @relation flexBasis(value: number | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexBasis(value: Length): This {
        flexBasisInner(value)
        this
    }

    protected open func flexBasisInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexBasis(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @relation flexGrow(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexGrow(value: Float64): This {
        flexGrowInner(value)
        this
    }

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @relation flexGrow(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexGrow(value: Int64): This {
        flexGrowInner(Float64(value))
        this
    }

    protected open func flexGrowInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexGrow(value)
        }
        this
    }

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @relation flexShrink(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexShrink(value: Float64): This {
        flexShrinkInner(value)
        this
    }

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @relation flexShrink(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexShrink(value: Int64): This {
        flexShrinkInner(Float64(value))
        this
    }

    protected open func flexShrinkInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexShrink(value)
        }
        this
    }

    /**
     * Sets the alignment mode of the child components along the cross axis of the parent container.
     * Default value: **ItemAlign.Auto**.
     *
     * @param { ItemAlign } value
     * @returns { This }
     * @relation flexShrink(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignSelf(value: ItemAlign): This {
        alignSelfInner(value)
        this
    }

    protected open func alignSelfInner(value: ItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlignSelf(value.getValue())
        }
        this
    }

    /**
     * Sets the response region of the current component.
     *
     * @param { Rectangle } value
     * @returns { This }
     * @relation responseRegion(value: Array<Rectangle> | Rectangle): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(value: Rectangle): This {
        responseRegionInner(value)
        this
    }

    protected open func responseRegionInner(value: Rectangle): This {
        let cjRect = value.parseToNative()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetResponseRegion(
                CJResponseRegion(
                    cjRect.x,
                    cjRect.xUnit,
                    cjRect.y,
                    cjRect.yUnit,
                    cjRect.width,
                    cjRect.widthUnit,
                    cjRect.height,
                    cjRect.heightUnit
                )
            )
        }
        this
    }

    /**
     * Sets the response region of the current component.
     *
     * @param { Array<Rectangle> } value
     * @returns { This }
     * @relation responseRegion(value: Array<Rectangle> | Rectangle): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(value: Array<Rectangle>): This {
        responseRegionInner(value)
    }

    protected open func responseRegionInner(value: Array<Rectangle>): This {
        let vecFFi = FFIVectorNativeRectangle(value.size)
        var index = 0
        for (rect in value) {
            BaseLog.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.parseToNative())
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }

    /**
     * Sets the border.
     *
     * @param { Length } width
     * @param { ResourceColor } color
     * @param { Length } radius
     * @param { BorderStyle } style
     * @returns { This }
     * @relation border(value: BorderOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func border(width!: Length, color!: ResourceColor = Color.BLACK, radius!: Length = 0.vp,
        style!: BorderStyle = BorderStyle.Solid): This {
        borderInner(width, color, radius, style)
        this
    }

    protected open func borderInner(width: Length, color: ResourceColor, radius: Length, style: BorderStyle): This {
        var w = transAppResourceToLength(width)
        var r = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorder(
                CJBorder(w.value, w.unitType.getValue(), transAppResourceToResourceColor(color), r.value,
                    r.unitType.getValue(), style.getValue()))
        }
        this
    }

    /**
     * Sets the border width.
     * Percentage values are not supported.
     *
     * @param { Length } value
     * @returns { This }
     * @throws { IllegalArgumentException } Percentage values are not supported.
     * @relation borderWidth(value: Length | EdgeWidths | LocalizedEdgeWidths): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderWidth(value: Length): This {
        borderWidthInner(value)
        this
    }

    protected open func borderWidthInner(value: Length): This {
        var v = transAppResourceToLength(value)
        if (v.unitType.getValue() == LENGTH_PERCENT) {
            throw IllegalArgumentException("Percentage values are not supported.")
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidth(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Sets the border width.
     *
     * @param { EdgeWidths } value
     * @returns { This }
     * @relation borderWidth(value: Length | EdgeWidths | LocalizedEdgeWidths): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderWidth(value: EdgeWidths): This {
        borderWidthInner(value)
        this
    }

    protected open func borderWidthInner(edgeWidths: EdgeWidths) {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidthWithCJEdge(
                CJEdge(edgeWidths.top.value, edgeWidths.top.unitType.getValue(), edgeWidths.right.value,
                    edgeWidths.right.unitType.getValue(), edgeWidths.bottom.value, edgeWidths
                        .bottom
                        .unitType
                        .getValue(), edgeWidths.left.value, edgeWidths.left.unitType.getValue()))
        }
        this
    }

    /**
     * Sets the border color.
     * Default value: **Color.Black**.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation borderColor(value: ResourceColor | EdgeColors | LocalizedEdgeColors): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderColor(value: ResourceColor): This {
        borderColorInner(value)
        this
    }

    protected open func borderColorInner(value: ResourceColor) {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { Length } topLeft
     * @param { Length } topRight
     * @param { Length } bottomLeft
     * @param { Length } bottomRight
     * @returns { This }
     * @relation borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp): This {
        borderRadiusInner(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        this
    }

    protected open func borderRadiusInner(topLeft!: Length, topRight!: Length, bottomLeft!: Length, bottomRight!: Length): This {
        var topLeftInner = transAppResourceToLength(topLeft)
        var topRightInner = transAppResourceToLength(topRight)
        var bottomLeftInner = transAppResourceToLength(bottomLeft)
        var bottomRightInner = transAppResourceToLength(bottomRight)
        unsafe {
            let value = CJBorderRadius(
                topLeftInner.value,
                topLeftInner.unitType.getValue(),
                topRightInner.value,
                topRightInner.unitType.getValue(),
                bottomLeftInner.value,
                bottomLeftInner.unitType.getValue(),
                bottomRightInner.value,
                bottomRightInner.unitType.getValue()
            )
            FfiOHOSAceFrameworkViewAbstractSetAllBorderRadius(value)
        }
        this
    }

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { Length } value
     * @returns { This }
     * @relation borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(value: Length): This {
        borderRadiusInner(value)
        this
    }

    protected open func borderRadiusInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderRadius(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Sets the border style.
     * Default value: **BorderStyle.Solid**.
     *
     * @param { BorderStyle } value
     * @returns { This }
     * @relation borderStyle(value: BorderStyle | EdgeStyles): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderStyle(value: BorderStyle): This {
        borderStyleInner(value)
    }

    protected open func borderStyleInner(value: BorderStyle): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderStyle(value.getValue())
        }
        this
    }

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { BlurStyle } value
     * @returns { This }
     * @relation foregroundBlurStyle(value: BlurStyle, options?: ForegroundBlurStyleOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundBlurStyle(value: BlurStyle): This {
        foregroundBlurStyleInner(value, Option<ForegroundBlurStyleOptions>.None)
        this
    }

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { BlurStyle } value
     * @param { ForegroundBlurStyleOptions } options
     * @returns { This }
     * @relation foregroundBlurStyle(value: BlurStyle, options?: ForegroundBlurStyleOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundBlurStyle(value: BlurStyle, options: ForegroundBlurStyleOptions): This {
        foregroundBlurStyleInner(value, options)
        this
    }

    protected open func foregroundBlurStyleInner(style: BlurStyle, options: ?ForegroundBlurStyleOptions): This {
        unsafe {
            if (let Some(v) <- options) {
                let ret = CJForegroundBlurStyleOptions(v.colorMode.getValue(), v.adaptiveColor.getValue(),
                    CJBlurOptions(v.blurOptions.grayscale), v.scale)
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyleOption(style.getValue(), ret)
            } else {
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyle(style.getValue())
            }
        }
        this
    }

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ColoringStrategy } value
     * @returns { This }
     * @relation foregroundColor(value: ResourceColor | ColoringStrategy): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundColor(value: ColoringStrategy): This {
        foregroundColorInner(value)
        this
    }

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation foregroundColor(value: ResourceColor | ColoringStrategy): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundColor(value: ResourceColor): This {
        foregroundColorInner(value)
        this
    }

    protected open func foregroundColorInner(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundColor(transAppResourceToResourceColor(value))
        }
        this
    }

    protected open func foregroundColorInner(value: ColoringStrategy): This {
        unsafe {
            try (strategy = LibC.mallocCString(value.getValue()).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetForegroundColor(strategy.value)
            }
        }
        this
    }

    /**
     * Background color
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation backgroundColor(value: ResourceColor): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundColor(value: ResourceColor): This {
        backgroundColorInner(value)
        this
    }

    protected open func backgroundColorInner(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Background image
     *
     * @param { ResourceColor } src
     * @returns { This }
     * @relation backgroundImage(src: ResourceStr | PixelMap, options?: BackgroundImageOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src: ResourceStr): This {
        backgroundImageInner(src, ImageRepeat.NoRepeat)
        this
    }

    /**
     * Background image
     * @param { ResourceColor } src
     * @param { ImageRepeat } repeat
     * @returns { This }
     * @relation backgroundImage(src: ResourceStr | PixelMap, options?: BackgroundImageOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src: ResourceStr, repeat: ImageRepeat): This {
        backgroundImageInner(src, repeat)
        this
    }

    protected open func backgroundImageInner(src: ResourceStr, repeat: ?ImageRepeat): This {
        var repeatUnit = if (let Some(v) <- repeat) {
            v.getValue()
        } else {
            ImageRepeat.NoRepeat.getValue()
        }
        var srcMedia = match (src) {
            case v: String => v
            case v: AppResource => getResourceMedia(v)
            case _ => throw IllegalArgumentException("Invaild type.")
        }
        unsafe {
            try (unsafeSrc = LibC.mallocCString(srcMedia).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetBackgroundImage(unsafeSrc.value, repeatUnit)
            }
        }
        this
    }

    /**
     * Background image size
     *
     * @param { ImageSize } value
     * @returns { This }
     * @relation backgroundImageSize(value: SizeOptions | ImageSize): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImageSize(value: ImageSize): This {
        backgroundImageSizeInner(value)
        this
    }

    /**
     * Background image size
     *
     * @param { Length } width
     * @param { Length } height
     * @returns { This }
     * @relation backgroundImageSize(value: SizeOptions | ImageSize): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): This {
        backgroundImageSizeInner(width, height)
        this
    }

    protected open func backgroundImageSizeInner(width: Length, height: Length): This {
        var w = transAppResourceToLength(width)
        var h = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSize(w.value, w.unitType.getValue(), h.value,
                h.unitType.getValue())
        }
        this
    }

    protected open func backgroundImageSizeInner(imageSize: ImageSize): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSizeType(imageSize.getValue())
        }
        this
    }

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { Alignment } value
     * @returns { This }
     * @relation backgroundImagePosition(value: Position | Alignment): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImagePosition(value: Alignment): This {
        backgroundImagePositionInner(value)
        this
    }

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation backgroundImagePosition(value: Position | Alignment): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): This {
        backgroundImagePositionInner(x, y)
        this
    }

    protected open func backgroundImagePositionInner(xAxis: Length, yAxis: Length): This {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionXY(x.value, x.unitType.getValue(), y.value,
                y.unitType.getValue())
        }
        this
    }

    protected open func backgroundImagePositionInner(value: Alignment): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionAlign(value.getValue())
        }
        this
    }

    /**
     * Scales the component. 
     * Scale ratio along the x-, y-, and z-axis. The default value is **1**.
     * centerX and centerY are used to set the scale center point.
     * default:{x:1,y:1,z:1,centerX:'50%',centerY:'50%'}
     *
     * @param { Float32 } x
     * @param { Float32 } y
     * @param { Float32 } z
     * @param { Length } centerX
     * @param { Length } centerY
     * @returns { This }
     * @relation scale(value: ScaleOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent): This {
        scaleInner(x, y, z, centerX, centerY)
        this
    }

    protected open func scaleInner(x: Float32, y: Float32, z: Float32, centerX: Length, centerY: Length) {
        var cx = transAppResourceToLength(centerX)
        var cy = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScale(
                CJSetScale(x, y, z, cx.value, cx.unitType.getValue(), cy.value, cy.unitType.getValue()))
        }
        this
    }

    /**
     * Sets the opacity of the component.
     *
     * @param { Float64 } value - Opacity of the component. The value ranges from 0 to 1.
     * @returns { This }
     * @relation opacity(value: number | Resource): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func opacity(value: Float64): This {
        opacityInner(value)
        this
    }

    protected open func opacityInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOpacity(value)
        }
        this
    }

    /**
     * Set component rotation.
     *
     * @relation rotate(value: RotateOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 1.0, angle!: Float32 = 0.0,
        centerX!: Length = 50.percent, centerY!: Length = 50.percent): This {
        rotateInner(x, y, z, angle, centerX, centerY)
        this
    }

    protected open func rotateInner(x: Float32, y: Float32, z: Float32, angle: Float32, centerX: Length, centerY: Length): This {
        var cx = transAppResourceToLength(centerX)
        var cy = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotate(
                CJSetRotate(x, y, z, angle, cx.value, cx.unitType.getValue(), cy.value, cy.unitType.getValue()))
        }
        this
    }

    /**
     * Sets the translation effect for page transitions.
     *
     * @relation translate(value: TranslateOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This {
        translateInner(x, y, z)
        this
    }

    protected open func translateInner(xAxis: Length, yAxis: Length, zAxis: Length): This {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(xAxis)
        var z = transAppResourceToLength(xAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslate(
                CJTranslate(x.value, x.unitType.getValue(), y.value, y.unitType.getValue(), z.value,
                    z.unitType.getValue()))
        }
        this
    }

    /**
     * If the value is true, the component is available and can respond to operations such as clicking.
     * If it is set to false, click operations are not responded.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation enabled(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enabled(value: Bool): This {
        enabledInner(value)
        this
    }

    protected open func enabledInner(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetEnabled(value)
        }
        this
    }

    /**
     * If the components of the two pages are configured with the same ID.
     * The shared element transition is performed during transition.
     * If the parameter is set to an empty string, the shared element transition does not occur.
     * For details about the options parameter, see the options parameter description.
     *
     * @relation sharedTransition(id: string, options?: sharedTransitionOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sharedTransition(id: String, options!: SharedTransitionOptions = SharedTransitionOptions()): This {
        sharedTransitionInner(id, options)
        this
    }

    protected open func sharedTransitionInner(id: String, options: SharedTransitionOptions): This {
        unsafe {
            try (unsafeId = LibC.mallocCString(id).asResource(), unsafeCurve = LibC
                .mallocCString(options.curve.getValue())
                .asResource(), unsafeMotionPath = LibC.mallocCString(options.motionPath.path).asResource()) {
                let unsafeOptions = CJSharedTransitionOptions(
                    options.duration,
                    options.delay,
                    options.zIndex,
                    unsafeCurve.value,
                    CJMotionPathOptions(unsafeMotionPath.value, options.motionPath.pathFrom, options.motionPath.pathTo,
                        options.motionPath.rotatable),
                    options.effectType.getValue()
                )
                FfiOHOSAceFrameworkViewAbstractSetSharedTransition(unsafeId.value, unsafeOptions)
            }
        }
        this
    }

    /**
     * Shared geometry transition
     *
     * @param { String } id
     * @param { Bool } followWithoutTransition
     * @returns { This }
     * @relation geometryTransition(id: string, options?: GeometryTransitionOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func geometryTransition(id: String, followWithoutTransition!: Bool = false): This {
        geometryTransitionInner(id, followWithoutTransition)
        this
    }

    protected open func geometryTransitionInner(id: String, value: Bool): This {
        unsafe {
            try (idCString = LibC.mallocCString(id).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetGeometryTransition(idCString.value, value)
            }
        }
        this
    }

    /**
     * Adds the content blurring effect for the current component. The input parameter is the blurring radius.
     * The larger the blurring radius, the more blurring the content.
     * If the value is 0, the content blurring effect is not blurring.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation blur(value: number, options?: BlurOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blur(value: Float64): This {
        blurInner(value)
        this
    }

    protected open func blurInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBlur(value)
        }
        this
    }

    /**
     * Applies a color blend effect to the component.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation colorBlend(value: Color | string | Resource): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colorBlend(value: ResourceColor): This {
        colorBlendInner(value)
        this
    }

    protected open func colorBlendInner(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetColorBlend(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Applies a background blur effect to the component. You can customize the blur radius and grayscale parameters.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation backdropBlur(value: number, options?: BlurOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backdropBlur(value: Float64): This {
        backdropBlurInner(value)
        this
    }

    protected open func backdropBlurInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackdropBlur(value)
        }
        this
    }

    /**
     * Applies a shadow effect to the component.
     *
     * @relation shadow(value: ShadowOptions | ShadowStyle): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadow(radius!: Float64, color!: ResourceColor = Color(0x666666), offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0): This {
        shadowInner(radius, color, offsetX, offsetY)
        this
    }

    protected open func shadowInner(radius: Float64, color: ResourceColor, offsetX: Float64, offsetY: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetShadow(radius, transAppResourceToResourceColor(color), offsetX, offsetY)
        }
        this
    }

    /**
     * Applies a grayscale effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation grayscale(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func grayscale(value: Float64): This {
        grayscaleInner(value)
        this
    }

    protected open func grayscaleInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetGrayScale(value)
        }
        this
    }

    /**
     * Applies a brightness effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation grayscale(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func brightness(value: Float64): This {
        unsafe {
            brightnessInner(value)
        }
        this
    }

    protected open func brightnessInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBrightness(value)
        }
        this
    }

    /**
     * Applies a saturation effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation saturate(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func saturate(value: Float64): This {
        saturateInner(value)
        this
    }

    protected open func saturateInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBrightness(value)
        }
        this
    }

    /**
     * Applies a contrast effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation saturate(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contrast(value: Float64): This {
        contrastInner(value)
        this
    }

    protected open func contrastInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetContrast(value)
        }
        this
    }

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation invert(value: number | InvertOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(value: Float64): This {
        invertInner(value)
        this
    }

    protected open func invertInner(value: Float64): This {
        var realValue = if (value > 1.0) {
            1.0
        } else {
            value
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvert(realValue)
        }
        this
    }

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @relation invert(value: number | InvertOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(low!: Float64, high!: Float64, threshold!: Float64, thresholdRange!: Float64): This {
        invertInner(low, high, threshold, thresholdRange)
        this
    }

    protected open func invertInner(low: Float64, high: Float64, threshold: Float64, thresholdRange: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvertWithOptions(low, high, threshold, thresholdRange)
        }
        this
    }

    protected open func pixelStretchEffectInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top);
        var right_ = transAppResourceToLength(right);
        var bottom_ = transAppResourceToLength(bottom);
        var left_ = transAppResourceToLength(left);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPixelStretchEffect(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
        this
    }

    protected open func outlineWidthInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top);
        var right_ = transAppResourceToLength(right);
        var bottom_ = transAppResourceToLength(bottom);
        var left_ = transAppResourceToLength(left);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineWidths(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
        this
    }

    protected open func outlineColorInner(top: ResourceColor, right: ResourceColor, bottom: ResourceColor,
        left: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineColors(
                transAppResourceToResourceColor(top),
                transAppResourceToResourceColor(right),
                transAppResourceToResourceColor(bottom),
                transAppResourceToResourceColor(left)
            )
        }
        this
    }

    protected open func outlineRadiusInner(topLeft: Length, topRight: Length, bottomLeft: Length, bottomRight: Length): This {
        var topLeft_ = transAppResourceToLength(topLeft);
        var topRight_ = transAppResourceToLength(topRight);
        var bottomLeft_ = transAppResourceToLength(bottomLeft);
        var bottomRight_ = transAppResourceToLength(bottomRight);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineRadiuses(
                CJBorderRadius(
                    topLeft_.value,
                    topLeft_.unitType.getValue(),
                    topRight_.value,
                    topRight_.unitType.getValue(),
                    bottomLeft_.value,
                    bottomLeft_.unitType.getValue(),
                    bottomRight_.value,
                    bottomRight_.unitType.getValue()
                )
            )
        }
        this
    }

    /**
     * Sepia conversion ratio of the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation sepia(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sepia(value: Float64): This {
        sepiaInner(value)
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func sepiaInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSepia(value)
        }
        this
    }

    /**
     * Rotates the hue of the component.
     *
     * @param { Float32 } value
     * @returns { This }
     * @relation hueRotate(value: number | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hueRotate(value: Float32): This {
        hueRotateInner(value)
        this
    }

    protected open func hueRotateInner(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHueRotate(value)
        }
        this
    }

    /**
     * The sibling components in the same container are hierarchically displayed. A larger value of z indicates a higher display level.
     *
     * @param { Int32 } value
     * @returns { This }
     * @relation zIndex(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func zIndex(value: Int32): This {
        zIndexInner(value)
        this
    }

    protected open func zIndexInner(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetZIndex(value)
        }
        this
    }

    /**
     * Controls the display or hide of the current component.
     *
     * @param { Visibility } value
     * @returns { This }
     * @relation visibility(value: Visibility): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func visibility(value: Visibility): This {
        visibilityInner(value)
        this
    }

    protected open func visibilityInner(value: Visibility): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetVisibility(value.getValue())
        }
        this
    }

    /**
     * Sets whether to clip the areas of child components that extend beyond this component's boundaries,
     * That is, whether to perform clipping based on the edge contour of the parent container.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation clip(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func clip(value: Bool): This {
        clipInner(value)
        this
    }

    protected open func clipInner(isClip: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClip(isClip)
        }
        this
    }

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { ShapeAbstract } value
     * @returns { This }
     * @relation clipShape(value: CircleShape | EllipseShape | PathShape | RectShape): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clipShape(value: ShapeAbstract): This {
        clipShapeInner(value)
        this
    }

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { ShapeAbstract } value
     * @returns { This }
     * @relation maskShape(value: CircleShape | EllipseShape | PathShape | RectShape): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maskShape(value: ShapeAbstract): This {
        maskShapeInner(value)
        this
    }

    protected open func clipShapeInner(value: ShapeAbstract): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClipByShape(value.getID())
        }
        this
    }

    protected open func maskShapeInner(value: ShapeAbstract): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMaskByShape(value.getID())
        }
        this
    }

    protected open func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractPop()
        }
        this
    }

    /**
     * Add mask text to the current component. The layout is the same as that of the current component.
     *
     * @relation overlay(value: string | CustomBuilder | ComponentContent, options?: OverlayOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func overlay(value!: String, align!: Alignment = Alignment.Center,
        offset!: ContentOffset = ContentOffset(x: 0.0, y: 0.0)): This {
        overlayInner(value, align, offset)
        this
    }

    protected open func overlayInner(title: String, align: Alignment, offset: ContentOffset): This {
        unsafe {
            try (titleCString = LibC.mallocCString(title).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetOverlay(titleCString.value, align.getValue(), offset.xOffset,
                    offset.yOffset)
            }
        }
        this
    }

    func parseToDismissPopupAction(reason: Int32): DismissPopupAction {
        return DismissPopupAction(reason: DismissReason.toEnum(reason))
    }

    func callFFIBindPopup(popup: PopupOptions, primaryActionId: Int64, secondaryActionId: Int64, onStateChangeId: Int64,
        nativeOnWillDismiss: NativeOptionCallBack, nativeTransition: NativeOptionInt64, nativePlacement: Int32,
        show: Bool): Unit {
        unsafe {
            let nativeArrowPointPosition = match (popup.arrowPointPosition) {
                case Some(value) => LibC.mallocCString(value.getValue())
                case None => LibC.mallocCString("")
            }
            let message = LibC.mallocCString(popup.message)
            let primaryValue = LibC.mallocCString(popup.primaryButton.value)
            let secondaryValue = LibC.mallocCString(popup.secondaryButton.value)
            let messageOptions = popup.messageOptions
            let fontWeight = LibC.mallocCString(messageOptions.font.weight.getValue())
            FfiOHOSAceFrameworkViewAbstractBindPopupV2(
                show,
                CJBindPopupParamsV2(message, popup.placementOnTop, primaryValue, primaryActionId, secondaryValue,
                    secondaryActionId, onStateChangeId, messageOptions.textColor.toUInt32(), fontWeight,
                    messageOptions.font.size.value, messageOptions.font.size.unitType.getValue(),
                    messageOptions.font.style.getValue(), popup.arrowOffset.value, popup
                        .arrowOffset
                        .unitType
                        .getValue(), popup.showInSubWindow, popup.mask.toUInt32(), popup.targetSpace.value,
                    popup.targetSpace.unitType.getValue(), nativePlacement, popup.offset.y.value, popup.offset.x.value,
                    popup.enableArrow, popup.popupColor.toUInt32(), popup.autoCancel, popup.width.value,
                    popup.width.unitType.getValue(), nativeArrowPointPosition, popup.arrowWidth.value,
                    popup.arrowWidth.unitType.getValue(), popup.arrowHeight.value, popup
                        .arrowHeight
                        .unitType
                        .getValue(), popup.radius.value, popup.radius.unitType.getValue(), popup.shadow.getValue(),
                    popup.backgroundBlurStyle.getValue(), nativeTransition, nativeOnWillDismiss,
                    popup.followTransformOfTarget)
            )
            LibC.free(message)
            LibC.free(primaryValue)
            LibC.free(secondaryValue)
            LibC.free(nativeArrowPointPosition)
            LibC.free(fontWeight)
        }
    }

    func callFFIBindCustomPopup(popup: CustomPopupOptions, onStateChangeId: Int64,
        nativeOnWillDismiss: NativeOptionCallBack, nativeTransition: NativeOptionInt64, nativePopupColor: UInt32,
        nativeMask: UInt32, show: Bool): Unit {
        unsafe {
            let nativeArrowPointPosition = match (popup.arrowPointPosition) {
                case Some(value) => LibC.mallocCString(value.getValue())
                case None => LibC.mallocCString("")
            }
            FfiOHOSAceFrameworkViewAbstractBindCustomPopupV2(
                CJBindCustomPopupV2(show, Callback0Param<Unit>(popup.builder).getID(), popup.placement.getValue(),
                    popup.maskColor.toUInt32(), popup.backgroundColor.toUInt32(), popup.enableArrow, popup.autoCancel,
                    onStateChangeId, nativePopupColor, popup.arrowOffset.value, popup.arrowOffset.unitType.getValue(),
                    popup.showInSubWindow, nativeMask, popup.targetSpace.value, popup.targetSpace.unitType.getValue(),
                    popup.offset.x, popup.offset.y, popup.width.value, popup.width.unitType.getValue(),
                    nativeArrowPointPosition, popup.arrowWidth.value, popup.arrowWidth.unitType.getValue(),
                    popup.arrowHeight.value, popup.arrowHeight.unitType.getValue(), popup.radius.value,
                    popup.radius.unitType.getValue(), popup.shadow.getValue(), popup.backgroundBlurStyle.getValue(),
                    popup.focusable, nativeTransition, nativeOnWillDismiss, popup.followTransformOfTarget))
            LibC.free(nativeArrowPointPosition)
        }
    }

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @relation bindPopup(show: boolean, popup: PopupOptions | CustomPopupOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindPopup(show: Bool, popup: PopupOptions): This {
        bindPopupInner(show, popup)
        this
    }

    protected open func bindPopupInner(show: Bool, popup: PopupOptions): This {
        var primaryActionId: Int64 = if (!popup.primaryButton.value.isEmpty()) {
            Callback0Param<Unit>(popup.primaryButton.action).getID()
        } else {
            INVALID_CALLBACK_ID
        }
        var secondaryActionId: Int64 = if (!popup.secondaryButton.value.isEmpty()) {
            Callback0Param<Unit>(popup.secondaryButton.action).getID()
        } else {
            INVALID_CALLBACK_ID
        }
        var onStateChangeId: Int64 = if (let Some(v) <- popup.onStateChange) {
            let lambda = {isVisible: Bool => v(StateChangeEvent(isVisible))}
            Callback1Param<Bool, Unit>(lambda).getID()
        } else {
            INVALID_CALLBACK_ID
        }

        let nativeOnWillDismiss: NativeOptionCallBack = if (let Some(v) <- popup.onWillDismiss) {
            let wrapper = {action: Int32 => v(parseToDismissPopupAction(action))}
            let lambdaData = Callback1Param<Int32, Unit>(wrapper)
            NativeOptionCallBack(true, lambdaData.getID())
        } else {
            NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }

        let nativeTransition: NativeOptionInt64 = if (let Some(v) <- popup.transition) {
            NativeOptionInt64(true, v.getID())
        } else {
            NativeOptionInt64(false, 0)
        }

        let nativePlacement: Int32 = if (let Some(v) <- popup.placement) {
            v.getValue()
        } else {
            if (popup.placementOnTop) {
                Placement.Top.getValue()
            } else {
                Placement.Bottom.getValue()
            }
        }
        callFFIBindPopup(popup, primaryActionId, secondaryActionId, onStateChangeId, nativeOnWillDismiss,
            nativeTransition, nativePlacement, show)
        this
    }

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @relation bindPopup(show: boolean, popup: PopupOptions | CustomPopupOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindPopup(show: Bool, popup: CustomPopupOptions): This {
        bindPopupInner(show, popup)
        this
    }

    protected open func bindPopupInner(show: Bool, popup: CustomPopupOptions): This {
        var onStateChangeId = match (popup.onStateChange) {
            case Some(v) =>
                let lambda = {
                    isVisible: Bool => v(StateChangeEvent(isVisible))
                }
                Callback1Param<Bool, Unit>(lambda).getID()
            case None => INVALID_CALLBACK_ID
        }

        let nativeOnWillDismiss = match (popup.onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    action: Int32 => value(parseToDismissPopupAction(action))
                }
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }

        let nativeTransition = match (popup.transition) {
            case Some(value) => NativeOptionInt64(true, value.getID())
            case None => NativeOptionInt64(false, 0)
        }

        let nativePopupColor = match (popup.popupColor) {
            case Some(value) => value.toUInt32()
            case None => popup.backgroundColor.toUInt32()
        }

        let nativeMask = match (popup.mask) {
            case Some(value) => value.toUInt32()
            case None => popup.maskColor.toUInt32()
        }
        callFFIBindCustomPopup(popup, onStateChangeId, nativeOnWillDismiss, nativeTransition, nativePopupColor,
            nativeMask, show)
        this
    }

    /**
     * Menu control
     *
     * @relation bindMenu(content: Array<MenuElement> | CustomBuilder, options?: MenuOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindMenu(content: Array<Action>): This {
        bindMenuInner(content)
        this
    }

    protected open func bindMenuInner(content: Array<Action>): This {
        let valueVecFFi = FFIVectorString(content.size)
        var index = 0
        for (menuElement in content) {
            valueVecFFi.setElement(index, menuElement.value)
            index++
        }
        let data = MenuActionData(content)
        let callback = {
            actionName: CString => data.actionHandle(actionName.toString())
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindMenu(
                valueVecFFi.getNativeHandle(),
                Callback1Param<CString, Unit>(callback).getID()
            )
            valueVecFFi.free()
        }
        this
    }

    /**
     * Menu control
     *
     * @relation bindMenu(content: Array<MenuElement> | CustomBuilder, options?: MenuOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindMenu(content: CustomBuilder): This {
        bindMenuInner(content)
        this
    }

    protected open func bindMenuInner(builder: CustomBuilder): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindCustomMenu(Callback0Param<Unit>(builder).getID())
        }
        this
    }

    /**
     * Binds a context menu to the component, whose visibility is subject to the isShown settings.
     *
     * @relation bindContextMenu(isShown: boolean, content: CustomBuilder, options?: ContextMenuOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindContextMenu(content: CustomBuilder, responseType: ResponseType,
        options!: ContextMenuOptions = ContextMenuOptions()): This {
        bindContextMenuInner(content, responseType, options)
        this
    }

    protected open func bindContextMenuInner(builder: CustomBuilder, responseType: ResponseType,
        options: ContextMenuOptions): This {
        var optionElement: CJContextMenuOptions = options.parseContextMenuOptions()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindContextMenuOption(
                Callback0Param<Unit>(builder).getID(),
                responseType.getValue(),
                optionElement
            )
        }
        this
    }

    /**
     * Linear Gradient
     * angle: Angle of Linear Gradient. The default value is 180;
     * direction: Direction of Linear Gradient. The default value is GradientDirection.Bottom;
     * colors: Color description for gradients.
     * repeating: repeating. The default value is false
     *
     * @relation linearGradient(value: LinearGradientOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func linearGradient(angle!: ?Float64 = None, direction!: GradientDirection = GradientDirection.Bottom,
        colors!: Array<(ResourceColor, Float64)> = [(Color.TRANSPARENT, 0.0)], repeating!: Bool = false): This {
        linearGradientInner(angle, direction, colors, repeating)
        this
    }

    protected open func linearGradientInner(angle: ?Float64, direction: GradientDirection,
        colors: Array<(ResourceColor, Float64)>, repeating: Bool): This {
        let directionValue = direction.getValue()
        let cColorsArr = toCArrCColors(colors)
        unsafe {
            var cAnglePoint = CPointer<Float64>()
            if (let Some(v) <- angle) {
                cAnglePoint = LibC.malloc<Float64>(count: 1)
                cAnglePoint.write(v)
            }
            let linearGradientParam = LinearGradientParam(cAnglePoint, directionValue, cColorsArr, repeating)
            FfiOHOSAceFrameworkViewAbstractLinearGradient(linearGradientParam)
            LibC.free(cAnglePoint)
            LibC.free(cColorsArr.head)
        }
        this
    }

    /**
     * Creates a sweep gradient.
     *
     * @relation sweepGradient(value: SweepGradientOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sweepGradient(center: (Length, Length), start!: Float64 = 0.0, end!: Float64 = 0.0,
        rotation!: Float64 = 0.0, colors!: Array<(ResourceColor, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false): This {
        sweepGradientInner(center, start, end, rotation, colors, repeating)
        this
    }

    protected open func sweepGradientInner(center: (Length, Length), start: Float64, end: Float64, rotation: Float64,
        colors: Array<(ResourceColor, Float64)>, repeating: Bool): This {
        let cCenter = CTupleLength(center[0].value, center[0].unitType.getValue(), center[1].value,
            center[1].unitType.getValue())
        let cColorsArr = toCArrCColors(colors)
        let sweepGradientParam = SweepGradientParam(cCenter, start, end, rotation, cColorsArr, repeating)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSweepGradient(sweepGradientParam)
            LibC.free(cColorsArr.head)
        }
        this
    }

    /**
     * Creates a radial gradient.
     *
     * @relation radialGradient(value: RadialGradientOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radialGradient(center: (Length, Length), radius: Length, colors: Array<(ResourceColor, Float64)>,
        repeating!: Bool = false): This {
        radialGradientInner(center, radius, colors, repeating)
        this
    }

    protected open func radialGradientInner(center: (Length, Length), radius: Length,
        colors: Array<(ResourceColor, Float64)>, repeating: Bool): This {
        var radius_ = transAppResourceToLength(radius)
        let cCenter = CTupleLength(center[0].value, center[0].unitType.getValue(), center[1].value,
            center[1].unitType.getValue())
        let cColorsArr = toCArrCColors(colors)
        let radialGradientParam = RadialGradientParam(cCenter, radius_.value, radius_.unitType.getValue(), cColorsArr,
            repeating)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRadialGradient(radialGradientParam)
            LibC.free(cColorsArr.head)
        }
        this
    }

    func toCArrCColors(colors: Array<(ResourceColor, Float64)>): CArrCColors {
        let colorSize = colors.size
        let colorsArr = Array<CColors>(
            colorSize,
            {
                index =>
                let color = colors[index][0].toUInt32()
                let location = colors[index][1]
                CColors(color, location)
            }
        )
        let arr: CPointer<CColors> = unsafe { LibC.malloc<CColors>(count: colorSize) }
        for (i in 0..colorSize) {
            unsafe {
                arr.write(i, colorsArr[i])
            }
        }
        return CArrCColors(arr, colorSize)
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>): This {
        keyboardShortcutInner(value, keys, action: None)
        this
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: String, keys: Array<ModifierKey>): This {
        keyboardShortcutInner(value, keys, action: None)
        this
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>, action: () -> Unit): This {
        keyboardShortcutInner(value, keys, action: action)
        this
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: String, keys: Array<ModifierKey>, action: () -> Unit): This {
        keyboardShortcutInner(value, keys, action: action)
        this
    }

    protected open func keyboardShortcutInner(value: CombinationKeyType, keys: Array<ModifierKey>, action!: ?() -> Unit): This {
        unsafe {
            let modifierKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                modifierKeys.write(i, keys[i].getValue())
            }
            if (let Some(v) <- (value as String)) {
                try (cValue = LibC.mallocCString(v).asResource()) {
                    if (let Some(actionFunc) <- action) {
                        FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue.value, modifierKeys, keys.size,
                            Callback0Param<Unit>(actionFunc).getID())
                    } else {
                        FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue.value, modifierKeys, keys.size, 0)
                    }
                } finally {
                    LibC.free<Int32>(modifierKeys)
                }
                return this
            }
            if (let Some(v) <- (value as FunctionKey)) {
                if (let Some(actionFunc) <- action) {
                    FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(v.getValue(), modifierKeys, keys.size,
                        Callback0Param<Unit>(actionFunc).getID())
                } else {
                    FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(v.getValue(), modifierKeys, keys.size, 0)
                }
                LibC.free<Int32>(modifierKeys)
            }
        }
        return this
    }

    /**
     * Key. User can set an key to the component to identify it.
     *
     * @relation key(value: string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func key(value: String): This {
        keyInner(value)
        this
    }

    protected open func keyInner(value: String): This {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetInspectorKey(unsafeValue.value)
            }
        }
        this
    }

    /**
     * How the final state of the component's content is rendered during its width and height animation process.
     *
     * @relation renderFit(fitMode: RenderFit): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func renderFit(fitMode: RenderFit): This {
        renderFitInner(fitMode)
        this
    }

    protected func renderFitInner(fitMode: RenderFit): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRenderFit(fitMode.getValue())
        }
        this
    }

    /**
     * Id. User can set an id to the component to identify it.
     *
     * @relation id(value: string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(value: String): This {
        idInner(value)
        this
    }

    protected open func idInner(value: String): This {
        unsafe {
            let unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetId(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

    /**
     * Sets the safe area to be expanded to.
     *
     * @relation expandSafeArea(types?: Array<SafeAreaType>, edges?: Array<SafeAreaEdge>): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func expandSafeArea(types!: ?Array<SafeAreaType> = None, edges!: ?Array<SafeAreaEdge> = None): This {
        expandSafeAreaInner(types, edges)
        this
    }

    protected open func expandSafeAreaInner(types: ?Array<SafeAreaType>, edges: ?Array<SafeAreaEdge>) {
        var typesArray = if (let Some(tys) <- types) {
            tys
        } else {
            [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD]
        }
        var edgesArray = if (let Some(edge) <- edges) {
            edge
        } else {
            [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END]
        }
        var safeAreaType: UInt32 = 0
        for (i in 0..typesArray.size) {
            safeAreaType |= typesArray[i].getValue()
        }
        var safeAreaEdge: UInt32 = 0
        for (i in 0..edgesArray.size) {
            safeAreaEdge |= edgesArray[i].getValue()
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractExpandSafeArea(safeAreaType, safeAreaEdge)
        }
        this
    }

    /**
     * Binds a modal page to the component, whose visibility is subject to the isShow settings.
     *
     * @relation bindContentCover(isShow: boolean, builder: CustomBuilder, options?: ContentCoverOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindContentCover(isShow: Bool, builder: CustomBuilder,
        options!: ContentCoverOptions = ContentCoverOptions()): This {
        bindContentCoverInner(isShow, builder, options)
        this
    }

    protected open func bindContentCoverInner(isShow: Bool, builder: CustomBuilder, options: ContentCoverOptions): This {
        let cjBindCustomPopup = options.parseCJContentCoverOptions(options)
        unsafe {
            FFIOHOSAceFrameworkBindContentCoverV2(isShow, Callback0Param<Unit>(builder).getID(), cjBindCustomPopup)
        }
        this
    }

    /**
     * animation
     *
     * @relation animation(value: AnimateParam): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationStart(value: AnimateParam): This {
        animationStartInner(value)
        this
    }

    protected open func animationStartInner(value: AnimateParam): This {
        unsafe {
            let param = NativeOptionAnimateParam(true, parseAnimateParam(value))
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
        }
        this
    }

    /**
     * animation
     *
     * @relation animation(value: AnimateParam): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationEnd(): This {
        animationEndInner()
        this
    }

    protected open func animationEndInner(): This {
        unsafe {
            let param = NativeOptionAnimateParam(false, NativeAnimateParam())
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
        }
        this
    }

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @relation transition(value: TransitionEffect): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transition(value: TransitionEffect): This {
        transitionInner(value)
        this
    }

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @relation transition(value: TransitionEffect): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transition(value: TransitionEffect, onFinish: (Bool) -> Unit): This {
        transitionInner(value, onFinish)
        this
    }

    protected open func transitionInner(value: TransitionEffect, onFinish: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(onFinish)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransitionWithBack(value.getID(), lambdaData.getID())
        }
        this
    }

    protected open func transitionInner(value: TransitionEffect): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransition(value.getID())
        }
        this
    }

    /**
     * Set focusable.
     * Components that have default interaction logic, such as Button and TextInput, are focusable by default. Other
     * components, such as Text and Image, are not focusable by default. Only focusable components can trigger a focus event.
     *
     * @relation focusable(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusable(value: Bool): This {
        focusableInner(value)
        this
    }

    protected open func focusableInner(value: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkFocusable(value)
        }
        this
    }

    /**
     * Set focus index by key tab.
     * The tabIndex and focusScopeId cannot be used together.
     *
     * @relation tabIndex(index: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabIndex(index: Int32): This {
        tabIndexInner(index)
        this
    }

    protected open func tabIndexInner(index: Int32): This {
        unsafe {
            FFIOHOSAceFrameworkTabIndex(index)
        }
        this
    }

    /**
     * Set default focused component when a page create.
     *
     * @relation defaultFocus(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func defaultFocus(value: Bool): This {
        defaultFocusInner(value)
        this
    }

    protected open func defaultFocusInner(value: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkDefaultFocus(value)
        }
        this
    }

    /**
     * Set default focused component when focus on a focus group.
     *
     * @relation groupDefaultFocus(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func groupDefaultFocus(value: Bool): This {
        groupDefaultFocusInner(value)
        this
    }

    protected open func groupDefaultFocusInner(value: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkGroupDefaultFocus(value)
        }
        this
    }

    /**
     * Set a component focused when the component be touched.
     *
     * @relation focusOnTouch(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusOnTouch(value: Bool): This {
        focusOnTouchInner(value)
        this
    }

    protected open func focusOnTouchInner(value: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkFocusOnTouch(value)
        }
        this
    }

    protected init() {
        super()
    }

    protected init(id: Int64) {
        super(id)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func initial(): Unit {
        pop()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func update(): Unit {
        pop()
    }

    /**
     * Binds a sheet page to the component, whose visibility is subject to the isShow settings.
     *
     * @relation bindSheet(isShow: boolean, builder: CustomBuilder, options?: SheetOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSheet(isShow: Bool, builder: CustomBuilder, options!: SheetOptions = SheetOptions()): This {
        bindSheetInner(isShow, builder, options)
        this
    }

    protected open func bindSheetInner(isShow: Bool, builder: CustomBuilder, options: SheetOptions): This {
        let cBuilder = Callback0Param<Unit>(builder).getID()
        let cSheetOption = SheetOptions.parse(options)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractbindSheetParamV2(isShow, cBuilder, cSheetOption)
            if (cSheetOption.detents.hasValue) {
                LibC.free<Int32>(cSheetOption.detents.value.head)
            }
        }
        this
    }

    /**
     * Set preview of the component for dragging process
     *
     * @relation dragPreview(value: CustomBuilder | DragItemInfo | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dragPreview(value: String): This {
        dragPreviewInner(value)
        this
    }

    protected open func dragPreviewInner(value: String): This {
        unsafe {
            try (unsafeSrc = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithString(unsafeSrc.value)
            }
        }
        this
    }
}
