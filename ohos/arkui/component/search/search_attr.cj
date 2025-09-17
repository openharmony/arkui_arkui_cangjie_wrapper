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

sealed interface SearchAttribute <: CommonMethod<SearchAttribute> {

    func searchButton(value: ?ResourceStr): SearchAttribute

    func placeholderColor(value: ?ResourceColor): SearchAttribute

    func placeholderFont(
        size!: ?Length,
        weight!: ?FontWeight,
        style!: ?FontStyle,
        family!: ?ResourceStr
    ): SearchAttribute

    func textFont(
        size!: ?Length,
        weight!: ?FontWeight,
        style!: ?FontStyle,
        family!: ?ResourceStr
    ): SearchAttribute

    func copyOption(value: ?CopyOptions): SearchAttribute

    func onSubmit(callback: ?(String) -> Unit): SearchAttribute

    func onChange(callback: ?(String) -> Unit): SearchAttribute

    func onCopy(callback: ?(String) -> Unit): SearchAttribute

    func onCut(callback: ?(String) -> Unit): SearchAttribute

    func onPaste(callback: ?(String) -> Unit): SearchAttribute
}
