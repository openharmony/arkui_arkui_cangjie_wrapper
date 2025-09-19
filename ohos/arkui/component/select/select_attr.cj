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

package ohos.arkui.component.select

import ohos.arkui.component.common.*
import ohos.base.*

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SelectAttribute <: CommonMethod<SelectAttribute> {

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selected(value: ?Int32): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func value(value: ?ResourceStr): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func font(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?ResourceStr
    ): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedOptionBgColor(value: ?ResourceColor): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedOptionFont(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?String
    ): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedOptionFontColor(value: ?ResourceColor): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionBgColor(value: ?ResourceColor): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionFont(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?ResourceStr
    ): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionFontColor(value: ?ResourceColor): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func space(value: ?Length): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func arrowPosition(value: ?ArrowPosition): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func menuAlign(alignType!: ?MenuAlignType, offset!: ?Offset): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionWidth(value: ?OptionWidthMode): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionWidth(value: ?Length): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionHeight(value: ?Length): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func menuBackgroundColor(value: ?ResourceColor): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func menuBackgroundBlurStyle(value: ?BlurStyle): SelectAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(callback: ?OnSelectCallback): SelectAttribute
}
