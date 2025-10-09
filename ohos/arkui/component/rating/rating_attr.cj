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

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Rating Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RatingAttribute <: CommonMethod<RatingAttribute> {

    /**
     * Called when the total number of stars is set.
     * 
     * @params { ?Int32 } value
     * @returns { RatingAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func stars(starCount: ?Int32): RatingAttribute

    /**
     * Called when the step size of the operation rating.
     *
     * @params { ?Float64 } size
     * @returns { RatingAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func stepSize(size: ?Float64): RatingAttribute

    /**
     * Called when a picture is set.
     *
     * @params { ?ResourceStr } backgroundUri - Background URI option.
     * @params { ?ResourceStr } foregroundUri - Foreground URI option.
     * @params { ?ResourceStr } secondaryUri - Secondary URI option.
     * @returns { RatingAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func starStyle(backgroundUri!: ?ResourceStr, foregroundUri!: ?ResourceStr, secondaryUri!: ?ResourceStr): RatingAttribute

    /**
     * Called when the star rating of the operation scoring bar changes.
     *
     * @params { ?(Float64) -> Unit } callback
     * @returns { RatingAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Float64) -> Unit): RatingAttribute
}
