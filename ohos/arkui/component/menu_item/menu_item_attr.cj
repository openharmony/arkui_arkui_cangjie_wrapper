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

package ohos.arkui.component.menu_item

import ohos.arkui.component.common.{CommonMethod, FontWeight, FontStyle}
import ohos.labels.{APILevel, Hide}
import ohos.base.{Length, ResourceColor, ResourceStr}

/**
 * Defines the MenuItem attribute functions.
 * Provides methods for configuring the appearance and behavior of the MenuItem component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface MenuItemAttribute <: CommonMethod<MenuItemAttribute> {

    /**
     * Setting whether menuItem is selected.
     * Configures the selection state of the menu item.
     *
     * @param { ?Bool } value - menuItem is selected.
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selected(value: ?Bool): MenuItemAttribute

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     * Controls the visibility of the check icon when the menu item is selected.
     *
     * @param { ?Bool } value - Indicates whether to display the check icon when selected.
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectIcon(value: ?Bool): MenuItemAttribute

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     *
     * @param { ?ResourceStr } value - Indicates whether to display icon when selected.
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectIcon(value: ?ResourceStr): MenuItemAttribute

    /**
     * Configures the font properties of the menu item content text.
     *
     * @param { ?Length } size - Indicates the font size of content text.
     * @param { ?FontWeight } weight - Indicates the font weight of content text.
     * @param { ?ResourceStr } family - Indicates the font family of content text.
     * @param { ?FontStyle } style - Indicates the font style of content text.
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contentFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): MenuItemAttribute

    /**
     * Configures the font color of the menu item content text.
     *
     * @param { ?ResourceColor } value - Indicates the font color of content text.
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contentFontColor(value: ?ResourceColor): MenuItemAttribute

    /**
     * Sets the label info font style.
     * Configures the font properties of the menu item label text.
     *
     * @param { ?Length } size - Indicates the font size of label info text.
     * @param { ?FontWeight } weight - Indicates the font weight of label info text.
     * @param { ?ResourceStr } family - Indicates the font family of label info text.
     * @param { ?FontStyle } style - Indicates the font style of label info text.
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func labelFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): MenuItemAttribute

    /**
     * Configures the font color of the menu item label text.
     *
     * @param { ?ResourceColor } value - Indicates the font color of label info text.
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func labelFontColor(value: ?ResourceColor): MenuItemAttribute

    /**
     * Triggers a callback when a menu item is selected or unchecked.
     *
     * @param { ?(Bool) -> Unit } callback - Callback when a menu item is selected or unchecked.
     * The parameter indicates whether the menu item is currently selected (true) or not (false).
     * @returns { MenuItemAttribute } Returns the menu item attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Bool) -> Unit): MenuItemAttribute
}
