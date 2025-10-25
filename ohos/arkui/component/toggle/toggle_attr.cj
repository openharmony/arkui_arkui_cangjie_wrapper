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

package ohos.arkui.component.toggle

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines the Toggle attribute functions.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ToggleAttribute <: CommonMethod<ToggleAttribute> {
    /**
     * Set the color of the selected button.
     *
     * @param { ?ResourceColor } value - Color of the selected button.
     * @returns { ToggleAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): ToggleAttribute

    /**
     * Set the color of the switch point.
     *
     * @param { ?ResourceColor } color - Color of the switch point.
     * @returns { ToggleAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func switchPointColor(color: ?ResourceColor): ToggleAttribute

    /**
     * Called when the selected state of the component changes.
     *
     * @param { ?(Bool) -> Unit } callback - Callback function triggered when the selected state changes.
     * @returns { ToggleAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Bool) -> Unit): ToggleAttribute
}
