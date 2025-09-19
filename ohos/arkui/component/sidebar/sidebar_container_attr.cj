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

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SideBarContainerAttribute <: CommonMethod<SideBarContainerAttribute> {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showSideBar(value: ?Bool): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func controlButton(value: ?ButtonStyle): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showControlButton(value: ?Bool): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Bool) -> Unit): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sideBarWidth(value: ?Length): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func minSideBarWidth(value: ?Length): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxSideBarWidth(value: ?Length): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoHide(value: ?Bool): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sideBarPosition(value: ?SideBarPosition): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func divider(value: ?DividerStyle): SideBarContainerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func minContentWidth(value: ?Length): SideBarContainerAttribute
}
