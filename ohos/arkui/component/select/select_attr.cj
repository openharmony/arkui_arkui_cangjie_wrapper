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

package ohos.arkui.component.select

import ohos.arkui.component.common.{CommonMethod, FontStyle, FontWeight, ArrowPosition, MenuAlignType, Offset, OptionWidthMode, BlurStyle}
import ohos.labels.{APILevel}
import ohos.base.{ResourceStr, Length, ResourceColor}

/**
 * Defines the Select attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SelectAttribute <: CommonMethod<SelectAttribute> {

    /**
     * Sets the serial number of the select item, starting from 0.
     *
     * @param { ?Int32 } value - The serial number of the select item.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selected(value: ?Int32): SelectAttribute

    /**
     * Sets the text display of the select button itself.
     *
     * @param { ?ResourceStr } value - The text display of the select button itself.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func value(value: ?ResourceStr): SelectAttribute

    /**
     * Sets the text properties of the select button itself.
     *
     * @param { ?FontStyle } style - The font style.
     * @param { ?FontWeight } weight - The font weight.
     * @param { ?Length } size - The font size.
     * @param { ?ResourceStr } family - The font family.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func font(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?ResourceStr
    ): SelectAttribute

    /**
     * Sets the text color of the select button itself.
     *
     * @param { ?ResourceColor } value - The font color.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): SelectAttribute

    /**
     * Sets the background color of the selected items in the select.
     *
     * @param { ?ResourceColor } value - The selected item background color.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedOptionBgColor(value: ?ResourceColor): SelectAttribute

    /**
     * Sets the text style of the selected items in the select.
     *
     * @param { ?FontStyle } style - The selected item font style.
     * @param { ?FontWeight } weight - The selected item font weight.
     * @param { ?Length } size - The selected item font size.
     * @param { ?String } family - The selected item font family.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedOptionFont(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?String
    ): SelectAttribute

    /**
     * Sets the text color of the selected item in the select.
     *
     * @param { ?ResourceColor } value - The selected item font color.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedOptionFontColor(value: ?ResourceColor): SelectAttribute

    /**
     * Sets the background color of the select item.
     *
     * @param { ?ResourceColor } value - The selected item background color.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionBgColor(value: ?ResourceColor): SelectAttribute

    /**
     * Sets the text style for select items.
     *
     * @param { ?FontStyle } style - The selected item font style.
     * @param { ?FontWeight } weight - The selected item font weight.
     * @param { ?Length } size - The selected item font size.
     * @param { ?ResourceStr } family - The selected item font family.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionFont(
        style!: ?FontStyle,
        weight!: ?FontWeight,
        size!: ?Length,
        family!: ?ResourceStr
    ): SelectAttribute

    /**
     * Sets the text color for select items.
     *
     * @param { ?ResourceColor } value - The selected item color.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionFontColor(value: ?ResourceColor): SelectAttribute

    /**
     * Set the space for text and icon in select
     *
     * @param { ?Length } value - Indicates the length of the space
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func space(value: ?Length): SelectAttribute

    /**
     * Set the layout direction for text and arrow in select
     *
     * @param { ?ArrowPosition } value - Indicates the arrow position in the select
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func arrowPosition(value: ?ArrowPosition): SelectAttribute

    /**
     * Set the alignment between select and menu.
     *
     * @param { ?MenuAlignType } alignType - The type of alignment between select and menu.
     * @param { ?Offset } offset - The offset between select and menu.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func menuAlign(alignType!: ?MenuAlignType, offset!: ?Offset): SelectAttribute

    /** 
     * Set the width of each option and set whether the option width fit the trigger.
     *
     * @param { ?OptionWidthMode } value - The length of option width and decide option width to fit trigger or content.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionWidth(value: ?OptionWidthMode): SelectAttribute

    /** 
     * Set the width of each option and set whether the option width fit the trigger.
     *
     * @param { ?Length } value - The length of option width and decide option width to fit trigger or content.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionWidth(value: ?Length): SelectAttribute

    /** 
     * Set the height of each option.
     * 
     * @param { ?Length } value - The length of option height.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func optionHeight(value: ?Length): SelectAttribute

    /**
     * Set the menu's background color.
     *
     * @param { ?ResourceColor } value - The backgroundColor of menu.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func menuBackgroundColor(value: ?ResourceColor): SelectAttribute

    /**
     * Set menu background blur Style.
     *
     * @param { ?BlurStyle } value - The BackgroundBlurStyle of menu.
     * @returns { SelectAttribute } The attribute of the select.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func menuBackgroundBlurStyle(value: ?BlurStyle): SelectAttribute

    /**
     * Callback for selecting an item from the select.
     *
     * @param { ?OnSelectCallback } callback - The callback on select.
     * @returns { SelectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(callback: ?OnSelectCallback): SelectAttribute
}
