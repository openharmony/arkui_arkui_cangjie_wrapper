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

import ohos.arkui.component.common.{WebDarkMode, CommonMethod, MixedMode, NestedScrollMode}
import ohos.labels.{APILevel, Hide}
import ohos.base.{Callback}
import ohos.web.webview.{WebviewController}

/**
 * Defines the Web attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface WebAttribute <: CommonMethod<WebAttribute> {
    /**
     * Sets whether to enable access to the file system in the application.
     *
     * @param { ?Bool } fileAccess - Whether to enable file system access. True to enable, false to disable.
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
     * @param { ?Bool } domStorageAccess - Whether to enable DOM Storage API. True to enable, false to disable.
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
     * @param { ?Bool } imageAccess - Whether to enable automatic image loading. True to enable, false to disable.
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
     * @param { ?Bool } onlineImageAccess - Whether to allow image resources to be loaded from the network. True to enable, false to disable.
     * @returns { WebAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onlineImageAccess(onlineImageAccess: ?Bool): WebAttribute

    /**
     * Sets the behavior when a secure origin attempts to load a resource from an insecure origin.
     * The default is MixedMode.None, meaning not allow a secure origin to load content from an insecure origin.
     *
     * @param { ?MixedMode } mixedMode - The mixed content mode to apply.
     * @default MixedMode.None
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
     * @param { ?Bool } zoomAccess - Whether to enable zoom gestures. True to enable, false to disable.
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
     * @param { ?Bool } geolocationAccess - Whether to enable geolocation access. True to enable, false to disable.
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
     * @param { ?Bool } verticalScrollBar - Whether to display the vertical scroll bar. True to display, false to hide.
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
     * @param { ?NestedScrollMode } scrollForward - Set NestedScrollMode when the scrollable component scrolls forward.
     * @param { ?NestedScrollMode } scrollBackward - Set NestedScrollMode when the scrollable component scrolls backward.
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
     * @param { ?Callback<OnLoadInterceptEvent, Bool> } callback - The triggered callback when the URL loading is intercepted.
     * @returns { WebAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onLoadIntercept(callback: ?Callback<OnLoadInterceptEvent, Bool>): WebAttribute

    /**
     * Called when the web page starts to be loaded.
     *
     * @param { ?Callback<OnPageBeginEvent, Unit> } callback - The triggered function at the begin of web page loading.
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
     * @param { ?Callback<OnPageEndEvent, Unit> } callback - The callback function triggered when page loading completes.
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
     * @param { ?Array<(String) -> String> } funcList - An array of functions to register.
     * @param { ?String } name - The name of the JavaScript object.
     * @param { ?Array<String> } methodList - An array of method names to register.
     * @param { ?WebviewController } controller - The web view controller.
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
     * @param { ?WebDarkMode } mode - The dark mode setting to apply.
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
     * @param { ?Bool } access - Whether to enable forcible dark mode. True to enable, false to disable.
     * @returns { WebAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func forceDarkAccess(access: ?Bool): WebAttribute
}
