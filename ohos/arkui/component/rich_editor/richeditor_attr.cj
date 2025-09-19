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
import ohos.labels.APILevel
import ohos.base.*

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RichEditorAttribute <: CommonMethod<RichEditorAttribute> {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func customKeyboard(value!: ?CustomBuilder): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindSelectionMenu(
        spantype!: ?RichEditorSpanType,
        content!: ?CustomBuilder,
        responseType!: ?ResponseType,
        options!: ?SelectionMenuOptions
    ): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func copyOptions(value: ?CopyOptions): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onReady(callback: ?VoidCallback): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aboutToIMEInput(callback: ?Callback<RichEditorInsertValue, Bool>): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onIMEInputComplete(callback: ?Callback<RichEditorTextSpanResult, Unit>): RichEditor

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDeleteComplete(callback: ?VoidCallback): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aboutToDelete(callback: ?Callback<RichEditorDeleteValue, Bool>): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(callback: ?Callback<RichEditorSelection, Unit>): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?PasteEventCallback): RichEditorAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDidChange(callback: ?OnDidChangeCallback): RichEditorAttribute
}
