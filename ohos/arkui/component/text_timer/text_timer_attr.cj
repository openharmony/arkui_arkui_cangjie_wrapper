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

package ohos.arkui.component.text_timer

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines TextTimer Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextTimerAttribute <: CommonMethod<TextTimerAttribute> {
    /**
     * Sets the custom format.
     * The value must contain at least one of the following keywords: HH, mm, ss, and SS.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the specified date format is yy, MM, or dd, the default value is used instead.
     * </p>
     *
     * @param { ?String } value - Custom format.Default value: 'HH:mm:ss.SS'.
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func format(value: ?String): TextTimerAttribute

    /**
     * Triggered when the time text changes.
     * This event is not triggered when the screen is locked or the application is running in the background.
     * When high-precision formats (such as SSS or SS) are used, the callback interval may vary.
     *
     * @param { ?(Int64, Int64) -> Unit } event
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onTimer(event: ?(Int64, Int64) -> Unit): TextTimerAttribute

    /**
     * Sets the font size.
     *
     * @param { ?Length } value - Font size.The default font size is 16 fp.
     * <br>If fontSize is of the number type, the unit fp is used.
     * <br>The value cannot be a percentage.
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextTimerAttribute

    /**
     * Sets the font color.
     *
     * @param { ?ResourceColor } value
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextTimerAttribute

    /**
     * Sets the font style.
     *
     * @param { ?FontStyle } value - Font style.Default value: FontStyle.Normal.
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextTimerAttribute

    /**
     * Sets the font weight.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the value is too large, the text may be clipped depending on the font.
     * </p>
     *
     * @param { ?FontWeight } value - Font weight.
     * <br>For the number type, Value range: [100, 900], at an interval of 100.The default value is 400.
     * <br>A larger value indicates a heavier font weight.
     * <br>For the string type, only strings that represent a number.
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextTimerAttribute

    /**
     * Sets the font family.
     *
     * @param { ?ResourceStr } value - Font family. Default font: 'HarmonyOS Sans'.
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextTimerAttribute

    /**
     * Sets the text shadow.
     * It supports input parameters in an array to implement multiple text shadows.
     * This API does not work with the fill attribute or coloring strategy.
     *
     * @param { ?Array<ShadowOptions> } value - The shadow options.
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textShadow(value: ?Array<ShadowOptions>): TextTimerAttribute

    /**
     * Sets the text shadow.
     * It supports input parameters in an array to implement multiple text shadows.
     * This API does not work with the fill attribute or coloring strategy.
     *
     * @param { ?ShadowOptions } value - The shadow options.
     * @returns { TextTimerAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textShadow(value: ?ShadowOptions): TextTimerAttribute
}
