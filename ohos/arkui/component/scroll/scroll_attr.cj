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

import ohos.arkui.component.common.{ScrollDirection, ScrollState, ScrollSource}
import ohos.labels.APILevel

/**
 * Defines the Scroll attribute functions.
 * Provides methods for configuring the appearance and behavior of the Scroll component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ScrollAttribute <: ScrollableCommonMethod<ScrollAttribute> {
    /**
     * Sets the scrolling direction.
     *
     * @param { ?ScrollDirection } scrollDirection - The direction to apply setting. The default value is ScrollDirection.Vertical.
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollable(scrollDirection: ?ScrollDirection): ScrollAttribute

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
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): ScrollAttribute

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
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> Unit): ScrollAttribute

    /**
     * Triggered when the Scroll component scrolls.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called;
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?ScrollOnScrollCallback } callback - Callback triggered after scrolling.
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDidScroll(callback: ?ScrollOnScrollCallback): ScrollAttribute

    /**
     * Triggered when each frame scrolling starts.
     *
     * @param { ?OnScrollFrameBeginCallback } event - Callback triggered at first frame of scroll.
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollFrameBegin(event: ?OnScrollFrameBeginCallback): ScrollAttribute

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
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollEdge(event: ?OnScrollEdgeCallback): ScrollAttribute
}
