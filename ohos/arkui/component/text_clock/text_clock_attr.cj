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

package ohos.arkui.component.text_clock

import ohos.arkui.component.common.{CommonMethod, FontStyle, FontWeight, ShadowOptions}
import ohos.labels.APILevel
import ohos.base.{ResourceStr, Length, ResourceColor}

/**
 * Defines TextClock Component.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextClockAttribute <: CommonMethod<TextClockAttribute> {
    /**
     * Provides a date change callback.
     * The callback parameter is Unix Time Stamp,
     * The number of milliseconds that have elapsed since January 1, 1970 (UTC).
     * The minimum callback interval for this event default is seconds when TextClock is not in a form.
     * The minimum callback interval for this event is minutes when TextClock is in a form.
     * If visibility is Hidden the callback be disabled when TextClock is in a form.
     * You can listen to this callback,
     * Use the format attribute method to customize data display in the callback.
     *
     * @param { ?(Int64) -> Unit } callback - Listening date event callback.
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDateChange(callback: ?(Int64) -> Unit): TextClockAttribute

    /**
     * Set display time format, such as "yyyy/mm/dd","yyyy-mm-dd".
     * Supports time format: yyyy,mm,mmm(English month abbreviation),mmmm(Full name of the month in English),
     * dd,ddd(English Week abbreviation),dddd(Full name of the week in English),
     * HH/hh(24-hour clock/12-hour clock),MM/mm(minute),SS/ss(second).
     * The default value is "hh:mm:ss" when TextClock is not in a form.
     * The default value is "hh:mm" when TextClock is in a form.
     * If the value has second or millisecond, the value will be set to the default value.
     *
     * @param { ?ResourceStr } value
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func format(value: ?ResourceStr): TextClockAttribute

    /**
     * Called when the value of TextClock fontSize is set.
     *
     * @param { ?Length } value
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextClockAttribute

    /**
     * Called when the value of TextClock fontColor is set.
     *
     * @param { ?ResourceColor } value
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextClockAttribute

    /**
     * Called when the value of TextClock fontStyle is set.
     *
     * @param { ?FontStyle } value
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextClockAttribute

    /**
     * Called when the value of TextClock fontWeight is set.
     *
     * @param { ?FontWeight } value
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextClockAttribute

    /**
     * Called when the value of TextClock fontFamily is set.
     *
     * @param { ?ResourceStr } value
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextClockAttribute

    /**
     * Called when the text shadow is set.
     *
     * @param { ?Array<ShadowOptions> } value - The shadow options.
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textShadow(values: ?Array<ShadowOptions>): TextClockAttribute

    /**
     * Called when the text shadow is set.
     *
     * @param { ?ShadowOptions } value - The shadow options.
     * @returns { TextClockAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textShadow(value: ?ShadowOptions): TextClockAttribute
}
