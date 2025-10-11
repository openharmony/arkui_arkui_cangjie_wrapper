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

package ohos.arkui.component.menu

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines the Menu Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface MenuAttribute <: CommonMethod<MenuAttribute> {
    /**
     * Sets the font style.
     * Family and style are not supported currently and will be fixed in future.
     *
     * @param { ?Length } size
     * @param { ?FontWeight } weight
     * @param { ?ResourceStr } family
     * @param { ?FontStyle } style
     * @returns { MenuAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func font(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): MenuAttribute

    /**
     * Sets the Menu font color.
     *
     * @param { ?ResourceColor } value
     * @returns { MenuAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): MenuAttribute

    /**
     * Sets the radius of the corner around the menu.
     * When the radius is less than the menu width, the default border radius is used.
     *
     * @param { ?Length } value
     * @returns { MenuAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(value: ?Length): MenuAttribute

    /**
     * Sets the radius of the corner around the menu.
     * When the radius is less than the menu width, the default border radius is used.
     *
     * @param { ?BorderRadiuses } value
     * @returns { MenuAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(value: ?BorderRadiuses): MenuAttribute

}
