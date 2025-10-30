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

package ohos.arkui.component.alphabet_indexer

import ohos.arkui.component.common.{CommonMethod, FontWeight, FontStyle, IndexerAlign}
import ohos.labels.APILevel
import ohos.base.{Length, ResourceStr, ResourceColor}

/**
 * Defines the AlphabetIndexer attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface AlphabetIndexerAttribute <: CommonMethod<AlphabetIndexerAttribute> {
    /**
     * Definitions color.
     *
     * @param { ?ResourceColor } value - The color to display.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func color(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Select the text color.
     *
     * @param { ?ResourceColor } value - The selected color to display.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Font color of the pop-up prompt text.
     *
     * @param { ?ResourceColor } value - The selected background color.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupColor(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Font color of the pop-up prompt text.
     *
     * @param { ?ResourceColor } value - The popup color to display.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedBackgroundColor(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Background color of the pop-up window index.
     *
     * @param { ?ResourceColor } value - The background color to display.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupBackground(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Whether to use pop-up index hints.
     *
     * @param { ?Bool } value - Whether using popup index hints.
     * @default true
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func usingPopup(value: ?Bool): AlphabetIndexerAttribute
    /**
     * Select the text text style.
     *
     * @param { ?Length } size - The selected item font size.
     * @param { ?FontWeight } weight - The selected item font weight.
     * @param { ?ResourceStr } family - The selected item font family.
     * @param { ?FontStyle } style - The selected item font style.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute
    /**	
     * Select the text background color.	
     *	
     * @param { ?Length } size - The popup font size.
     * @param { ?FontWeight } weight - The popup font weight.
     * @param { ?ResourceStr } family - The popup font family.
     * @param { ?FontStyle } style - The popup font style.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupFont(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute
    /**	
     * Definitions fonts.	
     *	
     * @param { ?Length } size - The normal item font size.
     * @param { ?FontWeight } weight - The normal item font weight.
     * @param { ?ResourceStr } family - The normal item font weight.
     * @param { ?FontStyle } style - The normal item font weight.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func font(
        size!: ?Length,
        weight!: ?FontWeight,
        family!: ?ResourceStr,
        style!: ?FontStyle
    ): AlphabetIndexerAttribute
    /**
     * Size of the letter area on the letter index bar. The letter area is a square. Set the length of the square side.
     * 
     * @param { ?Length } value - The normal item size.
     * @default 16.vp
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func itemSize(size: ?Length): AlphabetIndexerAttribute
    /**
     * Alphabet index bar alignment style. The left and right alignment styles are supported,
     * which affects the pop-up position of the pop-up window.
     *
     * @param { ?IndexerAlign } value - Indicates the alignment style of Alphabet index.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignStyle(value: ?IndexerAlign): AlphabetIndexerAttribute
    /**
     * Sets the selected index.
     *
     * @param { ?Int32 } index - The initial selected index.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selected(index: ?Int32): AlphabetIndexerAttribute
    /**
     * Position of the pop-up windows, relative to the midpoint of the top border of the indexer bar.
     *
     * @param { ?Length } x - Coordinate x of the Position.
     * @param { ?Length } y - Coordinate y of the Position.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupPosition(x!: ?Length, y!: ?Length): AlphabetIndexerAttribute
    /**
     * Index bar selection callback.
     *
     * @param { ?OnAlphabetIndexerSelectCallback } callback - The callback on select item.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(callback: ?OnAlphabetIndexerSelectCallback): AlphabetIndexerAttribute
    /**
     * Index bar selection callback and return the strings which display on pop-up.
     *
     * @param { ?OnAlphabetIndexerRequestPopupDataCallback } callback - The callback on request popup.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onRequestPopupData(callback: ?OnAlphabetIndexerRequestPopupDataCallback): AlphabetIndexerAttribute
    /**
     * Pop-up selection callback.
     *
     * @param { ?OnAlphabetIndexerPopupSelectCallback } callback - The callback on select popup.
     * @returns { AlphabetIndexerAttribute } Returns the current AlphabetIndexerAttribute instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPopupSelect(callback: ?OnAlphabetIndexerPopupSelectCallback): AlphabetIndexerAttribute
}
