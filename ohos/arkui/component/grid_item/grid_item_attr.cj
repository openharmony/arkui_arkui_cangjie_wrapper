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

package ohos.arkui.component.grid_item

import ohos.arkui.component.common.{CommonMethod}
import ohos.labels.{APILevel, Hide}

/**
 * Defines the GridItem attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface GridItemAttribute <: CommonMethod<GridItemAttribute> {
    /**
     * This parameter specifies the start column number of the current element.
     *
     * @param { ?Int32 } value - The start column index, must be a non-negative integer.
     * @returns { GridItemAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func columnStart(value: ?Int32): GridItemAttribute

    /**
     * This parameter specifies the end column number of the current element.
     *
     * @param { ?Int32 } columnEnd - The end column index, must be a non-negative integer greater than or equal to columnStart.
     * @returns { GridItemAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func columnEnd(value: ?Int32): GridItemAttribute

    /**
     * This parameter specifies the start line number of the current element.
     *
     * @param { ?Int32 } value - Start line number of the element.
     * @returns { GridItemAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rowStart(value: ?Int32): GridItemAttribute

    /**
     * Specifies the end line number of the current element.
     *
     * @param { ?Int32 } value - End line number of the element.
     * @returns { GridItemAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rowEnd(value: ?Int32): GridItemAttribute
}
