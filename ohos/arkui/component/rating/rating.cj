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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.rating

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.resource.*

foreign {
    func FfiOHOSAceFrameworkRatingCreate(rating: Float64, indicator: Bool): Unit

    func FfiOHOSAceFrameworkRatingSetStars(value: Int32): Unit

    func FfiOHOSAceFrameworkRatingSetStepSize(value: Float64): Unit

    func FfiOHOSAceFrameworkRatingSetStarStyle(
        backgroundUri: CString,
        foregroundUri: CString,
        secondaryUri: CString
    ): Unit

    func FfiOHOSAceFrameworkRatingSetOnChange(callback: Int64): Unit
}

/**
 * Defines Rating Component.
 * A component that allows users to rate by clicking or sliding stars, commonly used for product ratings or feedback collection.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Rating <: CommonMethodComponent<Rating> & RatingAttribute {
    /**
     * Initializes a Rating component with optional initial rating value and indicator mode.
     *
     * @param { ?Float64 } rating - Current rating value.
     * @param { ?Bool } indicator - Whether the rating component is used as indicator (read-only mode).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(rating!: ?Float64, indicator!: ?Bool = None) {
        unsafe {
            FfiOHOSAceFrameworkRatingCreate(rating ?? 0.0, indicator ?? false)
        }
    }

    /**
     * Configures the total number of stars to display in the rating component.
     * 
     * @param { ?Int32 } value - Number of stars.
     * @returns { This } Returns the Rating instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stars(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkRatingSetStars(value ?? 5)
        }
        this
    }

    /**
     * Configures the increment step size when changing the rating value.
     *
     * @param { ?Float64 } size - Step size for rating changes.
     * @returns { This } Returns the Rating instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stepSize(size: ?Float64): This {
        let tmpSize = size ?? 0.5
        // When the parameter value is less than or equal to 0, use the default value of 0.5
        if (tmpSize <= 0.0) {
            return this
        }
        unsafe {
            FfiOHOSAceFrameworkRatingSetStepSize(tmpSize)
        }
        this
    }

    /**
     * Configures custom images for the rating stars.
     *
     * @param { ?ResourceStr } backgroundUri - Background URI option for unselected stars.
     * @param { ?ResourceStr } foregroundUri - Foreground URI option for selected stars.
     * @param { ?ResourceStr } secondaryUri - Secondary URI option for partially selected stars.
     * @returns { This } Returns the Rating instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func starStyle(backgroundUri!: ?ResourceStr, foregroundUri!: ?ResourceStr, secondaryUri!: ?ResourceStr = None): This {
        let tmpBackgroundUri = backgroundUri ?? ""
        let tmpForegroundUri = foregroundUri ?? ""
        let backgroundUri_ = transResourceStrToString(tmpBackgroundUri)
        let foregroundUri_ = transResourceStrToString(tmpForegroundUri)
        let secondaryUri_ = transResourceStrToString(secondaryUri ?? tmpBackgroundUri)
        unsafe {
            try (unsafeBackgroundUri = LibC.mallocCString(backgroundUri_).asResource(),
                unsafeForegroundUri = LibC.mallocCString(foregroundUri_).asResource(),
                unsafeSecondaryUri = LibC.mallocCString(secondaryUri_).asResource()) {
                FfiOHOSAceFrameworkRatingSetStarStyle(unsafeBackgroundUri.value, unsafeForegroundUri.value,
                    unsafeSecondaryUri.value)
            }
        }
        this
    }

    /**
     * Triggered when the user changes the rating value by clicking or sliding.
     *
     * @param { ?(Float64) -> Unit } callback - Callback function when rating changes.
     * The parameter is the new rating value.
     * @returns { This } Returns the Rating instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(Float64) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        unsafe {
            FfiOHOSAceFrameworkRatingSetOnChange(Callback1Param<Float64, Unit>(tmpCallback).getID())
        }
        this
    }
}
