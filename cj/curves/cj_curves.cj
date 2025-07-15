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
import ohos.component.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign func FfiOHOSAceFrameworkCurvesCreateStepsCurve(count: Int64, end: Bool): Int64

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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Curves {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func stepsCurve(count: Int64, end: Bool): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateStepsCurve(count, end) })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func cubicBezierCurve(x1: Float32, y1: Float32, x2: Float32, y2: Float32): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateCubicBezierCurve(x1, y1, x2, y2) })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func springCurve(velocity: Float32, mass: Float32, stiffness: Float32, damping: Float32): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateSpringCurve(velocity, mass, stiffness, damping) })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func springMotion(response!: Float32 = 0.55, damping!: Float32 = 0.825,
        overlapDuration!: Float32 = 0.0): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateSpringMotion(response, damping, overlapDuration) })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func responsiveSpringMotion(response!: Float32 = 0.15, dampingFraction!: Float32 = 0.86,
        overlapDuration!: Float32 = 0.25): ICurve {
        return ICurve(
            unsafe { FfiOHOSAceFrameworkCurvesCreateResponsiveSpringMotion(response, dampingFraction, overlapDuration) })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func interpolatingSpring(velocity: Float32, mass: Float32, stiffness: Float32, damping: Float32): ICurve {
        return ICurve(unsafe { FfiOHOSAceFrameworkCurvesCreateInterpolatingSpring(velocity, mass, stiffness, damping) })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func initCurve(curve!: Curve = Curve.Linear): ICurve {
        unsafe {
            let aniTimFunc = LibC.mallocCString(getValue(curve))
            let id = FfiOHOSAceFrameworkCurvesInitCurve(aniTimFunc)
            LibC.free(aniTimFunc)
            return ICurve(id)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
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
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func interpolate(fraction: Float32): Float32 {
        return unsafe { FfiOHOSAceFrameworkCurvesInterpolate(getID(), fraction) }
    }
}
