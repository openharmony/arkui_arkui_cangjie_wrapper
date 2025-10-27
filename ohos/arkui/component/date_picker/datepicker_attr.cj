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

package ohos.arkui.component.date_picker

import ohos.arkui.component.common.*
import ohos.arkui.component.text_clock.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*
import std.time.*

/**
 * Defines DatePicker attributes.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface DatePickerAttribute <: CommonMethod<DatePickerAttribute> {
    /**
     * Sets whether to display the lunar calendar alongside the Gregorian calendar.
     *
     * @param { ?Bool } value - Whether to display the lunar calendar. true means display lunar calendar, false means not display.
     * @default false
     * @returns { DatePickerAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lunar(value: ?Bool): DatePickerAttribute

    /**
     * Triggered when a date is selected.
     *
     * @param { ?Callback<DateTime, Unit> } callback - The callback function to invoke when the date changes.
     * @returns { DatePickerAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDateChange(callback: ?Callback<DateTime, Unit>): DatePickerAttribute

    /**
     * Sets the text style for the items at the top and bottom of the visible area.
     *
     * @param { ?PickerTextStyle } value - Font color, font size, and font weight of the top and bottom items.
     * @returns { DatePickerAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disappearTextStyle(value: ?PickerTextStyle): DatePickerAttribute

    /**
     * Sets the text style for all items except the top, bottom, and selected items.
     *
     * @param { ?PickerTextStyle } value - Font color, font size, and font weight of all items except the top,
     *   <br>bottom, and selected items.
     * @returns { DatePickerAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textStyle(value: ?PickerTextStyle): DatePickerAttribute

    /**
     * Sets the text style for the currently selected item.
     *
     * @param { ?PickerTextStyle } value - The text style for the selected item.
     * @returns { DatePickerAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedTextStyle(value: ?PickerTextStyle): DatePickerAttribute
}
