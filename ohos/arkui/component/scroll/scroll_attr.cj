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
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines scroll component.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ScrollAttribute <: ScrollableCommonMethod<ScrollAttribute> {
    /**
     * Sets the scrolling direction.
     *
     * @param { ?ScrollDirection } scrollDirection
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollable(scrollDirection: ?ScrollDirection): ScrollAttribute

    /**
     * Triggered before scrolling.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?(Float64, Float64, ScrollState, ScrollSource) -> OffsetResult } handler
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): ScrollAttribute

    /**
     * Triggered before scrolling.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?(Float64, Float64, ScrollState, ScrollSource) -> Unit } handler
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> Unit): ScrollAttribute

    /**
     * Triggered when the Scroll component scrolls.
     * 1. This event is triggered when scrolling is started by the Scroll component or other input settings,such as keyboard and mouse operations;
     * 2. This event is triggered when the controller API is called;
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?ScrollOnScrollCallback } callback
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDidScroll(callback: ?ScrollOnScrollCallback): ScrollAttribute

    /**
     * Triggered when each frame scrolling starts.
     * Anonymous Object Rectification.
     *
     * @param { ?OnScrollFrameBeginCallback } event
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollFrameBegin(event: ?OnScrollFrameBeginCallback): ScrollAttribute

    /**
     * Triggered when scrolling reaches the edge.
     * Anonymous Object Rectification.
     * 1. This event is triggered when scrolling reaches the edge after being started by the Scroll component or other input settings, such as keyboard and mouse operations.
     * 2. This event is triggered when the controller API is called.
     * 3. This event supports the out-of-bounds bounce effect.
     *
     * @param { ?OnScrollEdgeCallback } event
     * @returns { ScrollAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollEdge(event: ?OnScrollEdgeCallback): ScrollAttribute
}
