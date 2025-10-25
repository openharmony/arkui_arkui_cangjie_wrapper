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

package ohos.arkui.component.column

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines the Column attribute functions.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ColumnAttribute <: CommonMethod<ColumnAttribute> {
    /**
     * Sets the alignment format of the subassembly in the horizontal direction.
     *
     * @param { ?HorizontalAlign } value - The horizontal alignment mode for child elements.
     * @returns { ColumnAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignItems(value: ?HorizontalAlign): ColumnAttribute

    /**
     * Sets the alignment format of the subassembly in the vertical direction.
     *
     * @param { ?FlexAlign } value - The vertical alignment mode for child elements.
     * @returns { ColumnAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func justifyContent(value: ?FlexAlign): ColumnAttribute
}
