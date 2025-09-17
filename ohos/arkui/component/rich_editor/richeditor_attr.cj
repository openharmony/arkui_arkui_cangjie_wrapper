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

package ohos.arkui.component.rich_editor

import ohos.arkui.component.common.*
import ohos.base.*

sealed interface RichEditorAttribute <: CommonMethod<RichEditorAttribute> {

    func customKeyboard(value!: ?CustomBuilder): RichEditorAttribute

    func bindSelectionMenu(
        spantype!: ?RichEditorSpanType,
        content!: ?CustomBuilder,
        responseType!: ?ResponseType,
        options!: ?SelectionMenuOptions
    ): RichEditorAttribute

    func copyOptions(value: ?CopyOptions): RichEditorAttribute

    func onReady(callback: ?VoidCallback): RichEditorAttribute

    func aboutToIMEInput(callback: ?Callback<RichEditorInsertValue, Bool>): RichEditorAttribute

    func onIMEInputComplete(callback: ?Callback<RichEditorTextSpanResult, Unit>): RichEditor

    func onDeleteComplete(callback: ?VoidCallback): RichEditorAttribute

    func aboutToDelete(callback: ?Callback<RichEditorDeleteValue, Bool>): RichEditorAttribute

    func onSelect(callback: ?Callback<RichEditorSelection, Unit>): RichEditorAttribute

    func onPaste(callback: ?PasteEventCallback): RichEditorAttribute

    func onDidChange(callback: ?OnDidChangeCallback): RichEditorAttribute
}
