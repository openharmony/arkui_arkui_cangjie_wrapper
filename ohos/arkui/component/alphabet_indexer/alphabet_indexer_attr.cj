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

package ohos.arkui.component.alphabet_indexer

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface AlphabetIndexerAttribute <: CommonMethod<AlphabetIndexerAttribute> {

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func color(value: ?ResourceColor): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupColor(value: ?ResourceColor): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedBackgroundColor(value: ?ResourceColor): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupBackground(value: ?ResourceColor): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func usingPopup(value: ?Bool): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func font(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func itemSize(size: ?Length): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignStyle(value: ?IndexerAlign): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selected(index: ?Int32): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupPosition(x!: ?Length, y!: ?Length): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(callback: ?OnAlphabetIndexerSelectCallback): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onRequestPopupData(callback: ?OnAlphabetIndexerRequestPopupDataCallback): AlphabetIndexerAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPopupSelect(callback: ?OnAlphabetIndexerPopupSelectCallback): AlphabetIndexerAttribute
}
