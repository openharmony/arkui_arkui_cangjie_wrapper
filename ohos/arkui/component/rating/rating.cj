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
 * 
 * @relation declare const Rating: RatingInterface
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Rating <: CommonMethodComponent<RatingAttribute> & RatingAttribute {
    /**
     * Create a Rating.
     *
     * @params { Float64 } rating
     * @params { Bool } indicator
     * @returns { This }
     * @relation (options?: RatingOptions): RatingAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(rating!: ?Float64, indicator!: ?Bool = None) {
        unsafe {
            FfiOHOSAceFrameworkRatingCreate(rating ?? 0.0, indicator ?? false)
        }
    }

    /**
     * Called when the total number of stars is set.
     * 
     * @param { Int32 } value
     * @returns { This }
     * @relation stars(value: number): RatingAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stars(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkRatingSetStars(value ?? 5)
        }
        this
    }

    /**
     * Called when the step size of the operation rating.
     *
     * @param { Float64 } size
     * @returns { This }
     * @relation stepSize(value: number): RatingAttribute
     */
    @!APILevel[
        22,
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
     * Called when a picture is set.
     *
     * @param { ResourceStr } backgroundUri - Background URI option.
     * @param { ResourceStr } foregroundUri - Foreground URI option.
     * @param { ResourceStr } secondaryUri - Secondary URI option.
     * @returns { This }
     * @relation starStyle(options: StarStyleOptions): RatingAttribute
     */
    @!APILevel[
        22,
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
                unsafeForegroundUri = LibC.mallocCString(backgroundUri_).asResource(),
                unsafeSecondaryUri = LibC.mallocCString(backgroundUri_).asResource()) {
                FfiOHOSAceFrameworkRatingSetStarStyle(unsafeBackgroundUri.value, unsafeForegroundUri.value,
                    unsafeSecondaryUri.value)
            }
        }
        this
    }

    /**
     * Called when the star rating of the operation scoring bar changes.
     *
     * @param { (Float64) -> Unit } callback
     * @returns { This }
     * @relation onChange(callback: (value: number) => void): RatingAttribute
     */
    @!APILevel[
        22,
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
