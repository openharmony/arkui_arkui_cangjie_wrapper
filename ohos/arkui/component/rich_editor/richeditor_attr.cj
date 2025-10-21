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
     * @param { ?CustomBuilder } value
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
     * @param { ?RichEditorSpanType } spantype
     * @param { ?CustomBuilder } content
     * @param { ?ResponseType } responseType
     * @param { ?SelectionMenuOptions } options
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
     * @param { ?CopyOptions } value
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
     * @param { ?VoidCallback } callback
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
     * @param { ?Callback<RichEditorInsertValue, Bool> } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aboutToImeInput(callback: ?Callback<RichEditorInsertValue, Bool>): RichEditorAttribute

    /**
     * Get text value information when completed input.
     *
     * @param { ?Callback<RichEditorTextSpanResult, Unit> } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onImeInputComplete(callback: ?Callback<RichEditorTextSpanResult, Unit>): RichEditor

    /**
     * Notify that the deletion has been completed.
     *
     * @param { ?VoidCallback } callback
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
     * @param { ?Callback<RichEditorDeleteValue, Bool> } callback
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
     * @param { ?Callback<RichEditorSelection, Unit> } callback
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
     * @param { ?PasteEventCallback } callback
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
     * @param { ?OnDidChangeCallback } callback
     * @returns { RichEditorAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDidChange(callback: ?OnDidChangeCallback): RichEditorAttribute
}
