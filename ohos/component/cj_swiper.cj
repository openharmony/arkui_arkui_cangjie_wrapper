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

@!APILevel[
    19,
    crossplatform: true,
    atomicservice: true,
    form: true,
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

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func dot(): DotIndicator {
        DotIndicator()
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func digit(): DigitIndicator {
        DigitIndicator()
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func left(value: Length): This {
        this.mLeft = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func top(value: Length): This {
        this.mTop = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func right(value: Length): This {
        this.mRight = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bottom(value: Length): This {
        this.mBottom = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(value: Length): This {
        this.mStart = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func end(value: Length): This {
        this.mEnd = transAppResourceToLength(value)
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

@!APILevel[
    19,
    crossplatform: true,
    atomicservice: true,
    form: true,
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

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
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

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemWidth(value: Length): This {
        this.mItemWidth = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemHeight(value: Length): This {
        this.mItemHeight = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedItemWidth(value: Length): This {
        this.mSelectedItemWidth = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedItemHeight(value: Length): This {
        this.mSelectedItemHeight = transAppResourceToLength(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func mask(value: Bool): This {
        this.mMask = value
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        this.mColor = transAppResourceToResourceColor(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ResourceColor): This {
        this.mSelectedColor = transAppResourceToResourceColor(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
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

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FontOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Length
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: FontWeight
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 14.vp, weight!: FontWeight = FontWeight.Normal) {
        this.size = transAppResourceToLength(size)
        this.weight = weight
    }
}

@!APILevel[
    19,
    crossplatform: true,
    atomicservice: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DigitIndicator <: Indicator {
    private var mFontColor: UInt32
    private var mSelectedFontColor: UInt32
    private var mDigitFont: FontOptions
    private var mSelectedDigitFont: FontOptions

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this.mFontColor = Color(0xff182431).toUInt32()
        this.mSelectedFontColor = Color(0xff182431).toUInt32()
        this.mDigitFont = FontOptions()
        this.mSelectedDigitFont = FontOptions()
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        this.mFontColor = transAppResourceToResourceColor(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedFontColor(value: ResourceColor): This {
        this.mSelectedFontColor = transAppResourceToResourceColor(value)
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func digitFont(value: FontOptions): This {
        this.mDigitFont = value
        this
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedDigitFont(value: FontOptions): This {
        this.mSelectedDigitFont = value
        this
    }

    func parseCJDigit(): CJDigitIndicator {
        var mDigitFontWeight: ?CString = None
        var mSelectedDigitFontWeight: ?CString = None
        try {
            mDigitFontWeight = unsafe { LibC.mallocCString(mDigitFont.weight.getValue()) }
            mSelectedDigitFontWeight = unsafe { LibC.mallocCString(mSelectedDigitFont.weight.getValue()) }
        } catch (e: Exception) {
            mDigitFontWeight?.free()
            mSelectedDigitFontWeight?.free()
            throw e
        }
        return CJDigitIndicator(
            mFontColor,
            mSelectedFontColor,
            mDigitFont.size.value,
            mDigitFont.size.unitType.getValue(),
            mDigitFontWeight.getOrThrow(),
            mSelectedDigitFont.size.value,
            mSelectedDigitFont.size.unitType.getValue(),
            mSelectedDigitFontWeight.getOrThrow(),
            super.parseToNative()
        )
    }
}

@C
struct CJSwiperAutoFill {
    CJSwiperAutoFill(
        let minSize: Float64,
        let minSizeUnit: Int32
    ) {}
}

@!APILevel[
    19,
    crossplatform: true,
    atomicservice: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwiperAutoFill {
    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var minSize: Length

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(minSize: Float64) {
        this.minSize = minSize.vp
    }

    @!APILevel[
        19,
        crossplatform: true,
        atomicservice: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(minSize: Int64) {
        this.minSize = minSize.vp
    }

    func parseToNative(): CJSwiperAutoFill {
        return CJSwiperAutoFill(
            minSize.value,
            minSize.unitType.getValue(),
        )
    }
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ArrowStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showBackground: Bool
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isSidebarMiddle: Bool
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundSize: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: UInt32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowSize: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowColor: UInt32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(showBackground!: Bool = false, isSidebarMiddle!: Bool = false, backgroundSize!: Length = 24.vp,
        backgroundColor!: ResourceColor = Color(0x00000000), arrowSize!: Length = 18.vp,
        arrowColor!: ResourceColor = Color(0x182431)) {
        this.showBackground = showBackground
        this.isSidebarMiddle = isSidebarMiddle
        this.backgroundSize = transAppResourceToLength(backgroundSize)
        this.backgroundColor = transAppResourceToResourceColor(backgroundColor)
        this.arrowSize = transAppResourceToLength(arrowSize)
        this.arrowColor = transAppResourceToResourceColor(arrowColor)
    }

    func parseToNative(): CJArrowStyle {
        return CJArrowStyle(
            showBackground,
            isSidebarMiddle,
            backgroundSize.value,
            backgroundSize.unitType.getValue(),
            backgroundColor,
            arrowSize.value,
            arrowSize.unitType.getValue(),
            arrowColor
        )
    }
}

@C
struct CJSwiperAnimationEvent {
    CJSwiperAnimationEvent(
        let currentOffset: Float64,
        let targetOffset: Float64,
        let velocity: Float64
    ) {}

    func parseToCJ(): SwiperAnimationEvent {
        return SwiperAnimationEvent(
            currentOffset,
            targetOffset,
            velocity
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwiperAnimationEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public SwiperAnimationEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var currentOffset: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var targetOffset: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var velocity: Float64
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

    func parseToCJ(): SwiperContentTransitionProxy {
        return SwiperContentTransitionProxy(
            selectedIndex,
            index,
            position,
            mainAxisLength,
            proxy,
            finishTransition
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwiperContentTransitionProxy {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let selectedIndex: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let index: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let position: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let mainAxisLength: Float64

    let proxy: CPointer<Unit>
    let mFinishTransition: CFunc<(CPointer<Unit>) -> Unit>

    init(selectedIndex: Int32, index: Int32, position: Float64, mainAxisLength: Float64, proxy: CPointer<Unit>,
        finishTransition: CFunc<(CPointer<Unit>) -> Unit>) {
        this.selectedIndex = selectedIndex
        this.index = index
        this.position = position
        this.mainAxisLength = mainAxisLength
        this.proxy = proxy
        this.mFinishTransition = finishTransition
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func finishTransition(): Unit {
        unsafe {
            this.mFinishTransition(this.proxy)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwiperContentAnimatedTransition {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public SwiperContentAnimatedTransition(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var timeout: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var transition: (SwiperContentTransitionProxy) -> Unit
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwiperController <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showNext(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerShowNext(this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showPrevious(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerShowPrevious(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func changeIndex(index: Int32, useAnimation: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerChangeIndex(index, useAnimation, this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func changeIndex(index: Int32): Unit {
        this.changeIndex(index, false)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func finishAnimation(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerFinishAnimation(this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func finishAnimation(callback: () -> Unit): Unit {
        unsafe {
            FfiOHOSAceFrameworkSwiperControllerFinishAnimationWithCallback(this.getID(),
                Callback0Param<Unit>(callback).getID())
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Swiper <: ContainerBase {
    let controllerDefault: SwiperController = SwiperController()
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller: SwiperController, subcomponent: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkSwiperCreate(controller.getID())
        }
        this.child = subcomponent
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkSwiperCreate(controllerDefault.getID())
        }
        this.child = subcomponent
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoPlay(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetAutoplay(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func duration(value: UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDuration(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func index(value: UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetIndex(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func interval(value: UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetInterval(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func loop(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetLoop(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vertical(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetVertical(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetIndicator(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(value: DotIndicator): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetIndicatorWithDot(value.parseCJDot())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(value: DigitIndicator): This {
        unsafe {
            let cjDigit = value.parseCJDigit()
            FfiOHOSAceFrameworkSwiperSetIndicatorWithDit(cjDigit)
            LibC.free(cjDigit.digitFontWeight)
            LibC.free(cjDigit.selectedDigitFontWeight)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemSpace(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSwiperSetItemSpace(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayMode(value: SwiperDisplayMode): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisplayMode(value.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func effectMode(value: EdgeEffect): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetEffectMode(value.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayCount(value: Int32): This {
        this.displayCount(value, false)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayCount(value: Int32, swipeByGroup: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisplayCountByGroup(value, swipeByGroup)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayCount(value: SwiperAutoFill, swipeByGroup: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisplayCountWithObj(value.parseToNative(), swipeByGroup)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayCount(value: SwiperAutoFill): This {
        this.displayCount(value, false)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetCachedCount(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disableSwipe(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisableSwipe(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func curve(value: Curve): This {
        unsafe {
            var content = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkSwiperSetCurve(content);
            LibC.free(content)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func digital(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDigital(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicatorStyle(
        left!: Length = (-1.0).vp,
        top!: Length = (-1.0).vp,
        right!: Length = (-1.0).vp,
        bottom!: Length = (-1.0).vp,
        size!: Length = (10.0).vp,
        color!: ResourceColor = Color(0x0c000000),
        selectedColor!: ResourceColor = Color(0xff0a59f7),
        mask!: Bool = false
    ): This {
        var left_ = transAppResourceToLength(left)
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameworkSwiperSetIndicatorStyle(
                CJIndicatorStyle(
                    transValueToTarget(left_.value, 0.0, -1.0),
                    left_.unitType.getValue(),
                    transValueToTarget(top_.value, 0.0, -1.0),
                    top_.unitType.getValue(),
                    transValueToTarget(right_.value, 0.0, -1.0),
                    right_.unitType.getValue(),
                    transValueToTarget(bottom_.value, 0.0, -1.0),
                    bottom_.unitType.getValue(),
                    transValueToTarget(size_.value, 0.0, 10.0),
                    size_.unitType.getValue(),
                    transAppResourceToResourceColor(color),
                    transAppResourceToResourceColor(selectedColor),
                    mask
                )
            )
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayArrow(value: Bool, isHoverShow!: Bool = false): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisplayArrowWithBool(value, isHoverShow)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayArrow(value: ArrowStyle, isHoverShow!: Bool = false): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetDisplayArrowWithObj(value.parseToNative(), isHoverShow)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nextMargin(value: Length, ignoreBlank!: Bool = false): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSwiperNextMargin(value_.value, value_.unitType.getValue(), ignoreBlank)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func prevMargin(value: Length, ignoreBlank!: Bool = false): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSwiperPrevMargin(value_.value, value_.unitType.getValue(), ignoreBlank)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicatorInteractive(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperIndicatorInteractive(value)
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nestedScroll(value: SwiperNestedScrollMode): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperNestedScroll(value.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func enabled(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetEnabled(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSwiperSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSwiperSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkSwiperSetSize(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Int32) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkSwiperSetOnChange(Callback1Param<Int32, Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func onClick(callback: (ClickEvent) -> Unit): This {
        let wrapper = {
            evt: CJClickEvent => callback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper);
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnClick(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAnimationStart(callback: (Int32, Int32, SwiperAnimationEvent) -> Unit): This {
        let wrapper = {
            index: Int32, target: Int32, event: CJSwiperAnimationEvent => callback(index, target, event.parseToCJ())
        }
        unsafe {
            FfiOHOSAceFrameworkSwiperOnAnimationStart(
                Callback3Param<Int32, Int32, CJSwiperAnimationEvent, Unit>(wrapper).getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAnimationEnd(callback: (Int32, SwiperAnimationEvent) -> Unit): This {
        let wrapper = {
            index: Int32, event: CJSwiperAnimationEvent => callback(index, event.parseToCJ())
        }
        unsafe {
            FfiOHOSAceFrameworkSwiperOnAnimationEnd(
                Callback2Param<Int32, CJSwiperAnimationEvent, Unit>(wrapper).getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onGestureSwipe(callback: (Int32, SwiperAnimationEvent) -> Unit): This {
        let wrapper = {
            index: Int32, event: CJSwiperAnimationEvent => callback(index, event.parseToCJ())
        }
        unsafe {
            FfiOHOSAceFrameworkSwiperOnGestureSwipe(
                Callback2Param<Int32, CJSwiperAnimationEvent, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onContentDidScroll(callback: (Int32, Int32, Float64, Float64) -> Unit): This {
        let wrapper = {
            selectedIndex: Int32, index: Int32, position: Float64, mainAxisLength: Float64 => callback(selectedIndex,
                index, position, mainAxisLength)
        }
        unsafe {
            FfiOHOSAceFrameworkSwiperOnContentDidScroll(
                Callback4Param<Int32, Int32, Float64, Float64, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customContentTransition(transition: SwiperContentAnimatedTransition): This {
        let wrapper = {
            proxy: CJSwiperContentTransitionProxy => transition.transition(proxy.parseToCJ())
        }
        unsafe {
            FfiOHOSAceFrameworkSwiperCustomContentTransition(transition.timeout,
                Callback1Param<CJSwiperContentTransitionProxy, Unit>(wrapper).getID())
        }
        this
    }
}
