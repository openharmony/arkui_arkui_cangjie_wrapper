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

package ohos.arkui.component.button

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines Button attributes.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ButtonAttribute <: CommonMethod<ButtonAttribute> {
    /**
     * Text size.
     *
     * @params { ?Length } value
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): ButtonAttribute

    /**
     * Font weight.
     *
     * @params { ?FontWeight } value
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): ButtonAttribute

    /**
     * Text color.
     *
     * @params { ?ResourceColor } value
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(color: ?ResourceColor): ButtonAttribute

    /**
     * Font style.
     *
     * @params { ?FontStyle } value
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): ButtonAttribute

    /**
     * Font family.
     *
     * @params { ?ResourceStr } value
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): ButtonAttribute

    /**
     * Describes the button style.
     *
     * @params { ?ButtonType } value
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func shape(value: ?ButtonType): ButtonAttribute

    /**
     * Indicates whether to enable the switchover effect when the button is pressed. When the status is set to false, the switchover effect is disabled.
     *
     * @params { ?Bool } value
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func stateEffect(value: ?Bool): ButtonAttribute

    /**
     * Describes the button style.
     *
     * @params { ?ButtonStyleMode } value - button style mode
     * @returns { ButtonAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func buttonStyle(value: ?ButtonStyleMode): ButtonAttribute
}
