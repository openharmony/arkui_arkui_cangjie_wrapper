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

package ohos.arkui.component.search

import ohos.arkui.component.common.*
import ohos.base.*

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SearchAttribute <: CommonMethod<SearchAttribute> {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func searchButton(value: ?ResourceStr): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderColor(value: ?ResourceColor): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderFont(
        size!: ?Length,
        weight!: ?FontWeight,
        style!: ?FontStyle,
        family!: ?ResourceStr
    ): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textFont(
        size!: ?Length,
        weight!: ?FontWeight,
        style!: ?FontStyle,
        family!: ?ResourceStr
    ): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func copyOption(value: ?CopyOptions): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSubmit(callback: ?(String) -> Unit): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(String) -> Unit): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCopy(callback: ?(String) -> Unit): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCut(callback: ?(String) -> Unit): SearchAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?(String) -> Unit): SearchAttribute
}
