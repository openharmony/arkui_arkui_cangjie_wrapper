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

/**
 * Defines RichEditor Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RichEditorAttribute <: CommonMethod<RichEditorAttribute> {
    /**
     * Define custom keyboard.
     *
     * @params { ?CustomBuilder } value
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func customKeyboard(value!: ?CustomBuilder): RichEditorAttribute

    /**
     * Bind to the selection menu.
     *
     * @params { ?RichEditorSpanType } spantype
     * @params { ?CustomBuilder } content
     * @params { ?ResponseType } responseType
     * @params { ?SelectionMenuOptions } options
     * @returns { RichEditorAttribute }
     */
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

    /**
     * Allow replication.
     *
     * @params { ?CopyOptions } value
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func copyOptions(value: ?CopyOptions): RichEditorAttribute

    /**
     * Called when on ready.
     *
     * @params { ?VoidCallback } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onReady(callback: ?VoidCallback): RichEditorAttribute

    /**
     * Get text value information when about to input.
     *
     * @params { ?Callback<RichEditorInsertValue, Bool> } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aboutToIMEInput(callback: ?Callback<RichEditorInsertValue, Bool>): RichEditorAttribute

    /**
     * Get text value information when completed input.
     *
     * @params { ?Callback<RichEditorTextSpanResult, Unit> } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onIMEInputComplete(callback: ?Callback<RichEditorTextSpanResult, Unit>): RichEditor

    /**
     * Notify that the deletion has been completed.
     *
     * @params { ?VoidCallback } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDeleteComplete(callback: ?VoidCallback): RichEditorAttribute

    /**
     * Get text value information when about to delete.
     *
     * @params { ?Callback<RichEditorDeleteValue, Bool> } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aboutToDelete(callback: ?Callback<RichEditorDeleteValue, Bool>): RichEditorAttribute

    /**
     * Called when the content is selected.
     *
     * @params { ?Callback<RichEditorSelection, Unit> } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(callback: ?Callback<RichEditorSelection, Unit>): RichEditorAttribute

    /**
     * Defines onPaste callback.
     *
     * @params { ?PasteEventCallback } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?PasteEventCallback): RichEditorAttribute

    /**
     * Called after text changed.
     *
     * @params { ?OnDidChangeCallback } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDidChange(callback: ?OnDidChangeCallback): RichEditorAttribute
}
