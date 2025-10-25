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

package ohos.arkui.component.text_picker

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines the TextPicker attribute functions.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextPickerAttribute <: CommonMethod<TextPickerAttribute> {
    /**
     * Sets the height of each item in the picker.
     *
     * @param { ?Length } value - Height of each item in the picker. The default value are 56.vp (selected) and 36.vp (unselected).
     * <br>For the number type, the value range is [0, +∞).
     * <br>For the string type, only numeric string values, for example, "56", are supported.
     * @default 56.vp
     * @returns { TextPickerAttribute } Returns the text picker attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func defaultPickerItemHeight(value: ?Length): TextPickerAttribute

    /**
     * Sets whether scrolling is loopable.
     *
     * @param { ?Bool } value - Whether scrolling is loopable. true: loopable; false: not loopable.
     * @default true
     * @returns { TextPickerAttribute } Returns the text picker attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func canLoop(value: ?Bool): TextPickerAttribute

    /**
     * Triggered when an item in the picker is selected.
     * When the picker contains text only or both text and imagery,
     * value indicates the text of the selected item.
     * When the picker contains imagery only, value is empty.
     *
     * @param { ?OnTextPickerChangeCallback } callback - The callback of onChange.
     * @returns { TextPickerAttribute } Returns the text picker attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?OnTextPickerChangeCallback): TextPickerAttribute
}
