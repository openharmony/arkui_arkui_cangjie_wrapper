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

import std.convert.*

@C
public struct OffsetResult {
    public OffsetResult(
        // Float64 -> vp
        public let xOffset: Float64,
        public let yOffset: Float64
    ) {}
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

@C
struct RectResultParams {
    RectResultParams(
        let x: Float64,
        let y: Float64,
        let width: Float64,
        let height: Float64
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RectResult {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollSnapOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var snapAlign: ScrollSnapAlign
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var snapPagination: Array<Length>
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSnapToStart: Bool = true
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSnapToEnd: Bool = true
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        snapAlign: ScrollSnapAlign,
        snapPagination!: Option<Array<Length>> = None,
        enableSnapToStart!: Bool = true,
        enableSnapToEnd!: Bool = true
    ) {
        this.snapAlign = snapAlign
        if (let Some(v) <- snapPagination) {
            this.snapPagination = v
        } else {
            this.snapPagination = [0.vp]
        }
        this.enableSnapToStart = enableSnapToStart
        this.enableSnapToEnd = enableSnapToEnd
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        snapAlign: ScrollSnapAlign,
        snapPagination!: Length,
        enableSnapToStart!: Bool = true,
        enableSnapToEnd!: Bool = true
    ) {
        this.snapAlign = snapAlign
        var snapPagination_ = transAppResourceToLength(snapPagination)
        if (snapPagination_.value < 0.0) {
            this.snapPagination = [0.vp]
        } else {
            this.snapPagination = [snapPagination_]
        }
        this.enableSnapToStart = enableSnapToStart
        this.enableSnapToEnd = enableSnapToEnd
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollAnimationOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: Curve
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var canOverScroll: Bool
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollSnapAlign {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | ...

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case START => 1
            case CENTER => 2
            case END => 3
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
public enum ScrollAlign {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AUTO
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | ...

    func getValue(): Int32 {
        match (this) {
            case START => 0
            case CENTER => 1
            case END => 2
            case AUTO => 3
            case NONE => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NestedScrollOptions {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NestedScrollOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var scrollForward: NestedScrollMode,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var scrollBackward: NestedScrollMode
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FadingEdgeOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public FadingEdgeOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var fadingEdgeLength!: Length = 32.vp) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentClipMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CONTENT_ONLY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOUNDARY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SAFE_AREA
    | ...

    func getValue(): Int32 {
        match (this) {
            case CONTENT_ONLY => 0
            case BOUNDARY => 1
            case SAFE_AREA => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
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

    func FfiOHOSAceFrameworkScrollerCurrentOffset(scrollerID: Int64): OffsetResult

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
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ScrollableBase <: ContainerBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBar(barState: BarState): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarColor(color: ResourceColor): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarWidth(value: Length): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nestedScroll(value: NestedScrollOptions): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableScrollInteraction(value: Bool): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: Float64): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachStart(callback: () -> Unit): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachEnd(callback: () -> Unit): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStart(callback: () -> Unit): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStop(callback: () -> Unit): This

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flingSpeedLimit(speedLimit: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseFlingSpeed(speedLimit)
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
    public func fadingEdge(enabled: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseFadingEdge(enabled)
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
    public func fadingEdge(enabled: Bool, options: FadingEdgeOptions): This {
        var fadingEdge = transAppResourceToLength(options.fadingEdgeLength)
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseFadingEdgeOptions(
                enabled,
                fadingEdge.value,
                fadingEdge.unitType.getValue()
            )
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
    public func clipContent(clip: ContentClipMode): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipMode(clip.getValue())
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
    public func clipContent(clip: RectShape): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipShape(clip.getID())
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
    public func onWillScroll(callback: (Float64, ScrollState, ScrollSource) -> Float64): This {
        let wrapper = {
            scrollOffset: Float64, scrollState: Int32, scrollSource: Int32 => callback(scrollOffset,
                ScrollState.parseValue(scrollState), ScrollSource.parseValue(scrollSource))
        }
        let lambdaData = Callback3Param<Float64, Int32, Int32, Float64>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollableBaseOnWillScroll(lambdaData.getID())
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
    public func onWillScroll(callback: (Float64, ScrollState, ScrollSource) -> Unit): This {
        let callbackWithRet: (Float64, ScrollState, ScrollSource) -> Float64 = {
            scrollOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
            callback(scrollOffset, scrollState, scrollSource)
            return scrollOffset
        }
        onWillScroll(callbackWithRet)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidScroll(callback: (scrollOffset: Float64, scrollState: ScrollState) -> Unit): This {
        let wrapper = {
            scrollOffset: Float64, scrollState: Int32 => callback(scrollOffset, ScrollState.parseValue(scrollState))
        }
        let lambdaData = Callback2Param<Float64, Int32, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollableBaseOnDidScroll(lambdaData.getID())
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
public class Scroll <: ScrollableBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkScrollCreate(-1)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkScrollCreate(scroller.getID())
        }
        this.child = child
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enablePaging(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkScrollEnablePaging(value)
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
    public func enableScrollInteraction(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkScrollInteraction(value)
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
    public func friction(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkScrollFriction(value)
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
    public func friction(value: AppResource): This {
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
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func initialOffset(xOffset!: Length = 0.vp, yOffset!: Length = 0.vp): This {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollInitialOffset(Float32(xOffset_.value), xOffset_.unitType.getValue(),
                Float32(yOffset_.value), yOffset_.unitType.getValue())
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
    public func edgeEffect(value: EdgeEffect, options: EdgeEffectOptions): This {
        edgeEffect(value, alwaysEnabled: options.alwaysEnabled)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func edgeEffect(edgeEffect: EdgeEffect, alwaysEnabled!: Bool = true): This {
        unsafe {
            FfiOHOSAceFrameworkScrollEdgeEffect(edgeEffect.getValue(), alwaysEnabled)
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
    public func scrollable(scrollDirection: ScrollDirection): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollable(scrollDirection.getValue())
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
    public func scrollBar(barState: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBar(barState.getValue())
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
    public func scrollBarColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBarColor(transAppResourceToResourceColor(color))
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
    public func scrollBarWidth(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkScrollScrollBarWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollSnap(value: ScrollSnapOptions): This {
        let snapPagination = value.snapPagination
        var vecValueHandle = FFIVectorFloat32(snapPagination.size)
        var vecParameHandle = FFIVectorInt32(snapPagination.size)

        for (i in 0..snapPagination.size) {
            vecValueHandle.setElement(i, Float32(snapPagination[i].value))
            vecParameHandle.setElement(i, snapPagination[i].unitType.getValue())
        }

        unsafe {
            FfiOHOSAceFrameworkScrollScrollsnap(
                ScrollSnapOptionsParams(
                    value.snapAlign.getValue(),
                    vecValueHandle.getNativeHandle(),
                    vecParameHandle.getNativeHandle(),
                    Int32(snapPagination.size),
                    value.enableSnapToStart,
                    value.enableSnapToEnd,
                    snapPagination.size > 1
                )
            )

            vecValueHandle.free()
            vecParameHandle.free()
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
    public func nestedScroll(value: NestedScrollOptions): This {
        let localScrollForward = value.scrollForward.getValue()
        let localScrollBackward = value.scrollBackward.getValue()
        unsafe {
            FfiOHOSAceFrameworkScrollNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    @Deprecated["The function is deprecated", since: "14"]
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScroll(callback: (OffsetResult) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScroll(CallbackOffset(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachStart(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnReachStart(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachEnd(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnReachEnd(Callback0Param<Unit>(callback).getID())
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
    public func onWillScroll(callback: (Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): This {
        let wrapper = {
            xOffset: Float64, yOffset: Float64, scrollState: Int32, scrollSource: Int32 => callback(xOffset, yOffset,
                ScrollState.parseValue(scrollState), ScrollSource.parseValue(scrollSource))
        }
        let lambdaData = Callback4Param<Float64, Float64, Int32, Int32, OffsetResult>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollOnWillScroll(lambdaData.getID())
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
    public func onWillScroll(callback: (Float64, Float64, ScrollState, ScrollSource) -> Unit): This {
        let callbackWithRet: (Float64, Float64, ScrollState, ScrollSource) -> OffsetResult = {
            xOffset: Float64, yOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
            callback(xOffset, yOffset, scrollState, scrollSource)
            return OffsetResult(xOffset, yOffset)
        }
        onWillScroll(callbackWithRet)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidScroll(callback: (Float64, Float64, ScrollState) -> Unit): This {
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStart(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollStart(Callback0Param<Unit>(callback).getID())
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
    public func onScrollStop(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollStop(Callback0Param<Unit>(callback).getID())
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
    public func onScrollFrameBegin(callback: (Float64, ScrollState) -> Float64): This {
        let wrapper = {
            offset: Float64, state: Int32 => callback(offset, ScrollState.parseValue(state))
        }
        let lambdaData = Callback2Param<Float64, Int32, Float64>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkScrollSetOnScrollFrameBegin(lambdaData.getID())
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
    public func onScrollEdge(callback: (Edge) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollEdge(
                Callback1Param<Int32, Unit>(
                    {
                        value =>
                        let edge = Edge.setValue(value)
                        callback(edge)
                    }
                ).getID())
        }
        this
    }

    @!APILevel[
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollEnd(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkScrollOnScrollEnd(Callback0Param<Unit>(callback).getID())
        }
        this
    }
}

sealed abstract class BaseScroller <: RemoteDataLite {
    /**
     * constructor.
     *
     * @since 11
     */
    public init(id: Int64) {
        super(id)
    }

    /**
     * Sets slides to the specified position.
     *
     * @param xOffset: X-axis offset.
     * @param yOffset: Y-axis offset.
     * @since 11
     */
    public func scrollTo(xOffset!: Length, yOffset!: Length): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollTo(this.getID(), xOffset_.value, xOffset_.unitType.getValue(),
                yOffset_.value, yOffset_.unitType.getValue())
        }
    }

    /**
     * Sets slides to the specified position.
     *
     * @param xOffset: X-axis offset.
     * @param yOffset: Y-axis offset.
     * @param duration: Scrolling duration.
     * @param curve: Scrolling curve.
     * @since 11
     */
    public func scrollTo(xOffset!: Length, yOffset!: Length, duration!: Float64, curve!: Curve): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            var curveCString = LibC.mallocCString(curve.getValue())
            FfiOHOSAceFrameworkScrollerScrollToByCurve(this.getID(), xOffset_.value, xOffset_.unitType.getValue(),
                yOffset_.value, yOffset_.unitType.getValue(), duration, curveCString)
            LibC.free(curveCString)
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
    public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: ScrollAnimationOptions): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            var curveCString = LibC.mallocCString(animation.curve.getValue())
            FfiOHOSAceFrameworkScrollerScrollToAnimationOptions(this.getID(), xOffset_.value,
                xOffset_.unitType.getValue(), yOffset_.value, yOffset_.unitType.getValue(), animation.duration,
                curveCString, animation.canOverScroll)
            LibC.free(curveCString)
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
    public func scrollTo(xOffset!: Length, yOffset!: Length, animation!: Bool): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollToAnimation(this.getID(), xOffset_.value, xOffset_.unitType.getValue(),
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
    public func scrollBy(xOffset!: Length, yOffset!: Length): Unit {
        var xOffset_ = transAppResourceToLength(xOffset)
        var yOffset_ = transAppResourceToLength(yOffset)
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollBy(this.getID(), xOffset_.value, xOffset_.unitType.getValue(),
                yOffset_.value, yOffset_.unitType.getValue())
        }
    }

    /**
     * Called when scrolling to the edge of the container.
     *
     * @param edge: Edge type of the container.
     * @since 11
     */
    public func scrollEdge(edge: Edge): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollEdge(this.getID(), edge.getValue())
        }
    }

    /**
     * Called when scrolling to the edge of the container.
     *
     * @param edge: Edge type of the container.
     * @param velocity: he fasten speed of scrolling to the edge, unit is vp/s.
     * @since 14
     */
    public func scrollEdge(edge: Edge, velocity!: Float32): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollEdgeWithVelocity(this.getID(), edge.getValue(), velocity)
        }
    }

    /**
     * Called when scrolling to the edge of the container.
     *
     * @param edge: Edge type of the container.
     * @param velocity: he fasten speed of scrolling to the edge, unit is vp/s.
     * @since 14
     */
    public func scrollEdge(edge: Edge, velocity!: Int32): Unit {
        scrollEdge(edge, velocity: Float32(velocity))
    }

    /**
     * Fling the scroll view.
     *
     * @param velocity: initial velocity of fling, in vp/s.
     * @since 14
     */
    public func fling(velocity: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollFling(this.getID(), velocity)
        }
    }

    /**
     * Fling the scroll view.
     *
     * @param velocity: initial velocity of fling, in vp/s.
     * @since 14
     */
    public func fling(velocity: Int64): Unit {
        fling(Float64(velocity))
    }

    /**
     * Sets page turning mode.
     *
     * @param next: Whether to enable the attribute.
     * @since 11
     */
    public func scrollPage(next: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollPage(this.getID(), next)
        }
    }

    /**
     * Sets page turning mode.
     *
     * @param next: Whether to enable the attribute.
     * @param animation: Set whether the scrollPage have animate.
     * @since 14
     */
    public func scrollPage(next: Bool, animation!: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkScrollerScrollPageWithAnimation(this.getID(), next, animation)
        }
    }

    /**
     * Called when viewing the scroll offset.
     *
     * @return OffsetResult: scroll offset.
     * @since 11
     */
    public func currentOffset(): OffsetResult {
        unsafe {
            FfiOHOSAceFrameworkScrollerCurrentOffset(this.getID())
        }
    }

    /**
     * Called when sliding to the specified index.
     *
     * @param index: Index to jump to.
     * @param smooth: Whether there is animation when sliding.
     * @param align: alignment mode of a specified index.
     * @return This: Current object.
     * @since 11
     */
    public func scrollToIndex(
        index: Int32,
        smooth!: Bool = false,
        align!: ScrollAlign = ScrollAlign.START
    ): This {
        unsafe {
            if (index >= 0) {
                FfiOHOSAceFrameworkScrollerScrollToIndex(this.getID(), index, smooth, align.getValue())
            }
        }
        this
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
    public func scrollToIndex(
        index: Int32,
        smooth!: Bool = false,
        align!: ScrollAlign = ScrollAlign.START,
        extraOffset!: Length
    ): This {
        var extraOffset_ = transAppResourceToLength(extraOffset)
        unsafe {
            if (index >= 0) {
                FfiOHOSAceFrameworkScrollerScrollToIndexWithUnit(this.getID(), index, smooth, align.getValue(),
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
    public func isAtEnd(): Bool {
        unsafe {
            FfiOHOSAceFrameworkScrollerIsAtEnd(this.getID())
        }
    }

    /**
     * Get child item size and position.
     *
     * @param  index: Index of the item.
     * @returns RectResult: Returns the size and position.
     * since 14
     */
    public func getItemRect(index: Int32): RectResult {
        unsafe {
            RectResult(FfiOHOSAceFrameworkScrollerGetItemRect(this.getID(), index))
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
    public func getItemIndex(x: Length, y: Length): Int32 {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkScrollerGetItemIndex(this.getID(), x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
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
public class Scroller <: BaseScroller {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkScrollerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}
