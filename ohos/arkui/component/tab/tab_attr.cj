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

package ohos.arkui.component.tab

import ohos.arkui.component.common.{CommonMethod, BarMode, CustomBuilder}
import ohos.labels.APILevel
import ohos.base.{Length, Callback, ResourceStr}

/**
 * Defines the Tabs attribute functions.
 * Provides methods for configuring the appearance and behavior of the Tabs component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TabsAttribute <: CommonMethod<TabsAttribute> {
    /**
     * Called when the width of the bar graph is set.
     * Configures the width of the tab bar.
     *
     * @param { ?Length } value - Width of the tab bar. If the set value is less than 0
     * or greater than the width of the Tabs component, the default value is used.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func barWidth(value: ?Length): TabsAttribute

    /**
     * Called when the height of the bar graph is set.
     * Configures the height of the tab bar.
     *
     * @param { ?Length } value - Height of the tab bar. If the set value is less than 0 or
     * greater than the height of the Tabs component, the default value is used.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func barHeight(value: ?Length): TabsAttribute

    /**
     * Sets whether to use vertical tabs.
     * Configures the orientation of the tabs.
     *
     * @param { ?Bool } value - Whether to use vertical tabs. The default value is false.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func vertical(value: ?Bool): TabsAttribute

    /**
     * Sets whether the tabs are scrollable.
     * Controls whether the tab bar can be scrolled when there are many tabs.
     *
     * @param { ?Bool } value - Whether the tabs are scrollable. The default value is true.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollable(value: ?Bool): TabsAttribute

    /**
     * Sets the tab bar layout mode to BarMode.Fixed.
     * Configures the layout mode of the tab bar.
     *
     * @param { ?BarMode } value - The width of each tab is determined by equally dividing
     * the number of tabs by the bar width (or bar height in the vertical layout).
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func barMode(value: ?BarMode): TabsAttribute

    /**
     * Sets the length of time required to complete the tab switching animation,
     * which is initiated by clicking a specific tab or by calling the changeIndex API of TabsController.
     * Configures the duration of the tab switching animation.
     *
     * @param { ?Float32 } value - Animation duration in seconds.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationDuration(value: ?Float32): TabsAttribute

    /**
     * Triggered when a tab is switched.
     *
     * <p><strong>NOTE</strong>:
     * <br>This event is triggered when any of the following conditions is met:
     * 1. The swiping animation is completed, followed by tab switching.
     * 2. The Controller API is called.
     * 3. The attribute value is updated using a state variable.
     * 4. A tab is clicked.
     * </p>
     *
     * @param { ?Callback<Int32, Unit> } event - Callback function triggered when tab changes.
     * The parameter is the index of the selected tab.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(event: ?Callback<Int32, Unit>): TabsAttribute
}

/**
 * Defines the TabContent attribute functions.
 * Provides methods for configuring the appearance and behavior of the TabContent component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TabContentAttribute <: CommonMethod<TabContentAttribute> {
    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the content set exceeds the space provided by the tab bar, it will be clipped.
     * </p>
     *
     * @param { ?ResourceStr } content - Content displayed on the tab bar.
     * @returns { TabContentAttribute } Returns the tab content attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabBar(content: ?ResourceStr): TabContentAttribute

    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>The bottom tab style does not include an indicator.
     * <br>When an icon display error occurs, a gray blank block is displayed.
     * </p>
     *
     * @param { ?ResourceStr } icon - TabBar icon.
     * @param { ?ResourceStr } text - TabBar text.
     * @returns { TabContentAttribute } Returns the tab content attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabBar(icon!: ?ResourceStr, text!: ?ResourceStr): TabContentAttribute

    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the content set exceeds the space provided by the tab bar, it will be clipped.
     * </p>
     *
     * @param { ?CustomBuilder } content - Content displayed on the tab bar.
     * @returns { TabContentAttribute } Returns the tab content attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabBar(content: ?CustomBuilder): TabContentAttribute
}
