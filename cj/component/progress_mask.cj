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
    func FfiOHOSAceFrameworkProgressMaskCreate(value: Float32, total: Float32, color: UInt32): Int64

    func FfiOHOSAceFrameworkProgressMaskUpdateProgress(selfId: Int64, value: Float32): Unit

    func FfiOHOSAceFrameworkProgressMaskUpdateColor(selfId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkProgressMaskEnableBreathingAnimation(selfId: Int64, value: Bool): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ProgressMask <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Float32, total!: Float32, color!: Color) {
        super(unsafe {
            FfiOHOSAceFrameworkProgressMaskCreate(value, total, color.toUInt32())
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateProgress(number: Float32): Unit {
        unsafe {
            FfiOHOSAceFrameworkProgressMaskUpdateProgress(this.getID(), number)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateColor(color: Color): Unit {
        unsafe {
            FfiOHOSAceFrameworkProgressMaskUpdateColor(this.getID(), color.toUInt32())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableBreathingAnimation(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkProgressMaskEnableBreathingAnimation(this.getID(), value)
        }
    }
}
