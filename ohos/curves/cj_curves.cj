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

package ohos.curves

import ohos.base.*
import ohos.arkui.component.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.business_exception.BusinessException

foreign func FfiOHOSAceFrameworkCurvesCreateStepsCurve(count: Int32, end: Bool): Int64

foreign func FfiOHOSAceFrameworkCurvesCreateCubicBezierCurve(x1: Float32, y1: Float32, x2: Float32, y2: Float32): Int64

foreign func FfiOHOSAceFrameworkCurvesCreateSpringCurve(velocity: Float32, mass: Float32, stiffness: Float32,
    damping: Float32): Int64

foreign func FfiOHOSAceFrameworkCurvesCreateInterpolatingSpring(velocity: Float32, mass: Float32, stiffness: Float32,
    damping: Float32): Int64

foreign func FfiOHOSAceFrameworkCurvesCreateSpringMotion(response: Float32, dampingFraction: Float32,
    overlapDuration: Float32): Int64

foreign func FfiOHOSAceFrameworkCurvesCreateResponsiveSpringMotion(response: Float32, dampingFraction: Float32,
    overlapDuration: Float32): Int64

foreign func FfiOHOSAceFrameworkCurvesInitCurve(aniTimFunc: CString): Int64

foreign func FfiOHOSAceFrameworkCurvesCreateCustomCurve(callback: Int64): Int64

foreign func FfiOHOSAceFrameworkCurvesInterpolate(id: Int64, fraction: Float32): Float32

/**
 * Contains interpolator functions such as initialization, third-order Bezier curves, and spring curves.
 *
 * @relation curves
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Curves {

    /**
     * Creates a step curve.
     *
     * @param { Int32 } count
     * @param { Bool } end
     * @returns { ICurve }
     * @relation stepsCurve(count: number, end: boolean): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func stepsCurve(count: Int32, end: Bool): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateStepsCurve(count, end) })
    }

    /**
     * Creates a cubic Bezier curve. The curve values must be between 0 and 1.
     *
     * @param { Float32 } x1
     * @param { Float32 } y1
     * @param { Float32 } x2
     * @param { Float32 } y2
     * @returns { ICurve }
     * @relation cubicBezierCurve(x1: number, y1: number, x2: number, y2: number): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func cubicBezierCurve(x1: Float32, y1: Float32, x2: Float32, y2: Float32): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateCubicBezierCurve(x1, y1, x2, y2) })
    }

    /**
     * Creates a spring curve.
     *
     * @param { Float32 } velocity
     * @param { Float32 } mass
     * @param { Float32 } stiffness
     * @param { Float32 } damping
     * @returns { ICurve }
     * @relation springCurve(velocity: number, mass: number, stiffness: number, damping: number): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func springCurve(velocity: Float32, mass: Float32, stiffness: Float32, damping: Float32): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateSpringCurve(velocity, mass, stiffness, damping) })
    }

    /**
     * Creates a spring curve. The curve shape is subject to the spring parameters, and the animation duration
     * is subject to the **duration** parameter in **animation** and **animateTo**.
     *
     * @param { Float32 } response
     * @param { Float32 } dampingFraction
     * @param { Float32 } overlapDuration
     * @returns { ICurve }
     * @relation springMotion(response?: number, dampingFraction?: number, overlapDuration?: number): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func springMotion(response!: Float32 = 0.55, dampingFraction!: Float32 = 0.825,
        overlapDuration!: Float32 = 0.0): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateSpringMotion(response, dampingFraction, overlapDuration) })
    }

    /**
     * Creates a responsive spring animation curve. It is a special case of springMotion,
     * with the only difference in the default values. It can be used together with **springMotion**.
     *
     * @param { Float32 } response
     * @param { Float32 } dampingFraction
     * @param { Float32 } overlapDuration
     * @returns { ICurve }
     * @relation responsiveSpringMotion(response?: number, dampingFraction?: number, overlapDuration?: number): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func responsiveSpringMotion(response!: Float32 = 0.15, dampingFraction!: Float32 = 0.86,
        overlapDuration!: Float32 = 0.25): ICurve {
        return ICurve(
            unsafe { FfiOHOSAceFrameworkCurvesCreateResponsiveSpringMotion(response, dampingFraction, overlapDuration) })
    }

    /**
     * Creates an interpolating spring curve animated from 0 to 1. The actual animation value is calculated based
     * on the curve. The animation duration is subject to the curve parameters, rather than the **duration** parameter
     * in **animation** or **animateTo**.
     *
     * @param { Float32 } velocity
     * @param { Float32 } mass
     * @param { Float32 } stiffness
     * @param { Float32 } damping
     * @returns { ICurve }
     * @relation interpolatingSpring(velocity: number, mass: number, stiffness: number, damping: number): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func interpolatingSpring(velocity: Float32, mass: Float32, stiffness: Float32, damping: Float32): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateInterpolatingSpring(velocity, mass, stiffness, damping) })
    }

    /**
     * Implements initialization for the interpolation curve,
     * which is used to create an interpolation curve based on the input parameter.
     *
     * @param { Curve } curve
     * @returns { ICurve }
     * @relation initCurve(curve?: Curve): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func initCurve(curve!: Curve = Curve.Linear): ICurve {
        unsafe {
            var id: Int64 = 0
            try (aniTimFunc = LibC.mallocCString(getValue(curve)).asResource()) {
                id = FfiOHOSAceFrameworkCurvesInitCurve(aniTimFunc.value)
            }
            return ICurve(id)
        }
    }

    /**
     * Creates a custom curve.
     *
     * @param { (Float32) -> Float32 } interpolate
     * @returns { ICurve }
     * @relation customCurve(interpolate: (fraction: number) => number): ICurve
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func customCurve(interpolate: (Float32) -> Float32): ICurve {
        let lambdaData = Callback1Param<Float32, Float32>(interpolate)
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateCustomCurve(lambdaData.getID()) })
    }

    static func getValue(curve: Curve): String {
        match (curve) {
            case Linear => "linear"
            case Ease => "ease"
            case EaseIn => "ease-in"
            case EaseOut => "ease-out"
            case EaseInOut => "ease-in-out"
            case FastOutSlowIn => "fast-out-slow-in"
            case LinearOutSlowIn => "linear-out-slow-in"
            case FastOutLinearIn => "fast-out-linear-in"
            case ExtremeDeceleration => "extreme-deceleration"
            case Sharp => "sharp"
            case Rhythm => "rhythm"
            case Smooth => "smooth"
            case Friction => "friction"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Interface for curve object.
 *
 * @relation ICurve
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ICurve <: RemoteDataLite {
    init(id: Int64) {
        super(unsafe {
            id
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get curve value by fraction.
     *
     * @param { Float32 } fraction
     * @returns { Float32 }
     * @relation interpolate(fraction: number): number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func interpolate(fraction: Float32): Float32 {
        return unsafe { FfiOHOSAceFrameworkCurvesInterpolate(getID(), fraction) }
    }
}
