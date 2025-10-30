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

package ohos.arkui.component.sidebar

import ohos.arkui.component.common.{CommonMethod, SideBarPosition}
import ohos.labels.APILevel
import ohos.base.{Length}

/**
 * Defines the SideBarContainer attribute functions.
 * Provides methods for configuring the appearance and behavior of the SideBarContainer component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SideBarContainerAttribute <: CommonMethod<SideBarContainerAttribute> {
    /**
     * Callback showControlButton function when setting the status of sidebar
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showSideBar(value: ?Bool): SideBarContainerAttribute

    /**
     * Callback controlButton function when setting the style of button
     *
     * @param { ?ButtonStyle } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func controlButton(value: ?ButtonStyle): SideBarContainerAttribute

    /**
     * Callback showControlButton function when setting the status of button
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showControlButton(value: ?Bool): SideBarContainerAttribute

    /**
     * Trigger callback when sidebar style of showing change finished.
     *
     * @param { ?(Bool) -> Unit } callback
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Bool) -> Unit): SideBarContainerAttribute

    /**
     * Sets the length of sidebar.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sideBarWidth(value: ?Length): SideBarContainerAttribute

    /**
     * Sets the min length of sidebar.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func minSideBarWidth(value: ?Length): SideBarContainerAttribute

    /**
     * Sets the max length of sidebar.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxSideBarWidth(value: ?Length): SideBarContainerAttribute

    /**
     * Sets whether to automatically hide when drag sidebar width is less than the minimum width.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoHide(value: ?Bool): SideBarContainerAttribute

    /**
     * Called when determining the location of the sidebar.
     *
     * @param { ?SideBarPosition } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sideBarPosition(value: ?SideBarPosition): SideBarContainerAttribute

    /**
     * Set divider style for sideBarContainer
     *
     * @param { ?DividerStyle } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func divider(value: ?DividerStyle): SideBarContainerAttribute

    /**
     * Sets the min length of content.
     * 
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func minContentWidth(value: ?Length): SideBarContainerAttribute
}
