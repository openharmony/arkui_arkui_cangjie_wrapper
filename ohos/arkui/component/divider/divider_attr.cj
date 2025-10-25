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

package ohos.arkui.component.divider

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Divider attributes.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface DividerAttribute <: CommonMethod<DividerAttribute> {
    /**
     * Indicates whether to use a horizontal splitter or a vertical splitter.
     * The options are as follows: false: horizontal splitter; true: vertical splitter.
     *
     * @param { ?Bool } value - Whether to use a vertical divider.
     * @default false
     * @returns { DividerAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func vertical(value: ?Bool): DividerAttribute

    /**
     * Sets the color of the divider line.
     *
     * @param { ?ResourceColor } value - The color of the divider line.
     * @returns { DividerAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func color(value: ?ResourceColor): DividerAttribute

    /**
     * Sets the width of the dividing line.
     *
     * @param { ?Length } value - The width of the dividing line.
     * @returns { DividerAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeWidth(value: ?Length): DividerAttribute

    /**
     * Sets the end style of the split line.
     *
     * @param { ?LineCapStyle } value - The end style of the split line.
     * @default LineCapStyle.Butt
     * @returns { DividerAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func lineCap(value: ?LineCapStyle): DividerAttribute
}
