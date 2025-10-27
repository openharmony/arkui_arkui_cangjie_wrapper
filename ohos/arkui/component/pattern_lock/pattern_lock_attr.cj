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

package ohos.arkui.component.pattern_lock

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines the PatternLock attribute functions.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface PatternLockAttribute <: CommonMethod<PatternLockAttribute> {
    /**
     * Sets the fill color of the grid dot in the selected state.
     *
     * @param { ?ResourceColor } value - Fill color of the grid dot in the selected state.
     * @default { ?ResourceColor } - 0xff182431
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): PatternLockAttribute

    /**
     * Sets the path color.
     *
     * @param { ?ResourceColor } value - Path color.
     * @default { ?ResourceColor } - 0x33182431
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func pathColor(value: ?ResourceColor): PatternLockAttribute

    /**
     * Sets the fill color of the grid dot in the activated state, which is when the dot is highlighted but not selected.
     *
     * @param { ?ResourceColor } value - Fill color of the grid dot in the activated state.
     * @default { ?ResourceColor } - 0xff182431
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func activeColor(value: ?ResourceColor): PatternLockAttribute

    /**
     * Sets the fill color of the grid dot in the unselected state.
     *
     * @param { ?ResourceColor } value - Fill color of the grid dot in the unselected state.
     * @default { ?ResourceColor } - 0xff182431
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func regularColor(value: ?ResourceColor): PatternLockAttribute

    /**
     * Sets whether to allow the user to reset the component status (that is, clear the input) by touching the component
     * again after the input is complete.
     *
     * @param { ?Bool } value - Whether to allow the user to reset the component status (that is, clear the input) by
     * touching the component again after the input is complete. The default value is true.
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoReset(value: ?Bool): PatternLockAttribute

    /**
     * Sets the radius of the dots in a grid.
     *
     * <p><strong>NOTE</strong>:
     * <br>If this attribute is set to 0 or a negative value, the default value is used.
     * </p>
     *
     * @param { ?Length } value - Radius of the dots in a grid. The default value is 6.vp.
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func circleRadius(value: ?Length): PatternLockAttribute

    /**
     * Sets the width and height (same value) of the component.
     *
     * <p><strong>NOTE</strong>:
     * <br>If this attribute is set to 0 or a negative number, the component is not displayed.
     * </p>
     *
     * @param { ?Length } value - Width and height of the component. The default value is 288.vp.
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sideLength(value: ?Length): PatternLockAttribute

    /**
     * Sets the width of the path stroke.
     *
     * <p><strong>NOTE</strong>:
     * <br>If this attribute is set to **0** or a negative value, the path stroke is not displayed.
     * </p>
     *
     * @param { ?Length } value - Width of the path stroke. The default value is 12.vp.
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func pathStrokeWidth(value: ?Length): PatternLockAttribute

    /**
     * Invoked when the pattern password input is complete.
     *
     * @param { ?(Array<Int32>) -> Unit } callback - Callback function triggered when pattern password input is complete.
     * @returns { PatternLockAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPatternComplete(callback: ?(Array<Int32>) -> Unit): PatternLockAttribute
}
