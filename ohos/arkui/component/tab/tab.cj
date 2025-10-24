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

package ohos.arkui.component.tab

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.ffi.*
import ohos.base.*
import ohos.resource.*
import ohos.labels.APILevel

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

    func FfiOHOSAceFrameworkTabContentOnWillShow(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabContentOnWillHide(callback: Int64): Unit

    func FfiOHOSAceFrameworkTabContentPUCreate(callback: Int64): Unit
}

/**
 * Defines Tabs Component.
 * A component that allows navigation between multiple views through tabs.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Tabs <: CommonMethodComponent<Tabs> & TabsAttribute {
    /**
     * Create a Tabs.
     * Initializes a Tabs component with the specified parameters.
     *
     * @param { ?BarPosition } barPosition - Position of the tab bar.
     * @param { ?TabsController } controller - Controller for managing tab switching.
     * @param { ?Int32 } index - Initial index of the selected tab.
     * @param { () -> Unit } child - Builder function for tab content. The default value is an empty function.
     * @returns { Tabs } Returns the Tabs instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        barPosition!: ?BarPosition = None,
        controller!: ?TabsController = None,
        index!: ?Int32 = None,
        child!: () -> Unit = {=>}
    ) {
        let tmpBarPosition = barPosition ?? BarPosition.Start
        let tmpController = controller ?? TabsController()
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(tmpBarPosition.getValue(), tmpController.getID(), index ?? -1)
        }
        this.child = child
    }

    /**
     * Called when the width of the bar graph is set.
     * Configures the width of the tab bar.
     *
     * @param { ?Length } value - Width of the tab bar. If the set value is less than 0
     * or greater than the width of the Tabs component, the default value is used.
     * @returns { This }  Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barWidth(value: ?Length): This {
        if (let Some(v)<- value) {
            var width_ = transAppResourceToLength(v)
            unsafe {
                FfiOHOSAceFrameworkTabsSetBarWidth(normalizeValue(width_.value, 0.0), width_.unitType.getValue())
            }
            return this
        } else {
            var width_ = transAppResourceToLength((-1.0).vp)
            unsafe {
                FfiOHOSAceFrameworkTabsSetBarWidth(width_.value, width_.unitType.getValue())
            }
            return this
        }
    }

    /**
     * Called when the height of the bar graph is set.
     * Configures the height of the tab bar.
     *
     * @param { ?Length } value - Height of the tab bar. If the set value is less than 0 or
     * greater than the height of the Tabs component, the default value is used.
     * @returns { This }  Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barHeight(value: ?Length): This {
        if (let Some(v)<- value) {
            var height_ = transAppResourceToLength(v)
            unsafe {
                FfiOHOSAceFrameworkTabsSetBarWidth(normalizeValue(height_.value, 0.0), height_.unitType.getValue())
            }
            return this
        } else {
            var height_ = transAppResourceToLength((-1.0).vp)
            unsafe {
                FfiOHOSAceFrameworkTabsSetBarWidth(height_.value, height_.unitType.getValue())
            }
            return this
        }
    }

    protected func index(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetIndex(value)
        }
        this
    }

    /**
     * Sets whether to use vertical tabs.
     * Configures the orientation of the tabs.
     *
     * @param { ?Bool } value - Whether to use vertical tabs. The default value is false.
     * @returns { This }  Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vertical(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetVertical(value ?? false)
        }
        this
    }

    /**
     * Sets whether the tabs are scrollable.
     * Controls whether the tab bar can be scrolled when there are many tabs.
     *
     * @param { ?Bool } value - Whether the tabs are scrollable. The default value is true.
     * @returns { This }  Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollable(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetScrollable(value ?? true)
        }
        this
    }

    /**
     * Sets the tab bar layout mode to BarMode.Fixed.
     * Configures the layout mode of the tab bar.
     *
     * @param { ?BarMode } value - The width of each tab is determined by equally dividing
     * the number of tabs by the bar width (or bar height in the vertical layout).
     * @returns { This }  Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barMode(value: ?BarMode): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarMode((value ?? BarMode.Fixed).getValue())
        }
        this
    }

    /**
     * Sets the length of time required to complete the tab switching animation,
     * which is initiated by clicking a specific tab or by calling the changeIndex API of TabsController.
     * Configures the duration of the tab switching animation.
     *
     * @param { ?Float32 } value - Animation duration in seconds.
     * @returns { This }  Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationDuration(value: ?Float32): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetAnimationDuration(value ?? -1.0)
        }
        this
    }

    /**
     * Triggered when a tab is switched.
     *
     * <p><strong>NOTE</strong>:
     * <br>This event is triggered when any of the following conditions is met:
     * 1. The swiping animation is completed, followed by tab switching.
     * 2. The Controller API is called.
     * 3. The attribute value is updated using a state variable.
     * 4. A tab is clicked.
     * </p>
     *
     * @param { ?Callback<Int32, Unit> } event - Callback function triggered when tab changes.
     * The parameter is the index of the selected tab.
     * @returns { This }  Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(event: ?Callback<Int32, Unit>): This {
        let tmpEvent = event ?? { _ => }
        unsafe {
            FfiOHOSAceFrameworkTabsOnChange(Callback1Param<Int32, Unit>(tmpEvent).getID())
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

/**
 * Provides methods for switching tabs.
 * Controller for managing tab switching operations.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabsController <: RemoteDataLite {
    /**
     * Creates a new TabsController instance.
     */
    @!APILevel[
        22,
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

    /**
     * Switches to the specified tab.
     * Programmatically changes the currently selected tab.
     *
     * @param { ?Int32 } value - Index of the tab. If this parameter is set to a value less than 0
     * or greater than the maximum number, the default value 0 is used.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func changeIndex(value: ?Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabsControllerChangeIndex(this.getID(), value ?? 0)
        }
    }
}

/**
 * Defines TabContent Component.
 * Represents the content of a single tab within the Tabs component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabContent <: CommonMethodComponent<TabContent> & TabContentAttribute {
    /**
     * TabContent constructor.
     * Initializes a TabContent component with a child builder function.
     *
     * @param { () -> Unit } child - Builder function for tab content.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkTabContentPUCreate(Callback0Param<Unit>(child).getID())
        }
    }

    /**
     * TabContent constructor.
     * Initializes a TabContent component without a child builder function.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkTabContentCreate()
        }
    }

    protected func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabContentPop()
        }
        this
    }

    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the content set exceeds the space provided by the tab bar, it will be clipped.
     * </p>
     *
     * @param { ?ResourceStr } content - Content displayed on the tab bar.
     * @returns { This } Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: ?ResourceStr): This {
        unsafe {
            try (content_ = LibC.mallocCString(transResourceStrToString(content ?? "")).asResource()) {
                FfiOHOSAceFrameworkTabContentSetTabBar(content_.value)
            }
        }
        this
    }

    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>The bottom tab style does not include an indicator.
     * <br>When an icon display error occurs, a gray blank block is displayed.
     * </p>
     *
     * @param { ?ResourceStr } icon - TabBar icon.
     * @param { ?ResourceStr } text - TabBar text.
     * @returns { This } Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(icon!: ?ResourceStr = None, text!: ?ResourceStr = None): This {
        unsafe {
            try(icon_ = LibC.mallocCString(transResourceMediaToString(icon ?? "")).asResource(),
                text_ = LibC.mallocCString(transResourceStrToString(text ?? "")).asResource()) {
                FfiOHOSAceFrameworkTabContentSetTabBarWithIcon(icon_.value, text_.value)
            }
        }
        this
    }

    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the content set exceeds the space provided by the tab bar, it will be clipped.
     * </p>
     *
     * @param { ?CustomBuilder } content - Content displayed on the tab bar.
     * @returns { This } Returns the TabContent instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: ?CustomBuilder): This {
        unsafe {
            FfiOHOSAceFrameworkTabContentSetTabBarWithComponent(Callback0Param<Unit>(content ?? { => }).getID())
        }
        this
    }
}
