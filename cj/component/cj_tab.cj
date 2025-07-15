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
struct CJTabsScrollableBarModeOptions {
    CJTabsScrollableBarModeOptions(
        let margin: Float64,
        let marginUnit: Int32,
        let nonScrollableLayoutStyle: Int32
    ) {}
}

@C
struct CJTabsDividerStyle {
    CJTabsDividerStyle(
        let strokeWidth: Float64,
        let strokeWidthUnit: Int32,
        let color: UInt32,
        let startMargin: Float64,
        let startMarginUnit: Int32,
        let endMargin: Float64,
        let endMarginUnit: Int32
    ) {}
}

@C
struct CJTabsBlurOptions {
    CJTabsBlurOptions(let grayscale: VectorFloat32Handle) {}
}

@C
struct CJTabsBarBackgroundBlurStyleOptions {
    CJTabsBarBackgroundBlurStyleOptions(
        let colorMode: Int32,
        let adaptiveColor: Int32,
        let blurOptions: CJTabsBlurOptions,
        let scale: Float32,
        let policy: Int32,
        let inactiveColor: UInt32
    ) {}
}

@C
struct CJTabsBarGridColumnOptions {
    CJTabsBarGridColumnOptions(
        let margin: Float64,
        let marginUnit: Int32,
        let gutter: Float64,
        let gutterUnit: Int32,
        let sm: Int32,
        let md: Int32,
        let lg: Int32
    ) {}
}

@C
struct CJTabsBackgroundEffectOptions {
    CJTabsBackgroundEffectOptions(
        let radius: Float64,
        let saturation: Float64,
        let brightness: Float64,
        let color: UInt32,
        let adaptiveColor: Int32,
        let blurOptions: CJTabsBlurOptions,
        let policy: Int32,
        let inactiveColor: UInt32
    ) {}
}

@C
struct CJTabsAnimationEvent {
    CJTabsAnimationEvent(
        let currentOffset: Float32,
        let targetOffset: Float32,
        let velocity: Float32
    ) {}
}

@C
struct CJTabContentAnimatedTransition {
    CJTabContentAnimatedTransition(
        let timeout: Int32,
        let transition: Int64,
        let isUndefined: Bool
    ) {}

    init() {
        timeout = 1000
        transition = -1
        isUndefined = true
    }
}

@C
struct CJTabContentIndicatorStyle {
    CJTabContentIndicatorStyle(
        let color: UInt32,
        let height: Float64,
        let heightUnit: Int32,
        let width: Float64,
        let widthUnit: Int32,
        let borderRadius: Float64,
        let borderRadiusUnit: Int32,
        let marginTop: Float64,
        let marginTopUnit: Int32
    ) {}
}

@C
struct CJBoardStyle {
    CJBoardStyle(
        let borderRadius: Float64,
        let borderRadiusUnit: Int32
    ) {}
}

@C
struct CJFont {
    CJFont(
        let size: Float64,
        let sizeUnit: Int32,
        let weight: CString,
        let family: CString,
        let style: Int32
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(weight)
            LibC.free(family)
        }
    }
}

@C
struct CJTabContentLabelStyle {
    CJTabContentLabelStyle(
        let overflow: Int32,
        let maxLines: Int32,
        let minFontSize: Float64,
        let minFontSizeUnit: Int32,
        let maxFontSize: Float64,
        let maxFontSizeUnit: Int32,
        let heightAdaptivePolicy: Int32,
        let font: CJFont,
        let unselectedColor: UInt32,
        let selectedColor: UInt32
    ) {}
}

@C
struct CJPadding {
    CJPadding(
        let paddingType: Int32,
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
struct CJTabBarIconStyle {
    CJTabBarIconStyle(
        let unselectedColor: UInt32,
        let selectedColor: UInt32
    ) {}
}

@C
struct CJSubTabBarStyle {
    CJSubTabBarStyle(
        let content: CString,
        let indicator: CJTabContentIndicatorStyle,
        let selectedMode: Int32,
        let board: CJBoardStyle,
        let labelStyle: CJTabContentLabelStyle,
        let padding: CJPadding,
        let id: CString
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(content)
            labelStyle.font.free()
            LibC.free(id)
        }
    }
}

@C
struct CJBottomTabBarStyle {
    CJBottomTabBarStyle(
        let icon: CString,
        let isTabBarSymbol: Bool,
        let text: CString,
        let padding: CJPadding,
        let verticalAlign: Int32,
        let layoutMode: Int32,
        let symmetricExtensible: Bool,
        let labelStyle: CJTabContentLabelStyle,
        let id: CString,
        let iconStyle: CJTabBarIconStyle
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(icon)
            LibC.free(text)
            labelStyle.font.free()
            LibC.free(id)
        }
    }
}

foreign {
    func FfiOHOSAceFrameworkTabsCreate(barVal: Int32, controller: Int64, index: Int32): Unit

    func FfiOHOSAceFrameworkTabsPop(): Unit

    func FfiOHOSAceFrameworkTabsSetBarWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetBarHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetBarMode(barMode: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetBarModeWithOptions(barMode: Int32, options: CJTabsScrollableBarModeOptions): Unit

    func FfiOHOSAceFrameworkTabsSetIndex(index: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetVertical(isVertical: Bool): Unit

    func FfiOHOSAceFrameworkTabsSetScrollable(isScrollable: Bool): Unit

    func FfiOHOSAceFrameworkTabsSetAnimationDuration(duration: Float32): Unit

    func FfiOHOSAceFrameworkTabsSetAnimateMode(animateMode: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetBarPosition(barPosition: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetDivider(dividerStyle: CJTabsDividerStyle): Unit

    func FfiOHOSAceFrameworkTabsSetFadingEdge(fadingEdge: Bool): Unit

    func FfiOHOSAceFrameworkTabsSetBarOverlap(barOverlap: Bool): Unit

    func FfiOHOSAceFrameworkTabsSetBarBackgroundColor(backgroundColor: UInt32): Unit

    func FfiOHOSAceFrameworkTabsSetBarBackgroundBlurStyle(blurStyle: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetBarBackgroundBlurStyleWithOptions(
        blurStyle: Int32,
        options: CJTabsBarBackgroundBlurStyleOptions
    ): Unit

    func FfiOHOSAceFrameworkTabsSetBarGridAlign(blurStyle: CJTabsBarGridColumnOptions): Unit

    func FfiOHOSAceFrameworkTabsSetEdgeEffect(edgeEffect: Int32): Unit

    func FfiOHOSAceFrameworkTabsSetBarBackgroundEffect(options: CJTabsBackgroundEffectOptions): Unit

    func FfiOHOSAceFrameworkTabsOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabsOnTabBarClick(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabsOnAnimationStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabsOnAnimationEnd(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabsOnGestureSwipe(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabsCustomContentTransition(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabsCustomAnimationFinishTransition(id: Int64): Unit

    func FfiOHOSAceFrameworkTabsOnContentWillChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabsControllerCtor(): Int64

    func FfiOHOSAceFrameworkTabsControllerChangeIndex(controllerId: Int64, index: Int32): Unit

    func FfiOHOSAceFrameworkTabsControllerPreloadItems(controllerId: Int64, indices: VectorInt32Handle): Unit

    func FfiOHOSAceFrameworkTabsControllerSetTabBarTranslate(controllerId: Int64, translate: CTranslateOptions): Unit

    func FfiOHOSAceFrameworkTabsControllerSetTabBarOpacity(controllerId: Int64, opacity: Float64): Unit

    func FfiOHOSAceFrameworkTabContentCreate(): Unit

    func FfiOHOSAceFrameworkTabContentPop(): Unit

    func FfiOHOSAceFrameworkTabContentSetTabBar(content: CString): Unit

    func FfiOHOSAceFrameworkTabContentSetTabBarWithIcon(icon: CString, text: CString): Unit

    func FfiOHOSAceFrameworkTabContentSetTabBarWithComponent(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabContentSetTabBarWithSubTabBarStyle(subTabBarStyle: CJSubTabBarStyle): Unit

    func FfiOHOSAceFrameworkTabContentSetTabBarWithBottomTabBarStyle(bottomTabBarStyle: CJBottomTabBarStyle): Unit

    func FfiOHOSAceFrameworkTabContentOnWillShow(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabContentOnWillHide(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabContentPUCreate(callback: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollableBarModeOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let margin: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let nonScrollableLayoutStyle: LayoutStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(margin!: Length = 0.0.vp, nonScrollableLayoutStyle!: LayoutStyle = LayoutStyle.ALWAYS_CENTER) {
        this.margin = transAppResourceToLength(margin)
        this.nonScrollableLayoutStyle = nonScrollableLayoutStyle
    }

    func getNative(): CJTabsScrollableBarModeOptions {
        return CJTabsScrollableBarModeOptions(
            margin.value,
            margin.unitType.getValue(),
            nonScrollableLayoutStyle.getValue()
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BarGridColumnOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let margin: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let gutter: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let sm: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let md: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let lg: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(margin!: Length = 24.0.vp, gutter!: Length = 24.0.vp, sm!: Int32 = -1, md!: Int32 = -1, lg!: Int32 = -1) {
        this.margin = transAppResourceToLength(margin)
        this.gutter = transAppResourceToLength(gutter)
        this.sm = sm
        this.md = md
        this.lg = lg
    }

    func getNative(): CJTabsBarGridColumnOptions {
        return CJTabsBarGridColumnOptions(
            margin.value,
            margin.unitType.getValue(),
            gutter.value,
            gutter.unitType.getValue(),
            sm,
            md,
            lg
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabsAnimationEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TabsAnimationEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let currentOffset!: Float32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let targetOffset!: Float32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let velocity!: Float32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabContentTransitionProxy <: RemoteDataLite {
    TabContentTransitionProxy(id: Int64, public let from: Int32, public let to: Int32) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func finishTransition(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabsCustomAnimationFinishTransition(this.getID())
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabContentAnimatedTransition {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TabContentAnimatedTransition(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let timeout!: Int32 = 1000,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let transition!: (TabContentTransitionProxy) -> Unit
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DividerStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let strokeWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let color: ResourceColor

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let startMargin: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let endMargin: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length, color!: ResourceColor = Color(0X33182431), startMargin!: Length = 0.vp,
        endMargin!: Length = 0.vp) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.color = transAppResourceToResourceColor(color)
        this.startMargin = transAppResourceToLength(startMargin)
        this.endMargin = transAppResourceToLength(endMargin)
    }

    func getNative(): CJTabsDividerStyle {
        return CJTabsDividerStyle(
            strokeWidth.value,
            strokeWidth.unitType.getValue(),
            color.toUInt32(),
            startMargin.value,
            startMargin.unitType.getValue(),
            endMargin.value,
            endMargin.unitType.getValue()
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ALWAYS_CENTER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ALWAYS_AVERAGE_SPLIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SPACE_BETWEEN_OR_CENTER
    | ...

    func getValue(): Int32 {
        match (this) {
            case ALWAYS_CENTER => 0
            case ALWAYS_AVERAGE_SPLIT => 1
            case SPACE_BETWEEN_OR_CENTER => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimationMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CONTENT_FIRST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ACTION_FIRST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NO_ANIMATION
    | ...

    func getValue(): Int32 {
        match (this) {
            case CONTENT_FIRST => 0
            case ACTION_FIRST => 1
            case NO_ANIMATION => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Tabs <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        barPosition: BarPosition,
        controller: TabsController,
        index: Int32,
        child: () -> Unit
    ) {
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        barPosition: BarPosition,
        controller: TabsController,
        child: () -> Unit
    ) {
        let index: Int32 = -1
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        barPosition: BarPosition,
        index: Int32,
        child: () -> Unit
    ) {
        let controller = TabsController()
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        controller: TabsController,
        index: Int32,
        child: () -> Unit
    ) {
        let barPosition: BarPosition = BarPosition.Start
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        barPosition: BarPosition,
        child: () -> Unit
    ) {
        let controller = TabsController()
        let index: Int32 = -1
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        controller: TabsController,
        child: () -> Unit
    ) {
        let barPosition: BarPosition = BarPosition.Start
        let index: Int32 = -1
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        index: Int32,
        child: () -> Unit
    ) {
        let barPosition: BarPosition = BarPosition.Start
        let controller = TabsController()
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        let barPosition: BarPosition = BarPosition.Start
        let controller = TabsController()
        let index: Int32 = -1
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barWidth(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarWidth(normalizeValue(width_.value, 0.0), width_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barHeight(height: Length): This {
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarHeight(normalizeValue(height_.value, 0.0), height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected func index(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetIndex(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vertical(isVertical: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetVertical(isVertical)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollable(isScrollable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetScrollable(isScrollable)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barMode(mode: BarMode): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarMode(mode.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barMode(mode: BarMode, options: ScrollableBarModeOptions): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarModeWithOptions(mode.getValue(), options.getNative())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationDuration(duration: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetAnimationDuration(duration)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationDuration(duration: Int32): This {
        animationDuration(Float32(duration))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationMode(mode: AnimationMode): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetAnimateMode(mode.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barPosition(barPosition: BarPosition): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarPosition(barPosition.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(divider: ?DividerStyle): This {
        let cjDivider = divider ?? DividerStyle(strokeWidth: 0.vp, color: Color(0x33000000), startMargin: 0.vp,
            endMargin: 0.vp)
        unsafe {
            FfiOHOSAceFrameworkTabsSetDivider(cjDivider.getNative())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fadingEdge(isFading: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetFadingEdge(isFading)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barOverlap(isOverlap: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarOverlap(isOverlap)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barBackgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarBackgroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barBackgroundBlurStyle(blurStyle: BlurStyle): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarBackgroundBlurStyle(blurStyle.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barBackgroundBlurStyle(blurStyle: BlurStyle, options: BackgroundBlurStyleOptions): This {
        let grayscale = options.blurOptions.grayscale
        var vecGrayscaleHandle = FFIVectorFloat32(grayscale.size)
        for (i in 0..grayscale.size) {
            vecGrayscaleHandle.setElement(i, Float32(grayscale[i]))
        }
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarBackgroundBlurStyleWithOptions(
                blurStyle.getValue(),
                CJTabsBarBackgroundBlurStyleOptions(
                    options.colorMode.getValue(),
                    options.adaptiveColor.getValue(),
                    CJTabsBlurOptions(vecGrayscaleHandle.getNativeHandle()),
                    options.scale,
                    options.policy.getValue(),
                    options.inactiveColor.toUInt32()
                )
            )
            vecGrayscaleHandle.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barGridAlign(options: BarGridColumnOptions): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarGridAlign(options.getNative())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func edgeEffect(edgeEffect: EdgeEffect): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetEdgeEffect(edgeEffect.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barBackgroundEffect(options: BackgroundEffectOptions): This {
        let grayscale = options.blurOptions.grayscale
        var vecGrayscaleHandle = FFIVectorFloat32(grayscale.size)
        for (i in 0..grayscale.size) {
            vecGrayscaleHandle.setElement(i, Float32(grayscale[i]))
        }
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarBackgroundEffect(
                CJTabsBackgroundEffectOptions(
                    options.radius,
                    options.saturation,
                    options.brightness,
                    options.color.toUInt32(),
                    options.adaptiveColor.getValue(),
                    CJTabsBlurOptions(vecGrayscaleHandle.getNativeHandle()),
                    options.policy.getValue(),
                    options.inactiveColor.toUInt32()
                )
            )
            vecGrayscaleHandle.free()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (index: Int32) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkTabsOnChange(Callback1Param<Int32, Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTabBarClick(callback: (index: Int32) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkTabsOnTabBarClick(Callback1Param<Int32, Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAnimationStart(callback: (index: Int32, targetIndex: Int32, event: TabsAnimationEvent) -> Unit): This {
        let wrapper = {
            index: Int32, targetIndex: Int32, event: CJTabsAnimationEvent => callback(
                index,
                targetIndex,
                TabsAnimationEvent(
                    currentOffset: event.currentOffset,
                    targetOffset: event.targetOffset,
                    velocity: event.velocity
                )
            )
        }
        unsafe {
            FfiOHOSAceFrameworkTabsOnAnimationStart(
                Callback3Param<Int32, Int32, CJTabsAnimationEvent, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAnimationEnd(callback: (index: Int32, event: TabsAnimationEvent) -> Unit): This {
        let wrapper = {
            index: Int32, event: CJTabsAnimationEvent => callback(
                index,
                TabsAnimationEvent(
                    currentOffset: event.currentOffset,
                    targetOffset: event.targetOffset,
                    velocity: event.velocity
                )
            )
        }
        unsafe {
            FfiOHOSAceFrameworkTabsOnAnimationEnd(Callback2Param<Int32, CJTabsAnimationEvent, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onGestureSwipe(callback: (index: Int32, event: TabsAnimationEvent) -> Unit): This {
        let wrapper = {
            index: Int32, event: CJTabsAnimationEvent => callback(
                index,
                TabsAnimationEvent(
                    currentOffset: event.currentOffset,
                    targetOffset: event.targetOffset,
                    velocity: event.velocity
                )
            )
        }
        unsafe {
            FfiOHOSAceFrameworkTabsOnGestureSwipe(Callback2Param<Int32, CJTabsAnimationEvent, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customContentTransition(callback: (from: Int32, to: Int32) -> Option<TabContentAnimatedTransition>): This {
        let wrapper = {
            from: Int32, to: Int32 =>
            let cjTabContentAnimatedTransition: CJTabContentAnimatedTransition
            let tabContentAnimatedTransition: Option<TabContentAnimatedTransition> = callback(from, to)
            match (tabContentAnimatedTransition) {
                case None => cjTabContentAnimatedTransition = CJTabContentAnimatedTransition()
                case Some(v) =>
                    let transitionWrapper = {
                        proxyFrom: Int32, proxyTo: Int32, id: Int64 => v.transition(
                            TabContentTransitionProxy(id, proxyFrom, proxyTo))
                    }
                    cjTabContentAnimatedTransition = CJTabContentAnimatedTransition(
                        v.timeout,
                        Callback3Param<Int32, Int32, Int64, Unit>(transitionWrapper).getID(),
                        false
                    )
            }
            return cjTabContentAnimatedTransition
        }
        unsafe {
            FfiOHOSAceFrameworkTabsCustomContentTransition(
                Callback2Param<Int32, Int32, CJTabContentAnimatedTransition>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onContentWillChange(callback: (currentIndex: Int32, comingIndex: Int32) -> Bool): This {
        let wrapper = {
            currentIndex: Int32, comingIndex: Int32 => return callback(currentIndex, comingIndex)
        }
        unsafe {
            FfiOHOSAceFrameworkTabsOnContentWillChange(Callback2Param<Int32, Int32, Bool>(wrapper).getID())
        }
        this
    }

    protected override func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabsPop()
        }
        this
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabsController <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkTabsControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func changeIndex(index: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabsControllerChangeIndex(this.getID(), index)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preloadItems(indices: ?Array<Int32>): Unit {
        let indiceArray: Array<Int32>
        match (indices) {
            case None => indiceArray = []
            case Some(v) => indiceArray = v
        }
        let vecFFi = FFIVectorInt32(indiceArray.size)
        var index = 0
        for (i in indiceArray) {
            vecFFi.setElement(index, Int32(i))
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkTabsControllerPreloadItems(this.getID(), vecFFi.getNativeHandle())
            vecFFi.free()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTabBarTranslate(translate: TranslateOptions): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabsControllerSetTabBarTranslate(this.getID(), CTranslateOptions(translate))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTabBarOpacity(opacity: Float64): Unit {
        if (opacity < 0.0 || opacity > 1.0) {
            return
        }
        unsafe {
            FfiOHOSAceFrameworkTabsControllerSetTabBarOpacity(this.getID(), opacity)
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabContent <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkTabContentPUCreate(Callback0Param<Unit>(child).getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkTabContentCreate()
        }
    }

    /**
     * @deprecated
     */
    protected func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabContentPop()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: String): This {
        unsafe {
            var content_ = LibC.mallocCString(content)
            FfiOHOSAceFrameworkTabContentSetTabBar(content_)
            content_.free()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: AppResource): This {
        tabBar(getResourceString(content))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(icon!: String, text!: String): This {
        unsafe {
            var icon_: ?CString = None
            var text_: ?CString = None
            try {
                icon_ = LibC.mallocCString(icon)
                text_ = LibC.mallocCString(text)
                FfiOHOSAceFrameworkTabContentSetTabBarWithIcon(icon_.getOrThrow(), text_.getOrThrow())
            } finally {
                icon_?.free()
                text_?.free()
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(icon!: AppResource, text!: String): This {
        tabBar(icon: getResourceMedia(icon), text: text)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(icon!: String, text!: AppResource): This {
        tabBar(icon: icon, text: getResourceString(text))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(icon!: AppResource, text!: AppResource): This {
        tabBar(icon: getResourceMedia(icon), text: getResourceString(text))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkTabContentSetTabBarWithComponent(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: SubTabBarStyle): This {
        unsafe {
            let cjSubTabBarStyle: CJSubTabBarStyle = content.getNative()
            FfiOHOSAceFrameworkTabContentSetTabBarWithSubTabBarStyle(cjSubTabBarStyle)
            cjSubTabBarStyle.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: BottomTabBarStyle): This {
        unsafe {
            let cjBottomTabBarStyle: CJBottomTabBarStyle = content.getNative()
            FfiOHOSAceFrameworkTabContentSetTabBarWithBottomTabBarStyle(cjBottomTabBarStyle)
            cjBottomTabBarStyle.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillShow(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkTabContentOnWillShow(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillHide(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkTabContentOnWillHide(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func size(width!: Length, height!: Length): This {
        AppLog.warn("TabContent does not support size settings.")
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func width(_: Length): This {
        AppLog.info("TabContent does not support width settings.")
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(_: Length): This {
        AppLog.info("TabContent does not support height settings.")
        this
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class IndicatorStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let color: UInt32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let height: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let width: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let borderRadius: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let marginTop: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public IndicatorStyle(
        color!: ResourceColor = 0xFF007DFF,
        height!: Length = 2.0.vp,
        width!: Length = 0.0.vp,
        borderRadius!: Length = 0.0.vp,
        marginTop!: Length = 8.0.vp
    ) {
        this.color = transAppResourceToResourceColor(color)
        this.height = transAppResourceToLength(height)
        this.width = transAppResourceToLength(width)
        this.borderRadius = transAppResourceToLength(borderRadius)
        this.marginTop = transAppResourceToLength(marginTop)
    }

    func getNative(): CJTabContentIndicatorStyle {
        return CJTabContentIndicatorStyle(
            color,
            height.value,
            height.unitType.getValue(),
            width.value,
            width.unitType.getValue(),
            borderRadius.value,
            borderRadius.unitType.getValue(),
            marginTop.value,
            marginTop.unitType.getValue()
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SelectedMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    INDICATOR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOARD
    | ...

    func getValue(): Int32 {
        match (this) {
            case INDICATOR => 0
            case BOARD => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

enum PaddingType {
    PADDING
    | LENGTH
    | LOCALIZEDPADDING

    func getValue(): Int32 {
        match (this) {
            case PADDING => 0
            case LENGTH => 1
            case LOCALIZEDPADDING => 1
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BoardStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let borderRadius: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public BoardStyle(borderRadius!: Length = 8.0.vp) {
        this.borderRadius = transAppResourceToLength(borderRadius)
    }

    func getNative(): CJBoardStyle {
        return CJBoardStyle(
            borderRadius.value,
            borderRadius.unitType.getValue()
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LabelStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let overflow: TextOverflow

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let maxLines: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let minFontSize: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let maxFontSize: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let heightAdaptivePolicy: TextHeightAdaptivePolicy

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let font: Fonts

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let unselectedColor: UInt32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let selectedColor: UInt32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LabelStyle(
        overflow!: TextOverflow = TextOverflow.Ellipsis,
        maxLines!: Int32 = 1,
        minFontSize!: Length = 0.0.fp,
        maxFontSize!: Length = 0.0.fp,
        heightAdaptivePolicy!: TextHeightAdaptivePolicy = TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        font!: Fonts = Fonts(),
        unselectedColor!: ResourceColor = 0x99182431,
        selectedColor!: ResourceColor = 0xFF007DFF
    ) {
        this.overflow = overflow
        this.maxLines = maxLines
        this.minFontSize = transAppResourceToLength(minFontSize)
        this.maxFontSize = transAppResourceToLength(maxFontSize)
        this.heightAdaptivePolicy = heightAdaptivePolicy
        this.font = font
        this.unselectedColor = transAppResourceToResourceColor(unselectedColor)
        this.selectedColor = transAppResourceToResourceColor(selectedColor)
    }

    func getNative(): CJTabContentLabelStyle {
        unsafe {
            var weightCString: ?CString = None
            var familyCString: ?CString = None
            try {
                weightCString = LibC.mallocCString(font.weight.getValue())
                familyCString = LibC.mallocCString(font.family)
            } catch (e: Exception) {
                weightCString?.free()
                familyCString?.free()
                throw e
            }
            return CJTabContentLabelStyle(
                overflow.getValue(),
                maxLines,
                minFontSize.value,
                minFontSize.unitType.getValue(),
                maxFontSize.value,
                maxFontSize.unitType.getValue(),
                heightAdaptivePolicy.getValue(),
                CJFont(font.size.value, font.size.unitType.getValue(), weightCString.getOrThrow(),
                    familyCString.getOrThrow(), font.style.getValue()),
                unselectedColor,
                selectedColor
            )
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Padding {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let top: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let right: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let bottom: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let left: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public Padding(
        top!: Length = 17.0.vp,
        right!: Length = 8.0.vp,
        bottom!: Length = 18.0.vp,
        left!: Length = 8.0.vp
    ) {
        this.top = transAppResourceToLength(top)
        this.right = transAppResourceToLength(right)
        this.bottom = transAppResourceToLength(bottom)
        this.left = transAppResourceToLength(left)
    }

    func getNative(paddingType: PaddingType): CJPadding {
        return CJPadding(
            paddingType.getValue(),
            top.value,
            top.unitType.getValue(),
            right.value,
            right.unitType.getValue(),
            bottom.value,
            bottom.unitType.getValue(),
            left.value,
            left.unitType.getValue()
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedPadding {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let top: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let end: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let bottom: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let start: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LocalizedPadding(
        top!: Length = 17.0.vp,
        end!: Length = 8.0.vp,
        bottom!: Length = 18.0.vp,
        start!: Length = 8.0.vp
    ) {
        this.top = transAppResourceToLength(top)
        this.end = transAppResourceToLength(end)
        this.bottom = transAppResourceToLength(bottom)
        this.start = transAppResourceToLength(start)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SubTabBarStyle {
    private var content_: String = ""
    private var indicator_: IndicatorStyle = IndicatorStyle()
    private var selectedMode_: SelectedMode = SelectedMode.INDICATOR
    private var board_: BoardStyle = BoardStyle()
    private var labelStyle_: LabelStyle = LabelStyle()
    private var padding_: Padding = Padding()
    private var id_: String = ""
    private var paddingType_: PaddingType = PaddingType.PADDING

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: String) {
        this.content_ = content
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: AppResource) {
        this.content_ = getResourceString(content)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(content: String): SubTabBarStyle {
        SubTabBarStyle(content)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(content: AppResource): SubTabBarStyle {
        SubTabBarStyle(content)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(value: IndicatorStyle): SubTabBarStyle {
        this.indicator_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedMode(value: SelectedMode): SubTabBarStyle {
        this.selectedMode_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func board(value: BoardStyle): SubTabBarStyle {
        this.board_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelStyle(value: LabelStyle): SubTabBarStyle {
        this.labelStyle_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: Padding): SubTabBarStyle {
        this.padding_ = value
        this.paddingType_ = PaddingType.PADDING
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: Length): SubTabBarStyle {
        this.padding_ = Padding(top: value, right: value, bottom: value, left: value)
        this.paddingType_ = PaddingType.LENGTH
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: LocalizedPadding): SubTabBarStyle {
        this.padding_ = Padding(top: value.top, right: value.end, bottom: value.bottom, left: value.start)
        this.paddingType_ = PaddingType.LOCALIZEDPADDING
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(value: String): SubTabBarStyle {
        this.id_ = value
        this
    }

    func getNative(): CJSubTabBarStyle {
        unsafe {
            var contentCString: ?CString = None
            var idCString: ?CString = None
            try {
                contentCString = LibC.mallocCString(content_)
                idCString = LibC.mallocCString(id_)
            } catch (e: Exception) {
                contentCString?.free()
                idCString?.free()
                throw e
            }
            return CJSubTabBarStyle(
                contentCString.getOrThrow(),
                indicator_.getNative(),
                selectedMode_.getValue(),
                board_.getNative(),
                labelStyle_.getNative(),
                padding_.getNative(paddingType_),
                idCString.getOrThrow()
            )
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AUTO
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    VERTICAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HORIZONTAL
    | ...

    func getValue(): Int32 {
        match (this) {
            case AUTO => 0
            case VERTICAL => 1
            case HORIZONTAL => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabBarIconStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let unselectedColor: UInt32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let selectedColor: UInt32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TabBarIconStyle(
        unselectedColor!: ResourceColor = 0x33182431,
        selectedColor!: ResourceColor = 0xFF007DFF
    ) {
        this.unselectedColor = transAppResourceToResourceColor(unselectedColor)
        this.selectedColor = transAppResourceToResourceColor(selectedColor)
    }

    func getNative(): CJTabBarIconStyle {
        return CJTabBarIconStyle(
            unselectedColor,
            selectedColor
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BottomTabBarStyle {
    private var icon_: String = ""
    private var text_: String = ""
    private var padding_: Padding = Padding(top: 0.0.vp, right: 4.0.vp, bottom: 0.0.vp, left: 4.0.vp)
    private var paddingType_: PaddingType = PaddingType.PADDING
    private var verticalAlign_: VerticalAlign = VerticalAlign.Center
    private var layoutMode_: LayoutMode = LayoutMode.VERTICAL
    private var symmetricExtensible_: Bool = false
    private var labelStyle_: LabelStyle = LabelStyle()
    private var id_: String = ""
    private var iconStyle_: TabBarIconStyle = TabBarIconStyle()

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: String, text: String) {
        this.icon_ = icon
        this.text_ = text
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: AppResource, text: AppResource) {
        this.icon_ = getResourceMedia(icon)
        this.text_ = getResourceString(text)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: AppResource, text: String) {
        this.icon_ = getResourceMedia(icon)
        this.text_ = text
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: String, text: AppResource) {
        this.icon_ = icon
        this.text_ = getResourceString(text)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(icon: String, text: String): BottomTabBarStyle {
        BottomTabBarStyle(icon, text)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(icon: AppResource, text: AppResource): BottomTabBarStyle {
        BottomTabBarStyle(icon, text)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(icon: AppResource, text: String): BottomTabBarStyle {
        BottomTabBarStyle(icon, text)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(icon: String, text: AppResource): BottomTabBarStyle {
        BottomTabBarStyle(icon, text)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: Padding): BottomTabBarStyle {
        this.padding_ = value
        this.paddingType_ = PaddingType.PADDING
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: Length): BottomTabBarStyle {
        this.padding_ = Padding(top: value, right: value, bottom: value, left: value)
        this.paddingType_ = PaddingType.LENGTH
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: LocalizedPadding): BottomTabBarStyle {
        this.padding_ = Padding(top: value.top, right: value.end, bottom: value.bottom, left: value.start)
        this.paddingType_ = PaddingType.LOCALIZEDPADDING
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func verticalAlign(value: VerticalAlign): BottomTabBarStyle {
        this.verticalAlign_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func layoutMode(value: LayoutMode): BottomTabBarStyle {
        this.layoutMode_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func symmetricExtensible(value: Bool): BottomTabBarStyle {
        this.symmetricExtensible_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelStyle(value: LabelStyle): BottomTabBarStyle {
        this.labelStyle_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(value: String): BottomTabBarStyle {
        this.id_ = value
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func iconStyle(value: TabBarIconStyle): BottomTabBarStyle {
        this.iconStyle_ = value
        this
    }

    func getNative(): CJBottomTabBarStyle {
        unsafe {
            var iconCString: ?CString = None
            var textCString: ?CString = None
            var idCString: ?CString = None
            try {
                iconCString = LibC.mallocCString(icon_)
                textCString = LibC.mallocCString(text_)
                idCString = LibC.mallocCString(id_)
            } catch (e: Exception) {
                iconCString?.free()
                textCString?.free()
                idCString?.free()
                throw e
            }
            return CJBottomTabBarStyle(
                iconCString.getOrThrow(),
                false,
                textCString.getOrThrow(),
                padding_.getNative(paddingType_),
                verticalAlign_.getValue(),
                layoutMode_.getValue(),
                symmetricExtensible_,
                labelStyle_.getNative(),
                idCString.getOrThrow(),
                iconStyle_.getNative()
            )
        }
    }
}
