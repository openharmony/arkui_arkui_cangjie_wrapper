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
     * Callback showControlButton function when setting the status of sidebar.
     *
     * @param { ?Bool } value - Whether to show the sidebar.
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showSideBar(value: ?Bool): SideBarContainerAttribute

    /**
     * Callback controlButton function when setting the style of button.
     *
     * @param { ?ButtonStyle } value - The button style.
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func controlButton(value: ?ButtonStyle): SideBarContainerAttribute

    /**
     * Callback showControlButton function when setting the status of button.
     *
     * @param { ?Bool } value - Whether to show the control button.
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showControlButton(value: ?Bool): SideBarContainerAttribute

    /**
     * Trigger callback when sidebar style of showing change finished.
     * Called when the sidebar show/hide animation completes.
     *
     * @param { ?(Bool) -> Unit } callback - Trigger callback when sidebar style of showing change finished.
     * The parameter indicates whether the sidebar is currently shown (true) or hidden (false).
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Bool) -> Unit): SideBarContainerAttribute

    /**
     * Configures the width of the sidebar when it is shown.
     *
     * @param { ?Length } value - The width of the sidebar.
     * @default 240.vp
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sideBarWidth(value: ?Length): SideBarContainerAttribute

    /**
     * Configures the minimum width the sidebar can be resized to.
     *
     * @param { ?Length } value - The minimum width of the sidebar.
     * @default 200.vp
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func minSideBarWidth(value: ?Length): SideBarContainerAttribute

    /**
     * Configures the maximum width the sidebar can be resized to.
     *
     * @param { ?Length } value - The maximum width of the sidebar.
     * @default 280.vp
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxSideBarWidth(value: ?Length): SideBarContainerAttribute

    /**
     * Sets whether to automatically hide when drag sidebar width is less than the minimum width.
     * Controls whether the sidebar automatically collapses when resized below its minimum width.
     *
     * @param { ?Bool } value - Whether to automatically hide.
     * @default true
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoHide(value: ?Bool): SideBarContainerAttribute

    /**
     * Configures which edge of the container the sidebar appears on.
     *
     * @param { ?SideBarPosition } value - The position of the sidebar.
     * @default SideBarPosition.Start
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sideBarPosition(value: ?SideBarPosition): SideBarContainerAttribute

    /**
     * Configures the appearance of the divider between the sidebar and main content.
     *
     * @param { ?DividerStyle } value - Indicates the style of the divider or whether to show the divider.
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func divider(value: ?DividerStyle): SideBarContainerAttribute

    /**
     * Configures the minimum width of the main content area.
     *
     * @param { ?Length } value - Min length of content.
     * @default 360.vp
     * @returns { SideBarContainerAttribute } Returns the sidebar container attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func minContentWidth(value: ?Length): SideBarContainerAttribute
}
