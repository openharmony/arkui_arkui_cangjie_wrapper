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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.curves

import ohos.arkui.component.{Curve}
import ohos.ffi.{RemoteDataLite, Callback1Param, releaseFFIData}
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Curves {
    /**
     * Creates a step curve.
     *
     * @param { Int32 } count - Number of steps. The value must be a positive integer.<br>Value range: [1, +∞).
     *     <p>**NOTE**:
     *     <br>A value less than 1 evaluates to the value **1**.
     *     </p>
     * @param { Bool } end - Whether jumping occurs when the interpolation ends.
     *     **true**: Jumping occurs when the interpolation ends.
     *     **false**: Jumping occurs when the interpolation starts.
     * @returns { ICurve } Interpolation curve.
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
     * @param { Float32 } x1 - X coordinate of the first point on the Bezier curve.<br>Value range: [0, 1].
     *     <p>**NOTE**:
     *     <br>A value less than 0 is handed as **0**. A value greater than 1 is handed as **1**.
     *     </p>
     * @param { Float32 } y1 - Y coordinate of the first point on the Bezier curve.<br>Value range: (-∞, +∞).
     * @param { Float32 } x2 - X coordinate of the second point on the Bezier curve.<br>Value range: [0, 1].
     *     <p>**NOTE**:
     *     <br>A value less than 0 is handed as **0**. A value greater than 1 is handed as **1**.
     *     </p>
     * @param { Float32 } y2 - Y coordinate of the second point on the Bezier curve.<br>Value range: (-∞, +∞).
     * @returns { ICurve } Interpolation curve.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func cubicBezierCurve(x1: Float32, y1: Float32, x2: Float32, y2: Float32): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateCubicBezierCurve(x1, y1, x2, y2) })
    }

    /**
     * Creates a spring curve. The curve shape is subject to the spring parameters, and the animation duration
     * is subject to the **duration** parameter in **animation** and **animateTo**.
     *
     * @param { Float32 } velocity - Initial velocity.
     *     It is applied by external factors to the spring animation,
     *     designed to help ensure the smooth transition from the previous motion state.
     *     The velocity is the normalized velocity, and its value is equal to the actual velocity at the beginning of
     *     the animation divided by the animation attribute change value.
     *     Value range: (-∞, +∞).
     * @param { Float32 } mass - Mass
     *     which influences the inertia in the spring system.
     *     The greater the mass, the greater the amplitude of the oscillation,
     *     and the slower the speed of restoring to the equilibrium position.
     *     Value range: (0, +∞).
     *     <p>**NOTE**:
     *     <br>If this parameter is set to a value less than or equal to 0, the value 1 is used.
     *     </p>
     * @param { Float32 } stiffness - Stiffness.
     *     It is the degree to which an object deforms by resisting the force applied.
     *     In an elastic system, the greater the stiffness, the stronger the ability to resist deformation,
     *     and the faster the speed of restoring to the equilibrium position.Value range: (0, +∞).
     *     <p>**NOTE**:
     *     <br>If this parameter is set to a value less than or equal to 0, the value 1 is used.
     *     </p>
     * @param { Float32 } damping -Damping. It is used to describe the oscillation and attenuation of the system
     *     after being disturbed. The larger the damping, the smaller the number of oscillations of elastic motion,
     *     and the smaller the oscillation amplitude.Value range: (0, +∞).
     *     <p>**NOTE**:
     *     <br>If this parameter is set to a value less than or equal to 0, the value 1 is used.
     *     </p>
     * @returns { ICurve } Interpolation curve.
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
     * @param { Float32 } response - Duration of one complete oscillation.
     * @param { Float32 } dampingFraction - Damping coefficient.
     * @param { Float32 } overlapDuration - Duration for animations to overlap, in seconds.
     * @returns { ICurve }
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
     * @param { Float32 } response - See **response** in **springMotion**.<br>Default value: **0.15**.
     * @param { Float32 } dampingFraction - See **dampingFraction** in **springMotion**.<br>Default value: **0.86**.
     * @param { Float32 } overlapDuration - See **overlapDuration** in **springMotion**.<br>Default value: **0.25**.
     * @returns { ICurve }
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
     * @param { Float32 } velocity - Initial velocity.
     * @param { Float32 } mass - Mass, which influences the inertia in the spring system.
     * @param { Float32 } stiffness - Stiffness.
     * @param { Float32 } damping - Damping.
     * @returns { ICurve }
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
     * @param { Curve } curve - Curve type.
     * @default Curve.Linear
     * @returns { ICurve }
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
     * @param { (Float32) -> Float32 } interpolate - Custom interpolation callback.
     * @returns { ICurve } Interpolation curve.
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
     * @param { Float32 } fraction - Indicates the current normalized time parameter. Value range: [0, 1].
     * @returns { Float32 }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func interpolate(fraction: Float32): Float32 {
        return unsafe { FfiOHOSAceFrameworkCurvesInterpolate(getID(), fraction) }
    }
}
