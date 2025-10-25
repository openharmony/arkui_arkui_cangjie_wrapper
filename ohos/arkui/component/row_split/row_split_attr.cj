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

package ohos.arkui.component.row_split

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Provides methods for configuring the appearance and behavior of the RowSplit component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RowSplitAttribute <: CommonMethod<RowSplitAttribute> {
    /**
    * Controls whether the dividers between child components can be dragged to resize the components.
    *
    * @param { ?Bool } value - Whether enable resizeable.
    * @returns { RowSplitAttribute } Returns the row split attribute.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func resizeable(value: ?Bool): RowSplitAttribute
}
