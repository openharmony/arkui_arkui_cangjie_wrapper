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

/**
 * CommonScrollableMethod
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
     * @param { ?BarState } barState - Scrollbar state.Default value: BarState.Auto for the List, Grid,
     *     and Scroll components and BarState.Off for the WaterFlow component
     * @returns { T } the instantiated type of the scrollable base.
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
     * @param { ?ResourceColor } color - Scrollbar color.Default value: 0x182431 (40% opacity)
     *     A number value indicates a HEX color in RGB or ARGB format,
     *     for example, 0xffffff. A string value indicates a color in RGB or ARGB format, for example, 0xffffff.
     * @returns { T } the instantiated type of the scrollable base.
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
     * @param { ?Length } value - Scrollbar width.Default value: 4
     *     Unit: vp
     *     If this parameter is set to a value less than or equal to 0, the default value is used.
     *     The value 0 means not to show the scrollbar.
     * @returns { T } the instantiated type of the scrollable base.
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
     * @param { ?NestedScrollOptions } value - options for nested scrolling.
     *      Default value: scrollForward: NestedScrollMode.SelfOnly, scrollBackward: NestedScrollMode.SelfOnly.
     * @returns { T } the instantiated type of the scrollable base.
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
     * Sets whether to support scroll gestures. When this attribute is set to false,
     * scrolling by finger or mouse is not supported, but the scroll controller API is not affected.
     *
     * @param { ?Bool } value - Whether to support scroll gestures.Default value: true
     * @returns { T } the instantiated type of the scrollable base.
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
     * @param { ?Float64 } value - Friction coefficient.
     *      Default value: 0.9 for wearable devices and 0.6 for non-wearable devices.
     * @returns { T } the instantiated type of the scrollable base.
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
     * Triggered when the scrollable component reaches the start position.
     *
     * @param { ?() -> Unit } event - Callback function, triggered when the scrollable reaches the start position.
     * @returns { T } the instantiated type of the scrollable base.
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
     * Triggered when the scrollable component reaches the end position.
     *
     * @param { ?() -> Unit } event - Callback function, triggered when the scrollable reaches the end position.
     * @returns { T } the instantiated type of the scrollable base.
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
     * Triggered when the scrollable component starts scrolling initiated by the user's finger dragging the component or its scrollbar.
     *
     * @param { ?() -> Unit } event - Callback function, triggered when the scrollable starts scrolling.
     * @returns { T } the instantiated type of the scrollable base.
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
     * NOTE
     * 1. This event is triggered when scrolling is stopped by the Scroll component or other input settings, such as keyboard and mouse operations.
     * 2. This event is triggered when the controller API is called, accompanied by a transition animation.
     *
     * @param { ?() -> Unit } event - Callback function, triggered when the scrollable stops scrolling.
     * @returns { T } the instantiated type of the scrollable base.
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
     * Sets the maximum initial velocity at the start of the fling animation that occurs after gesture-driven scrolling ends.
     *
     * @param { ?Float64 } speedLimit - Maximum initial velocity at the start of the fling animation.
     *     Default value: 9000
     *     Unit: vp/s
     *     Value range: (0, +∞). If this parameter is set to a value less than or equal to 0, the default value is used.
     * @returns { T } the instantiated type of the scrollable base.
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
     * Called when setting whether to enable fading Edge effect.
     *
     * @param { Option<Bool> } enabled - Whether to turn on the edge fade effect
     * @param { ?FadingEdgeOptions } options - Fading edge options.
     * @returns { T } the instantiated type of the scrollable base.
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
     * Sets the content clipping area for this scrollable component.
     *
     * @param { ?RectShape } clip - A value from enum ContentClipMode or a customized clip rect.
     * @returns { T } the instantiated type of the scrollable base.
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
     * NOTE
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,
     * such as keyboard and mouse operations.
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     *
     * @param { Option<(Float64, ScrollState, ScrollSource) -> Unit> } handler - Callback triggered before scrolling.
     * @returns { T } the instantiated type of the scrollable base.
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
     * NOTE
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,
     * such as keyboard and mouse operations.
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?OnScrollCallBack } handler - Callback triggered when the Scroll component scrolls.
     * @returns { T } the instantiated type of the scrollable base.
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
