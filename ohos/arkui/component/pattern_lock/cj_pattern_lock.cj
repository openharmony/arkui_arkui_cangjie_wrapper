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

package ohos.arkui.component.pattern_lock

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.arkui.component.view.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
struct CJCircleStyleOptions {
    CJCircleStyleOptions(
        let color: UInt32,
        let radius: Float64,
        let radiusUnit: Int32,
        let enableWaveEffect: Bool
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkPatternLockCreate(controller: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockActivateCircleStyle(options: CJCircleStyleOptions): Unit

    func FfiOHOSAceFrameworkPatternLockonDotConnect(callback: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockOnPatternComplete(callback: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockAutoReset(value: Bool): Unit

    func FfiOHOSAceFrameworkPatternLockPathColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockActiveColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockRegularColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockCircleRadius(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPatternLockSideLength(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPatternLockStrokeWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPatternLockControllerCreate(): Int64

    func FfiOHOSAceFrameworkPatternLockControllerReset(selfID: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockControllerSetChallengeResult(selfID: Int64, challengeResult: Int64): Unit
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PatternLockController <: RemoteDataLite {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe { FfiOHOSAceFrameworkPatternLockControllerCreate() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset() {
        unsafe {
            FfiOHOSAceFrameworkPatternLockControllerReset(this.getID())
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PatternLock <: ViewBase {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkPatternLockCreate(-1)
        }
    }
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller: PatternLockController) {
        unsafe {
            FfiOHOSAceFrameworkPatternLockCreate(controller.getID())
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(color: Color): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockSelectedColor(color.toUInt32())
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pathColor(color: Color): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockPathColor(color.toUInt32())
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func activeColor(color: Color): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockActiveColor(color.toUInt32())
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func regularColor(color: Color): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockRegularColor(color.toUInt32())
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoReset(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockAutoReset(value)
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func circleRadius(value: Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockCircleRadius(transAppResourceToLength(value).value,
                transAppResourceToLength(value).unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideLength(value: Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockSideLength(transAppResourceToLength(value).value,
                transAppResourceToLength(value).unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pathStrokeWidth(value: Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockStrokeWidth(transAppResourceToLength(value).value,
                transAppResourceToLength(value).unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPatternComplete(callback: (Array<Int32>) -> Unit): This {
        let wrapper = {
            ffiVector: VectorInt32Handle =>
            let handle = FFIVectorInt32(ffiVector)
            var arr: Array<Int32> = Array<Int32>(handle.getSize()) {
                idx => handle.getElement(idx)
            }
            callback(arr)
        }
        let lambdaData = Callback1Param<VectorInt32Handle, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkPatternLockOnPatternComplete(lambdaData.getID())
        }
        this
    }
}
