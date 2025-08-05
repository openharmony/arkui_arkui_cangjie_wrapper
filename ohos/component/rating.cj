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

package ohos.component

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
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Rating <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(rating!: Float64, indicator!: Bool = false) {
        unsafe {
            FfiOHOSAceFrameworkRatingCreate(rating, indicator)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(rating!: Int64, indicator!: Bool = false) {
        this(rating: Float64(rating), indicator: indicator)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stars(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkRatingSetStars(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stepSize(value: Float64): This {
        // When the parameter value is less than or equal to 0, use the default value of 0.5
        if (value <= 0.0) {
            return this
        }
        unsafe {
            FfiOHOSAceFrameworkRatingSetStepSize(value)
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stepSize(value: Int64): This {
        stepSize(Float64(value))
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func starStyle(backgroundUri!: String, foregroundUri!: String, secondaryUri!: String = backgroundUri): This {
        unsafe {
            try (unsafeBackgroundUri = LibC.mallocCString(backgroundUri).asResource(),
                unsafeForegroundUri = LibC.mallocCString(foregroundUri).asResource(),
                unsafeSecondaryUri = LibC.mallocCString(secondaryUri).asResource()) {
                FfiOHOSAceFrameworkRatingSetStarStyle(unsafeBackgroundUri.value, unsafeForegroundUri.value,
                    unsafeSecondaryUri.value)
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Float64) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRatingSetOnChange(Callback1Param<Float64, Unit>(callback).getID())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: () -> Unit): This {
        onChange {
            _: Float64 => callback()
        }
        this
    }
}
