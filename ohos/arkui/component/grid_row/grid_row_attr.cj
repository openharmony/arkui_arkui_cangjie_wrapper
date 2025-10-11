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

package ohos.arkui.component.grid_row

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines GridRow attributes.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface GridRowAttribute <: CommonMethod<GridRowAttribute> {
    /**
     * Cross axis alignment of each line in GridRow.
     *
     * @param { ?ItemAlign } value - element alignment
     * @returns { GridRowAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignItems(value: ?ItemAlign): GridRowAttribute

    /**
     * Callback triggered when the breakpoint changes, breakpoints value can be xs, sm, md, lg, xl, xxl.
     *
     * @param { ?(String) -> Unit } callback
     * @returns { GridRowAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onBreakpointChange(callback: ?(String) -> Unit): GridRowAttribute
}
