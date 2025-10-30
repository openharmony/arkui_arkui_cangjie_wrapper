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

package ohos.arkui.component.row

import ohos.arkui.component.common.{CommonMethod, VerticalAlign, FlexAlign}
import ohos.labels.APILevel
import ohos.base.{LengthProp}

/**
 * Provides methods for configuring the appearance and behavior of the Row component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RowAttribute <: CommonMethod<RowAttribute> {
    /**
    * Configures the vertical alignment of child components within the row.
    *
    * @param { ?VerticalAlign } value - Vertical alignment of child components.
    * @returns { RowAttribute } Returns the row attribute.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignItems(value: ?VerticalAlign): RowAttribute

    /**
    * Configures the horizontal alignment of child components within the row.
    *
    * @param { ?FlexAlign } value - Horizontal alignment of child components.
    * @returns { RowAttribute } Returns the row attribute.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func justifyContent(value: ?FlexAlign): RowAttribute

}
