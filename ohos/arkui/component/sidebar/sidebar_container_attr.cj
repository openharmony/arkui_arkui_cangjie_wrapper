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

sealed interface SideBarContainerAttribute <: CommonMethod<SideBarContainerAttribute> {

    func showSideBar(value: Bool): SideBarContainerAttribute

    func controlButton(value: ButtonStyle): SideBarContainerAttribute

    func showControlButton(value: Bool): SideBarContainerAttribute

    func onChange(callback: (Bool) -> Unit): SideBarContainerAttribute

    func sideBarWidth(value: Length): SideBarContainerAttribute

    func minSideBarWidth(value: Length): SideBarContainerAttribute

    func maxSideBarWidth(value: Length): SideBarContainerAttribute

    func autoHide(value: Bool): SideBarContainerAttribute

    func sideBarPosition(value: SideBarPosition): SideBarContainerAttribute

    func divider(value: ?DividerStyle): SideBarContainerAttribute

    func minContentWidth(value: Length): SideBarContainerAttribute
}
