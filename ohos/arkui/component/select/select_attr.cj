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

sealed interface SelectAttribute <: CommonMethod<SelectAttribute> {

    func selected(value: ?Int32): SelectAttribute

    func value(value: ?ResourceStr): SelectAttribute

    func font(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?ResourceStr
    ): SelectAttribute

    func fontColor(value: ?ResourceColor): SelectAttribute

    func selectedOptionBgColor(value: ?ResourceColor): SelectAttribute

    public func selectedOptionFont(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?String
    ): SelectAttribute

    func selectedOptionFontColor(value: ?ResourceColor): SelectAttribute

    func optionBgColor(value: ?ResourceColor): SelectAttribute

    func optionFont(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?ResourceStr
    ): SelectAttribute

    func optionFontColor(value: ?ResourceColor): SelectAttribute

    func space(value: ?Length): SelectAttribute

    func arrowPosition(value: ?ArrowPosition): SelectAttribute

    func menuAlign(alignType!: ?MenuAlignType, offset!: ?Offset): SelectAttribute

    func optionWidth(value: ?OptionWidthMode): SelectAttribute

    func optionWidth(value: ?Length): SelectAttribute

    func optionHeight(value: ?Length): SelectAttribute

    func menuBackgroundColor(value: ?ResourceColor): SelectAttribute

    func menuBackgroundBlurStyle(value: ?BlurStyle): SelectAttribute

    func onSelect(callback: ?OnSelectCallback): SelectAttribute
}
