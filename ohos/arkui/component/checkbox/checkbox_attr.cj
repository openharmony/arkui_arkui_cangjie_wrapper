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

package ohos.arkui.component.checkbox

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Checkbox attributes.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface CheckboxAttribute <: CommonMethod<CheckboxAttribute> {
    /**
     * setting whether checkbox is selected.
     *
     * @param { ?Bool } value
     * @returns { CheckboxAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func select(value: ?Bool): CheckboxAttribute

    /**
     * setting the display color of checkbox.
     *
     * @param { ?ResourceColor } value
     * @returns { CheckboxAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): CheckboxAttribute

    /**
     * Called when the selection status changes.
     * Anonymous Object Rectification.
     *
     * @param { ?OnCheckboxChangeCallback } callback
     * @returns { CheckboxAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?OnCheckboxChangeCallback): CheckboxAttribute

    /**
     * setting the shape of checkbox.
     *
     * @param { ?CheckBoxShape } value - The configuration of checkbox shape.
     * @returns { CheckboxAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func shape(value: ?CheckBoxShape): CheckboxAttribute
}
