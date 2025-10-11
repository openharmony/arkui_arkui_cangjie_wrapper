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

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines MenuItem Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface MenuItemAttribute <: CommonMethod<MenuItemAttribute> {

    /**
     * Setting whether menuItem is selected.
     *
     * @param { ?Bool } value
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selected(value: ?Bool): MenuItemAttribute

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     *
     * @param { ?Bool } value
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectIcon(value: ?Bool): MenuItemAttribute

    /**
     * Whether the relevant check icon is displayed when a menu item is selected.
     *
     * @param { ?ResourceStr } value
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectIcon(value: ?ResourceStr): MenuItemAttribute

    /**
     * Sets the content font style.
     *
     * @param { ?Length } size
     * @param { ?FontWeight } weight
     * @param { ?ResourceStr } family
     * @param { ?FontStyle } style   
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contentFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): MenuItemAttribute

    /**
     * Sets the font color of content text.
     *
     * @param { ?ResourceColor } value 
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contentFontColor(value: ?ResourceColor): MenuItemAttribute

    /**
     * Sets the label info font style.
     *
     * @param { ?Length } size
     * @param { ?FontWeight } weight
     * @param { ?ResourceStr } family
     * @param { ?FontStyle } style   
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func labelFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): MenuItemAttribute

    /**
     * Sets the font color of label info text.
     *
     * @param { ?ResourceColor } value
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func labelFontColor(value: ?ResourceColor): MenuItemAttribute

    /**
     * Triggers a callback when a menu item is selected or unchecked.
     *
     * @param { ?(Bool) -> Unit } callback
     * @returns { MenuItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Bool) -> Unit): MenuItemAttribute
}
