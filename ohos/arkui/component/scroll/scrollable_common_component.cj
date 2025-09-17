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

/**
 * Provides functions for scroll able Base.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ScrollableCommonMethodComponent<T> <: CommonMethodComponent<T> {
    protected init(id: Int64){
        super(id)
    }

    protected init(){
        super()
    }

    protected open func initial(): Unit {
        super.initial()
    }

    protected open func update(): Unit {
        super.update()
    }

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
    public func scrollBar(barState: ?BarState): T {
        let tmpBarState = barState ?? throw IllegalArgumentException("The type now is not supported.")
        scrollBarInner(tmpBarState)
    }

    protected func scrollBarInner(barState: BarState): T

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
    public func scrollBarColor(color: ?ResourceColor): T {
        let tmpColor = color ?? throw IllegalArgumentException("The type now is not supported.")
        scrollBarColorInner(tmpColor)
    }

    protected func scrollBarColorInner(color: ResourceColor): T

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
    public func scrollBarWidth(value: ?Length): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        scrollBarWidthInner(tmpValue)
    }

    protected func scrollBarWidthInner(value: Length): T

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
    public func nestedScroll(value: ?NestedScrollOptions): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        nestedScrollInner(tmpValue)
    }

    protected func nestedScrollInner(value: NestedScrollOptions): T

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
    public func enableScrollInteraction(value: ?Bool): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        enableScrollInteractionInner(tmpValue)
    }

    protected func enableScrollInteractionInner(value: Bool): T

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
    public func friction(value: ?Float64): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        frictionInner(tmpValue)
    }

    protected func frictionInner(value: Float64): T

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
    public func friction(value: ?AppResource): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        frictionInner(tmpValue)
    }

    protected func frictionInner(value: AppResource): T

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
    public func onReachStart(event: ?() -> Unit): T {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        onReachStartInner(tmpEvent)
    }

    protected func onReachStartInner(event: () -> Unit): T

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
    public func onReachEnd(event: ?() -> Unit): T {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        onReachEndInner(tmpEvent)
    }

    protected func onReachEndInner(event: () -> Unit): T

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
    public func onScrollStart(event: ?() -> Unit): T {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        onScrollStartInner(tmpEvent)
    }

    protected func onScrollStartInner(event: () -> Unit): T

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
    public func onScrollStop(event: ?() -> Unit): T {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        onScrollStopInner(tmpEvent)
    }

    protected func onScrollStopInner(event: () -> Unit): T

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
    public func flingSpeedLimit(speedLimit: ?Float64): T {
        let tmpSpeedLimit = speedLimit ?? throw IllegalArgumentException("The type now is not supported.")
        flingSpeedLimitInner(tmpSpeedLimit)
    }

    protected func flingSpeedLimitInner(speedLimit: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseFlingSpeed(speedLimit)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
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
    public func fadingEdge(enabled: Option<Bool>): T {
        fadingEdgeInner(enabled)
    }

    protected func fadingEdgeInner(enabled: Option<Bool>): T {
        match (enabled) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkScrollableBaseFadingEdge(v)
                }
            case None => ()
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
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
    public func fadingEdge(enabled: Option<Bool>, options: ?FadingEdgeOptions): T {
        let tmpOptions = options ?? throw IllegalArgumentException("The type now is not supported.")
        fadingEdgeInner(enabled, tmpOptions)
    }

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
        (this as T) ?? throw IllegalArgumentException("Type error")
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
    public func clipContent(clip: ?ContentClipMode): T {
        let tmpClip = clip ?? throw IllegalArgumentException("The type now is not supported.")
        clipContentInner(tmpClip)
    }

    protected func clipContentInner(clip: ContentClipMode): T {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipMode(clip.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
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
    public func clipContent(clip: ?RectShape): T {
        let tmpClip = clip ?? throw IllegalArgumentException("The type now is not supported.")
        clipContentInner(tmpClip)
    }

    protected func clipContentInner(clip: RectShape): T {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipShape(clip.getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
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
    public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): T {
        onWillScrollInner(handler)
    }

    protected func onWillScrollInner(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): T {
        match (handler) {
            case Some(v) =>
                let wrapper = { scrollOffset: Float64, scrollState: Int32, scrollSource: Int32 =>
                    let res = v(scrollOffset, ScrollState.parseValue(scrollState), ScrollSource.parseValue(scrollSource))
                    return res.offsetRemain ?? throw IllegalArgumentException("The type now is not supported.")
                }
                let lambdaData = Callback3Param<Float64, Int32, Int32, Float64>(wrapper)

                unsafe {
                    FfiOHOSAceFrameworkScrollableBaseOnWillScroll(lambdaData.getID())
                }
            case None => ()
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
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
    public func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): T {
        onWillScrollInner(handler)
    }

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
        (this as T) ?? throw IllegalArgumentException("Type error")
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
    public func onDidScroll(handler: ?OnScrollCallBack): T {
        let tmpHandler = handler ?? throw IllegalArgumentException("The type now is not supported.")
        onDidScrollInner(tmpHandler)
    }

    protected func onDidScrollInner(handler: OnScrollCallBack): T {
        let wrapper = {
            scrollOffset: Float64, scrollState: Int32 => handler(scrollOffset, ScrollState.parseValue(scrollState))
        }
        let lambdaData = Callback2Param<Float64, Int32, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkScrollableBaseOnDidScroll(lambdaData.getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }
}
