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

package ohos.arkui.component.refresh

import ohos.arkui.component.common.{CommonMethod, RefreshStatus}
import ohos.labels.APILevel

/**
 * Defines Refresh Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RefreshAttribute <: CommonMethod<RefreshAttribute> {
    /**
     * Called when the refresh state changes.
     *
     * @param { ?(RefreshStatus) -> Unit } callback
     * @returns { RefreshAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onStateChange(callback: ?(RefreshStatus) -> Unit): RefreshAttribute

    /**
     * Called when the refresh state is entered.
     *
     * @param { ?() -> Unit } callback
     * @returns { RefreshAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onRefreshing(callback: ?() -> Unit): RefreshAttribute
}
