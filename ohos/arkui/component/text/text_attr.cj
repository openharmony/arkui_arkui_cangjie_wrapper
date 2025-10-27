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

package ohos.arkui.component.text

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines the Text attribute functions.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextAttribute <: CommonMethod<TextAttribute> {
    /**
     * Set font line spacing.
     *
     * @param { ?Length } value - The line spacing value.
     * @default 0
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func lineSpacing(value: ?Length): TextAttribute

    /**
     * Called when the font size is set.
     *
     * @param { ?Length } value - The font size.
     * @default 16.fp
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextAttribute

    /**
     * Called when the maximum font size of the font is set.
     *
     * @param { ?Length } value - The maximum font size.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxFontSize(value: ?Length): TextAttribute

    /**
     * Called when the minimum font size of the font is set.
     *
     * @param { ?Length } value - The minimum font size.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func minFontSize(value: ?Length): TextAttribute

    /**
     * Called when the font color is set.
     *
     * @param { ?ResourceColor } value - The font color. The default value is 0xe6182431. The default value on wearable devices is 0xc5ffffff.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextAttribute

    /**
     * Called when the font style of a font is set.
     *
     * @param { ?FontStyle } value - The font style. The default value is FontStyle.Normal.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextAttribute

    /**
     * Called when the font weight is set.
     *
     * @param { ?FontWeight } value - The font weight.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextAttribute

    /**
     * Called when the font list of text is set.
     *
     * @param { ?ResourceStr } value - The font family.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextAttribute

    /**
     * Called when the horizontal center mode of the font is set.
     *
     * @param { ?TextAlign } value - The text alignment. The default value is TextAlign.Start.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textAlign(value: ?TextAlign): TextAttribute

    /**
     * Called when the overflow mode of the font is set.
     *
     * @param { ?TextOverflow } value - Text overflow options.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textOverflow(value: ?TextOverflow): TextAttribute

    /**
     * Called when the maximum number of lines of text is set.
     * <br>By default, text is automatically folded.
     * <br>If this attribute is specified, the text will not exceed the specified number of lines.
     * <br>If there is extra text, you can use textOverflow to specify how it is displayed.
     *
     * @param { ?Int32 } value - The maximum number of lines.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLines(value: ?Int32): TextAttribute

    /**
     * Called when the vertical center mode of the font is set.
     * <br>If the value is less than or equal to 0, the line height is not limited and the font size is adaptive.
     * <br>If the value is of the number type, the unit fp is used.
     * <br>For the string type, numeric string values with optional units.
     *
     * @param { ?Length } value - The line height.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func lineHeight(value: ?Length): TextAttribute

    /**
     * Called when the text decoration of the text is set.
     *
     * @param { ?TextDecorationType } decorationType - The type value of the decoration property object.
     * @param { ?ResourceColor } color - The color value of the decoration property object.
     * @param { ?TextDecorationStyle } decorationStyle - The style value of the decoration property object.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func decoration(decorationType!: ?TextDecorationType, color!: ?ResourceColor, decorationStyle!: ?TextDecorationStyle): TextAttribute

    /**
     * Called when the baseline offset is set.
     *
     * @param { ?Length } value - The baseline offset.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func baselineOffset(value: ?Length): TextAttribute

    /**
     * Called when the type of letter in the text font is set.
     *
     * @param { ?TextCase } value - The text case. The default value is TextCase.Normal.
     * @returns { TextAttribute } Returns the text attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textCase(value: ?TextCase): TextAttribute
}
