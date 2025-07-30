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
import ohos.arkui.state_management.*

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

/**
 * Defines the base class of Component.
 *
 * @since 11
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ViewBase <: InteractableView & ComponentRender {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width<T>(value: Option<T>): This where T <: Length {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => width(i64)
                case f64: Float64 => width(f64)
                case res: AppResource => width(res)
                case length: Length => width(length)
                case _ => throw IllegalArgumentException("Invalid size setting")
            }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height<T>(value: Option<T>): This where T <: Length {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => height(i64)
                case f64: Float64 => height(f64)
                case res: AppResource => height(res)
                case length: Length => height(length)
            }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func padding(value: Length): This {
        unsafe {
            var value_ = transAppResourceToLength(value)
            FfiOHOSAceFrameworkViewAbstractSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

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
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPaddings(
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func margin(value: Length): This {
        var value_ = transAppResourceToLength(value)
        marginInner(value_)
        this
    }

    protected open func marginInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargin(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This {
        marginInner(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected open func marginInner(top!: Length, right!: Length, bottom!: Length, left!: Length) {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargins(
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func layoutWeight(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLayoutWeight(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func constraintSize(
        minWidth!: Length = 0.vp,
        maxWidth!: Length = (Float64.Inf).vp,
        minHeight!: Length = 0.vp,
        maxHeight!: Length = (Float64.Inf).vp
    ): This {
        constraintSizeInner(minWidth, maxWidth, minHeight, maxHeight)
        this
    }

    protected open func constraintSizeInner(
        minWidth: Length,
        maxWidth: Length,
        minHeight: Length,
        maxHeight: Length
    ): This {
        var minWidth_ = transAppResourceToLength(minWidth)
        var maxWidth_ = transAppResourceToLength(maxWidth)
        var minHeight_ = transAppResourceToLength(minHeight)
        var maxHeight_ = transAppResourceToLength(maxHeight)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetConstraintSize(
                CJConstraintSize(
                    minWidth_.value,
                    minWidth_.unitType.getValue(),
                    maxWidth_.value,
                    maxWidth_.unitType.getValue(),
                    minHeight_.value,
                    minHeight_.unitType.getValue(),
                    maxHeight_.value,
                    maxHeight_.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func align(value: Alignment): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlign(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func direction(value: Direction): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDirection(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func position(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPosition(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func markAnchor(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMarkAnchor(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func offset(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOffset(x_.value, x_.unitType.getValue(), y_.value, y_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func alignRules(value: AlignRuleOption): This {
        let option = CJAlignRuleOption(value)
        unsafe { FfiOHOSAceFrameworkViewAbstractSetAlignRules(option) }
        option.free()
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func aspectRatio(value: Int64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAspectRatio(Float64(value))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func displayPriority(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDisplayPriority(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func flexBasis(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexBasis(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func flexGrow(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexGrow(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func flexGrow(value: Int64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexGrow(Float64(value))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func flexShrink(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexShrink(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func flexShrink(value: Int64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexShrink(Float64(value))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func alignSelf(value: ItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlignSelf(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func responseRegion(rect: Rectangle): This {
        let cjRect = rect.parseToNative()
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func responseRegionArray(array: Array<Rectangle>): This {
        let vecFFi = FFIVectorNativeRectangle(array.size)
        var index = 0
        for (rect in array) {
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

    func layoutPriority(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLayoutPriority(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func border(
        width!: Length,
        color!: ResourceColor = Color.BLACK,
        radius!: Length = 0.vp,
        style!: BorderStyle = BorderStyle.Solid
    ): This {
        borderInner(width, color, radius, style)
        this
    }

    protected open func borderInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: BorderStyle
    ): This {
        var width_ = transAppResourceToLength(width)
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorder(
                CJBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    transAppResourceToResourceColor(color),
                    radius_.value,
                    radius_.unitType.getValue(),
                    style.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderWidth(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderWidth(edgeWidths: EdgeWidths): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidthWithCJEdge(
                CJEdge(
                    edgeWidths.top.value,
                    edgeWidths.top.unitType.getValue(),
                    edgeWidths.right.value,
                    edgeWidths.right.unitType.getValue(),
                    edgeWidths.bottom.value,
                    edgeWidths.bottom.unitType.getValue(),
                    edgeWidths.left.value,
                    edgeWidths.left.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(
        topLeft!: Length = 0.vp,
        topRight!: Length = 0.vp,
        bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp
    ): This {
        borderRadiusInner(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        this
    }

    protected open func borderRadiusInner(
        topLeft!: Length,
        topRight!: Length,
        bottomLeft!: Length,
        bottomRight!: Length
    ): This {
        var topLeft_ = transAppResourceToLength(topLeft)
        var topRight_ = transAppResourceToLength(topRight)
        var bottomLeft_ = transAppResourceToLength(bottomLeft)
        var bottomRight_ = transAppResourceToLength(bottomRight)
        unsafe {
            let value = CJBorderRadius(
                topLeft_.value,
                topLeft_.unitType.getValue(),
                topRight_.value,
                topRight_.unitType.getValue(),
                bottomLeft_.value,
                bottomLeft_.unitType.getValue(),
                bottomRight_.value,
                bottomRight_.unitType.getValue()
            )
            FfiOHOSAceFrameworkViewAbstractSetAllBorderRadius(value)
        }
        this
    }

    protected open func borderRadiusInner(radius: Length): This {
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderRadius(radius_.value, radius_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderRadius(radius: Length): This {
        borderRadiusInner(radius)
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderStyle(style: BorderStyle): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderStyle(style.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundBlurStyle(value: ForegroundBlurStyle, options!: Option<ForegroundBlurStyleOptions> = None): This {
        unsafe {
            if (let Some(v) <- options) {
                let ret = CJForegroundBlurStyleOptions(v.colorMode.getValue(), v.adaptiveColor.getValue(),
                    CJBlurOptions(v.blurOptions.grayscale), v.scale)
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyleOption(value.getValue(), ret)
            } else {
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyle(value.getValue())
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func foregroundColor(value: ColoringStrategy): This {
        unsafe {
            let strategy = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkViewAbstractSetForegroundColor(strategy)
            LibC.free(strategy)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func foregroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetForegroundResourceColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src!: String, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This {
        var repeatInt32 = repeat.getValue()
        unsafe {
            let unsafeSrc = LibC.mallocCString(src)
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImage(unsafeSrc, repeatInt32)
            LibC.free(unsafeSrc)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src!: AppResource, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This {
        var srcMedia = getResourceMedia(src)
        backgroundImage(src: srcMedia, repeat: repeat)
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backgroundImageSize(imageSize: ImageSize): This {
        var imageSizeInt32 = imageSize.getValue()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSizeType(imageSizeInt32)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSize(width_.value, width_.unitType.getValue(),
                height_.value, height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backgroundImagePosition(align: Alignment): This {
        var alignInt32 = align.getValue()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionAlign(alignInt32)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionXY(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(
        x!: Float32 = 1.0,
        y!: Float32 = 1.0,
        z!: Float32 = 1.0,
        centerX!: Length = 50.percent,
        centerY!: Length = 50.percent
    ): This {
        var centerX_ = transAppResourceToLength(centerX)
        var centerY_ = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScale(
                CJSetScale(
                    x,
                    y,
                    z,
                    centerX_.value,
                    centerX_.unitType.getValue(),
                    centerY_.value,
                    centerY_.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func scale(scaleValue: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleSingle(scaleValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func scale(scaleValue: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleSingle(Float32(scaleValue))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func scaleX(scale: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleX(scale)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func scaleX(scale: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleX(Float32(scale))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func scaleY(scale: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleY(scale)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func scaleY(scale: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleY(Float32(scale))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func opacity(opacityValue: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOpacity(opacityValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func opacity(opacityValue: Int64): This {
        opacity(Float64(opacityValue))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(
        x!: Float32 = 0.0,
        y!: Float32 = 0.0,
        z!: Float32 = 1.0,
        angle!: Float32 = 0.0,
        centerX!: Length = 50.percent,
        centerY!: Length = 50.percent
    ): This {
        var centerX_ = transAppResourceToLength(centerX)
        var centerY_ = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotate(
                CJSetRotate(
                    x,
                    y,
                    z,
                    angle,
                    centerX_.value,
                    centerX_.unitType.getValue(),
                    centerY_.value,
                    centerY_.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rotate(
        x!: Float32,
        y!: Float32,
        z!: Float32,
        angle!: Float32,
        centerX!: AppResource,
        centerY!: AppResource
    ): This {
        rotate(x: x, y: y, z: z, angle: angle, centerX: getResourceLength(centerX), centerY: getResourceLength(centerY))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rotate(rotateZ: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateSingle(rotateZ)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rotate(rotateZ: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateSingle(Float32(rotateZ))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rotateX(rotateVal: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateX(rotateVal)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rotateX(rotateVal: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateX(Float32(rotateVal))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rotateY(rotateVal: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateY(rotateVal)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rotateY(rotateVal: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateY(Float32(rotateVal))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        var z_ = transAppResourceToLength(z)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslate(
                CJTranslate(
                    x_.value,
                    x_.unitType.getValue(),
                    y_.value,
                    y_.unitType.getValue(),
                    z_.value,
                    z_.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func translate(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslateSingle(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func translateX(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslateX(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func translateY(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslateY(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func transition(): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTransition()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func enabled(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetEnabled(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func sharedTransition(id: String, options!: SharedTransitionOptions): This {
        unsafe {
            let unsafeId = LibC.mallocCString(id)
            let unsafeCurve = LibC.mallocCString(options.curve.getValue())
            let unsafeMotionPath = LibC.mallocCString(options.motionPath.path)
            let unsafeOptions = CJSharedTransitionOptions(
                options.duration,
                options.delay,
                options.zIndex,
                unsafeCurve,
                CJMotionPathOptions(
                    unsafeMotionPath,
                    options.motionPath.`from`,
                    options.motionPath.to,
                    options.motionPath.rotatable
                ),
                options.`type`.getValue()
            )
            FfiOHOSAceFrameworkViewAbstractSetSharedTransition(unsafeId, unsafeOptions)
            LibC.free(unsafeId)
            LibC.free(unsafeCurve)
            LibC.free(unsafeMotionPath)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func geometryTransition(id: String, followWithoutTransition!: Bool = false): This {
        unsafe {
            let idCString = LibC.mallocCString(id)
            FfiOHOSAceFrameworkViewAbstractSetGeometryTransition(idCString, followWithoutTransition)
            LibC.free(idCString)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func blur(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBlur(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func blur(value: Int64): This {
        blur(Float64(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func colorBlend(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetColorBlend(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backdropBlur(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackdropBlur(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backdropBlur(value: Int64): This {
        backdropBlur(Float64(value))
        this
    }

    func windowBlur(progress!: Float32 = 0.0, blurStyle!: WindowBlurStyle = WindowBlurStyle.SmallLight): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWindowBlur(progress, blurStyle.getValue())
        }
        this
    }
    func windowBlur(progress!: Int32 = 0, blurStyle!: WindowBlurStyle = WindowBlurStyle.SmallLight): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWindowBlur(Float32(progress), blurStyle.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadow(
        radius!: Float64,
        color!: ResourceColor = Color(0x666666),
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0
    ): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetShadow(radius, transAppResourceToResourceColor(color), offsetX, offsetY)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadow(
        radius!: Int64,
        color!: ResourceColor = Color(0x666666),
        offsetX!: Int64 = 0,
        offsetY!: Int64 = 0
    ): This {
        shadow(
            radius: Float64(radius),
            color: transAppResourceToResourceColor(color),
            offsetX: Float64(offsetX),
            offsetY: Float64(offsetY)
        )
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func grayscale(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetGrayScale(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func grayscale(value: Int64): This {
        grayscale(Float64(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func brightness(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBrightness(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func brightness(value: Int64): This {
        brightness(Float64(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func saturate(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSaturate(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func saturate(value: Int64): This {
        saturate(Float64(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func contrast(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetContrast(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func contrast(value: Int64): This {
        contrast(Float64(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func invert(value: Float64): This {
        var realValue = value
        if (realValue > 1.0) {
            realValue = 1.0
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvert(realValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func invert(value: Int64): This {
        invert(Float64(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func invert(low!: Float64, high!: Float64, threshold!: Float64, thresholdRange!: Float64): This {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func sepia(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSepia(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func sepia(value: Int64): This {
        sepia(Float64(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func hueRotate(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHueRotate(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func hueRotate(value: Int32): This {
        hueRotate(Float32(value))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func zIndex(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetZIndex(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func visibility(value: Visibility): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetVisibility(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func clip(isClip: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClip(isClip)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func clip(shape: ShapeAbstract): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClipByShape(shape.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func mask(shape: ShapeAbstract): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMaskByShape(shape.getID())
        }
        this
    }

    protected open func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractPop()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func overlay(
        title!: String,
        align!: Alignment = Alignment.Center,
        offset!: ContentOffset = ContentOffset(x: 0.0, y: 0.0)
    ): This {
        unsafe {
            let titleCString = LibC.mallocCString(title)
            FfiOHOSAceFrameworkViewAbstractSetOverlay(
                titleCString,
                align.getValue(),
                offset.xOffset,
                offset.yOffset
            )
            LibC.free(titleCString)
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindPopup(show!: Bool, popup!: PopupOptions): This {
        var primaryActionId = INVALID_CALLBACK_ID
        if (!popup.primaryButton.value.isEmpty()) {
            primaryActionId = Callback0Param<Unit>(popup.primaryButton.action).getID()
        }

        var secondaryActionId = INVALID_CALLBACK_ID
        if (!popup.secondaryButton.value.isEmpty()) {
            secondaryActionId = Callback0Param<Unit>(popup.secondaryButton.action).getID()
        }
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

        let nativePlacement = match (popup.placement) {
            case Some(value) => value.getValue()
            case None => match (popup.placementOnTop) {
                case true => Placement.Top.getValue()
                case false => Placement.Bottom.getValue()
            }
        }
        callFFIBindPopup(popup, primaryActionId, secondaryActionId, onStateChangeId, nativeOnWillDismiss,
            nativeTransition, nativePlacement, show)
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindPopup(show!: Bool, popup!: CustomPopupOptions): This {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindMenu(menuList: Array<Action>): This {
        let valueVecFFi = FFIVectorString(menuList.size)
        var index = 0
        for (i in menuList) {
            BaseLog.debug("bindMenu vecdata: " + i.value)
            valueVecFFi.setElement(index, i.value)
            index++
        }
        let data = MenuActionData(menuList)
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindMenu(builder!: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindCustomMenu(Callback0Param<Unit>(builder).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindContextMenu(builder!: () -> Unit, responseType!: ResponseType,
        options!: ContextMenuOptions): This {
        var optionElement: CJContextMenuOptions = options.parseCContextMenuOptions()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindContextMenuOption(
                Callback0Param<Unit>(builder).getID(),
                responseType.getValue(),
                optionElement
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func linearGradient(
        angle!: Option<Float64> = None,
        direction!: GradientDirection = Bottom,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
        let cDirection = direction.getValue()
        let cColorsArr = toCArrCColors(colors)
        unsafe {
            var cAngle = CPointer<Float64>()
            if (let Some(v) <- angle) {
                cAngle = LibC.malloc<Float64>(count: 1)
                cAngle.write(v)
            }
            let linearGradientParam = LinearGradientParam(cAngle, cDirection, cColorsArr, repeating)
            FfiOHOSAceFrameworkViewAbstractLinearGradient(linearGradientParam)
            LibC.free(cAngle)
            LibC.free(cColorsArr.head)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sweepGradient(
        center: (Length, Length),
        start!: Float64 = 0.0,
        end!: Float64 = 0.0,
        rotation!: Float64 = 0.0,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radialGradient(
        center: (Length, Length),
        radius: Float64,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
        radialGradient(center, radius.vp, colors: colors, repeating: repeating)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radialGradient(
        center: (Length, Length),
        radius: Length,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
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

    func toCArrCColors(colors: Array<(Color, Float64)>): CArrCColors {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>): This {
        unsafe {
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(value.getValue(), cKeys, keys.size, 0)
            LibC.free<Int32>(cKeys)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func keyboardShortcut(value: String, keys: Array<ModifierKey>): This {
        unsafe {
            let cValue = LibC.mallocCString(value)
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue, cKeys, keys.size, 0)
            LibC.free(cValue)
            LibC.free<Int32>(cKeys)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>, action: () -> Unit): This {
        unsafe {
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(value.getValue(), cKeys, keys.size,
                Callback0Param<Unit>(action).getID())
            LibC.free<Int32>(cKeys)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func keyboardShortcut(value: String, keys: Array<ModifierKey>, action: () -> Unit): This {
        unsafe {
            let cValue = LibC.mallocCString(value)
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue, cKeys, keys.size,
                Callback0Param<Unit>(action).getID())
            LibC.free(cValue)
            LibC.free<Int32>(cKeys)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func key(value: String): This {
        unsafe {
            let unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetInspectorKey(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func renderFit(fitMode: RenderFit): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRenderFit(fitMode.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func id(value: String): This {
        unsafe {
            let unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetId(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func expandSafeArea(
        types!: Array<SafeAreaType> = [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD],
        edges!: Array<SafeAreaEdge> = [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END]
    ): This {
        var safeAreaType: UInt32 = 0
        for (i in 0..types.size) {
            safeAreaType |= types[i].getValue()
        }
        var safeAreaEdge: UInt32 = 0
        for (i in 0..edges.size) {
            safeAreaEdge |= edges[i].getValue()
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractExpandSafeArea(safeAreaType, safeAreaEdge)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindContentCover(isShow: Bool, builder: () -> Unit, contentCoverOptions: ContentCoverOptions): This {
        let cjBindCustomPopup = contentCoverOptions.parseCJContentCoverOptions(contentCoverOptions)
        unsafe {
            FFIOHOSAceFrameworkBindContentCoverV2(isShow, Callback0Param<Unit>(builder).getID(), cjBindCustomPopup)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func animationStart(animation: AnimateParam): This {
        unsafe {
            let param = NativeOptionAnimateParam(true, parseAnimateParam(animation))
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func animationEnd(): This {
        unsafe {
            let param = NativeOptionAnimateParam(false, NativeAnimateParam())
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func transition(effect: TransitionEffect): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransition(effect.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func transition(effect: TransitionEffect, onFinish: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(onFinish);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransitionWithBack(effect.getID(), lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func focusable(isFocusable: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkFocusable(isFocusable)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func tabIndex(index: Int32): This {
        unsafe {
            FFIOHOSAceFrameworkTabIndex(index)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func defaultFocus(isDefaultFocus: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkDefaultFocus(isDefaultFocus)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func groupDefaultFocus(isGroupDefaultFocus: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkGroupDefaultFocus(isGroupDefaultFocus)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func focusOnTouch(isFocusOnTouch: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkFocusOnTouch(isFocusOnTouch)
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSheet(isShow: Bool, builder: () -> Unit, options!: SheetOptions = SheetOptions()): This {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func startTrace(name: String, taskId: Int32): This {
        HiTraceMeter.startTrace(name, taskId)
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func finishTrace(name: String, taskId: Int32): This {
        HiTraceMeter.finishTrace(name, taskId)
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func dragPreview(value: String): This {
        unsafe {
            var unsafeSrc = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithString(unsafeSrc)
            LibC.free(unsafeSrc)
        }
        this
    }
}
