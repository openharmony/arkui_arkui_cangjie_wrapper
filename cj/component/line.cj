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
    func FfiOHOSAceFrameworkLineCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkLineSetStart(x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkLineSetEnd(x: Float64, y: Float64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Line <: ShapeComponent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Length, height!: Length) {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkLineCreate(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
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
    public init() {
        this(width: 0.vp, height: 0.vp)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func startPoint(value: (Float64, Float64)): This {
        unsafe {
            FfiOHOSAceFrameworkLineSetStart(value[0], value[1])
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
    public func startPoint(value: (Int64, Int64)): This {
        startPoint((Float64(value[0]), Float64(value[1])))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func endPoint(value: (Float64, Float64)): This {
        unsafe {
            FfiOHOSAceFrameworkLineSetEnd(value[0], value[1])
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
    public func endPoint(value: (Int64, Int64)): This {
        endPoint((Float64(value[0]), Float64(value[1])))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func initial() {}
}
