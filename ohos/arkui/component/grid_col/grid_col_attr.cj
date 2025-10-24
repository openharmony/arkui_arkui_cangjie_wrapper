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

package ohos.arkui.component.grid_col

import ohos.arkui.component.common.*
import ohos.labels.APILevel

/**
 * Defines the GridCol attribute functions.
 * This interface provides the attribute methods for the GridCol component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface GridColAttribute <: CommonMethod<GridColAttribute> {
    /**
     * Sets the span of current grid-container item.
     * Defines how many columns the grid item should span.
     *
     * @param { ?Int32 } value - The span value to set. This determines how many columns the grid item will occupy.
     * @returns { GridColAttribute } - Returns the attribute of GridCol.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func span(value: ?Int32): GridColAttribute

    /**
     * Sets the span of current grid-container item.
     * Defines how many columns the grid item should span on different screen sizes.
     *
     * @param { ?GridColOptions } value - The GridColOptions to set as span. This defines how many columns the grid item will occupy on different screen sizes.
     * @returns { GridColAttribute } - Returns the attribute of GridCol.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func span(value: ?GridColOptions): GridColAttribute

    /**
     * Sets the offset of current grid-container item.
     * Defines how many columns to offset the grid item from its normal position.
     *
     * @param { ?Int32 } value - The offset value to set. This determines how many columns the grid item will be offset from its normal position.
     * @returns { GridColAttribute } - Returns the attribute of GridCol.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func gridColOffset(value: ?Int32): GridColAttribute

    /**
     * Sets the offset of current grid-container item.
     * Defines how many columns to offset the grid item from its normal position on different screen sizes.
     *
     * @param { ?GridColOptions } value - The GridColOptions to set as offset. This defines how many columns the grid item will be offset from its normal position on different screen sizes.
     * @returns { GridColAttribute } - Returns the attribute of GridCol.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func gridColOffset(value: ?GridColOptions): GridColAttribute

    /**
     * Sets the order of current grid-container item.
     * Defines the display order of the grid item in the grid layout.
     *
     * @param { ?Int32 } value - The order value to set. Items with a lower order value are displayed before items with a higher order value.
     * @returns { GridColAttribute } - Returns the attribute of GridCol.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func order(value: ?Int32): GridColAttribute

    /**
     * Sets the order of current grid-container item.
     * Defines the display order of the grid item in the grid layout on different screen sizes.
     *
     * @param { ?GridColOptions } value - The GridColOptions to set as order. This defines the display order of the grid item on different screen sizes.
     * @returns { GridColAttribute } - Returns the attribute of GridCol.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func order(value: ?GridColOptions): GridColAttribute
}
