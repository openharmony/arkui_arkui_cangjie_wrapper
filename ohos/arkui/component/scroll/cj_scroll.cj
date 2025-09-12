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

package ohos.arkui.component.scroll

import ohos.arkui.component.common.*
import ohos.arkui.component.rect.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import ohos.arkui.shape.*
import std.convert.*
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollResult {
    /**
     * The offset remain 0f scroll.
     *
     * @type { Float64 }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetRemain: Float64

    /**
     * Constructs a scroll result.
     *
     * @param { Float64 } offsetRemain
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offsetRemain!: Float64) {
        this.offsetRemain = offsetRemain
    }
}

/**
 * Represents the offset values resulting from a scroll operation.
 *
 * @relation interface OffsetResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OffsetResult {

    /**
     * Horizontal scrolling offset.
     *
     * @type { Float64 }
     * @relation xOffset: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xOffset: Float64

    /**
     * Vertical scrolling offset.
     *
     * @type { Float64 }
     * @relation yOffset: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var yOffset: Float64

    /**
     * Constructs an offset result.
     *
     * @param { Float64 } xOffset
     * @param { Float64 } yOffset
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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

class CallbackOffset <: BaseCallBack {
    CallbackOffset(let closure: (OffsetResult) -> Unit) {
        registerSelf()
    }
    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackOffset")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<NativeOffsetResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackOffset")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0.parseToCJ())
    }
}

/**
 * Represents the rect values resulting from a scroll operation.
 *
 * @relation interface RectResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RectResult {

    /**
     * Representing the x in the rect values
     *
     * @type { Float64 }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Representing the y in the rect values
     *
     * @type { Float64 }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Representing the width in the rect values
     *
     * @type { Float64 }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64

    /**
     * Representing the height in the rect values
     *
     * @type { Float64 }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float64

    init(params: RectResultParams) {
        this.x = params.x
        this.y = params.y
        this.width = params.width
        this.height = params.height
    }
    /**
     * Constructs an rect result.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @param { Float64 } width
     * @param { Float64 } height
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
 *
 * @relation interface ScrollAnimationOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollAnimationOptions {
    /**
     * Scrolling duration.
     *
     * @type { Float64 }-A value less than 0 evaluates to the default value.
     * @relation duration?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: Float64

    /**
     * Scrolling curve.
     *
     * @type { Curve }
     * @relation curve?: Curve | ICurve;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: Curve

    /**
     * Whether to enable overscroll.
     *
     * @type { Bool }-Scrolling can exceed the boundary and initiate a bounce animation when this parameter is set to true,
     * and the component's edgeEffect attribute is set to EdgeEffect.
     * @relation canOverScroll?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var canOverScroll: Bool

    /**
     * Constructs a customizing scroll animations
     *
     * @param { Float64 } duration
     * @param { Curve } curve
     * @param { Bool } canOverScroll
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: Float64 = 1000.0,
        curve!: Curve = Curve.Ease,
        canOverScroll!: Bool = false
    ) {
        this.duration = duration
        this.curve = curve
        this.canOverScroll = canOverScroll
    }
}

/**
 * Enumerates alignment modes.
 *
 * @relation enum ScrollAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollAlign {
    /**
     * The start edge of the list item is flush with the start edge of the list.
     *
     * @relation START,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start

    /**
     * The list item is centered along the main axis of the list.
     *
     * @relation CENTER,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center

    /**
     * The end edge of the list item is flush with the end edge of the list.
     *
     * @relation END,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End

    /**
     * The list item is automatically aligned.
     *
     * @relation AUTO,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
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
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Provides parameters for customizing scroll nested.
 *
 * @relation interface NestedScrollOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NestedScrollOptions {
    /**
    * Representing the forward in the customizing scroll nested.
    *
    * @type { NestedScrollMode }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scrollForward: NestedScrollMode

    /**
    * Representing the backward in the customizing scroll nested.
    *
    * @type { NestedScrollMode }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scrollBackward: NestedScrollMode

    /**
     * Provides parameters for customizing scroll nested.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scrollForward: NestedScrollMode, scrollBackward: NestedScrollMode) {
        this.scrollForward = scrollForward
        this.scrollBackward = scrollBackward
    }
}

/**
 * Provides a parameter for customizing fading edge.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FadingEdgeOptions {

    /**
     * Representing the length in the customizing fading edge.
     *
     * @type { Length }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fadingEdgeLength: Length

    /**
     * Constructs a customizing fading edge.
     *
     * @param { Length } fadingEdgeLength
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fadingEdgeLength!: Length = 32.vp) {
        this.fadingEdgeLength = fadingEdgeLength
    }
}

/**
 * Enumerates content clip modes.
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentClipMode {
    /**
     * The only content mode of content clip modes.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ContentOnly

    /**
     * The boundary mode of content clip modes.
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Boundary

    /**
     * The safe area mode of content clip modes.
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SafeArea
    | ...

    func getValue(): Int32 {
        match (this) {
            case ContentOnly => 0
            case Boundary => 1
            case SafeArea => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

public type OnWillScrollCallBack = (Float64, ScrollState, ScrollSource) -> ScrollResult

public type OnScrollCallBack = (scrollOffset: Float64, scrollState: ScrollState) -> Unit

public type ScrollOnScrollCallback = (Float64, Float64, ScrollState) -> Unit

public type OnScrollFrameBeginCallback = (Float64, ScrollState) -> Float64

public type OnScrollEdgeCallback = (Edge) -> Unit

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollEdgeOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var velocity: Float32 = 0.0

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(velocity!: Float32 = 0.0) {
        this.velocity = velocity
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollToIndexOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraOffset: Length = 0.vp

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(extraOffset!: Length = 0.vp) {
        this.extraOffset = extraOffset
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
}

/**
 * Provides functions for scroll able Base.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ScrollableCommonMethod <: ContainerBase {
    /**
     * Sets the scrollbar state.
     *
     * @param { BarState } barState
     * @returns { This }
     * @relation scrollBar(barState: BarState): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBar(barState: BarState): This {
        scrollBarInner(barState)
    }

    protected func scrollBarInner(barState: BarState): This

    /**
     * Sets the scrollbar color.
     *
     * @param { ResourceColor } color
     * @returns { This }
     * @relation scrollBarColor(color: Color | number | string): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarColor(color: ResourceColor): This {
        scrollBarColorInner(color)
    }

    protected func scrollBarColorInner(color: ResourceColor): This

    /**
     * Sets the scrollbar width.
     *
     * @param { Length } value
     * @returns { This }
     * @relation scrollBarWidth(value: number | string): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarWidth(value: Length): This {
        scrollBarWidthInner(value)
    }

    protected func scrollBarWidthInner(value: Length): This

    /**
     * Sets the nested scrolling options. You can set the nested scrolling mode in the forward and backward directions
     * to implement scrolling linkage with the parent component.
     *
     * @param { NestedScrollOptions } value
     * @returns { This }
     * @relation nestedScroll(value: NestedScrollOptions): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nestedScroll(value: NestedScrollOptions): This {
        nestedScrollInner(value)
    }

    protected func nestedScrollInner(value: NestedScrollOptions): This

    /**
     * Sets whether to support scroll gestures. When this attribute is set to <em>false</em>,
     * scrolling by finger or mouse is not supported, but the scroll controller API is not affected.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation enableScrollInteraction(value: boolean): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableScrollInteraction(value: Bool): This {
        enableScrollInteractionInner(value)
    }

    protected func enableScrollInteractionInner(value: Bool): This

    /**
     * Sets the friction coefficient. It applies only to gestures in the scrolling area, and
     * it affects only indirectly the scroll chaining during the inertial scrolling process.
     * If this attribute is set to a value less than or equal to 0, the default value is used.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation friction(value: number | Resource): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: Float64): This {
        frictionInner(value)
    }

    protected func frictionInner(value: Float64): This

    /**
     * Sets the friction coefficient. It applies only to gestures in the scrolling area, and
     * it affects only indirectly the scroll chaining during the inertial scrolling process.
     * If this attribute is set to a value less than or equal to 0, the default value is used.
     *
     * @param { AppResource } value
     * @returns { This }
     * @relation friction(value: number | Resource): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: AppResource): This {
        frictionInner(value)
    }

    protected func frictionInner(value: AppResource): This

    /**
     * Sets the reach start.
     *
     * @param { function  } event
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachStart(event: () -> Unit): This {
        onReachStartInner(event)
    }

    protected func onReachStartInner(event: () -> Unit): This

    /**
     * Sets the reach end.
     *
     * @param { function  } event
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachEnd(event: () -> Unit): This {
        onReachEndInner(event)
    }

    protected func onReachEndInner(event: () -> Unit): This

    /**
     * Called when scrolling start.
     * Anonymous Object Rectification.
     *
     * @param { function } event
     * @returns { This }
     * @relation onScrollStart(event: VoidCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStart(event: () -> Unit): This {
        onScrollStartInner(event)
    }

    protected func onScrollStartInner(event: () -> Unit): This

    /**
     * Called when scrolling has stopped.
     * Anonymous Object Rectification.
     *
     * @param { function } event
     * @returns { This }
     * @relation onScrollStop(event: VoidCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStop(event: () -> Unit): This {
        onScrollStopInner(event)
    }

    protected func onScrollStopInner(event: () -> Unit): This

    /**
     * Fling Speed Limit.
     *
     * @param { Float64 } speedLimit
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flingSpeedLimit(speedLimit: Float64): This {
        flingSpeedLimitInner(speedLimit)
    }

    protected func flingSpeedLimitInner(speedLimit: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseFlingSpeed(speedLimit)
        }
        this
    }

    /**
     * The options of fading Edge.
     *
     * @param { Option<Bool> } enabled
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fadingEdge(enabled: Option<Bool>): This {
        fadingEdgeInner(enabled)
    }

    protected func fadingEdgeInner(enabled: Option<Bool>): This {
        match (enabled) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkScrollableBaseFadingEdge(v)
                }
            case None => ()
        }
        this
    }

    /**
     * The options of fading Edge.
     *
     * @param { Option<Bool> } enabled
     * @param { FadingEdgeOptions } options
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fadingEdge(enabled: Option<Bool>, options: FadingEdgeOptions): This {
        fadingEdgeInner(enabled, options)
    }

    protected func fadingEdgeInner(enabled: Option<Bool>, options: FadingEdgeOptions): This {
        match (enabled) {
            case Some(v) =>
                var fadingEdge = transAppResourceToLength(options.fadingEdgeLength)
                unsafe {
                    FfiOHOSAceFrameworkScrollableBaseFadingEdgeOptions(
                        v,
                        fadingEdge.value,
                        fadingEdge.unitType.getValue()
                    )
                }
            case None => ()
        }
        this
    }

    /**
     * The clip mode of content.
     *
     * @param { ContentClipMode } clip
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clipContent(clip: ContentClipMode): This {
        clipContentInner(clip)
    }

    protected func clipContentInner(clip: ContentClipMode): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipMode(clip.getValue())
        }
        this
    }

    /**
     * The clip mode of content.
     *
     * @param { RectShape } clip
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clipContent(clip: RectShape): This {
        clipContentInner(clip)
    }

    protected func clipContentInner(clip: RectShape): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipShape(clip.getID())
        }
        this
    }

    /**
     * Triggered before scrolling.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ScrollResult } handler
     * @returns { ScrollAttribute }
     * @relation onWillScroll(handler: ScrollOnWillScrollCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): This {
        onWillScrollInner(handler)
    }

    protected func onWillScrollInner(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): This {
        match (handler) {
            case Some(v) =>
                let wrapper = { scrollOffset: Float64, scrollState: Int32, scrollSource: Int32 =>
                    let res = v(scrollOffset, ScrollState.parseValue(scrollState), ScrollSource.parseValue(scrollSource))
                    return res.offsetRemain
                }
                let lambdaData = Callback3Param<Float64, Int32, Int32, Float64>(wrapper)

                unsafe {
                    FfiOHOSAceFrameworkScrollableBaseOnWillScroll(lambdaData.getID())
                }
            case None => ()
        }
        this
    }

    /**
     * Triggered before scrolling.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { Unit } handler
     * @returns { This }
     * @relation onWillScroll(handler: ScrollOnWillScrollCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): This {
        onWillScrollInner(handler)
    }

    protected func onWillScrollInner(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): This {
        match (handler) {
            case Some(v) =>
                let callbackWithRet: (Float64, ScrollState, ScrollSource) -> ScrollResult = {
                    scrollOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
                    v(scrollOffset, scrollState, scrollSource)
                    return ScrollResult(offsetRemain: scrollOffset)
                }
                onWillScroll(callbackWithRet)
            case None => ()
        }
        this
    }

    /**
     * Triggered when the Scroll component scrolls.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called;
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { OnScrollCallBack } handler
     * @returns { This }
     * @relation onDidScroll(handler: ScrollOnScrollCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidScroll(handler: OnScrollCallBack): This {
        onDidScrollInner(handler)
    }

    protected func onDidScrollInner(handler: OnScrollCallBack): This {
        let wrapper = {
            scrollOffset: Float64, scrollState: Int32 => handler(scrollOffset, ScrollState.parseValue(scrollState))
        }
        let lambdaData = Callback2Param<Float64, Int32, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollableBaseOnDidScroll(lambdaData.getID())
        }
        this
    }
}

/**
 * Defines scroll component.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroll <: ScrollableCommonMethod {

    /**
     * Constructs a scroll component.
     *
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { function } child
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { Scroller } scroller
     * @param { function } child
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkScrollCreate(scroller.getID())
        }
        this.child = child
    }

    protected func enableScrollInteractionInner(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkScrollInteraction(value)
        }
        this
    }

    protected func frictionInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkScrollFriction(value)
        }
        this
    }

    protected func frictionInner(value: AppResource): This {
        var friction: Float64 = 0.0
        let t = Float64.tryParse(getResourceString(value))
        match (t) {
            case Some(n) => friction = n
            case None => BaseLog.debug("AppResource type param of friction func convert to Float64 fail.");
        }
        unsafe {
            FfiOHOSAceFrameworkScrollFriction(friction)
        }
        this
    }

    /**
     * Sets the scrolling direction.
     *
     * @param { ScrollDirection } scrollDirection
     * @returns { This }
     * @relation scrollable(value: ScrollDirection): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollable(scrollDirection: ScrollDirection): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollable(scrollDirection.getValue())
        }
        this
    }

    protected func scrollBarInner(barState: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBar(barState.getValue())
        }
        this
    }

    protected func scrollBarColorInner(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBarColor(transAppResourceToResourceColor(color))
        }
        this
    }

    protected func scrollBarWidthInner(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBarWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    protected func nestedScrollInner(value: NestedScrollOptions): This {
        let localScrollForward = value.scrollForward.getValue()
        let localScrollBackward = value.scrollBackward.getValue()
        unsafe {
            FfiOHOSAceFrameworkScrollNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    protected func onReachStartInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnReachStart(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    protected func onReachEndInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnReachEnd(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /**
     * Triggered before scrolling.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { OffsetResult } handler
     * @returns { This }
     * @relation onWillScroll(handler: ScrollOnWillScrollCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: (Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): This {
        let wrapper = { xOffset: Float64, yOffset: Float64, scrollState: Int32, scrollSource: Int32 =>
            let res = handler(
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
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { Unit } handler
     * @returns { This }
     * @relation onWillScroll(handler: ScrollOnWillScrollCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: (Float64, Float64, ScrollState, ScrollSource) -> Unit): This {
        let callbackWithRet: (Float64, Float64, ScrollState, ScrollSource) -> OffsetResult = {
            xOffset: Float64, yOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
            handler(xOffset, yOffset, scrollState, scrollSource)
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
     * @param { ScrollOnScrollCallback } callback
     * @returns { This }
     * @relation onDidScroll(handler: ScrollOnScrollCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidScroll(callback: ScrollOnScrollCallback): This {
        let wrapper = {
            xOffset: Float64, yOffset: Float64, scrollState: Int32 => callback(xOffset, yOffset,
                ScrollState.parseValue(scrollState))
        }
        let lambdaData = Callback3Param<Float64, Float64, Int32, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollOnDidScroll(lambdaData.getID())
        }
        this
    }

    protected func onScrollStartInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollStart(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    protected func onScrollStopInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollStop(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /**
     * Triggered when each frame scrolling starts.
     * Anonymous Object Rectification.
     *
     * @param { OnScrollFrameBeginCallback } event
     * @returns { This }
     * @relation onScrollFrameBegin(event: OnScrollFrameBeginCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollFrameBegin(event: OnScrollFrameBeginCallback): This {
        let wrapper = {
            offset: Float64, state: Int32 => event(offset, ScrollState.parseValue(state))
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
     * 1. This event is triggered when scrolling reaches the edge after being started by the Scroll component or other input settings, such as keyboard and mouse operations.
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { OnScrollEdgeCallback } event
     * @returns { This }
     * @relation onScrollEdge(event: OnScrollEdgeCallback): ScrollAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollEdge(event: OnScrollEdgeCallback): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollEdge(
                Callback1Param<Int32, Unit>(
                    {
                        value =>
                        let edge = Edge.setValue(value)
                        event(edge)
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
 *
 * @relation class Scroller
 */

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroller {
    let handler: ScrollerHandler

    /**
     * A constructor used to create a Scroller object.
     *
     * @relation  constructor();
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { Length } xOffset
     * @param { Length } yOffset
     * @relation scrollTo(options: ScrollOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { Length } xOffset
     * @param { Length } yOffset
     * @param { ScrollAnimationOptions } animation
     * @relation scrollTo(options: ScrollOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: ScrollAnimationOptions): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            try (curveResource = LibC.mallocCString(animation.curve.getValue()).asResource()) {
                FfiOHOSAceFrameworkScrollerScrollToAnimationOptions(this.handler.getID(), xOffset_.value,
                    xOffset_.unitType.getValue(), yOffset_.value, yOffset_.unitType.getValue(), animation.duration,
                    curveResource.value, animation.canOverScroll)
            }
        }
    }

    /**
     * Sets slides to the specified position.
     *
     * @param { Length } xOffset
     * @param { Length } yOffset
     * @param { Bool } animation
     * @relation scrollTo(options: ScrollOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: Bool): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollToAnimation(this.handler.getID(), xOffset_.value, xOffset_.unitType.getValue(),
                yOffset_.value, yOffset_.unitType.getValue(), animation)
        }
    }

    /**
     * Called when the setting slides by offset.
     *
     * @param { Length } xOffset
     * @param { Length } yOffset
     * @relation scrollBy(dx: Length, dy: Length): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { Edge } value
     * @relation scrollEdge(value: Edge, options?: ScrollEdgeOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { Edge } value
     * @param { ScrollEdgeOptions } options
     * @relation scrollEdge(value: Edge, options?: ScrollEdgeOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollEdge(value: Edge, options: ScrollEdgeOptions): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollEdgeWithVelocity(this.handler.getID(), value.getValue(), options.velocity)
        }
    }

    /**
     * Performs inertial scrolling based on the initial velocity passed in.
     *
     * @param { Float64 } velocity - If the value specified is 0, it is considered as invalid, and will not take effect.
     * A positive value indicates scrolling towards the top, while a negative value indicates scrolling towards the bottom.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types; 3. Parameter verification failed.
     * @throws { BusinessException } 100004 - Controller not bound to component.
     * @relation fling(velocity: number): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fling(velocity: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollFling(this.handler.getID(), velocity)
        }
    }

    /**
     * Called when page turning mode is set.
     *
     * @param { Bool } next
     * @relation scrollPage(value: ScrollPageOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollPage(next: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollPage(this.handler.getID(), next)
        }
    }

    /**
     * Called when page turning mode is set.
     *
     * @param { Bool } next
     * @param { Bool } animation
     * @relation scrollPage(value: ScrollPageOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollPage(next: Bool, animation!: Bool = false): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollPageWithAnimation(this.handler.getID(), next, animation)
        }
    }

    /**
     * Obtains the current scrolling offset.
     *
     * @returns { This }
     * @relation currentOffset() : OffsetResult;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { Int32 } index
     * @param { Bool } smooth
     * @param { ScrollAlign } align
     * @param { ScrollToIndexOptions } options
     * @returns { This }
     * @relation scrollToIndex(value: number, smooth?: boolean, align?: ScrollAlign, options?: ScrollToIndexOptions): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollToIndex(
        index: Int32,
        smooth!: Bool = false,
        align!: ScrollAlign = ScrollAlign.Start,
        options!: ScrollToIndexOptions = ScrollToIndexOptions()
    ): This {
        var extraOffset_ = transAppResourceToLength(options.extraOffset)
        unsafe {
            if (index >= 0) {
                FfiOHOSAceFrameworkScrollerScrollToIndexWithUnit(this.handler.getID(), index, smooth, align.getValue(),
                    extraOffset_.value, extraOffset_.unitType.getValue())
            }
        }
        this
    }

    /**
     * Checks whether the component has scrolled to the bottom.
     * This API is available for the ArcList, Scroll, List, Grid, and WaterFlow components.
     *
     * @returns { Bool } - Returns whether the component scrolls to the end position.
     * @relation isAtEnd(): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func isAtEnd(): Bool {
        unsafe {
            FfiOHOSAceFrameworkScrollerIsAtEnd(this.handler.getID())
        }
    }

    /**
     * Obtains the size and position of a child component relative to its container.
     * The value of <em>index</em> must be the index of a child component visible in the display area.
     * Otherwise, the value is considered invalid.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @returns { Int32 }
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types; 3. Parameter verification failed.
     * @throws { BusinessException } 100004 - Controller not bound to component.
     * @relation getItemRect(index: number): RectResult;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getItemRect(index: Int32): RectResult {
        unsafe {
            RectResult(FfiOHOSAceFrameworkScrollerGetItemRect(this.handler.getID(), index))
        }
    }

    /**
     * Obtains the index of a child component based on coordinates.
     * <br>The returned index is <em>-1</em> for invalid coordinates.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @returns { Int32 }
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types; 3. Parameter verification failed.
     * @throws { BusinessException } 100004 - The controller not bound to component.
     * @relation getItemIndex(x: number, y: number): number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
