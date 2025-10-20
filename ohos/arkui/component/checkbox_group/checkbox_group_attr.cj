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

package ohos.arkui.component.checkbox_group

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines CheckboxGroup attributes.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface CheckboxGroupAttribute <: CommonMethod<CheckboxGroupAttribute> {
    /**
     * setting whether all checkbox is selected.
     *
     * @param { ?Bool } isAllSelected
     * @returns { CheckboxGroupAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectAll(value: ?Bool): CheckboxGroupAttribute

    /**
     * setting the display color of checkbox.
     *
     * @param { ?ResourceColor } value
     * @returns { CheckboxGroupAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): CheckboxGroupAttribute

    /**
     * Called when the selection status changes.
     * Anonymous Object Rectification.
     *
     * @param { ?OnCheckboxGroupChangeCallback } callback
     * @returns { CheckboxGroupAttribute }
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?OnCheckboxGroupChangeCallback): CheckboxGroupAttribute
}
