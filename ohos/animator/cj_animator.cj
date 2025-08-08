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

package ohos.animator

import ohos.base.*
import ohos.ffi.*
import ohos.component.*
import ohos.labels.APILevel

foreign {
    func FfiAnimatorCreate(option: CAnimatorOptions): Int64

    func FfiAnimatorReset(id: Int64, option: CAnimatorOptions): Int32

    func FfiAnimatorPlay(id: Int64): Int32

    func FfiAnimatorFinish(id: Int64): Int32

    func FfiAnimatorPause(id: Int64): Int32

    func FfiAnimatorCancel(id: Int64): Int32

    func FfiAnimatorReverse(id: Int64): Int32

    func FfiAnimatorSetExpectedFrameRateRange(id: Int64, minVal: Int32, maxVal: Int32, exceptedVal: Int32): Int32

    func FfiAnimatorOnframe(id: Int64, funcId: Int64): Int32

    func FfiAnimatorOncancel(id: Int64, funcId: Int64): Int32

    func FfiAnimatorOnfinish(id: Int64, funcId: Int64): Int32

    func FfiAnimatorOnrepeat(id: Int64, funcId: Int64): Int32

    func FfiAnimatorOnFrame(id: Int64, funcId: Int64): Int32

    func FfiAnimatorOnCancel(id: Int64, funcId: Int64): Int32

    func FfiAnimatorOnFinish(id: Int64, funcId: Int64): Int32

    func FfiAnimatorOnRepeat(id: Int64, funcId: Int64): Int32
}

@C
struct CAnimatorOptions {
    CAnimatorOptions(
        let duration!: Int32,
        let easing!: CString,
        let delay!: Int32,
        let fill!: CString,
        let direction!: CString,
        let iterations!: Int32,
        let begin!: Float64,
        let end!: Float64
    ) {}

    func freeCStringMember(): Unit {
        unsafe {
            LibC.free(easing)
            LibC.free(fill)
            LibC.free(direction)
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimatorFill {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forwards
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Backwards
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Both
    | ...

    func toString(): String {
        match (this) {
            case None => "none"
            case Forwards => "forwards"
            case Backwards => "backwards"
            case Both => "both"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimatorDirection {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Reverse
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alternate
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AlternateReverse
    | ...

    func toString(): String {
        match (this) {
            case Normal => "normal"
            case Reverse => "reverse"
            case Alternate => "alternate"
            case AlternateReverse => "alternate-reverse"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimatorOptions {
    public AnimatorOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let duration!: Int32 = 0,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let easing!: String = "ease",
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let delay!: Int32 = 0,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let fill!: AnimatorFill = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let direction!: AnimatorDirection = Normal,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let iterations!: Int32 = 0,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let begin!: Float64 = 0.0,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let end!: Float64 = 1.0
    ) {}

    func toCAnimatorOptions(): CAnimatorOptions {
        unsafe {
            return CAnimatorOptions(
                duration: duration,
                easing: LibC.mallocCString(easing),
                delay: delay,
                fill: LibC.mallocCString(fill.toString()),
                direction: LibC.mallocCString(direction.toString()),
                iterations: iterations,
                begin: begin,
                end: end
            )
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimatorResult <: RemoteDataLite {
    var onframe_: (Float64) -> Unit = {_ =>}
    var onfinish_: () -> Unit = {=>}
    var oncancel_: () -> Unit = {=>}
    var onrepeat_: () -> Unit = {=>}
    var onFrame_: (Float64) -> Unit = {_ =>}
    var onFinish_: () -> Unit = {=>}
    var onCancel_: () -> Unit = {=>}
    var onRepeat_: () -> Unit = {=>}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: AnimatorOptions) {
        super(unsafe {
            let opt = options.toCAnimatorOptions()
            let id = FfiAnimatorCreate(opt)
            opt.freeCStringMember()
            id
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onframe: (Float64) -> Unit {
        get() {
            return onframe_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback1Param<Float64, Unit>(callback)
                let errCode = FfiAnimatorOnframe(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                onframe_ = callback
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onFrame: (Float64) -> Unit {
        get() {
            return onFrame_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback1Param<Float64, Unit>(callback)
                let errCode = FfiAnimatorOnFrame(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                onFrame_ = callback
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onfinish: () -> Unit {
        get() {
            return onfinish_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback0Param<Unit>(callback)
                let errCode = FfiAnimatorOnfinish(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                onfinish_ = callback
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onFinish: () -> Unit {
        get() {
            return onFinish_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback0Param<Unit>(callback)
                let errCode = FfiAnimatorOnFinish(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                onFinish_ = callback
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop oncancel: () -> Unit {
        get() {
            return oncancel_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback0Param<Unit>(callback)
                let errCode = FfiAnimatorOncancel(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                oncancel_ = callback
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onCancel: () -> Unit {
        get() {
            return onCancel_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback0Param<Unit>(callback)
                let errCode = FfiAnimatorOnCancel(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                onCancel_ = callback
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onrepeat: () -> Unit {
        get() {
            return onrepeat_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback0Param<Unit>(callback)
                let errCode = FfiAnimatorOnrepeat(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                onrepeat_ = callback
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop onRepeat: () -> Unit {
        get() {
            return onRepeat_
        }
        set(callback) {
            unsafe {
                let lambdaData = Callback0Param<Unit>(callback)
                let errCode = FfiAnimatorOnRepeat(getID(), lambdaData.getID())
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
                onRepeat_ = callback
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(options: AnimatorOptions): Unit {
        unsafe {
            let opt = options.toCAnimatorOptions()
            let errCode = FfiAnimatorReset(getID(), opt)
            opt.freeCStringMember()
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func play(): Unit {
        unsafe {
            let errCode = FfiAnimatorPlay(getID())
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func finish(): Unit {
        unsafe {
            let errCode = FfiAnimatorFinish(getID())
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pause(): Unit {
        unsafe {
            let errCode = FfiAnimatorPause(getID())
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cancel(): Unit {
        unsafe {
            let errCode = FfiAnimatorCancel(getID())
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reverse(): Unit {
        unsafe {
            let errCode = FfiAnimatorReverse(getID())
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
            }
        }
    }

    func checkExpectedFrameRateRange(framerateRange: ExpectedFrameRateRange): ExpectedFrameRateRange {
        if (framerateRange.min > framerateRange.max || framerateRange.min > framerateRange.expected ||
            framerateRange.expected > framerateRange.max) {
            let framerateRangeFault: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 60, max: 120, expected: 60)
            return framerateRangeFault
        }
        if (framerateRange.min <= 0 || framerateRange.max <= 0 || framerateRange.expected <= 0) {
            let framerateRangeFault: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 60, max: 120, expected: 60)
            return framerateRangeFault
        }
        if (framerateRange.min > 144 || framerateRange.max > 144 || framerateRange.expected > 144) {
            let framerateRangeFault: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 60, max: 120, expected: 60)
            return framerateRangeFault
        }
        return framerateRange
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setExpectedFrameRateRange(framerateRange: ExpectedFrameRateRange): Unit {
        let checkFrameRateRange = checkExpectedFrameRateRange(framerateRange)
        unsafe {
            let errCode = FfiAnimatorSetExpectedFrameRateRange(getID(), checkFrameRateRange.min, checkFrameRateRange.max,
                checkFrameRateRange.expected)
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult setFramerate failed: Internal error.")
            }
        }
    }
}
