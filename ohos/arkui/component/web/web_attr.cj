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

package ohos.arkui.component.web

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*
import ohos.web.webview.*

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface WebAttribute <: CommonMethod<WebAttribute> {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fileAccess(fileAccess: ?Bool): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func domStorageAccess(domStorageAccess: ?Bool): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func imageAccess(imageAccess: ?Bool): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onlineImageAccess(onlineImageAccess: ?Bool): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func mixedMode(mixedMode: ?MixedMode): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func zoomAccess(zoomAccess: ?Bool): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func geolocationAccess(geolocationAccess: ?Bool): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func verticalScrollBarAccess(verticalScrollBar: ?Bool): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func nestedScroll(
        scrollForward!: ?NestedScrollMode,
        scrollBackward!: ?NestedScrollMode
    ): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onLoadIntercept(callback: ?Callback<OnLoadInterceptEvent, Bool>): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPageBegin(callback: ?Callback<OnPageBeginEvent, Unit>): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPageEnd(callback: ?Callback<OnPageEndEvent, Unit>): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func javaScriptProxy(funcList!: ?Array<(String) -> String>, name!: ?String, methodList!: ?Array<String>,
        controller!: ?WebviewController): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func darkMode(mode: ?WebDarkMode): WebAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func forceDarkAccess(access: ?Bool): WebAttribute
}
