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

protected package ohos.arkui.ui_context.animator

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.business_exception.BusinessException
import std.deriving.Derive
import ohos.arkui.component.common.*

foreign {
    func FfiAnimatorCreate(option: CAnimatorOptions): Int64

    func FfiAnimatorReset(id: Int64, option: CAnimatorOptions): Int32

    func FfiAnimatorPlay(id: Int64): Int32

    func FfiAnimatorFinish(id: Int64): Int32

    func FfiAnimatorPause(id: Int64): Int32

    func FfiAnimatorCancel(id: Int64): Int32

    func FfiAnimatorReverse(id: Int64): Int32

    func FfiAnimatorSetExpectedFrameRateRange(id: Int64, minVal: Int32, maxVal: Int32, exceptedVal: Int32): Int32

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
}

protected class Animator {
    protected static func create(options: AnimatorOptions): AnimatorResult {
        return AnimatorResult(options)
    }
}

/**
 * Whether to resume to the initial state after the animation is executed.
 *
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimatorFill {
    /**
     * The initial state is restored after the animation is executed.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    /**
     * The state at the end of the animation (defined in the last key frame) is retained after the animation is executed.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forwards
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Backwards
    | @!APILevel[
        22,
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The animation playback mode.
 * The default value is "normal".
 *
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimatorDirection {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Reverse
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alternate
    | @!APILevel[
        22,
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the animator options.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimatorOptions {
    /**
     * Delay for the animation start. The default value indicates no delay.
     * The default value is 0.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: Int32

    /**
     * Time curve of the animation. For details about the supported types.
     * linear The animation speed keeps unchanged.
     * ease The animation starts and ends at a low speed, cubic-bezier(0.25, 0.1, 0.25, 1.0).
     * ease-in The animation starts at a low speed, cubic-bezier(0.42, 0.0, 1.0, 1.0).
     * ease-out The animation ends at a low speed, cubic-bezier(0.0, 0.0, 0.58, 1.0).
     * ease-in-out The animation starts and ends at a low speed, cubic-bezier(0.42, 0.0, 0.58, 1.0).
     * fast-out-slow-in Standard curve, cubic-bezier(0.4, 0.0, 0.2, 1.0).
     * linear-out-slow-in Deceleration curve, cubic-bezier(0.0, 0.0, 0.2, 1.0).
     * fast-out-linear-in Acceleration curve, cubic-bezier(0.4, 0.0, 1.0, 1.0).
     * friction Damping curve, cubic-bezier(0.2, 0.0, 0.2, 1.0).
     * extreme-deceleration Extreme deceleration curve, cubic-bezier(0.0, 0.0, 0.0, 1.0).
     * sharp Sharp curve, cubic-bezier(0.33, 0.0, 0.67, 1.0).
     * rhythm Rhythm curve, cubic-bezier(0.7, 0.0, 0.2, 1.0).
     * smooth Smooth curve, cubic-bezier(0.4, 0.0, 0.4, 1.0).
     * cubic-bezier(x1, y1, x2, y2) You can customize an animation speed curve in the cubic-bezier() function. The x and y values of each input parameter must be between 0 and 1.
     * Step curve. The number must be set and only an integer is supported, step-position is optional. It can be set to start or end. The default value is end.
     * interpolating-spring(velocity, mass, stiffness, damping), interpolating spring curve.
     * The default value is ease.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var easing: String
    /**
     * Delay for the animation start. The default value indicates no delay.
     * The default value is 0.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: Int32
    /**
     * Whether to resume to the initial state after the animation is executed.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: AnimatorFill
    /**
     * The animation playback mode.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: AnimatorDirection
    /**
     * Number of times the animation will be played. number indicates a fixed number of playback operations, and -1 an unlimited number of playback operations.
     * The default value is 1.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var iterations: Int32
    /**
     * Starting point of animator interpolation.
     * The default value is 0.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var begin: Float64
    /**
     * Ending point of Dynamic Interpolation
     * The default value is 1.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: Float64

    /**
     * Create an animator options.
     *
     * @params { Int32 } duration - Duration of the animation, in milliseconds.
     * The default value is 0.
     * @params { String } easing - Time curve of the animation.
     * @params { Int32 } delay - Delay for the animation start. The default value indicates no delay.
     * The default value is 0.
     * @params { AnimatorFill } fill - Whether to resume to the initial state after the animation is executed.
     * @params { AnimatorDirection } direction - The animation playback mode.
     * @params { Int32 } iterations - Number of times the animation will be played. number indicates a fixed number of playback operations, and -1 an unlimited number of playback operations.
     * The default value is 1.
     * @params { Float64 } begin - Starting point of animator interpolation.
     * The default value is 0.
     * @params { Float64 } end - Ending point of Dynamic Interpolation.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: Int32,
        easing!: String,
        delay!: Int32,
        fill!: AnimatorFill,
        direction!: AnimatorDirection,
        iterations!: Int32,
        begin!: Float64,
        end!: Float64
    ) {
        this.duration = duration
        this.easing = easing
        this.delay = delay
        this.fill = fill
        this.direction = direction
        this.iterations = iterations
        this.begin = begin
        this.end = end
    }
}

/**
 * Defines the Animator result interface.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimatorResult <: RemoteDataLite {
    var onFrame_: (Float64) -> Unit = {_ =>}
    var onFinish_: () -> Unit = {=>}
    var onCancel_: () -> Unit = {=>}
    var onRepeat_: () -> Unit = {=>}

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    init(options: AnimatorOptions) {
        super(
            unsafe {
                var id: Int64 = 0
                try (easingStr = LibC.mallocCString(options.easing).asResource(),
                    fillStr = LibC.mallocCString(options.fill.toString()).asResource(),
                    directionStr = LibC.mallocCString(options.direction.toString()).asResource()) {
                    id = FfiAnimatorCreate(CAnimatorOptions(
                            duration: options.duration,
                            easing: easingStr.value,
                            delay: options.delay,
                            fill: fillStr.value,
                            direction: directionStr.value,
                            iterations: options.iterations,
                            begin: options.begin,
                            end: options.end))
                }
                id
            }
        )
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Trigger when vsync callback.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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
                    throw BusinessException(errCode, "Internal error: AnimatorResult play failed.")
                }
                onFrame_ = callback
            }
        }
    }

    /**
     * The animation is finished.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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

    /**
     * The animation is canceled.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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

    /**
     * The animation is repeated.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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

    /**
     * Reset the options for current animator.
     *
     * @params { AnimatorOptions } options
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(options: AnimatorOptions): Unit {
        unsafe {
            try (easingStr = LibC.mallocCString(options.easing).asResource(),
                fillStr = LibC.mallocCString(options.fill.toString()).asResource(),
                directionStr = LibC.mallocCString(options.direction.toString()).asResource()) {
                let errCode = FfiAnimatorReset(getID(), CAnimatorOptions(
                        duration: options.duration,
                        easing: easingStr.value,
                        delay: options.delay,
                        fill: fillStr.value,
                        direction: directionStr.value,
                        iterations: options.iterations,
                        begin: options.begin,
                        end: options.end))
                if (errCode != 0) {
                    throw BusinessException(errCode, "AnimatorResult play failed: Internal error.")
                }
            }
        }
    }

    /**
     * Start the animation.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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

    /**
     * Ends the animation.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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

    /**
     * Pauses the animation.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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

    /**
     * Cancels the animation.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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

    /**
     * Plays the animation in reverse direction.
     * Invalid when using interpolating-spring curve.
     *
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
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
        let tmpMin = framerateRange.min ?? -1
        let tmpMax = framerateRange.max ?? -1
        let tmpExpected = framerateRange.expected ?? -1
        if (tmpMin > tmpMax || tmpMin > tmpExpected || tmpExpected > tmpMax) {
            let framerateRangeFault: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 60, max: 120, expected: 60)
            return framerateRangeFault
        }
        if (tmpMin <= 0 || tmpMax <= 0 || tmpExpected <= 0) {
            let framerateRangeFault: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 60, max: 120, expected: 60)
            return framerateRangeFault
        }
        if (tmpMin > 144 || tmpMax > 144 || tmpExpected > 144) {
            let framerateRangeFault: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 60, max: 120, expected: 60)
            return framerateRangeFault
        }
        return framerateRange
    }

    /**
     * The expected frame rate of dynamical of rate range.
     *
     * @params { ExpectedFrameRateRange } rateRange
     * @throws { BusinessException } 100001 - Internal error. Possible causes:
     * <br> The specified page is not found or the object property list is not obtained.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setExpectedFrameRateRange(rateRange: ExpectedFrameRateRange): Unit {
        let checkFrameRateRange = checkExpectedFrameRateRange(rateRange)
        unsafe {
            let errCode = FfiAnimatorSetExpectedFrameRateRange(getID(), checkFrameRateRange.min ?? -1,
                checkFrameRateRange.max ?? -1,
                checkFrameRateRange.expected ?? -1)
            if (errCode != 0) {
                throw BusinessException(errCode, "AnimatorResult setFramerate failed: Internal error.")
            }
        }
    }
}
