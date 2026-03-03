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

package ohos.arkui.component.rich_text

import ohos.arkui.component.common.{CommonMethod}
import ohos.labels.{APILevel}

/**
 * Defines the RichText attribute functions.
 * Provides methods for configuring the behavior of the RichText component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RichTextAttribute <: CommonMethod<RichTextAttribute> {
    /**
     * Called when the rich text content begins loading.
     *
     * @param { ?() -> Unit } callback - Callback function when loading starts.
     * @returns { RichTextAttribute } Returns the rich text attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onStart(callback: ?() -> Unit): RichTextAttribute

    /**
     * Called when the rich text content finishes loading, either successfully or with an error.
     *
     * @param { ?() -> Unit } callback - Callback function when loading completes.
     * @returns { RichTextAttribute } Returns the rich text attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onComplete(callback: ?() -> Unit): RichTextAttribute
}
