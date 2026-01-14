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

package ohos.arkui.component.text_input

import ohos.arkui.component.common.{CommonMethod, EnterKeyType, TextAlign, FontWeight, FontStyle, CustomBuilder, TextInputStyle}
import ohos.labels.{APILevel}
import ohos.base.{ResourceColor, Length, ResourceStr}

/**
 * Defines the TextInput attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextInputAttribute <: CommonMethod<TextInputAttribute> {
    /**
     * Set enter key type.
     *
     * @param { ?EnterKeyType } value - The type of the enter key.
     * @default EnterKeyType.Done
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enterKeyType(value: ?EnterKeyType): TextInputAttribute

    /**
     * Set text align.
     * <br>Available options are TextAlign.Start, TextAlign.Center, and TextAlign.End.
     * <br>To set vertical alignment for the text, use the align attribute.
     * <br>The align attribute alone does not control the horizontal position of the text.
     * <br>In other words, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd produce the same effect, top-aligning the text;
     * Alignment.Start, Alignment.Center, and Alignment.End produce the same effect, centered-aligning the text vertically;
     * Alignment.BottomStart, Alignment.Bottom, and Alignment.BottomEnd produce the same effect, bottom-aligning the text.
     *
     * @param { ?TextAlign } value - The text alignment type.
     * @default TextAlign.Start
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textAlign(value: ?TextAlign): TextInputAttribute

    /**
     * Set placeholder color.
     *
     * @param { ?ResourceColor } value - Default value follows the theme.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderColor(value: ?ResourceColor): TextInputAttribute

    /**
     * Set caret color.
     *
     * @param { ?ResourceColor } value - The color of the insertion cursor.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func caretColor(value: ?ResourceColor): TextInputAttribute

    /**
     * Set placeholder font.
     *
     * @param { ?Length } size - The font size of the placeholder.
     * @param { ?FontWeight } weight - The font weight of the placeholder.
     * @param { ?String } family - The font family of the placeholder.
     * @param { ?FontStyle } style - The font style of the placeholder.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderFont(size!: ?Length, weight!: ?FontWeight, family!: ?String,
        style!: ?FontStyle): TextInputAttribute

    /**
     * Set max input length.
     *
     * @param { ?UInt32 } value - Maximum number of characters that can be entered.
     * @default Infinity.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLength(value: ?UInt32): TextInputAttribute

    /**
     * Set font size.
     * <br>If fontSize is of the number type, the unit fp is used.
     * <br>The default font size is 16.fp.
     * <br>The value cannot be a percentage.
     * <br>The default value on wearable devices is 18.fp.
     *
     * @param { ?Length } value - .The default value on wearable devices is 18.fp.
     * @default 16.fp
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextInputAttribute

    /**
     * Set font color.
     *
     * @param { ?ResourceColor } value - The font color of the text.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextInputAttribute

    /**
     * Set font weight.
     *
     * @param { ?FontWeight } value - The font weight of the text.
     * @default FontWeight.Normal
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextInputAttribute

    /**
     * Set font style.
     *
     * @param { ?FontStyle } value - The font style of the text.
     * @default FontStyle.Normal
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextInputAttribute

    /**
     * Set font family.
     * <br>Default font: 'HarmonyOS Sans'
     * <br>The 'HarmonyOS Sans' font and registered custom fonts are supported for applications.
     * <br>Only the 'HarmonyOS Sans' font is supported for widgets.
     *
     * @param { ?ResourceStr } value - The font family resource.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextInputAttribute

    /**
     * Set input filter.
     *
     * @param { ?ResourceStr } value - The input filter pattern.
     * @param { ?(String) -> Unit } error - Callback function when input does not match the filter.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func inputFilter(value: ?ResourceStr, error!: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when submitted.
     *
     * @param { ?(EnterKeyType) -> Unit } callback - Callback function when text input is submitted.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSubmit(callback: ?(EnterKeyType) -> Unit): TextInputAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback function when text is copied from the input.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCopy(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback function when text is cut from the input.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCut(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when the input of the input box changes.
     *
     * @param { ?(String) -> Unit } callback - Callback function when the input text changes.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback function when text is pasted to the input.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when judging whether the text editing change finished.
     *
     * @param { ?(Bool) -> Unit} callback - Callback function when text editing state changes.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onEditChange(callback: ?(Bool) -> Unit): TextInputAttribute

    /**
     * Set custom keyboard.
     *
     * @param { ?CustomBuilder } value - Set up a custom keyboard of TextInput.
     * @param { ?Bool } supportAvoidance - Indicates the custom keyboard options of TextInput.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func customKeyboard(value: ?CustomBuilder, supportAvoidance!: ?Bool): TextInputAttribute

    /**
     * Text input style
     *
     * @param { ?TextInputStyle } value - The text input style.
     * @default TextInputStyle.Default.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func style(value: ?TextInputStyle): TextInputAttribute

    /**
     * Sets whether request keyboard or not when on focus.
     * Sets whether to enable the input method when the TextInput component obtains focus in a way other than clicking.
     *
     * @param { ?Bool } value - Whether to enable the keyboard on focus.
     * @default true
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enableKeyboardOnFocus(value: ?Bool): TextInputAttribute

    /**
     * Controls whether the selection menu pops up.
     *
     * @param { ?Bool } value - Whether to hide the selection menu.
     * @default false
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectionMenuHidden(value: ?Bool): TextInputAttribute

    /**
     * Define the show underline of the text input.
     *
     * @param { ?Bool } value - Whether to show the underline.
     * @default false
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showUnderline(value: ?Bool): TextInputAttribute

    /**
     * Define max lines of the text input.
     *
     * @param { ?Int32 } value - Maximum number of lines.
     * @default 3
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLines(value: ?Int32): TextInputAttribute
}
