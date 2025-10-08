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

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines AlphabetIndexer attributes.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface AlphabetIndexerAttribute <: CommonMethod<AlphabetIndexerAttribute> {
    /**
     * Definitions color.
     *
     * @params { ?ResourceColor } value
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func color(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Select the text color.
     *
     * @params { ?ResourceColor } value
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Font color of the pop-up prompt text.
     *
     * @params { ?ResourceColor } value
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupColor(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Font color of the pop-up prompt text.
     *
     * @params { ?ResourceColor } value
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedBackgroundColor(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Background color of the pop-up window index.
     *
     * @params { ?ResourceColor } value
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupBackground(value: ?ResourceColor): AlphabetIndexerAttribute
    /**
     * Whether to use pop-up index hints.
     *
     * @params { ?Bool } value
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func usingPopup(value: ?Bool): AlphabetIndexerAttribute
    /**
     * Select the text text style,
     *
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
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
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
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
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
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
     * @params { ?Length } value
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func itemSize(size: ?Length): AlphabetIndexerAttribute
    /**
     * Alphabet index bar alignment style. The left and right alignment styles are supported,
     * which affects the pop-up position of the pop-up window.
     *
     * @params { ?IndexerAlign } value - indicates the alignment style of Alphabet index.
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignStyle(value: ?IndexerAlign): AlphabetIndexerAttribute
    /**
     * Sets the selected index.
     *
     * @params { ?Int32 } index
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selected(index: ?Int32): AlphabetIndexerAttribute
    /**
     * Position of the pop-up windows, relative to the midpoint of the top border of the indexer bar.
     *
     * @params { ?Length } x
     * @params { ?Length } y
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func popupPosition(x!: ?Length, y!: ?Length): AlphabetIndexerAttribute
    /**
     * Index bar selection callback.
     * Anonymous Object Rectification.
     *
     * @params { ?OnAlphabetIndexerSelectCallback } callback
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(callback: ?OnAlphabetIndexerSelectCallback): AlphabetIndexerAttribute
    /**
     * Index bar selection callback and return the strings which display on pop-up.
     * Anonymous Object Rectification.
     *
     * @params { ?OnAlphabetIndexerRequestPopupDataCallback } callback
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onRequestPopupData(callback: ?OnAlphabetIndexerRequestPopupDataCallback): AlphabetIndexerAttribute
    /**
     * Pop-up selection callback.
     * Anonymous Object Rectification.
     *
     * @params { ?OnAlphabetIndexerPopupSelectCallback } callback
     * @returns { AlphabetIndexerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPopupSelect(callback: ?OnAlphabetIndexerPopupSelectCallback): AlphabetIndexerAttribute
}
