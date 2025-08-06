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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Tabs <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        barPosition!: BarPosition = BarPosition.Start,
        controller!: TabsController = TabsController(),
        index!: Int32 = -1,
        child!: () -> Unit = {=>}
    ) {
        unsafe {
            FfiOHOSAceFrameworkTabsCreate(barPosition.getValue(), controller.getID(), index)
        }
        this.child = child
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barWidth(value: Length): This {
        var width_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarWidth(normalizeValue(width_.value, 0.0), width_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barHeight(value: Length): This {
        var height_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarHeight(normalizeValue(height_.value, 0.0), height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
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
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vertical(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetVertical(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollable(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetScrollable(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barMode(value: BarMode): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetBarMode(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationDuration(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkTabsSetAnimationDuration(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(event: Callback<Int32, Unit>): This {
        unsafe {
            FfiOHOSAceFrameworkTabsOnChange(Callback1Param<Int32, Unit>(event).getID())
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabsController <: RemoteDataLite {
    @!APILevel[
        21,
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
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func changeIndex(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTabsControllerChangeIndex(this.getID(), value)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabContent <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkTabContentPUCreate(Callback0Param<Unit>(child).getID())
        }
    }

    @!APILevel[
        21,
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
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: ResourceStr): This {
        unsafe {
            var content_ = LibC.mallocCString(transResourceStrToString(content))
            FfiOHOSAceFrameworkTabContentSetTabBar(content_)
            content_.free()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(icon!: ResourceStr = "", text!: ResourceStr = ""): This {
        unsafe {
            var icon_: ?CString = None
            var text_: ?CString = None
            try {
                icon_ = LibC.mallocCString(transResourceMediaToString(icon))
                text_ = LibC.mallocCString(transResourceStrToString(text))
                FfiOHOSAceFrameworkTabContentSetTabBarWithIcon(icon_.getOrThrow(), text_.getOrThrow())
            } finally {
                icon_?.free()
                text_?.free()
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabBar(content: CustomBuilder): This {
        unsafe {
            FfiOHOSAceFrameworkTabContentSetTabBarWithComponent(Callback0Param<Unit>(content).getID())
        }
        this
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
