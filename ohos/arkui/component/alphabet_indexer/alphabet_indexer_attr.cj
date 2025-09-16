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
import ohos.base.*
import ohos.resource.*

sealed interface AlphabetIndexerAttribute <: CommonMethod<AlphabetIndexerAttribute> {

    func color(value: ?ResourceColor): AlphabetIndexerAttribute

    func selectedColor(value: ?ResourceColor): AlphabetIndexerAttribute

    func popupColor(value: ?ResourceColor): AlphabetIndexerAttribute

    func selectedBackgroundColor(value: ?ResourceColor): AlphabetIndexerAttribute

    func popupBackground(value: ?ResourceColor): AlphabetIndexerAttribute

    func usingPopup(value: ?Bool): AlphabetIndexerAttribute

    func selectedFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute

    func popupFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute

    func font(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute

    func itemSize(size: ?Length): AlphabetIndexerAttribute

    func alignStyle(value: ?IndexerAlign): AlphabetIndexerAttribute

    func selected(index: ?Int32): AlphabetIndexerAttribute

    func popupPosition(x!: ?Length, y!: ?Length): AlphabetIndexerAttribute

    func onSelect(callback: ?OnAlphabetIndexerSelectCallback): AlphabetIndexerAttribute

    func onRequestPopupData(callback: ?OnAlphabetIndexerRequestPopupDataCallback): AlphabetIndexerAttribute

    func onPopupSelect(callback: ?OnAlphabetIndexerPopupSelectCallback): AlphabetIndexerAttribute
}
