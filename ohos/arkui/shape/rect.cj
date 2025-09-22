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

package ohos.arkui.shape

import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRectInsCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Int64

    func FfiOHOSAceFrameworkRectSetInsRadiusWidth(shapeId: Int64, radiusWidth: Float64, radiusWidthUnit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetInsRadiusHeight(shapeId: Int64, radiusHeight: Float64, radiusHeightUnit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetInsRadius(shapeId: Int64, radius: Float64, radiusUnit: Int32): Unit
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RectShape <: BaseShape {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: ?Length = None, height!: ?Length = None) {
        super(
            unsafe {
                var width_ = transAppResourceToLength(width ?? 0.vp)
                var height_ = transAppResourceToLength(height ?? 0.vp)
                FfiOHOSAceFrameworkRectInsCreate(
                    width_.value,
                    width_.unitType.getValue(),
                    height_.value,
                    height_.unitType.getValue()
                )
            })
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusWidth(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRectSetInsRadiusWidth(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusHeight(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRectSetInsRadiusHeight(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRectSetInsRadius(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }
}
