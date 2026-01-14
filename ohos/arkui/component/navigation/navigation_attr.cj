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

package ohos.arkui.component.navigation

import ohos.arkui.component.common.{CommonMethod, CustomBuilder}
import ohos.labels.{APILevel}
import ohos.base.{ResourceStr, Callback}

/**
 * Defines the Navigation attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface NavigationAttribute <: CommonMethod<NavigationAttribute> {
    /**
     * Set builder for user-defined NavDestination component.
     *
     * @param { ?(String, Any) -> Unit } builder - The builder function of NavDestination component.
     * @returns { NavigationAttribute } Returns the instance of the Navigation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func navDestination(builder: ?(String, Any) -> Unit): NavigationAttribute

    /**
     * Navigation title
     *
     * @param { ?ResourceStr } value - Navigation title.
     * @param { ?NavigationTitleOptions } options - Indicates the options of titlebar.
     * @returns { NavigationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func title(value: ?ResourceStr, options!: ?NavigationTitleOptions): NavigationAttribute

    /**
     * Navigation title
     *
     * @param { ?CustomBuilder } value - Navigation title.
     * @param { ?NavigationTitleOptions } options - Indicates the options of titlebar.
     * @returns { NavigationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func title(value: ?CustomBuilder, options!: ?NavigationTitleOptions): NavigationAttribute

    /**
     * Sets whether to hide the title bar and whether to animate the visibility change.
     *
     * @param { ?Bool } hide - Whether to hide the title bar.
     * <br>Default value is **false**. **true**: Hide the title bar. **false**: Show the title bar.
     * @param { ?Bool } animated - Whether to animate the visibility change.
     * <br>Default value is **false**.
     * <br>**true**: Animate the visibility change. **false**: Do not animate the visibility change.
     * @returns { NavigationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func hideTitleBar(hide: ?Bool, animated!: ?Bool): NavigationAttribute
}

/**
 * Defines the NavDestination attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface NavDestinationAttribute <: CommonMethod<NavDestinationAttribute> {
    /**
     * Called when the navigation destination is about
     * to be unmounted (or when the transition animation, if any, is about to start).
     *
     * @param { ?() -> Bool } callback - Indicates callback when the backButton is pressed.
     * @returns { NavDestinationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onBackPressed(callback: ?() -> Bool): NavDestinationAttribute

    /**
     * Invoked before sub-components of NavDestination are created.
     *
     * @param { ?Callback<NavDestinationContext, Unit> } callback
     * - Indicates callback that invoked before sub-components of NavDestination are created.
     * @returns { NavDestinationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onReady(callback: ?Callback<NavDestinationContext, Unit>): NavDestinationAttribute

    /**
     * Sets the page title. When the NavigationCustomTitle type is used to set the height,
     * the titleMode attribute does not take effect.
     * When the title string is too long: (1) If no subtitle is set, the string is scaled down,
     * wrapped in two lines, and then clipped with an ellipsis (...); (2) If a subtitle is set,
     * the subtitle is scaled down and then clipped with an ellipsis (...).
     *
     * @param { ?ResourceStr } value - Defines the title.
     * @param { ?NavigationTitleOptions } [options] - Indicates the options of titlebar.
     * @returns { NavDestinationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func title(value: ?ResourceStr, options!: ?NavigationTitleOptions): NavDestinationAttribute

    /**
     * Sets the page title. When the NavigationCustomTitle type is used to set the height,
     * the titleMode attribute does not take effect.
     * When the title string is too long: (1) If no subtitle is set, the string is scaled down,
     * wrapped in two lines, and then clipped with an ellipsis (...); (2) If a subtitle is set,
     * the subtitle is scaled down and then clipped with an ellipsis (...).
     *
     * @param { ?CustomBuilder } value - Defines the title.
     * @param { ?NavigationTitleOptions } options - Indicates the options of titlebar.
     * @returns { NavDestinationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func title(value: ?CustomBuilder, options!: ?NavigationTitleOptions): NavDestinationAttribute

    /**
     * Specifies whether to hide the title bar.
     *
     * @param { ?Bool } value - Indicates whether to hide the title bar.
     * @returns { NavDestinationAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func hideTitleBar(value: ?Bool): NavDestinationAttribute
}
