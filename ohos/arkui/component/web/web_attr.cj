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
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*
import ohos.web.webview.*

/**
 * Defines Web Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface WebAttribute <: CommonMethod<WebAttribute> {
    /**
    * Sets whether to enable access to the file system in the application.
    *
    * @param { ?Bool } fileAccess
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fileAccess(fileAccess: ?Bool): WebAttribute

    /**
    * Sets whether to enable the DOM Storage API. By default, this feature is disabled.
    *
    * @param { ?Bool } domStorageAccess
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func domStorageAccess(domStorageAccess: ?Bool): WebAttribute

    /**
    * Sets whether to enable automatic image loading.
    *
    * @param { ?Bool } imageAccess
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func imageAccess(imageAccess: ?Bool): WebAttribute

    /**
    * Sets whether to enable access to online images through HTTP and HTTPS.
    *
    * @param { ?Bool } onlineImageAccess
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onlineImageAccess(onlineImageAccess: ?Bool): WebAttribute

    /**
    *  Sets the behavior when a secure origin attempts to load a resource from an insecure origin.
    *  The default is MixedMode.None, meaning not allow a secure origin to load content from an insecure origin.
    *
    * @param { ?MixedMode } mixedMode
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func mixedMode(mixedMode: ?MixedMode): WebAttribute

    /**
    * Sets whether the Web supports zooming using gestures.
    *
    * @param { ?Bool } zoomAccess
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func zoomAccess(zoomAccess: ?Bool): WebAttribute

    /**
    * Set whether to enable geolocation access. By default, this feature is enabled.
    * For details, see Managing Location Permissions.
    *
    * @param { ?Bool } geolocationAccess
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func geolocationAccess(geolocationAccess: ?Bool): WebAttribute

    /**
    * Set whether paint vertical scroll bar, including the system default scrollbar and user-defined scrollbar.
    *
    * @param { ?Bool } verticalScrollBar
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func verticalScrollBarAccess(verticalScrollBar: ?Bool): WebAttribute

    /**
    * Called to setting the nested scroll options.
    *
    * @param { ?NestedScrollMode } scrollForward scrollBackward
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func nestedScroll(
        scrollForward!: ?NestedScrollMode,
        scrollBackward!: ?NestedScrollMode
    ): WebAttribute

    /**
    * Triggered when the resources loading is intercepted.
    *
    * @param { ?Callback<OnLoadInterceptEvent, Bool> } callback
    * @returns { WebAttribute }
    * @throws { BusinessException } 190002 - The callback function is invalid.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onLoadIntercept(callback: ?Callback<OnLoadInterceptEvent, Bool>): WebAttribute

    /**
    * Called when the web page starts to be loaded.
    *
    * @param { ?Callback<OnPageBeginEvent, Unit> } callback
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPageBegin(callback: ?Callback<OnPageBeginEvent, Unit>): WebAttribute

    /**
    * Triggered at the end of web page loading.
    *
    * @param { ?Callback<OnPageEndEvent, Unit> } callback
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPageEnd(callback: ?Callback<OnPageEndEvent, Unit>): WebAttribute

    /**
    * Registers the supplied ArkTS object in javaScriptProxy into this Web component.
    *
    * @param { ?Array<(String) -> String> } funcList
    * @param { ?String } name
    * @param { ?Array<String> } methodList
    * @param { ?WebviewController } controller
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func javaScriptProxy(funcList!: ?Array<(String) -> String>, name!: ?String, methodList!: ?Array<String>,
        controller!: ?WebviewController): WebAttribute

    /**
    * Sets the web dark mode. By default, web dark mode is disabled. When it is enabled,
    * the Web component enables the dark theme defined for web pages
    * if the theme has been defined in prefers-color-scheme of a media query,
    * and remains unchanged otherwise. To enable the forcible dark mode, use this API with forceDarkAccess.
    *
    * @param { ?WebDarkMode } mode
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func darkMode(mode: ?WebDarkMode): WebAttribute

    /**
    * Sets whether to enable forcible dark mode for the web page.
    * This API is applicable only when dark mode is enabled in {@link darkMode}.
    *
    * @param { ?Bool } access
    * @returns { WebAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func forceDarkAccess(access: ?Bool): WebAttribute
}
