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

package ohos.arkui.component.swiper

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
struct CJIndicatorStyle {
    CJIndicatorStyle(
        let left: Float64,
        let leftUnit: Int32,
        let top: Float64,
        let topUnit: Int32,
        let right: Float64,
        let rightUnit: Int32,
        let bottom: Float64,
        let bottomUnit: Int32,
        let size: Float64,
        let sizeUnit: Int32,
        let color: UInt32,
        let selectedColor: UInt32,
        let mask: Bool
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkSwiperCreate(controller: Int64): Unit

    func FfiOHOSAceFrameworkSwiperSetAutoplay(autoPlay: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetDuration(duration: UInt32): Unit

    func FfiOHOSAceFrameworkSwiperSetIndex(index: UInt32): Unit

    func FfiOHOSAceFrameworkSwiperSetInterval(interval: UInt32): Unit

    func FfiOHOSAceFrameworkSwiperSetLoop(loop: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetVertical(isVertical: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetIndicator(showIndicator: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetIndicatorWithDot(showIndicator: CJDotIndicator): Unit

    func FfiOHOSAceFrameworkSwiperSetIndicatorWithDit(showIndicator: CJDigitIndicator): Unit

    func FfiOHOSAceFrameworkSwiperSetWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSwiperSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSwiperSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkSwiperSetItemSpace(itemSpace: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSwiperSetDisplayMode(displayMode: Int32): Unit

    func FfiOHOSAceFrameworkSwiperSetEffectMode(effectMode: Int32): Unit

    func FfiOHOSAceFrameworkSwiperSetDisplayCountByGroup(count: Int32, swipeByGroup: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetDisplayCountWithObj(count: CJSwiperAutoFill, swipeByGroup: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetCachedCount(cachedCount: Int32): Unit

    func FfiOHOSAceFrameworkSwiperSetEnabled(value: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetDisableSwipe(disable: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetCurve(curveStr: CString): Unit

    func FfiOHOSAceFrameworkSwiperSetDigital(value: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetDisplayArrowWithBool(value: Bool, isHoverShow: Bool): Unit

    func FfiOHOSAceFrameworkSwiperSetDisplayArrowWithObj(value: CJArrowStyle, isHoverShow: Bool): Unit

    func FfiOHOSAceFrameworkSwiperNextMargin(value: Float64, unit: Int32, ignoreBlank: Bool): Unit

    func FfiOHOSAceFrameworkSwiperPrevMargin(value: Float64, unit: Int32, ignoreBlank: Bool): Unit

    func FfiOHOSAceFrameworkSwiperNestedScroll(value: Int32): Unit

    func FfiOHOSAceFrameworkSwiperIndicatorInteractive(value: Bool): Unit

    func FfiOHOSAceFrameworkSwiperOnAnimationStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkSwiperOnAnimationEnd(callback: Int64): Unit

    func FfiOHOSAceFrameworkSwiperOnGestureSwipe(callback: Int64): Unit

    func FfiOHOSAceFrameworkSwiperOnContentDidScroll(callback: Int64): Unit

    func FfiOHOSAceFrameworkSwiperCustomContentTransition(timeout: Int32, callback: Int64): Unit

    func FfiOHOSAceFrameworkSwiperControllerShowNext(controllerId: Int64): Unit

    func FfiOHOSAceFrameworkSwiperControllerShowPrevious(controllerId: Int64): Unit

    func FfiOHOSAceFrameworkSwiperControllerChangeIndex(index: Int32, useAnimation: Bool, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkSwiperControllerFinishAnimation(controllerId: Int64): Unit

    func FfiOHOSAceFrameworkSwiperControllerFinishAnimationWithCallback(controllerId: Int64, callback: Int64): Unit

    func FfiOHOSAceFrameworkSwiperSetOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkSwiperControllerCtor(): Int64

    func FfiOHOSAceFrameworkSwiperSetIndicatorStyle(style: CJIndicatorStyle): Unit

    func FfiOHOSAceFrameworkSwiperContentProxyFinishTransition(): Unit

    func FfiOHOSAceFrameworkInteractableViewOnClick(callback: Int64): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

@C
struct CJIndicator {
    CJIndicator(
        let left: Float64,
        let leftUnit: Int32,
        let top: Float64,
        let topUnit: Int32,
        let right: Float64,
        let rightUnit: Int32,
        let bottom: Float64,
        let bottomUnit: Int32,
        let start: Float64,
        let startUnit: Int32,
        let end: Float64,
        let endUnit: Int32
    ) {}
}

@C
struct CJDotIndicator {
    CJDotIndicator(
        let itemWidth: Float64,
        let itemWidthUnit: Int32,
        let itemHeight: Float64,
        let itemHeightUnit: Int32,
        let selectedItemWidth: Float64,
        let selectedItemWidthUnit: Int32,
        let selectedItemHeight: Float64,
        let selectedItemHeightUnit: Int32,
        let mask: Bool,
        let color: UInt32,
        let selectedColor: UInt32,
        let maxDisplayCount: UInt32,
        let indicator: CJIndicator
    ) {}
}

@C
struct CJDigitIndicator {
    CJDigitIndicator(
        let fontColor: UInt32,
        let selectedColor: UInt32,
        let digitFontSize: Float64,
        let digitFontSizeUnit: Int32,
        let digitFontWeight: CString,
        let selectedDigitFontSize: Float64,
        let selectedDigitFontSizeUnit: Int32,
        let selectedDigitFontWeight: CString,
        let indicator: CJIndicator
    ) {}
}

@C
struct CJSwiperAutoFill {
    CJSwiperAutoFill(
        let minSize: Float64,
        let minSizeUnit: Int32
    ) {}
}

@C
struct CJArrowStyle {
    CJArrowStyle(
        let showBackground: Bool,
        let isSidebarMiddle: Bool,
        let backgroundSize: Float64,
        let backgroundSizeUnit: Int32,
        let backgroundColor: UInt32,
        let arrowSize: Float64,
        let arrowSizeUnit: Int32,
        let arrowColor: UInt32
    ) {}
}

@C
struct CJSwiperAnimationEvent {
    CJSwiperAnimationEvent(
        let currentOffset: Float64,
        let targetOffset: Float64,
        let velocity: Float64
    ) {}
}

@C
struct CJSwiperContentTransitionProxy {
    CJSwiperContentTransitionProxy(
        let selectedIndex: Int32,
        let index: Int32,
        let position: Float64,
        let mainAxisLength: Float64,
        let proxy: CPointer<Unit>,
        let finishTransition: CFunc<(CPointer<Unit>) -> Unit>
    ) {}
}

/**
 * Defines the indicator class.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Indicator {
    private var mLeft: ?Length = None
    private var mTop: ?Length = None
    private var mRight: ?Length = None
    private var mBottom: ?Length = None
    private var mStart: ?Length = None
    private var mEnd: ?Length = None

    init() {}

    /**
     * DotIndicator class object.
     *
     * @returns { DotIndicator }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func dot(): DotIndicator {
        DotIndicator()
    }

    /**
     * DigitIndicator class object.
     *
     * @returns { DigitIndicator }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func digit(): DigitIndicator {
        DigitIndicator()
    }

    /**
     * Sets the position of the navigation indicator relative to the left edge of the Swiper component.
     *
     * @params { ?Length } value - the indicator to the left.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func left(value: ?Length): This {
        this.mLeft = transAppResourceToLength(value ?? 0.0.px)
        this
    }

    /**
     * Sets the position of the navigation indicator relative to the top edge of the Swiper component.
     *
     * @params { ?Length } value - the indicator to the left.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func top(value: ?Length): This {
        this.mTop = transAppResourceToLength(value ?? 0.0.px)
        this
    }

    /**
     * Sets the position of the navigation indicator relative to the right edge of the Swiper component.
     *
     * @params { ?Length } value - the indicator to the left.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func right(value: ?Length): This {
        this.mRight = transAppResourceToLength(value ?? 0.0.px)
        this
    }

    /**
     * Sets the position of the navigation indicator relative to the bottom edge of the Swiper component.
     *
     * @params { ?Length } value - the indicator to the left.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bottom(value: ?Length): This {
        this.mBottom = transAppResourceToLength(value ?? 0.0.px)
        this
    }

    /**
     * Sets the distance between the navigation indicator and the right edge (in right-to-left scripts)
     * or the left edge (in left-to-right scripts) of the Swiper component.
     *
     * @params { ?Length } value - the indicator to the right in LTR, indicator to the left in RTL.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(value: ?Length): This {
        this.mStart = transAppResourceToLength(value ?? 0.vp)
        this
    }

    /**
     * Sets the distance between the navigation indicator and the left edge (in right-to-left scripts)
     * or the right edge (in left-to-right scripts) of the Swiper component.
     *
     * @params { ?Length } value - the indicator to the left in RTL, Set the indicator to the right in LTR.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func end(value: ?Length): This {
        this.mEnd = transAppResourceToLength(value ?? 0.vp)
        this
    }

    func parseToNative(): CJIndicator {
        let (leftValue, leftUnit): (Float64, Int32) = parseValue(mLeft)
        let (topValue, topUnit): (Float64, Int32) = parseValue(mTop)
        let (rightValue, rightUnit): (Float64, Int32) = parseValue(mRight)
        let (bottomValue, bottomUnit): (Float64, Int32) = parseValue(mBottom)
        let (startValue, startUnit): (Float64, Int32) = parseValue(mStart)
        let (endValue, endUnit): (Float64, Int32) = parseValue(mEnd)
        return CJIndicator(
            leftValue,
            leftUnit,
            topValue,
            topUnit,
            rightValue,
            rightUnit,
            bottomValue,
            bottomUnit,
            startValue,
            startUnit,
            endValue,
            endUnit,
        )
    }

    private func parseValue(value: ?Length): (Float64, Int32) {
        if (let Some(v) <- value) {
            (v.value, v.unitType.getValue())
        } else {
            (0.0, -1)
        }
    }
}

/**
 * Define DotIndicator, the indicator type is dot.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DotIndicator <: Indicator {
    private var mItemWidth: Length
    private var mItemHeight: Length
    private var mSelectedItemWidth: Length
    private var mSelectedItemHeight: Length
    private var mMask: Bool
    private var mColor: UInt32
    private var mSelectedColor: UInt32
    private var mMaxDisplayCount: UInt32

    /**
     * DotIndicator constructor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this.mItemWidth = 6.vp
        this.mItemHeight = 6.vp
        this.mSelectedItemWidth = 12.vp
        this.mSelectedItemHeight = 6.vp
        this.mMask = false
        this.mColor = Color(0x182431).toUInt32()
        this.mSelectedColor = Color(0x007DFF).toUInt32()
        this.mMaxDisplayCount = 6
    }

    /**
     * Sets the width of the dot-style navigation indicator.
     *
     * @params { ?Length } value - Width of the dot-style navigation indicator. Default value is 6vp.
     * This parameter cannot be set in percentage.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemWidth(value: ?Length): This {
        this.mItemWidth = transAppResourceToLength(value ?? 6.vp)
        this
    }

    /**
     * Sets the height of the dot-style navigation indicator.
     *
     * @params { ?Length } value - Height of the dot-style navigation indicator. Default value is 6vp.
     * This parameter cannot be set in percentage.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemHeight(value: ?Length): This {
        this.mItemHeight = transAppResourceToLength(value ?? 6.vp)
        this
    }

    /**
     * Sets the width of the selected dot in the dot-style navigation indicator.
     *
     * @params { ?Length } value - Width of the selected dot in the dot-style navigation indicator.
     * Default value is 12vp. This parameter cannot be set in percentage.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedItemWidth(value: ?Length): This {
        this.mSelectedItemWidth = transAppResourceToLength(value ?? 6.vp)
        this
    }

    /**
     * Sets the height of the selected dot in the dot-style navigation indicator.
     *
     * @params { ?Length } value - Height of the selected dot in the dot-style navigation indicator.
     * Default value is 6vp. This parameter cannot be set in percentage.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedItemHeight(value: ?Length): This {
        this.mSelectedItemHeight = transAppResourceToLength(value ?? 6.vp)
        this
    }

    /**
     * Sets whether to enable the mask for the dot-style navigation indicator.
     *
     * @params { ?Bool } value - Whether to enable the mask for the dot-style navigation indicator.
     * Default value is false.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func mask(value: ?Bool): This {
        this.mMask = value ?? false
        this
    }

    /**
     * Sets the color of the dot-style navigation indicator.
     *
     * @params { ?ResourceColor } value - Color of the dot-style navigation indicator.
     * Default value is 0x182431(10% opacity).
     * @returns { DotIndicator }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ?ResourceColor): This {
        let tmpValue = value ?? 0x1A182431
        this.mColor = transAppResourceToResourceColor(tmpValue)
        this
    }

    /**
     * Sets the color of the selected dot in the dot-style navigation indicator.
     *
     * @params { ?ResourceColor } value - Color of the selected dot in the dot-style navigation indicator.
     * Default value is 0x007DFF.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ?ResourceColor): This {
        let tmpValue = value ?? 0xFF007DFF
        this.mSelectedColor = transAppResourceToResourceColor(tmpValue)
        this
    }

    /**
     * Sets the maximum number of navigation dots in the dot-style navigation indicator.
     *
     * @params { UInt32 } maxDisplayCount - Maximum number of navigation dots in the dot-style navigation indicator.
     * @returns { This } return the DotIndicator
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxDisplayCount(value: UInt32): This {
        this.mMaxDisplayCount = value
        this
    }

    func parseCJDot(): CJDotIndicator {
        return CJDotIndicator(
            mItemWidth.value,
            mItemWidth.unitType.getValue(),
            mItemHeight.value,
            mItemHeight.unitType.getValue(),
            mSelectedItemWidth.value,
            mSelectedItemWidth.unitType.getValue(),
            mSelectedItemHeight.value,
            mSelectedItemHeight.unitType.getValue(),
            mMask,
            mColor,
            mSelectedColor,
            mMaxDisplayCount,
            super.parseToNative()
        )
    }
}

/**
 * Define DigitIndicator, the indicator type is digit.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DigitIndicator <: Indicator {
    private var mFontColor: UInt32
    private var mSelectedFontColor: UInt32
    private var mDigitFont: Font
    private var mSelectedDigitFont: Font

    /**
     * DigitIndicator constructor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this.mFontColor = Color(0xff182431).toUInt32()
        this.mSelectedFontColor = Color(0xff182431).toUInt32()
        this.mDigitFont = Font()
        this.mSelectedDigitFont = Font()
    }

    /**
    * Sets the font color of the digit-style navigation indicator.
    *
    * @params { ?ResourceColor } value - Font color of the digit-style navigation indicator. Default value is #ff182431.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        this.mFontColor = transAppResourceToResourceColor(value ?? 0xff182431)
        this
    }

    /**
     * Sets the font color of the selected digit in the digit-style navigation indicator.
     *
     * @params { ?ResourceColor } value - Font color of the selected digit in the digit-style navigation indicator.
     * Default value is 0xff182431.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedFontColor(value: ?ResourceColor): This {
        this.mSelectedFontColor = transAppResourceToResourceColor(value ?? 0xff182431)
        this
    }

    /**
     * Sets the font style of the digit-style navigation indicator.
     *
     * <p><strong>NOTE</strong>:
     * <br>Only the size and weight parameters in Font are adjustable.
     * <brSetting family and style has no effect.
     * </p>
     *
     * @params { ?Font } value - Font style of the digit-style navigation indicator.
     * Default value is Font(14.vp, FontWeight.Normal).
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func digitFont(value: ?Font): This {
        this.mDigitFont = value ?? Font(size: 14.vp, weight: FontWeight.Normal)
        this
    }

    /**
     * Sets the font style of the selected digit in the digit-style navigation indicator.
     *
     * @params { ?Font } value - Font style of the selected digit in the digit-style navigation indicator.
     * Default value is Font(14.vp, FontWeight.Normal).
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedDigitFont(value: ?Font): This {
        this.mSelectedDigitFont = value ?? Font(size: 14.vp, weight: FontWeight.Normal)
        this
    }

    func parseCJDigit(): CJDigitIndicator {
        var mDigitFontWeight: ?CString = None
        var mSelectedDigitFontWeight: ?CString = None
        try {
            mDigitFontWeight = unsafe { LibC.mallocCString(mDigitFont.weight.getOrDefault({ => FontWeight.Normal}).getValue()) }
            mSelectedDigitFontWeight = unsafe { LibC.mallocCString(mSelectedDigitFont.weight.getOrDefault({ => FontWeight.Normal}).getValue()) }
        } catch (e: Exception) {
            mDigitFontWeight?.free()
            mSelectedDigitFontWeight?.free()
            throw e
        }
        return CJDigitIndicator(
            mFontColor,
            mSelectedFontColor,
            mDigitFont.size.getOrDefault({ =>16.fp}).value,
            mDigitFont.size.getOrDefault({ =>16.fp}).unitType.getValue(),
            mDigitFontWeight.getOrThrow(),
            mSelectedDigitFont.size.getOrDefault({ =>16.fp}).value,
            mSelectedDigitFont.size.getOrDefault({ =>16.fp}).unitType.getValue(),
            mSelectedDigitFontWeight.getOrThrow(),
            super.parseToNative()
        )
    }
}

/**
 * Provides methods for switching components.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwiperController <: RemoteDataLite {
    /**
     * SwiperController constructor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkSwiperControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Called when the next child component is displayed.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showNext(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerShowNext(this.getID())
        }
    }

    /**
     * Called when the previous subcomponent is displayed.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showPrevious(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerShowPrevious(this.getID())
        }
    }

    /**
     * Called when need to stop the swiper animation.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func finishAnimation(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerFinishAnimation(this.getID())
        }
    }

    /**
     * Called when need to stop the swiper animation.
     *
     * @params { ?VoidCallback } callback
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func finishAnimation(callback: ?VoidCallback): Unit {
        let tmpCallback = callback ?? { => }
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerFinishAnimationWithCallback(this.getID(),
                Callback0Param<Unit>(tmpCallback).getID())
        }
    }
}

/**
 * Defines Swiper Component.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Swiper <: CommonMethodComponent<Swiper> & SwiperAttribute {
    let controllerDefault: SwiperController = SwiperController()

    /**
     * Create a Swiper with controller and child component.
     *
     * @params { ?SwiperController } controller
     * @params { () -> Unit } child
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller!: ?SwiperController = Option.None, child!: () -> Unit) {
        match (controller) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkSwiperCreate(v.getID())
                }
            case None =>
                unsafe {
                    FfiOHOSAceFrameworkSwiperCreate(controllerDefault.getID())
                }
        }
        this.child = child
    }

    /**
     * Sets whether to enable automatic playback for child component switching.
     *
     * <p><strong>NOTE</strong>:
     * <br>If loop is set to false, the playback stops when the last page is reached.
     * <br>The playback continues when the page is not the last page after a swipe gesture.
     * <br>If the Swiper component becomes invisible, the playback stops.
     * </p>
     *
     * @params { ?Bool } value - Whether to enable automatic playback for child component switching.
     * Default value is false.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoPlay(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetAutoplay(value ?? false)
        }
        this
    }

    /**
     * Sets the duration of the animation for child component switching.
     *
     * @params { ?UInt32 } value - Duration of the autoplay for child component switching. Default value is 400.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func duration(value: ?UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDuration(value ?? 400)
        }
        this
    }

    /**
     * Sets the index of the child component currently displayed in the container.
     *
     * @params { ?UInt32 } value - Index of the child component currently displayed in the container. Default value is 0.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func index(value: ?UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetIndex(value ?? 0)
        }
        this
    }

    /**
     * Sets the interval for automatic playback.
     *
     * @params { ?UInt32 } value - Interval for automatic playback. Default value is 3000, the unit is ms.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func interval(value: ?UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetInterval(value ?? 3000)
        }
        this
    }

    /**
     * Sets whether to enable loop playback.
     *
     * @params { ?Bool } value - Whether to enable loop playback. Default value is true.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func loop(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetLoop(value ?? true)
        }
        this
    }

    /**
     * Sets whether vertical swiping is used.
     *
     * @params { ?Bool } value - Whether vertical swiping is used. Default value is false.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vertical(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetVertical(value ?? false)
        }
        this
    }

    /**
     * Sets the style of the navigation indicator.
     *
     * @params { ?Bool } value - Style of the navigation indicator.
     * Default value is true, default style is DotIndicator.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(indicator: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetIndicator(indicator ?? true)
        }
        this
    }

    /**
     * Sets the style of the navigation indicator.
     *
     * @params { ?DotIndicator } value - Style of the navigation indicator.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(indicator: ?DotIndicator): This {
        let tmpIndicator = indicator ?? DotIndicator()
        unsafe {
            FfiOHOSAceFrameworkSwiperSetIndicatorWithDot(tmpIndicator.parseCJDot())
        }
        this
    }

    /**
     * Sets the style of the navigation indicator.
     *
     * @params { ?DigitIndicator } value - Style of the navigation indicator.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(indicator: ?DigitIndicator): This {
        let tmpIndicator = indicator ?? DigitIndicator()
        unsafe {
            let cjDigit = tmpIndicator.parseCJDigit()
            FfiOHOSAceFrameworkSwiperSetIndicatorWithDit(cjDigit)
            LibC.free(cjDigit.digitFontWeight)
            LibC.free(cjDigit.selectedDigitFontWeight)
        }
        this
    }

    /**
     * Sets the space between child components.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the type is Length, the default unit is vp.
     * if the unit is not specified, for example, '10', the default unit vp is used.
     * </p>
     *
     * @params { ?Length } value - Space between child components. Default value is 0.
     * Minimum value is 0. If a value less than 0 is set, the default value is used.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemSpace(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkSwiperSetItemSpace(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the mode in which elements are displayed along the main axis.
     * This API takes effect only when displayCount is not set.
     *
     * @params { ?SwiperDisplayMode } value - Mode in which elements are displayed along the main axis.
     * Default value is SwiperDisplayMode.Stretch.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayMode(value: ?SwiperDisplayMode): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisplayMode((value ?? SwiperDisplayMode.Stretch).getValue())
        }
        this
    }

    /**
     * Sets the effect used when the component is at one of the edges.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute takes effect when loop is set to false.
     * </p>
     *
     * @params { ?EdgeEffect } value - Effect used when the component is at one of the edges.
     * Default value is EdgeEffect.Spring.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func effectMode(value: ?EdgeEffect): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetEffectMode((value ?? EdgeEffect.Spring).getValue())
        }
        this
    }

    /**
     * Sets the number of elements to display per page.
     *
     * If swipeByGroup is set to true:
     * 1. All sub-items are grouped from index 0.
     * 2. The number of sub-items in each group is the value of displayCount.
     * 3. If the number of sub-items in the last group is less than displayCount, placeholder items are added to supplement the number of last group.
     * 4. Placeholder items do not display any content and are only used as placeholders.
     * 5. When turning pages, turn pages by group.
     *
     * @params { ?Int32 } value - Number of elements to display per page. Default value is 1.
     * @params { ?Bool } swipeByGroup - Whether to turn pages by group. Default value is false.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayCount(value: ?Int32, swipeByGroup!: ?Bool = None): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisplayCountByGroup(value ?? 1, swipeByGroup ?? false)
        }
        this
    }

    /**
     * Sets the number of child components to be preloaded(cached).
     *
     * <p><strong>NOTE</strong>:
     * <br>Which are needed for the specific number of pages immediately before and after the current page.
     * <br>If swipeByGroup in displayCount is set to true, child components are cached by group.
     * </p>
     *
     * @params { ?Int32 } value - Number of child components to be preloaded (cached). Default value is 1.
     * Minimum value is 0. If a value less than 0 is set, the default value is used.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetCachedCount(value ?? 1)
        }
        this
    }

    /**
     * Sets whether to disable the swipe feature.
     *
     * @params { ?Bool } value - Whether to disable the swipe feature. Default value is false.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disableSwipe(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisableSwipe(value ?? false)
        }
        this
    }

    /**
     * Sets the animation curve.
     *
     * @params { ?Curve } value - Animation curve.
     * Default value is Curve.Linear.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func curve(value: ?Curve): This {
        unsafe {
            try (content = LibC.mallocCString((value ?? Curve.Linear).getValue()).asResource()) {
                FfiOHOSAceFrameworkSwiperSetCurve(content.value)
            }
        }
        this
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func digital(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDigital(value)
        }
        this
    }

    protected override func enabledInner(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetEnabled(value ?? true)
        }
        this
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkSwiperSetWidth(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkSwiperSetHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        if (width.isNone() || height.isNone()) {
            widthInner(width)
            heightInner(height)
        } else {
            var width_ = transAppResourceToLength(width ?? 0.0.vp)
            var height_ = transAppResourceToLength(height ?? 0.0.vp)
            unsafe {
                FfiOHOSAceFrameworkSwiperSetSize(
                    width_.value,
                    width_.unitType.getValue(),
                    height_.value,
                    height_.unitType.getValue()
                )
            }
        }
        this
    }

    /**
     * Triggered when the index of the currently displayed child component changes.
     *
     * @params { ?(Int32) -> Unit } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(event: ?(Int32) -> Unit): This {
        let tmpEvent = event ?? { res: Int32 => }
        unsafe {
            FfiOHOSAceFrameworkSwiperSetOnChange(Callback1Param<Int32, Unit>(tmpEvent).getID())
        }
        this
    }

    protected override func onClickInner(callback: ?(ClickEvent) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            evt: CJClickEvent => tmpCallback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper);
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnClick(lambdaData.getID())
        }
        this
    }
}
