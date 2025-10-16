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

import ohos.arkui.component.common.*
import ohos.arkui.component.text_field.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines TextInput Component.
 *
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextInputAttribute <: CommonMethod<TextInputAttribute> {
    /**
     * Called when the type of soft keyboard input button is set.
     *
     * @param { ?EnterKeyType } value - Default value is EnterKeyType.Done.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enterKeyType(value: ?EnterKeyType): TextInputAttribute

    /**
     * Called when the text align is set.
     * <br>Available options are TextAlign.Start, TextAlign.Center, and TextAlign.End.
     * <br>To set vertical alignment for the text, use the align attribute.
     * <br>The align attribute alone does not control the horizontal position of the text.
     * <br>In other words, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd produce the same effect, top-aligning the text;
     * Alignment.Start, Alignment.Center, and Alignment.End produce the same effect, centered-aligning the text vertically;
     * Alignment.BottomStart, Alignment.Bottom, and Alignment.BottomEnd produce the same effect, bottom-aligning the text.
     *
     * @param { ?TextAlign } value - Default value is TextAlign.Start.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textAlign(value: ?TextAlign): TextInputAttribute

    /**
     * Called when the overflow mode of the font is set.
     *
     * @param { ?ResourceColor } value - Default value follows the theme.The default value on wearable devices is '#99ffffff'.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderColor(value: ?ResourceColor): TextInputAttribute

    /**
     * Called when the color of the insertion cursor is set.
     *
     * @param { ?ResourceColor } value
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func caretColor(value: ?ResourceColor): TextInputAttribute

    /**
     * Called when the font property of the placeholder is set.
     *
     * @param { ?Length } size
     * @param { ?FontWeight } weight
     * @param { ?String } family
     * @param { ?FontStyle } style
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderFont(size!: ?Length, weight!: ?FontWeight, family!: ?String,
        style!: ?FontStyle): TextInputAttribute

    /**
     * Called when the input of maximum text length is set.
     *
     * @param { ?UInt32 } value - Default value is Infinity, indicating that there is no upper limit on the number of characters that can be entered.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLength(value: ?UInt32): TextInputAttribute

    /**
     * Called when the font size is set.
     * <br>If fontSize is of the number type, the unit fp is used.
     * <br>The default font size is 16.fp.
     * <br>The value cannot be a percentage.
     * <br>The default value on wearable devices is 18.fp.
     *
     * @param { ?Length } value
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextInputAttribute

    /**
     * Called when the font color is set.
     * @param { ?ResourceColor } value - The default value on wearable devices is '#dbffffff'.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextInputAttribute

    /**
     * Called when the font weight is set.
     *
     * @param { ?FontWeight } value - Default value is FontWeight.Normal.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextInputAttribute

    /**
     * Called when the font style of a font is set.
     *
     * @param { ?FontStyle } value - Default value is FontStyle.Normal.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextInputAttribute

    /**
     * Called when the font list of text is set.
     * <br>Default font: 'HarmonyOS Sans'
     * <br>The 'HarmonyOS Sans' font and registered custom fonts are supported for applications.
     * <br>Only the 'HarmonyOS Sans' font is supported for widgets.
     *
     * @param { ?ResourceStr } value
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextInputAttribute

    /**
     * Called when the inputFilter of text is set.
     *
     * @param { ?ResourceStr } value
     * @param { ?(String) -> Unit } error
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func inputFilter(value: ?ResourceStr, error!: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when submitted.
     *
     * @param { ?(EnterKeyType) -> Unit } callback - Callback of the listened event.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSubmit(callback: ?(EnterKeyType) -> Unit): TextInputAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback used to return the copied text content.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCopy(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCut(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when the input of the input box changes.
     *
     * @param { ?(String) -> Unit } callback
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Executed when a paste operation is performed.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?(String) -> Unit): TextInputAttribute

    /**
     * Called when judging whether the text editing change finished.
     *
     * @param { ?(Bool) -> Unit} callback
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onEditChange(callback: ?(Bool) -> Unit): TextInputAttribute

    /**
     * Define custom keyboard of the text input.
     *
     * @param { ?CustomBuilder } value - Set up a custom keyboard of TextInput.
     * @param { ?Bool } supportAvoidance - Indicates the custom keyboard options of TextInput.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func customKeyboard(value: ?CustomBuilder, supportAvoidance!: ?Bool): TextInputAttribute

    /**
     * Text input style
     *
     * @param { ?TextInputStyle } value - Text input style.Default value is TextInputStyle.Default.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func style(value: ?TextInputStyle): TextInputAttribute

    /**
     * Sets whether request keyboard or not when on focus.
     * Sets whether to enable the input method when the TextInput component obtains focus in a way other than clicking.
     *
     * @param { ?Bool } value - Default value is true.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enableKeyboardOnFocus(value: ?Bool): TextInputAttribute

    /**
     * Controls whether the selection menu pops up.
     *
     * @param { ?Bool } value - Default value is false.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectionMenuHidden(value: ?Bool): TextInputAttribute

    /**
     * Define the show underline of the text input.
     *
     * @param { ?Bool } value - Default value is false.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showUnderline(value: ?Bool): TextInputAttribute

    /**
     * Define max lines of the text input.
     *
     * @param { ?Int32 } value - Default value is 3.
     * @returns { TextInputAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLines(value: ?Int32): TextInputAttribute
}
