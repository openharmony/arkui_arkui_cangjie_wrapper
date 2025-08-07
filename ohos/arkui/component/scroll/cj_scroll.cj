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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetRemain: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offsetRemain!: Float64) {
        this.offsetRemain = offsetRemain
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OffsetResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xOffset: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var yOffset: Float64

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RectResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollAnimationOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: Curve

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var canOverScroll: Bool

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollAlign {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NestedScrollOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NestedScrollOptions(
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var scrollForward: NestedScrollMode,
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var scrollBackward: NestedScrollMode
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FadingEdgeOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fadingEdgeLength: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fadingEdgeLength!: Length = 32.vp) {
        this.fadingEdgeLength = fadingEdgeLength
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentClipMode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ContentOnly
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Boundary
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

public class ScrollEdgeOptions {
    public var velocity: Float32 = 0.0

    public init(velocity!: Float32 = 0.0) {
        this.velocity = velocity
    }
}

public class ScrollToIndexOptions {
    public var extraOffset: Length = 0.vp

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ScrollableBase <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBar(barState: BarState): This {
        scrollBarInner(barState)
    }

    protected func scrollBarInner(barState: BarState): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarColor(color: ResourceColor): This {
        scrollBarColorInner(color)
    }

    protected func scrollBarColorInner(color: ResourceColor): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarWidth(value: Length): This {
        scrollBarWidthInner(value)
    }

    protected func scrollBarWidthInner(value: Length): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nestedScroll(value: NestedScrollOptions): This {
        nestedScrollInner(value)
    }

    protected func nestedScrollInner(value: NestedScrollOptions): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableScrollInteraction(value: Bool): This {
        enableScrollInteractionInner(value)
    }

    protected func enableScrollInteractionInner(value: Bool): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: Float64): This {
        frictionInner(value)
    }

    protected func frictionInner(value: Float64): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: AppResource): This {
        frictionInner(value)
    }

    protected func frictionInner(value: AppResource): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachStart(event: () -> Unit): This {
        onReachStartInner(event)
    }

    protected func onReachStartInner(event: () -> Unit): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachEnd(event: () -> Unit): This {
        onReachEndInner(event)
    }

    protected func onReachEndInner(event: () -> Unit): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStart(event: () -> Unit): This {
        onScrollStartInner(event)
    }

    protected func onScrollStartInner(event: () -> Unit): This

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStop(event: () -> Unit): This {
        onScrollStopInner(event)
    }

    protected func onScrollStopInner(event: () -> Unit): This

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroll <: ScrollableBase {
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Scroller {
    let handler: ScrollerHandler

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
     * @param xOffset: X-axis offset.
     * @param yOffset: Y-axis offset.
     * @since 11
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
     * @param xOffset: X-axis offset.
     * @param yOffset: Y-axis offset.
     * @param animation: Scrolling animation options.
     * @since 14
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
     * @param xOffset: X-axis offset.
     * @param yOffset: Y-axis offset.
     * @param animation: Scrolling animation or not.
     * @since 14
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
     * Sets slides by offset.
     *
     * @param xOffset: X-axis offset.
     * @param yOffset: Y-axis offset.
     * @since 11
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
     * @param edge: Edge type of the container.
     * @since 11
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
     * @param edge: Edge type of the container.
     * @param velocity: he fasten speed of scrolling to the edge, unit is vp/s.
     * @since 14
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
     * Fling the scroll view.
     *
     * @param velocity: initial velocity of fling, in vp/s.
     * @since 14
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
     * Sets page turning mode.
     *
     * @param next: Whether to enable the attribute.
     * @since 11
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
     * Sets page turning mode.
     *
     * @param next: Whether to enable the attribute.
     * @param animation: Set whether the scrollPage have animate.
     * @since 14
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
     * Called when viewing the scroll offset.
     *
     * @return OffsetResult: scroll offset.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func currentOffset(): OffsetResult {
        unsafe {
            FfiOHOSAceFrameworkScrollerCurrentOffset(this.handler.getID()).parseToCJ()
        }
    }

    /**
     * Called when sliding to the specified index.
     *
     * @param index: Index to jump to.
     * @param smooth: Whether there is animation when sliding.
     * @param align: alignment mode of a specified index.
     * @param extraOffset: The extra offset of scrolling to the index, unit is vp.
     * @return This: Current object.
     * @since 14
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
     * Indicates whether the component scrolls to the end position.
     *
     * @return Bool: whether the component scrolls to the end position.
     * @since 14
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
     * Get child item size and position.
     *
     * @param  index: Index of the item.
     * @returns RectResult: Returns the size and position.
     * since 14
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
     * Get item index by position.
     *
     * @param x: X coordinate relative to the upper left corner of the current component's original area, in vp.
     * @param y: Y coordinate relative to the upper left corner of the current component's original area, in vp.
     * @returns Int32: Index of the item.
     * @since 14
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
