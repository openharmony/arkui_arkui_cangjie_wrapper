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

sealed interface WebAttribute <: CommonMethod<WebAttribute> {

    func fileAccess(fileAccess: ?Bool): WebAttribute

    func domStorageAccess(domStorageAccess: ?Bool): WebAttribute

    func imageAccess(imageAccess: ?Bool): WebAttribute

    func onlineImageAccess(onlineImageAccess: ?Bool): WebAttribute

    func mixedMode(mixedMode: ?MixedMode): WebAttribute

    func zoomAccess(zoomAccess: ?Bool): WebAttribute

    func geolocationAccess(geolocationAccess: ?Bool): WebAttribute

    func verticalScrollBarAccess(verticalScrollBar: ?Bool): WebAttribute

    func nestedScroll(
        scrollForward!: ?NestedScrollMode,
        scrollBackward!: ?NestedScrollMode
    ): WebAttribute

    func onLoadIntercept(callback: ?Callback<OnLoadInterceptEvent, Bool>): WebAttribute

    func onPageBegin(callback: ?Callback<OnPageBeginEvent, Unit>): WebAttribute

    func onPageEnd(callback: ?Callback<OnPageEndEvent, Unit>): WebAttribute

    func javaScriptProxy(funcList!: ?Array<(String) -> String>, name!: ?String, methodList!: ?Array<String>,
        controller!: ?WebviewController): WebAttribute

    func darkMode(mode: ?WebDarkMode): WebAttribute

    func forceDarkAccess(access: ?Bool): WebAttribute
}
