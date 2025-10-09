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
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*
import ohos.arkui.shape.*

/**
 * Provides functions for scroll able Base.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface ScrollableCommonMethod<T> <: CommonMethod<T> {
    /**
     * Sets the scrollbar state.
     *
     * @params { ?BarState } barState
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollBar(barState: ?BarState): T

    /**
     * Sets the scrollbar color.
     *
     * @params { ?ResourceColor } color
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollBarColor(color: ?ResourceColor): T

    /**
     * Sets the scrollbar width.
     *
     * @params { ?Length } value
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollBarWidth(value: ?Length): T

    /**
     * Sets the nested scrolling options. You can set the nested scrolling mode in the forward and backward directions
     * to implement scrolling linkage with the parent component.
     *
     * @params { ?NestedScrollOptions } value
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func nestedScroll(value: ?NestedScrollOptions): T

    /**
     * Sets whether to support scroll gestures. When this attribute is set to <em>false</em>,
     * scrolling by finger or mouse is not supported, but the scroll controller API is not affected.
     *
     * @params { ?Bool } value
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enableScrollInteraction(value: ?Bool): T

    /**
     * Sets the friction coefficient. It applies only to gestures in the scrolling area, and
     * it affects only indirectly the scroll chaining during the inertial scrolling process.
     * If this attribute is set to a value less than or equal to 0, the default value is used.
     *
     * @params { ?Float64 } value
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func friction(value: ?Float64): T

    /**
     * Sets the friction coefficient. It applies only to gestures in the scrolling area, and
     * it affects only indirectly the scroll chaining during the inertial scrolling process.
     * If this attribute is set to a value less than or equal to 0, the default value is used.
     *
     * @params { ?AppResource } value
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func friction(value: ?AppResource): T

    /**
     * Sets the reach start.
     *
     * @params { ?() -> Unit } event
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onReachStart(event: ?() -> Unit): T

    /**
     * Sets the reach end.
     *
     * @params { ?() -> Unit } event
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onReachEnd(event: ?() -> Unit): T

    /**
     * Called when scrolling start.
     * Anonymous Object Rectification.
     *
     * @params { ?() -> Unit } event
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollStart(event: ?() -> Unit): T

    /**
     * Called when scrolling has stopped.
     * Anonymous Object Rectification.
     *
     * @params { ?() -> Unit } event
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollStop(event: ?() -> Unit): T

    /**
     * Fling Speed Limit.
     *
     * @params { ?Float64 } speedLimit
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flingSpeedLimit(speedLimit: ?Float64): T

    /**
     * The options of fading Edge.
     *
     * @params { Option<Bool> } enabled
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fadingEdge(enabled: Option<Bool>): T

    /**
     * The options of fading Edge.
     *
     * @params { Option<Bool> } enabled
     * @params { ?FadingEdgeOptions } options
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fadingEdge(enabled: Option<Bool>, options: ?FadingEdgeOptions): T

    /**
     * The clip mode of content.
     *
     * @params { ?ContentClipMode } clip
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clipContent(clip: ?ContentClipMode): T

    /**
     * The clip mode of content.
     *
     * @params { ?RectShape } clip
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clipContent(clip: ?RectShape): T

    /**
     * Triggered before scrolling.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @params { Option<(Float64, ScrollState, ScrollSource) -> ScrollResult> } handler
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): T

    /**
     * Triggered before scrolling.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @params { Option<(Float64, ScrollState, ScrollSource) -> Unit> } handler
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): T

    /**
     * Triggered when the Scroll component scrolls.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called;
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @params { ?OnScrollCallBack } handler
     * @returns { T}
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDidScroll(handler: ?OnScrollCallBack): T
}
