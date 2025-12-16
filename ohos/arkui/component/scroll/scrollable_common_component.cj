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

import ohos.arkui.component.common.{CommonMethodComponent, BarState, ScrollState, ScrollSource}
import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{ResourceColor, Length, LengthProp}
import ohos.ffi.{Callback2Param, Callback3Param}
import ohos.resource.{AppResource}
import ohos.labels.{APILevel, Hide}
import ohos.arkui.shape.{RectShape}
import ohos.business_exception.BusinessException
import std.deriving.Derive

/**
 * Provides functions for scroll able Base.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ScrollableCommonMethodComponent<T> <: CommonMethodComponent<T> {
    @!Hide
    protected open func initial(): Unit {
        super.initial()
    }

    @!Hide
    protected open func update(): Unit {
        super.update()
    }

    /**
     * Sets the scrollbar state.
     *
     * @param { ?BarState } barState - Scrollbar state.
     * @default BarState.Auto
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBar(barState: ?BarState): T {
        scrollBarInner(barState)
    }

    @!Hide
    protected func scrollBarInner(barState: ?BarState): T

    /**
     * Sets the scrollbar color.
     *
     * @param { ?ResourceColor } color - Scrollbar color.
     * @default 0x182431
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarColor(color: ?ResourceColor): T {
        scrollBarColorInner(color)
    }

    @!Hide
    protected func scrollBarColorInner(color: ?ResourceColor): T

    /**
     * Sets the scrollbar width.
     *
     * @param { ?Length } value - Scrollbar width.
     * @default 4.vp
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarWidth(value: ?Length): T {
        scrollBarWidthInner(value ?? 4.vp)
    }

    @!Hide
    protected func scrollBarWidthInner(value: ?Length): T

    /**
     * Sets the nested scrolling options. You can set the nested scrolling mode in the forward and backward directions
     * to implement scrolling linkage with the parent component.
     *
     * @param { ?NestedScrollOptions } value - Nested scrolling options.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nestedScroll(value: ?NestedScrollOptions): T {
        nestedScrollInner(value)
    }

    @!Hide
    protected func nestedScrollInner(value: ?NestedScrollOptions): T

    /**
     * Sets whether to support scroll gestures. When this attribute is set to <em>false</em>,
     * scrolling by finger or mouse is not supported, but the scroll controller API is not affected.
     *
     * @param { ?Bool } value
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableScrollInteraction(value: ?Bool): T {
        enableScrollInteractionInner(value)
    }

    @!Hide
    protected func enableScrollInteractionInner(value: ?Bool): T

    /**
     * Sets the friction coefficient. It applies only to gestures in the scrolling area, and
     * it affects only indirectly the scroll chaining during the inertial scrolling process.
     * If this attribute is set to a value less than or equal to 0, the default value is used.
     *
     * @param { ?Float64 } value
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: ?Float64): T {
        frictionInner(value)
    }

    @!Hide
    protected func frictionInner(value: ?Float64): T

    /**
     * Sets the friction coefficient. It applies only to gestures in the scrolling area, and
     * it affects only indirectly the scroll chaining during the inertial scrolling process.
     * If this attribute is set to a value less than or equal to 0, the default value is used.
     *
     * @param { ?AppResource } value
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: ?AppResource): T {
        frictionInner(value)
    }

    @!Hide
    protected func frictionInner(value: ?AppResource): T

    /**
     * Sets the reach start.
     *
     * @param { ?() -> Unit } event
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachStart(event: ?() -> Unit): T {
        onReachStartInner(event)
    }

    @!Hide
    protected func onReachStartInner(event: ?() -> Unit): T

    /**
     * Sets the reach end.
     *
     * @param { ?() -> Unit } event - The callback on reach end.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachEnd(event: ?() -> Unit): T {
        onReachEndInner(event)
    }

    @!Hide
    protected func onReachEndInner(event: ?() -> Unit): T

    /**
     * Called when scrolling start.
     *
     * @param { ?() -> Unit } event - The callback on scroll start.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStart(event: ?() -> Unit): T {
        onScrollStartInner(event)
    }

    @!Hide
    protected func onScrollStartInner(event: ?() -> Unit): T

    /**
     * Called when scrolling has stopped.
     *
     * @param { ?() -> Unit } event - The callback on scroll stop.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStop(event: ?() -> Unit): T {
        onScrollStopInner(event)
    }

    @!Hide
    protected func onScrollStopInner(event: ?() -> Unit): T

    /**
     * Fling Speed Limit.
     *
     * @param { ?Float64 } speedLimit - The speed limit.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flingSpeedLimit(speedLimit: ?Float64): T {
        flingSpeedLimitInner(speedLimit)
    }

    @!Hide
    protected func flingSpeedLimitInner(speedLimit: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseFlingSpeed(speedLimit ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * The options of fading Edge.
     *
     * @param { Option<Bool> } enabled - Whether enable fading edge.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fadingEdge(enabled: Option<Bool>): T {
        fadingEdgeInner(enabled)
    }

    @!Hide
    protected func fadingEdgeInner(enabled: Option<Bool>): T {
        match (enabled) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkScrollableBaseFadingEdge(v)
                }
            case None => ()
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * The options of fading Edge.
     *
     * @param { Option<Bool> } enabled - Whether enable fading edge.
     * @param { ?FadingEdgeOptions } options - Fading edge options.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fadingEdge(enabled: Option<Bool>, options: ?FadingEdgeOptions): T {
        fadingEdgeInner(enabled, options ?? FadingEdgeOptions())
    }

    @!Hide
    protected func fadingEdgeInner(enabled: Option<Bool>, options: FadingEdgeOptions): T {
        match (enabled) {
            case Some(v) =>
                var fadingEdge = transAppResourceToLength(options.fadingEdgeLength ?? 32.vp)
                unsafe {
                    FfiOHOSAceFrameworkScrollableBaseFadingEdgeOptions(
                        v,
                        fadingEdge.value,
                        fadingEdge.unitType.getValue()
                    )
                }
            case None => ()
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * The clip mode of content.
     *
     * @param { ?ContentClipMode } clip - The clip mode.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clipContent(clip: ?ContentClipMode): T {
        clipContentInner(clip)
    }

    @!Hide
    protected open func clipContentInner(clip: ?ContentClipMode): T {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipMode((clip ?? ContentClipMode.Boundary).getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * The clip mode of content.
     *
     * @param { ?RectShape } clip - The clip mode.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clipContent(clip: ?RectShape): T {
        match (clip) {
            case Some(v) => clipContentInner(v)
            case None => clipContentInner(Option<ContentClipMode>.None)
        }
    }

    @!Hide
    protected func clipContentInner(clip: RectShape): T {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipShape(clip.getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
     * @param { Option<(Float64, ScrollState, ScrollSource) -> ScrollResult> } handler - Callback triggered before scrolling.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): T {
        onWillScrollInner(handler)
    }

    @!Hide
    protected func onWillScrollInner(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): T {
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
     * @param { Option<(Float64, ScrollState, ScrollSource) -> Unit> } handler - Callback triggered before scrolling.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): T {
        onWillScrollInner(handler)
    }

    @!Hide
    protected func onWillScrollInner(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): T {
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Triggered when the Scroll component scrolls.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings, such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called;
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?OnScrollCallBack } handler - Callback triggered after scrolling.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidScroll(handler: ?OnScrollCallBack): T {
        onDidScrollInner(handler ?? { _, _ => })
    }

    @!Hide
    protected func onDidScrollInner(handler: OnScrollCallBack): T {
        let wrapper = {
            scrollOffset: Float64, scrollState: Int32 => handler(scrollOffset, ScrollState.parseValue(scrollState))
        }
        let lambdaData = Callback2Param<Float64, Int32, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollableBaseOnDidScroll(lambdaData.getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }
}
