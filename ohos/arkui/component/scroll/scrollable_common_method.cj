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

import ohos.arkui.component.common.{CommonMethod, BarState, ScrollState, ScrollSource}
import ohos.labels.APILevel
import ohos.base.{ResourceColor, Length}
import ohos.resource.{AppResource}
import ohos.arkui.shape.{RectShape}

/**
 * Provides functions for scroll able Base.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface ScrollableCommonMethod<T> <: CommonMethod<T> {
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
    func scrollBar(barState: ?BarState): T

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
    func scrollBarColor(color: ?ResourceColor): T

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
    func scrollBarWidth(value: ?Length): T

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
    func nestedScroll(value: ?NestedScrollOptions): T

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
    func enableScrollInteraction(value: ?Bool): T

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
    func friction(value: ?Float64): T

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
    func friction(value: ?AppResource): T

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
    func onReachStart(event: ?() -> Unit): T

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
    func onReachEnd(event: ?() -> Unit): T

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
    func onScrollStart(event: ?() -> Unit): T

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
    func onScrollStop(event: ?() -> Unit): T

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
    func flingSpeedLimit(speedLimit: ?Float64): T

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
    func fadingEdge(enabled: Option<Bool>): T

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
    func fadingEdge(enabled: Option<Bool>, options: ?FadingEdgeOptions): T

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
    func clipContent(clip: ?ContentClipMode): T

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
    func clipContent(clip: ?RectShape): T

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
    func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): T

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
    func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): T

    /**
     * Triggered when the Scroll component scrolls.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
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
    func onDidScroll(handler: ?OnScrollCallBack): T
}
