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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Rating <: ViewBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(rating!: Float64, indicator!: Bool = false) {
        unsafe {
            FfiOHOSAceFrameworkRatingCreate(rating, indicator)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stars(starCount: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkRatingSetStars(starCount)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stepSize(size: Float64): This {
        // When the parameter value is less than or equal to 0, use the default value of 0.5
        if (size <= 0.0) {
            return this
        }
        unsafe {
            FfiOHOSAceFrameworkRatingSetStepSize(size)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func starStyle(backgroundUri!: ResourceStr, foregroundUri!: ResourceStr, secondaryUri!: ResourceStr = backgroundUri): This {
        let backgroundUri_ = transResourceStrToString(backgroundUri)
        let foregroundUri_ = transResourceStrToString(foregroundUri)
        let secondaryUri_ = transResourceStrToString(secondaryUri)
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Float64) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRatingSetOnChange(Callback1Param<Float64, Unit>(callback).getID())
        }
        this
    }
}
