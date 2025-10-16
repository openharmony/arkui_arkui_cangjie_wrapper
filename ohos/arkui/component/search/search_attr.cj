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
import ohos.labels.APILevel
import ohos.base.*

/**
 * The construct function of search
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SearchAttribute <: CommonMethod<SearchAttribute> {
    /**
     * Set the search button text, fontSize and fontColor
     *
     * @param { ?ResourceStr } value - indicates the text of the search button.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func searchButton(value: ?ResourceStr): SearchAttribute

    /**
     * Set the search button text, fontSize and fontColor
     *
     * @param { ?ResourceColor } value - Default value is '#99182431'.The default value on wearable devices is '#99ffffff'.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderColor(value: ?ResourceColor): SearchAttribute

    /**
     * Set the font used for place holder text
     *
     * @param { ?Length } size - font size.
     * @param { ?FontWeight } weight - font weight.
     * @param { ?FontStyle } style - font style.
     * @param { ?ResourceStr } family - font family.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderFont(
        size!: ?Length,
        weight!: ?FontWeight,
        style!: ?FontStyle,
        family!: ?ResourceStr
    ): SearchAttribute

    /**
     * Set the font used for input text
     *
     * @param { ?Length } size - font size.
     * @param { ?FontWeight } weight - font weight.
     * @param { ?FontStyle } style - font style.
     * @param { ?ResourceStr } family - font family.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textFont(
        size!: ?Length,
        weight!: ?FontWeight,
        style!: ?FontStyle,
        family!: ?ResourceStr
    ): SearchAttribute

    /**
     * Called when the copy option is set.
     * If this attribute is set to CopyOptions.None, the text can only be pasted;
     * all other actions, such as copying, cutting, and sharing, are disabled.
     * Dragging is not allowed when CopyOptions.None is set.
     *
     * @param { ?CopyOptions } value - Default value is CopyOptions.LocalDevice.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func copyOption(value: ?CopyOptions): SearchAttribute

    /**
     * Call the function when clicked the search button.
     *
     * @param { ?(String) -> Unit } callback - Search submission callback, which returns the text content currently in the search box.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSubmit(callback: ?(String) -> Unit): SearchAttribute

    /**
     * Call the function when editing the input text.
     * In this callback, if cursor operations are performed,
     * <br>developers need to adjust the cursor logic based on the previewText parameter to ensure it works seamlessly within the preview display scenario.
     *
     * @param { ?(String) -> Unit } callback - Search submission callback, which returns the text content currently in the search box.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(String) -> Unit): SearchAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback used to return the copied text content.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCopy(callback: ?(String) -> Unit): SearchAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback used to return the cut text content.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCut(callback: ?(String) -> Unit): SearchAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Executed when a paste operation is performed. Callback used to return the pasted text content.
     * @returns { SearchAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?(String) -> Unit): SearchAttribute
}
