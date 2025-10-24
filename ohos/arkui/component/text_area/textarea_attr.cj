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

package ohos.arkui.component.text_area

import ohos.arkui.component.common.*
import ohos.arkui.component.text_field.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines the TextArea attribute functions.
 * This interface provides the attribute methods for the TextArea component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextAreaAttribute <: CommonMethod<TextAreaAttribute> {
    /**
     * Set caret color.
     *
     * @param { ?ResourceColor } value - The caret color resource.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func caretColor(value: ?ResourceColor): TextAreaAttribute

    /**
     * Set placeholder font.
     * The 'HarmonyOS Sans' font and registered custom fonts are supported.
     *
     * @param { ?Length } size - Font size of the placeholder text.
     * @param { ?FontWeight } weight - Font weight of the placeholder text.
     * @param { ?String } family - Font family of the placeholder text.
     * @param { ?FontStyle } style - Font style of the placeholder text.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderFont(size!: ?Length, weight!: ?FontWeight, family!: ?String,
        style!: ?FontStyle): TextAreaAttribute

    /**
     * Set text align.
     * <br>To set vertical alignment for the text, use the align attribute.
     * <br>The align attribute alone does not control the horizontal position of the text.
     * <br>In other words, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd produce the same effect,
     * top-aligning the text; Alignment.Start, Alignment.Center, and Alignment.End produce the same effect,
     * centered-aligning the text vertically; Alignment.BottomStart, Alignment.Bottom,
     * and Alignment.BottomEnd produce the same effect, bottom-aligning the text.
     *
     * @param { ?TextAlign } value - Horizontal alignment of the text.
     * @default TextAlign.Start
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textAlign(value: ?TextAlign): TextAreaAttribute

    /**
     * Set font size.
     *
     * @param { ?Length } value - Font size of the text.
     * @default 16.fp
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextAreaAttribute

    /**
     * Set font color.
     *
     * @param { ?ResourceColor } value - Color of the text.
     * @default 0xe6182431
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextAreaAttribute

    /**
     * Set font weight.
     *
     * @param { ?FontWeight } value - Weight of the font.
     * @default FontWeight.Normal
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextAreaAttribute

    /**
     * Set font style.
     *
     * @param { ?FontStyle } value - Style of the font.
     * @default FontStyle.Normal
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextAreaAttribute

    /**
     * Set font family.
     * <br>Default font: 'HarmonyOS Sans'
     * <br>The 'HarmonyOS Sans' font and registered custom fonts are supported for applications.
     * <br>Only the 'HarmonyOS Sans' font is supported for widgets.
     *
     * @param { ?ResourceStr } value - Font family name.
     * @default 'HarmonyOS Sans'
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextAreaAttribute

    /**
     * Set enter key type.
     *
     * @param { ?EnterKeyType } value - Type of the enter key.
     * @default EnterKeyType.NewLine
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enterKeyType(value: ?EnterKeyType): TextAreaAttribute

    /**
     * Set input filter.
     *
     * @param { ?ResourceStr } value - Regular expression pattern for input filtering.
     * @param { ?(String) -> Unit } error - Callback function executed when input doesn't match the pattern.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func inputFilter(value!: ?ResourceStr, error!: ?(String) -> Unit): TextAreaAttribute

    /**
     * Define the max length content of the text area.
     * <br>By default, there is no maximum number of characters.
     * <br>When the maximum number of characters is reached,
     * no more characters can be entered, and the border turns red.
     *
     * @param { ?UInt32 } value - Maximum number of characters allowed.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLength(value: ?UInt32): TextAreaAttribute

    /**
     * Set placeholder color.
     *
     * @param { ?ResourceColor } value - Color of the placeholder text.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderColor(value: ?ResourceColor): TextAreaAttribute

    /**
     * Called when submitted.
     *
     * @param { ?(EnterKeyType) -> Unit } callback - Callback function executed when the enter key is pressed.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSubmit(callback: ?(EnterKeyType) -> Unit): TextAreaAttribute

    /**
     * Called when the input of the input box changes.
     *
     * @param { ?(String) -> Unit }  callback - Callback function executed when the text content changes.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(String) -> Unit): TextAreaAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback function executed when copy operation is performed.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCopy(callback: ?(String) -> Unit): TextAreaAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback function executed when cut operation is performed.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCut(callback: ?(String) -> Unit): TextAreaAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Executed when a paste operation is performed.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?(String) -> Unit): TextAreaAttribute

    /**
     * Called when judging whether the text editing change finished.
     * The text box is in the editing state when it has the caret placed in it, and is in the non-editing state otherwise.
     *
     * @param { ?(Bool) -> Unit} callback - Triggered when the text area status changes.
     * @returns { TextAreaAttribute } - Returns the attribute of TextArea.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onEditChange(callback: ?(Bool) -> Unit): TextAreaAttribute
}
