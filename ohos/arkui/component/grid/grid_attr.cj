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

package ohos.arkui.component.grid

import ohos.labels.APILevel
import ohos.base.{Length}
import ohos.arkui.component.scroll.{ScrollableCommonMethod}

/**
 * Defines Grid attributes.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface GridAttribute <: ScrollableCommonMethod<GridAttribute> {
    /**
     * This parameter specifies the number of columns in the current grid layout.
     *
     * @param { ?String } value - String specifying the number of columns and their proportional distribution.
     * @returns { GridAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func columnsTemplate(value: ?String): GridAttribute

    /**
     * Lets you set the number of rows in the current grid layout.
     *
     * @param { ?String } value - String specifying the number of rows and their proportional distribution.
     * @returns { GridAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rowsTemplate(value: ?String): GridAttribute

    /**
     * Allows you to set the spacing between columns.
     *
     * @param { ?Length } value - Spacing between adjacent columns.
     * @returns { GridAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func columnsGap(value: ?Length): GridAttribute

    /**
     * Lets you set the spacing between rows.
     *
     * @param { ?Length } value - Spacing between adjacent rows.
     * @returns { GridAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rowsGap(value: ?Length): GridAttribute

    /**
     * Sets the number of grid items to be preloaded and cached for performance optimization.
     *
     * @param { ?Int32 } count - Number of grid items to preload beyond the visible area.
     * @returns { GridAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func cachedCount(count: ?Int32): GridAttribute

    /**
     * Called to set number of GridItems to be preloaded (cached) in LazyForEach / Repeat.
     *
     * @param { ?Int32 } count - Number of grid items to preload beyond the visible area.
     * @param { ?Bool } show - Whether to display cached items when clip is disabled.
     * @returns { GridAttribute } - The attribute of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func cachedCount(count: ?Int32, show: ?Bool): GridAttribute
}
