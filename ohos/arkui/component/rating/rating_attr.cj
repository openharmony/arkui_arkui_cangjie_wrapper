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

package ohos.arkui.component.rating

import ohos.arkui.component.common.{CommonMethod}
import ohos.labels.{APILevel}
import ohos.base.{ResourceStr}

/**
 * Provides methods for configuring the appearance and behavior of the Rating component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RatingAttribute <: CommonMethod<RatingAttribute> {

    /**
     * Configures the total number of stars to display in the rating component.
     * 
     * @param { ?Int32 } starCount - Number of stars.
     * @returns { RatingAttribute } Returns the rating attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func stars(starCount: ?Int32): RatingAttribute

    /**
     * Configures the increment step size when changing the rating value.
     *
     * @param { ?Float64 } size - Step size for rating changes.
     * @returns { RatingAttribute } Returns the rating attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func stepSize(size: ?Float64): RatingAttribute

    /**
     * Configures custom images for the rating stars.
     *
     * @param { ?ResourceStr } backgroundUri - Background URI option for unselected stars.
     * @param { ?ResourceStr } foregroundUri - Foreground URI option for selected stars.
     * @param { ?ResourceStr } secondaryUri - Secondary URI option for partially selected stars.
     * @returns { RatingAttribute } Returns the rating attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func starStyle(backgroundUri!: ?ResourceStr, foregroundUri!: ?ResourceStr, secondaryUri!: ?ResourceStr): RatingAttribute

    /**
     * Called when the star rating of the operation scoring bar changes.
     * Triggered when the user changes the rating value by clicking or sliding.
     *
     * @param { ?(Float64) -> Unit } callback - Callback function when rating changes.
     * The parameter is the new rating value.
     * @returns { RatingAttribute } Returns the rating attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Float64) -> Unit): RatingAttribute
}
