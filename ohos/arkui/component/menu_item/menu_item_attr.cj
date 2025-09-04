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
import ohos.base.*
import ohos.resource.*

sealed interface MenuItemAttribute <: CommonMethod<MenuItemAttribute> {

    func selected(value: Bool): MenuItemAttribute

    func selectIcon(value: Bool): MenuItemAttribute

    func selectIcon(value: ResourceStr): MenuItemAttribute

    func contentFont(
        size!: Length,
        weight!: FontWeight,
        family!: ResourceStr,
        style!: FontStyle
    ): MenuItemAttribute

    func contentFontColor(value: ResourceColor): MenuItemAttribute

    func labelFont(
        size!: Length,
        weight!: FontWeight,
        family!: ResourceStr,
        style!: FontStyle
    ): MenuItemAttribute

    func labelFontColor(value: ResourceColor): MenuItemAttribute

    func onChange(callback: (Bool) -> Unit): MenuItemAttribute
}
