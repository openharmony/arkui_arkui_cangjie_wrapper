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

package ohos.arkui.component.rect	

import ohos.arkui.component.shape.{CommonShapeMethod}
import ohos.labels.APILevel
import ohos.base.{Length}

/**
 * Defines Rect Component.
 * Provides methods for configuring the appearance and behavior of the Rect component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RectAttribute <: CommonShapeMethod<RectAttribute> {	

    /**
     * Set the corner radius width.
     * Configures the horizontal radius of the rectangle's rounded corners.
     *
     * @param { ?Length } value - Radius width of the rectangle corners.
     * @returns { RectAttribute } Returns the rect attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radiusWidth(value: ?Length): RectAttribute

    /**
     * Configures the vertical radius of the rectangle's rounded corners.
     *
     * @param { ?Length } value - Radius height of the rectangle corners.
     * @returns { RectAttribute } Returns the rect attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radiusHeight(value: ?Length): RectAttribute

    /**
     * Configures the radius of all rectangle corners with a single value.
     *
     * @param { ?Length } value - Radius of the rectangle corners.
     * @returns { RectAttribute } Returns the rect attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(value: ?Length): RectAttribute

    /**
     * Configures the radius of each rectangle corner with individual values.
     *
     * @param { ?Array<Length> } value - Array of radius values for rectangle corners.
     * @returns { RectAttribute } Returns the rect attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(value: ?Array<Length>): RectAttribute

    /**
     * Set the corner radius size.
     * Configures the radius width and height of each rectangle corner with individual values.
     *
     * @param { ?Array<(Length, Length)> } radiusArray - Array of radius values (width, height) for rectangle corners.
     * @returns { RectAttribute } Returns the rect attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(radiusArray: ?Array<(Length, Length)>): RectAttribute
}
