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
import ohos.business_exception.BusinessException

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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollResult {
    /**
     * The offset remain 0f scroll.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetRemain: Float64

    /**
     * Constructs a scroll result.
     *
     * @params { Float64 } offsetRemain
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offsetRemain!: Float64) {
        this.offsetRemain = offsetRemain
    }
}

/**
 * Represents the offset values resulting from a scroll operation.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OffsetResult {

    /**
     * Horizontal scrolling offset.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xOffset: Float64

    /**
     * Vertical scrolling offset.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var yOffset: Float64

    /**
     * Constructs an offset result.
     *
     * @params { Float64 } xOffset
     * @params { Float64 } yOffset
     * @returns { This }
     */
    @!APILevel[
        22,
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
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackOffset")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<NativeOffsetResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackOffset")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0.parseToCJ())
    }
}

/**
 * Represents the rect values resulting from a scroll operation.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RectResult {

    /**
     * Representing the x in the rect values
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float64

    /**
     * Representing the y in the rect values
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float64

    /**
     * Representing the width in the rect values
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Float64

    /**
     * Representing the height in the rect values
     *
     */
    @!APILevel[
        22,
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
     * @params { Float64 } x
     * @params { Float64 } y
     * @params { Float64 } width
     * @params { Float64 } height
     * @returns { This }
     */
    @!APILevel[
        22,
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollAnimationOptions {
    /**
     * Scrolling duration.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Float64

    /**
     * Scrolling curve.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve

    /**
     * Whether to enable overscroll.
     *
     * and the component's edgeEffect attribute is set to EdgeEffect.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var canOverScroll: ?Bool

    /**
     * Constructs a customizing scroll animations
     *
     * @params { Float64 } duration
     * @params { Curve } curve
     * @params { Bool } canOverScroll
     * @returns { This }
     */
    @!APILevel[
        22,
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
 *
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollAlign {
    /**
     * The start edge of the list item is flush with the start edge of the list.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start

    /**
     * The list item is centered along the main axis of the list.
     *
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center

    /**
     * The end edge of the list item is flush with the end edge of the list.
     *
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End

    /**
     * The list item is automatically aligned.
     *
     */
    | @!APILevel[
        22,
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
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NestedScrollOptions {
    /**
    * Representing the forward in the customizing scroll nested.
    *
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scrollForward: ?NestedScrollMode

    /**
    * Representing the backward in the customizing scroll nested.
    *
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scrollBackward: ?NestedScrollMode

    /**
     * Provides parameters for customizing scroll nested.
     */
    @!APILevel[
        22,
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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FadingEdgeOptions {

    /**
     * Representing the length in the customizing fading edge.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fadingEdgeLength: ?Length

    /**
     * Constructs a customizing fading edge.
     *
     * @params { Length } fadingEdgeLength
     * @returns { This }
     */
    @!APILevel[
        22,
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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentClipMode {
    /**
     * The only content mode of content clip modes.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ContentOnly

    /**
     * The boundary mode of content clip modes.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Boundary

    /**
     * The safe area mode of content clip modes.
     */
    | @!APILevel[
        22,
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

public type OnWillScrollCallBack = (Float64, ScrollState, ScrollSource) -> ScrollResult

public type OnScrollCallBack = (scrollOffset: Float64, scrollState: ScrollState) -> Unit

public type ScrollOnScrollCallback = (Float64, Float64, ScrollState) -> Unit

public type OnScrollFrameBeginCallback = (Float64, ScrollState) -> Float64

public type OnScrollEdgeCallback = (Edge) -> Unit

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollEdgeOptions {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var velocity: ?Float32

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(velocity!: ?Float32 = None) {
        this.velocity = velocity ?? 0.0
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollToIndexOptions {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraOffset: ?Length

    @!APILevel[
        22,
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
 * Defines scroll component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroll <: ScrollableCommonMethodComponent<ScrollAttribute> & ScrollAttribute {

    /**
     * Constructs a scroll component.
     *
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * @params { function } child
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * @params { Scroller } scroller
     * @params { function } child
     * @returns { This }
     */
    @!APILevel[
        22,
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
                    case None => BaseLog.debug("AppResource type param of friction func convert to Float64 fail.");
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
     * @params { ScrollDirection } scrollDirection
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollable(scrollDirection: ?ScrollDirection): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollable((scrollDirection ?? ScrollDirection.Vertical).getValue())
        }
        this
    }

    protected func scrollBarInner(barState: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBar(barState.getValue())
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
     * @params { OffsetResult } handler
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @params { Unit } handler
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * @params { ScrollOnScrollCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * @params { OnScrollFrameBeginCallback } event
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * 1. This event is triggered when scrolling reaches the edge after being started by the Scroll component or other input settings, such as keyboard and mouse operations.
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @params { OnScrollEdgeCallback } event
     * @returns { This }
     */
    @!APILevel[
        22,
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
 *
 */

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroller {
    let handler: ScrollerHandler

    /**
     * A constructor used to create a Scroller object.
     *
     */
    @!APILevel[
        22,
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
     * @params { Length } xOffset
     * @params { Length } yOffset
     */
    @!APILevel[
        22,
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
     * @params { Length } xOffset
     * @params { Length } yOffset
     * @params { ScrollAnimationOptions } animation
     */
    @!APILevel[
        22,
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
     * @params { Length } xOffset
     * @params { Length } yOffset
     * @params { Bool } animation
     */
    @!APILevel[
        22,
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
     * @params { Length } xOffset
     * @params { Length } yOffset
     */
    @!APILevel[
        22,
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
     * @params { Edge } value
     */
    @!APILevel[
        22,
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
     * @params { Edge } value
     * @params { ScrollEdgeOptions } options
     */
    @!APILevel[
        22,
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
     * @params { Float64 } velocity - If the value specified is 0, it is considered as invalid, and will not take effect.
     * A positive value indicates scrolling towards the top, while a negative value indicates scrolling towards the bottom.
     */
    @!APILevel[
        22,
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
     * @params { Bool } value
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollPage(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollPage(this.handler.getID(), value)
        }
    }

    /**
     * Called when page turning mode is set.
     *
     * @params { Bool } next
     * @params { Bool } animation
     */
    @!APILevel[
        22,
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
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * @params { Int32 } index
     * @params { Bool } smooth
     * @params { ScrollAlign } align
     * @params { ScrollToIndexOptions } options
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollToIndex(
        index: Int32,
        smooth!: ?Bool = None,
        align!: ?ScrollAlign = None,
        options!: ?ScrollToIndexOptions = None
    ): This {
        let tmpAlign = align ?? ScrollAlign.Start
        let tmpOptions = options ?? ScrollToIndexOptions()
        
        var extraOffset_ = transAppResourceToLength(tmpOptions.extraOffset ?? 0.vp)
        unsafe {
            if (index >= 0) {
                FfiOHOSAceFrameworkScrollerScrollToIndexWithUnit(this.handler.getID(), index, smooth ?? false, tmpAlign.getValue(),
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
     */
    @!APILevel[
        22,
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
     * @params { Float64 } x
     * @params { Float64 } y
     * @returns { Int32 }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getItemRect(index: ?Int32): RectResult {
        unsafe {
            RectResult(FfiOHOSAceFrameworkScrollerGetItemRect(this.handler.getID(), index ?? -1))
        }
    }

    /**
     * Obtains the index of a child component based on coordinates.
     * <br>The returned index is <em>-1</em> for invalid coordinates.
     *
     * @params { Float64 } x
     * @params { Float64 } y
     * @returns { Int32 }
     */
    @!APILevel[
        22,
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
