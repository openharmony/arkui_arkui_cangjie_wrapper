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
 * Defines the options of TextArea.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextAreaAttribute <: CommonMethod<TextAreaAttribute> {
    /**
     * Called when the color of the insertion cursor is set.
     *
     * @param { ?ResourceColor } value
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func caretColor(value: ?ResourceColor): TextAreaAttribute

    /**
     * Called when the font property of the placeholder is set.
     * The 'HarmonyOS Sans' font and registered custom fonts are supported.
     *
     * @param { ?Length } size
     * @param { ?FontWeight } weight
     * @param { ?String } family
     * @param { ?FontStyle } style
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderFont(size!: ?Length, weight!: ?FontWeight, family!: ?String,
        style!: ?FontStyle): TextAreaAttribute

    /**
     * Called when the text align is set.
     * <br>To set vertical alignment for the text, use the align attribute.
     * <br>The align attribute alone does not control the horizontal position of the text.
     * <br>In other words, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd produce the same effect,
     * top-aligning the text; Alignment.Start, Alignment.Center, and Alignment.End produce the same effect,
     * centered-aligning the text vertically; Alignment.BottomStart, Alignment.Bottom,
     * and Alignment.BottomEnd produce the same effect, bottom-aligning the text.
     *
     * @param { ?TextAlign } value - Default value is TextAlign.Start.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textAlign(value: ?TextAlign): TextAreaAttribute

    /**
     * Called when the font size is set.
     *
     * @param { ?Length } value - Default value is 16.fp. If fontSize is of the number type, the unit fp is used. This parameter cannot be set in percentage.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextAreaAttribute

    /**
     * Called when the font color is set.
     * @param { ?ResourceColor } value
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextAreaAttribute

    /**
     * Called when the font weight is set.
     *
     * @param { ?FontWeight } value - Default value is FontWeight.Normal.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextAreaAttribute

    /**
     * Called when the font style of a font is set.
     *
     * @param { ?FontStyle } value - Default value is FontStyle.Normal.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextAreaAttribute

    /**
     * Called when the font list of text is set.
     * <br>Default font: 'HarmonyOS Sans'
     * <br>The 'HarmonyOS Sans' font and registered custom fonts are supported for applications.
     * <br>Only the 'HarmonyOS Sans' font is supported for widgets.
     *
     * @param { ?ResourceStr } value - Default value is 'HarmonyOS Sans'.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextAreaAttribute

    /**
     * Called when the type of soft keyboard input button is set.
     *
     * @param { ?EnterKeyType } value - Default value is Default value is EnterKeyType.NewLine.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enterKeyType(value: ?EnterKeyType): TextAreaAttribute

    /**
     * Called when the inputFilter of text is set.
     *
     * @param { ?ResourceStr } value
     * @param { ?(String) -> Unit } error
     * @returns { TextAreaAttribute }
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
     * @param { ?UInt32 } value
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLength(value: ?UInt32): TextAreaAttribute

    /**
     * Called when the color of the placeholder is set.
     *
     * @param { ?ResourceColor } value - Default value follows the theme.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderColor(value: ?ResourceColor): TextAreaAttribute

    /**
     * Called when submitted.
     *
     * @param { ?(EnterKeyType) -> Unit } callback - If it is EnterKeyType.NEW_LINE and the text box is in inline input style, onSubmit is not triggered.
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSubmit(callback: ?(EnterKeyType) -> Unit): TextAreaAttribute

    /**
     * Called when the input of the input box changes.
     *
     * @param { ?(String) -> Unit }  callback
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(String) -> Unit): TextAreaAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCopy(callback: ?(String) -> Unit): TextAreaAttribute

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback
     * @returns { TextAreaAttribute }
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
     * @returns { TextAreaAttribute }
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
     * @returns { TextAreaAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onEditChange(callback: ?(Bool) -> Unit): TextAreaAttribute
}
