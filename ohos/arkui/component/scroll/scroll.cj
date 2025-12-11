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

package ohos.arkui.component.scroll

import ohos.arkui.component.common.{ScrollState, Edge, Curve, NestedScrollMode, ScrollDirection, BarState, ScrollSource}
import ohos.arkui.component.native_struct.{RectResultParams}
import ohos.arkui.component.util.{transAppResourceToResourceColor, transAppResourceToLength, EMPTY_FUNCTION}
import ohos.base.{VectorFloat32Handle, VectorInt32Handle, Length, ResourceColor, APP_LOG, LengthProp, BASE_LOG}
import ohos.ffi.{BaseCallBack, RemoteDataLite, Callback0Param, Callback4Param, Callback3Param, Callback2Param, Callback1Param, releaseFFIData}
import ohos.resource.{AppResource, getResourceString}
import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException
import std.convert.{Parsable}
import std.deriving.Derive

@C
struct NativeOffsetResult {
    NativeOffsetResult(
        let xOffset: Float64,
        let yOffset: Float64
    ) {}

    func parseToCJ(): OffsetResult {
        OffsetResult(xOffset, yOffset)
    }
}

/**
 * Represents the scroll values resulting from a scroll operation.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollResult {
    /**
     * The offset remain of scroll.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetRemain: Float64

    /**
     * Constructs a scroll result.
     *
     * @param { Float64 } offsetRemain - The offset remain of scroll.
     * @returns { ScrollResult }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offsetRemain!: Float64) {
        this.offsetRemain = offsetRemain
    }
}

/**
 * Represents the offset values resulting from a scroll operation.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OffsetResult {

    /**
     * Horizontal scrolling offset.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xOffset: Float64

    /**
     * Vertical scrolling offset.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var yOffset: Float64

    /**
     * Constructs an offset result.
     *
     * @param { Float64 } xOffset - Horizontal scrolling offset.
     * @param { Float64 } yOffset - Vertical scrolling offset.
     * @returns { OffsetResult }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(xOffset: Float64, yOffset: Float64) {
        this.xOffset = xOffset
        this.yOffset = yOffset
    }
}

@C
struct ScrollSnapOptionsParams {
    ScrollSnapOptionsParams(
        let snapAlign: Int32,
        let vHandle: VectorFloat32Handle,
        let pHandle: VectorInt32Handle,
        let size: Int32,
        let enableSnapToStart: Bool,
        let enableSnapToEnd: Bool,
        let isArray: Bool
    ) {}
}

@C
struct ScrollOnWillScrollCallbackParams {
    ScrollOnWillScrollCallbackParams(
        let xOffset: Float64,
        let yOffset: Float64,
        let scrollState: Int32,
        let scrollSource: Int32
    ) {}
}

/**
 * Represents the rect values resulting from a scroll operation.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RectResult {
    /**
     * Representing the x in the rect values.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float64

    /**
     * Representing the y in the rect values.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float64

    /**
     * Representing the width in the rect values
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Float64

    /**
     * Representing the height in the rect values
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Float64

    init(params: RectResultParams) {
        this.x = params.x
        this.y = params.y
        this.width = params.width
        this.height = params.height
    }
    /**
     * Constructs an rect result.
     *
     * @param { Float64 } x - Representing the x in the rect values.
     * @param { Float64 } y - Representing the y in the rect values.
     * @param { Float64 } width - Representing the width in the rect values.
     * @param { Float64 } height - Representing the height in the rect values.
     * @returns { RectResult }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ) {
        this.x = x
        this.y = y
        this.width = width
        this.height = height
    }
}

/**
 * Provides parameters for customizing scroll animations.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollAnimationOptions {
    /**
     * Scrolling duration.
     *
     * @default 1000.0
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Float64

    /**
     * Scrolling curve.
     *
     * @default Curve.Ease
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve

    /**
     * Whether to enable overscroll.
     *
     * <p><strong>NOTE</strong>
     * <br> Scrolling can exceed the boundary and initiate a bounce animation when this parameter is set to <em>true</em>,
     * and the component's edgeEffect attribute is set to EdgeEffect.Spring.
     * </p>
     *
     * @default false
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var canOverScroll: ?Bool

    /**
     * The constructor.
     *
     * @param { ?Float64 } duration - The animation duration. The default value is 1000.0.
     * @param { ?Curve } curve - The animation curve. The default value is Curve.Ease.
     * @param { ?Bool } canOverScroll - Whether allow over scroll. The default value is false.
     * @returns { ScrollAnimationOptions }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: ?Float64 = None,
        curve!: ?Curve = None,
        canOverScroll!: ?Bool = None
    ) {
        this.duration = duration ?? 1000.0
        this.curve = curve ?? Curve.Ease
        this.canOverScroll = canOverScroll ?? false
    }
}

/**
 * Enumerates alignment modes.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollAlign {
    /**
     * The start edge of the list item is flush with the start edge of the list.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start

    /**
     * The list item is centered along the main axis of the list.
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center

    /**
     * The end edge of the list item is flush with the end edge of the list.
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End

    /**
     * The list item is automatically aligned.
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    func getValue(): Int32 {
        match (this) {
            case Start => 0
            case Center => 1
            case End => 2
            case Auto => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Provides parameters for customizing scroll nested.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NestedScrollOptions {
    /**
    * Representing the forward in the customizing scroll nested.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scrollForward: ?NestedScrollMode

    /**
    * Representing the backward in the customizing scroll nested.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scrollBackward: ?NestedScrollMode

    /**
     * The constructor.
     *
     * @param { ?NestedScrollMode } scrollForward
     * @param { ?NestedScrollMode } scrollBackward
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scrollForward: ?NestedScrollMode, scrollBackward: ?NestedScrollMode) {
        this.scrollForward = scrollForward ?? NestedScrollMode.SelfOnly
        this.scrollBackward = scrollBackward ?? NestedScrollMode.SelfOnly
    }
}

/**
 * Provides a parameter for customizing fading edge.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FadingEdgeOptions {
    /**
     * Representing the length in the customizing fading edge.
     *
     * @default 32.vp
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fadingEdgeLength: ?Length

    /**
     * The constructor.
     *
     * @param { ?Length } fadingEdgeLength - The fading edge length.
     * @default 32.vp
     * @returns { FadingEdgeOptions }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fadingEdgeLength!: ?Length = None) {
        this.fadingEdgeLength = fadingEdgeLength ?? 32.vp
    }
}

/**
 * Enumerates content clip modes.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentClipMode {
    /**
     * The only content mode of content clip modes.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ContentOnly

    /**
     * The boundary mode of content clip modes.
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Boundary

    /**
     * The safe area mode of content clip modes.
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SafeArea
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case ContentOnly => 0
            case Boundary => 1
            case SafeArea => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Called before scroll to allow developer to control real offset the Scrollable can scroll.
 *
 * @param { Float64 } scrollOffset - offset this frame will scroll, which may or may not be reached.
 * @param { ScrollState } scrollState - current scroll state.
 * @param { ScrollSource } scrollSource - source of current scroll.
 * @returns { ScrollResult } the remain offset for the scrollable.
 */
public type OnWillScrollCallBack = (Float64, ScrollState, ScrollSource) -> ScrollResult

/**
 * On scroll callback using in scrollable onDidScroll.
 *
 * @param { Float64 } scrollOffset - offset this frame did scroll.
 * @param { ScrollState } scrollState - current scroll state.
 */
public type OnScrollCallBack = (scrollOffset: Float64, scrollState: ScrollState) -> Unit

/**
 * Represents the callback triggered when the <em>Scroll</em> component scrolls.
 *
 * <p><strong>NOTE</strong>
 * <br>If the <em>onScrollFrameBegin</em> event and <em>scrollBy</em> method are used to implement nested scrolling,
 * set the <em>edgeEffect</em> attribute of the scrollable child component to <em>None</em>. For example,
 * if a <em>List</em> is nested in the <em>Scroll</em> component, <em>edgeEffect</em> of the <em>List</em> must be set to <em>EdgeEffect.None</em>.
 * </p>
 *
 * @param { Float64 } xOffset - Horizontal offset per frame during scrolling. A positive offset indicates scrolling to the left,
 * and a negative offset indicates scrolling to the right.
 * <br>Unit: vp
 * @param { Float64 } yOffset - Vertical offset per frame during scrolling.
 * A positive offset indicates scrolling upward, and a negative offset indicates scrolling downward.
 * <br>Unit: vp
 * @param { ScrollState } scrollState - Current scrolling state.
 */
public type ScrollOnScrollCallback = (Float64, Float64, ScrollState) -> Unit

/**
 * Represents the callback triggered before each frame scrolling starts.
 *
 * @param { Float64 } offset - Amount to scroll by, in vp.
 * @param { ScrollState } state - Current scroll state.
 * @returns { Float64 } data - the scroll data return by handler
 */
public type OnScrollFrameBeginCallback = (Float64, ScrollState) -> Float64

/**
 * Represents the callback triggered when scrolling reaches an edge.
 *
 * @param { Edge } side - Edge position to scroll to.
 */
public type OnScrollEdgeCallback = (Edge) -> Unit

/**
 * Provides parameters for scrolling to the edge of a scrollable container.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollEdgeOptions {
    /**
     * Fixed velocity for scrolling to the edge of the container.
     * If the value specified is less than or equal to 0, the parameter will not take effect. Unit is vp/s.
     *
     * @default 0
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var velocity: ?Float32

    /**
     * The constructor.
     *
     * @param { ?Float64 } velocity - Fixed velocity for scrolling to the edge of the container. The default unit is vp/s.
     * @default 0
     * @returns { ScrollEdgeOptions }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(velocity!: ?Float32 = None) {
        this.velocity = velocity ?? 0.0
    }
}

/**
 * Provides parameters for scrolling to a specific index.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollToIndexOptions {
    /**
     * Extra offset for scrolling to a specified index.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraOffset: ?Length

    /**
     * The constructor.
     *
     * @param { ?Length } extraOffset - Extra offset for scrolling to a specified index.
     * @returns { ScrollToIndexOptions }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(extraOffset!: ?Length = None) {
        this.extraOffset = extraOffset ?? 0.vp
    }
}

foreign {
    func FfiOHOSAceFrameworkScrollCreate(scroller: Int64): Unit

    func FfiOHOSAceFrameworkScrollScrollable(scrollDirection: Int32): Unit

    func FfiOHOSAceFrameworkScrollScrollBar(barState: Int32): Unit

    func FfiOHOSAceFrameworkScrollScrollBarColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkScrollScrollBarWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkScrollNestedScroll(scrollForward: Int32, scrollBackward: Int32): Unit

    func FfiOHOSAceFrameworkScrollEnablePaging(value: Bool): Unit

    func FfiOHOSAceFrameworkScrollInteraction(value: Bool): Unit

    func FfiOHOSAceFrameworkScrollFriction(friction: Float64): Unit

    func FfiOHOSAceFrameworkScrollEdgeEffect(edgeEffect: Int32, alwaysEnabled: Bool): Unit

    func FfiOHOSAceFrameworkScrollScrollsnap(value: ScrollSnapOptionsParams): Unit

    func FfiOHOSAceFrameworkScrollInitialOffset(xOffset: Float32, xUnit: Int32, yOffset: Float32, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkScrollOnScroll(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnScrollEdge(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollSetOnScrollFrameBegin(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnWillScroll(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnDidScroll(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnScrollEnd(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnScrollStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnScrollStop(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnReachStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollOnReachEnd(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollerCtor(): Int64

    func FfiOHOSAceFrameworkScrollerScrollTo(scrollerID: Int64, xOffset: Float64, xUnit: Int32, yOffset: Float64,
        yUnit: Int32): Unit

    func FfiOHOSAceFrameworkScrollerScrollToByCurve(scrollerID: Int64, xOffset: Float64, xUnit: Int32, yOffset: Float64,
        yUnit: Int32, duration: Float64, curve: CString): Unit

    func FfiOHOSAceFrameworkScrollerScrollToAnimation(scrollerID: Int64, xOffset: Float64, xUnit: Int32,
        yOffset: Float64, yUnit: Int32, animation: Bool): Unit

    func FfiOHOSAceFrameworkScrollerScrollToAnimationOptions(scrollerID: Int64, xOffset: Float64, xUnit: Int32,
        yOffset: Float64, yUnit: Int32, duration: Float64, curve: CString, canOverScroll: Bool): Unit

    func FfiOHOSAceFrameworkScrollerScrollBy(scrollerID: Int64, xOffset: Float64, xUnit: Int32, yOffset: Float64,
        yUnit: Int32): Unit

    func FfiOHOSAceFrameworkScrollerScrollToIndex(scrollerID: Int64, index: Int32, smooth: Bool, align: Int32): Unit

    func FfiOHOSAceFrameworkScrollerScrollToIndexWithUnit(scrollerID: Int64, index: Int32, smooth: Bool, align: Int32,
        offset: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkScrollerScrollEdge(scrollerID: Int64, edge: Int32): Unit

    func FfiOHOSAceFrameworkScrollerScrollEdgeWithVelocity(scrollerID: Int64, edge: Int32, velocity: Float32): Unit

    func FfiOHOSAceFrameworkScrollerScrollFling(scrollerID: Int64, velocity: Float64): Unit

    func FfiOHOSAceFrameworkScrollerScrollPage(scrollerID: Int64, next: Bool): Unit

    func FfiOHOSAceFrameworkScrollerScrollPageWithAnimation(scrollerID: Int64, next: Bool, animation: Bool): Unit

    func FfiOHOSAceFrameworkScrollerCurrentOffset(scrollerID: Int64): NativeOffsetResult

    func FfiOHOSAceFrameworkScrollerIsAtEnd(scrollerID: Int64): Bool

    func FfiOHOSAceFrameworkScrollerGetItemRect(scrollerID: Int64, index: Int32): RectResultParams

    func FfiOHOSAceFrameworkScrollerGetItemIndex(scrollerID: Int64, x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Int32

    func FfiOHOSAceFrameworkScrollableBaseFlingSpeed(speedLimit: Float64): Unit

    func FfiOHOSAceFrameworkScrollableBaseFadingEdge(enabled: Bool): Unit

    func FfiOHOSAceFrameworkScrollableBaseFadingEdgeOptions(enabled: Bool, fadingEdge: Float64, fadingEdgeUnit: Int32): Unit

    func FfiOHOSAceFrameworkScrollableBaseClipMode(clip: Int32): Unit

    func FfiOHOSAceFrameworkScrollableBaseClipShape(shapeId: Int64): Unit

    func FfiOHOSAceFrameworkScrollableBaseOnWillScroll(callback: Int64): Unit

    func FfiOHOSAceFrameworkScrollableBaseOnDidScroll(callback: Int64): Unit

    func FFISetWidthWithEmpty(): Unit
}

/**
 * A component that provides a scrollable container for its child components.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroll <: ScrollableCommonMethodComponent<Scroll> & ScrollAttribute {
    /**
     * Constructs a scroll component.
     *
     * @returns { Scroll }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkScrollCreate(-1)
        }
    }

    /**
     * Constructs a scroll component.
     *
     * @param { () -> Unit } child - The child component.
     * @returns { Scroll }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkScrollCreate(-1)
        }
        this.child = child
    }

    /**
     * Constructs a scroll component.
     *
     * @param { ?Scroller } scroller - The scroller of current Scroll component.
     * @param { () -> Unit } child - The child component.
     * @returns { Scroll }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: ?Scroller, child: () -> Unit) {
        let tmpScroller = scroller ?? Scroller()
        unsafe {
            FfiOHOSAceFrameworkScrollCreate(tmpScroller.getID())
        }
        this.child = child
    }

    protected func enableScrollInteractionInner(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkScrollInteraction(value ?? true)
        }
        this
    }

    protected func frictionInner(value: ?Float64): This {
        unsafe {
            FfiOHOSAceFrameworkScrollFriction(value ?? -1.0)
        }
        this
    }

    protected func frictionInner(value: ?AppResource): This {
        match (value) {
            case Some(v) =>
                var friction: Float64 = 0.0
                let t = Float64.tryParse(getResourceString(v))
                match (t) {
                    case Some(n) => friction = n
                    case None => BASE_LOG.debug("AppResource type param of friction func convert to Float64 fail.");
                }
                unsafe {
                    FfiOHOSAceFrameworkScrollFriction(friction)
                }
            case None => frictionInner(-1.0)
        }
        this
    }

    /**
     * Sets the scrolling direction.
     *
     * @param { ?ScrollDirection } scrollDirection - The direction to apply setting.
     * @default ScrollDirection.Vertical
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollable(scrollDirection: ?ScrollDirection): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollable((scrollDirection ?? ScrollDirection.Vertical).getValue())
        }
        this
    }

    protected func scrollBarInner(barState: ?BarState): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBar((barState ?? BarState.Auto).getValue())
        }
        this
    }

    protected func scrollBarColorInner(color: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBarColor(transAppResourceToResourceColor(color ?? 0x66182431))
        }
        this
    }

    protected func scrollBarWidthInner(width: ?Length): This {
        var width_ = transAppResourceToLength(width ?? 4.vp)
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBarWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    protected func nestedScrollInner(value: ?NestedScrollOptions): This {
        let tmpValue = value ?? NestedScrollOptions(NestedScrollMode.SelfOnly, NestedScrollMode.SelfOnly)
        let localScrollForward = (tmpValue.scrollForward ?? NestedScrollMode.SelfOnly).getValue()
        let localScrollBackward = (tmpValue.scrollBackward ?? NestedScrollMode.SelfOnly).getValue()
        unsafe {
            FfiOHOSAceFrameworkScrollNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    protected func onReachStartInner(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? EMPTY_FUNCTION
        unsafe {
            FfiOHOSAceFrameworkScrollOnReachStart(Callback0Param<Unit>(tmpCallback).getID())
        }
        this
    }

    protected func onReachEndInner(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? EMPTY_FUNCTION
        unsafe {
            FfiOHOSAceFrameworkScrollOnReachEnd(Callback0Param<Unit>(tmpCallback).getID())
        }
        this
    }

    /**
     * Triggered before scrolling.
     *
     * <p><strong>NOTE</strong>
     * <br>1. This event is triggered when scrolling is started by the <em>Scroll</em> component or other input settings,
     * such as keyboard and mouse operations.
     * <br>2. This event is triggered when the controller API is called.
     * <br>3. This event supports the out-of-bounds bounce effect.
     * </p>
     *
     * @param { ?(Float64, Float64, ScrollState, ScrollSource) -> OffsetResult } handler - Callback triggered before scrolling.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): This {
        let tmpHandler = handler ?? { _, _, _, _ => OffsetResult(0.0, 0.0)}
        let wrapper = { xOffset: Float64, yOffset: Float64, scrollState: Int32, scrollSource: Int32 =>
            let res = tmpHandler(
                xOffset, yOffset,
                ScrollState.parseValue(scrollState),
                ScrollSource.parseValue(scrollSource)
            )
            NativeOffsetResult(res.xOffset, res.yOffset)
        }
        let lambdaData = Callback4Param<Float64, Float64, Int32, Int32, NativeOffsetResult>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollOnWillScroll(lambdaData.getID())
        }
        this
    }

    /**
     * Triggered before scrolling.
     *
     * <p><strong>NOTE</strong>
     * <br>1. This event is triggered when scrolling is started by the <em>Scroll</em> component or other input settings,
     * such as keyboard and mouse operations.
     * <br>2. This event is triggered when the controller API is called.
     * <br>3. This event supports the out-of-bounds bounce effect.
     * </p>
     *
     * @param { ?(Float64, Float64, ScrollState, ScrollSource) -> Unit } handler - Callback triggered before scrolling.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> Unit): This {
        let tmpHandler = handler ?? { _, _, _, _ => }
        let callbackWithRet: (Float64, Float64, ScrollState, ScrollSource) -> OffsetResult = {
            xOffset: Float64, yOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
            tmpHandler(xOffset, yOffset, scrollState, scrollSource)
            return OffsetResult(xOffset, yOffset)
        }
        onWillScroll(callbackWithRet)
    }

    /**
     * Triggered when the Scroll component scrolls.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called;
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?ScrollOnScrollCallback } callback - Callback triggered after scrolling.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidScroll(callback: ?ScrollOnScrollCallback): This {
        let tmpCallback = callback ?? { _, _, _ => }
        let wrapper = {
            xOffset: Float64, yOffset: Float64, scrollState: Int32 => tmpCallback(xOffset, yOffset,
                ScrollState.parseValue(scrollState))
        }
        let lambdaData = Callback3Param<Float64, Float64, Int32, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollOnDidScroll(lambdaData.getID())
        }
        this
    }

    protected func onScrollStartInner(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? EMPTY_FUNCTION
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollStart(Callback0Param<Unit>(tmpCallback).getID())
        }
        this
    }

    protected func onScrollStopInner(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? EMPTY_FUNCTION
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollStop(Callback0Param<Unit>(tmpCallback).getID())
        }
        this
    }

    /**
     * Triggered when each frame scrolling starts.
     *
     * @param { ?OnScrollFrameBeginCallback } event - Callback triggered at first frame of scroll.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollFrameBegin(event: ?OnScrollFrameBeginCallback): This {
        let tmpEvent = event ?? { _, _ => 0.0 }
        let wrapper = {
            offset: Float64, state: Int32 => tmpEvent(offset, ScrollState.parseValue(state))
        }
        let lambdaData = Callback2Param<Float64, Int32, Float64>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkScrollSetOnScrollFrameBegin(lambdaData.getID())
        }
        this
    }

    /**
     * Triggered when scrolling reaches the edge.
     * Anonymous Object Rectification.
     *
     * <p><strong>NOTE</strong>
     * <br>1. This event is triggered when scrolling reaches the edge after being started by the <em>Scroll</em> component or other input settings,
     * such as keyboard and mouse operations.
     * <br>2. This event is triggered when the controller API is called.
     * <br>3. This event supports the out-of-bounds bounce effect.
     * </p>
     *
     * @param { ?OnScrollEdgeCallback } event - Callback triggered when scrolling reaches the edge.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollEdge(event: ?OnScrollEdgeCallback): This {
        let tmpEvent = event ?? { _ => 0.0 }
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollEdge(
                Callback1Param<Int32, Unit>(
                    {
                        value =>
                        let edge = Edge.setValue(value)
                        tmpEvent(edge)
                    }
                ).getID())
        }
        this
    }
}

class ScrollerHandler <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}

/**
 * Defines a controller for scrollable container components.
 * 1. The binding of a Scroller instance to a scrollable container component occurs during the component creation phase.
 * 2. Scroller APIs can only be effectively called after the Scroller instance is bound to a scrollable container component.
 * Otherwise, depending on the API called, it may have no effect or throw an exception.
 */

@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroller {
    let handler: ScrollerHandler

    /**
     * A constructor used to create a Scroller object.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this.handler = ScrollerHandler(unsafe {
            FfiOHOSAceFrameworkScrollerCtor()
        })
    }

    protected func getID(): Int64 {
        this.handler.getID()
    }

    /**
     * Sets slides to the specified position.
     *
     * @param { Length } xOffset - Horizontal scrolling offset.
     * @param { Length } yOffset - Vertical scrolling offset.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollTo(xOffset!: Length, yOffset!: Length): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollTo(this.handler.getID(), xOffset_.value, xOffset_.unitType.getValue(),
                yOffset_.value, yOffset_.unitType.getValue())
        }
    }

    /**
     * Sets slides to the specified position.
     *
     * @param { Length } xOffset - Horizontal scrolling offset.
     * @param { Length } yOffset - Vertical scrolling offset.
     * @param { ?ScrollAnimationOptions } animation - Animation configuration.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: ?ScrollAnimationOptions): Unit {
        let tmpAnimation = animation ?? ScrollAnimationOptions()
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            try (curveResource = LibC.mallocCString((tmpAnimation.curve ?? Curve.Ease).getValue()).asResource()) {
                FfiOHOSAceFrameworkScrollerScrollToAnimationOptions(this.handler.getID(), xOffset_.value,
                    xOffset_.unitType.getValue(), yOffset_.value, yOffset_.unitType.getValue(), tmpAnimation.duration ?? 1000.0,
                    curveResource.value, tmpAnimation.canOverScroll ?? false)
            }
        }
    }

    /**
     * Sets slides to the specified position.
     *
     * @param { Length } xOffset - Horizontal scrolling offset.
     * @param { Length } yOffset - Vertical scrolling offset.
     * @param { ?Bool } animation - Animation configuration.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: ?Bool): Unit {
        let tmpAnimation = animation ?? false
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollToAnimation(this.handler.getID(), xOffset_.value, xOffset_.unitType.getValue(),
                yOffset_.value, yOffset_.unitType.getValue(), tmpAnimation)
        }
    }

    /**
     * Called when the setting slides by offset.
     *
     * @param { Length } xOffset - X coordinate to scroll to.
     * @param { Length } yOffset - Y coordinate to scroll to.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBy(xOffset!: Length, yOffset!: Length): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollBy(this.handler.getID(), xOffset_.value, xOffset_.unitType.getValue(),
                yOffset_.value, yOffset_.unitType.getValue())
        }
    }

    /**
     * Called when scrolling to the edge of the container.
     *
     * @param { Edge } value - The edge to scroll by.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollEdge(value: Edge): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollEdge(this.handler.getID(), value.getValue())
        }
    }

    /**
     * Called when scrolling to the edge of the container.
     *
     * @param { Edge } value - The edge to scroll by.
     * @param { ?ScrollEdgeOptions } options - The scroll edge option.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollEdge(value: Edge, options: ?ScrollEdgeOptions): Unit {
        let tmpOptions = options ?? ScrollEdgeOptions()
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollEdgeWithVelocity(this.handler.getID(), value.getValue(), tmpOptions.velocity ?? 0.0)
        }
    }

    /**
     * Performs inertial scrolling based on the initial velocity passed in.
     *
     * @param { Float64 } velocity - If the value specified is 0, it is considered as invalid, and will not take effect.
     * A positive value indicates scrolling towards the top, while a negative value indicates scrolling towards the bottom.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fling(velocity: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollFling(this.handler.getID(), velocity)
        }
    }

    /**
     * Applied when page turning mode is set.
     *
     * @param { Bool } next - Whether scroll from page to page.
     * @param { ?Bool } animation - Whether enable animation on page scroll. The default value is false.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollPage(next: Bool, animation!: ?Bool = None): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollPageWithAnimation(this.handler.getID(), next, animation ?? false)
        }
    }

    /**
     * Obtains the current scrolling offset.
     *
     * @returns { Option<OffsetResult> }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func currentOffset(): Option<OffsetResult> {
        unsafe {
            FfiOHOSAceFrameworkScrollerCurrentOffset(this.handler.getID()).parseToCJ()
        }
    }

    /**
     * Scrolls to a specified index, with support for setting an extra offset for the scroll.
     * This API only works for the ArcList, Grid, List, and WaterFlow components.
     *
     * @param { Int32 } index - Index to jump to.
     * @param { ?Bool } smooth - If true, scroll to index item with animation. If false, scroll to index item without animation. The default value is false.
     * @param { ?ScrollAlign } align - Sets the alignment mode of a specified index.
     * @param { ?ScrollToIndexOptions } options - Sets the options of a specified index, such as extra offset.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollToIndex(
        index: Int32,
        smooth!: ?Bool = None,
        align!: ?ScrollAlign = None,
        options!: ?ScrollToIndexOptions = None
    ): Unit {
        let tmpAlign = align ?? ScrollAlign.Start
        let tmpOptions = options ?? ScrollToIndexOptions()

        var extraOffset_ = transAppResourceToLength(tmpOptions.extraOffset ?? 0.vp)
        unsafe {
            if (index >= 0) {
                FfiOHOSAceFrameworkScrollerScrollToIndexWithUnit(this.handler.getID(), index, smooth ?? false, tmpAlign.getValue(),
                    extraOffset_.value, extraOffset_.unitType.getValue())
            }
        }
    }

    /**
     * Checks whether the component has scrolled to the bottom.
     * This API is available for the ArcList, Scroll, List, Grid, and WaterFlow components.
     *
     * @returns { Bool } - Returns whether the component scrolls to the end position.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func isAtEnd(): Bool {
        unsafe {
            FfiOHOSAceFrameworkScrollerIsAtEnd(this.handler.getID())
        }
    }

    /**
     * Obtains the size and position of a child component relative to its container.
     *
     * <p><strong>NOTE</strong>
     * <br>- The value of <em>index</em> must be the index of a child component visible in the display area.
     * Otherwise, the value is considered invalid.
     * <br>- The value of <em>index</em> must be the index of a child component visible in the display area. Otherwise,
     * the value is considered invalid.
     * </p>
     *
     * @param { ?Int32 } index - Index of the target child component.
     * @returns { RectResult } Returns the size and position.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getItemRect(index: ?Int32): RectResult {
        unsafe {
            RectResult(FfiOHOSAceFrameworkScrollerGetItemRect(this.handler.getID(), index ?? -1))
        }
    }

    /**
     * Obtains the index of a child component based on coordinates.
     *
     * <p><strong>NOTE</strong>
     * <br>The returned index is <em>-1</em> for invalid coordinates.
     * </p>
     *
     * @param { Float64 } x - X-coordinate, in vp.
     * @param { Float64 } y - Y-coordinate, in vp.
     * @returns { Int32 } Index of the item.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getItemIndex(x: Float64, y: Float64): Int32 {
        var x_ = transAppResourceToLength(x.vp)
        var y_ = transAppResourceToLength(y.vp)
        unsafe {
            FfiOHOSAceFrameworkScrollerGetItemIndex(this.handler.getID(), x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
    }
}
