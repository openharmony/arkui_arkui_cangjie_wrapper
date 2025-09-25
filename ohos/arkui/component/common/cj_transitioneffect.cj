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

package ohos.arkui.component.common

import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive

foreign func FfiOHOSAceFrameworkTransitionEffectOpacity(number: Float64): Int64

foreign func FfiOHOSAceFrameworkTransitionEffectTranslate(options: CTranslateOptions): Int64

foreign func FfiOHOSAceFrameworkTransitionEffectScale(options: CScaleOptions): Int64

foreign func FfiOHOSAceFrameworkTransitionEffectRotate(options: CRotateOptions): Int64

foreign func FfiOHOSAceFrameworkTransitionEffectMove(edge: Int32): Int64

foreign func FfiOHOSAceFrameworkTransitionEffectAsymmetric(appearId: Int64, disappearId: Int64): Int64

foreign func FfiOHOSAceFrameworkTransitionEffectCombine(id: Int64, effectId: Int64): Unit

foreign func FfiOHOSAceFrameworkTransitionEffectAnimation(id: Int64, param: NativeAnimateParam): Unit

foreign func FfiOHOSAceFrameworkTransitionEffectIdentity(): Int64

foreign func FfiOHOSAceFrameworkTransitionEffectSlideSwitch(): Int64

/**
 * Defines the options of translate.
 *
 * @relation declare interface TranslateOptions
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TranslateOptions {

    /**
     * Translation distance along the x-axis.
     * For the number type, the unit is VP, and the value range is (-∞, +∞).
     * For the string type, the value follows the format of length string type.
     *
     * @type { Length }
     * @relation x?: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Length

    /**
     * Translation distance along the y-axis.
     * For the number type, the unit is VP, and the value range is (-∞, +∞).
     * For the string type, the value follows the format of length string type.
     *
     * @type { Length }
     * @relation y?: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Length

    /**
     * Distance to translate along the z-axis. The value is a floating
     * point number, the default value is 0.0, and the unit is px.
     *
     * @type { Length }
     * @relation z?: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: ?Length

    /**
     * TranslateOptions constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?Length = None, y!: ?Length = None, z!: ?Length = None) {
        this.x = transAppResourceToLength(x ?? 0.0.vp)
        this.y = transAppResourceToLength(y ?? 0.0.vp)
        this.z = transAppResourceToLength(z ?? 0.0.vp)
    }
}

/**
 * Defines the options of scale.
 *
 * @relation declare interface ScaleOptions
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleOptions {

    /**
     * Scale ratio along the x-axis.
     * x > 1: The component is scaled up along the x-axis.
     * 0 < x < 1: The component is scaled down along the x-axis.
     * x < 0: The component is scaled in the reverse direction of the x-axis.
     *
     * @type { Float32 }
     * @relation x?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float32

    /**
     * Scale ratio along the y-axis.
     * y > 1: The component is scaled up along the y-axis.
     * 0 < y < 1: The component is scaled down along the y-axis.
     * y < 0: The component is scaled in the reverse direction of the y-axis.
     *
     * @type { Float32 }
     * @relation y?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float32

    /**
     * Scale ratio along the z-axis. z > 1: The component is scaled up along the z-axis.
     * <br>0 < z < 1: The component is scaled down along the z-axis.
     * <br>z < 0: The component is scaled in the reverse direction of the z-axis.
     *
     * @type { Float32 }
     * @relation z?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: ?Float32

    /**
     * X coordinate of the transformation center point (anchor). Unit is vp.
     *
     * @type { Length }
     * @relation centerX?: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: ?Length

    /**
     * Y coordinate of the transformation center point (anchor). Unit is vp.
     *
     * @type { Length }
     * @relation centerY?: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: ?Length

    /**
     * ScaleOptions constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?Float32 = None, y!: ?Float32 = None, z!: ?Float32 = None, centerX!: ?Length = None,
        centerY!: ?Length = None) {
        this.x = x ?? 1.0
        this.y = y ?? 1.0
        this.z = z ?? 1.0
        this.centerX = transAppResourceToLength(centerX ?? 50.percent)
        this.centerY = transAppResourceToLength(centerY ?? 50.percent)
    }
}

@C
struct CScaleOptions {
    let x: Float32
    let y: Float32
    let z: Float32
    let centerX: Float64
    let centerXType: UInt32
    let centerY: Float64
    let centerYType: UInt32

    CScaleOptions(options: ScaleOptions) {
        x = options.x ?? 1.0
        y = options.y ?? 1.0
        z = options.z ?? 1.0
        centerX = (options.centerX ?? 50.percent).value
        centerXType = UInt32((options.centerX ?? 50.percent).unitType.getValue())
        centerY = (options.centerY ?? 50.percent).value
        centerYType = UInt32((options.centerY ?? 50.percent).unitType.getValue())
    }
}

/**
 * The param of rotate.
 *
 * @relation declare interface RotateOptions
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotateOptions {

    /**
     * The param of angle.
     *
     * @type { Float32 }
     * @relation angle: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var angle: ?Float32

    /**
     * X coordinate of the rotation axis vector.
     *
     * @type { Float32 }
     * @relation x?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float32

    /**
     * Y coordinate of the rotation axis vector.
     *
     * @type { Float32 }
     * @relation y?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float32

    /**
     * Z coordinate of the rotation axis vector.
     *
     * @type { Float32 }
     * @relation z?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: ?Float32

    /**
     * X coordinate of the transformation center point (anchor). Unit is vp.
     *
     * @type { Length }
     * @relation centerX?: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: ?Length

    /**
     * Y coordinate of the transformation center point (anchor). Unit is vp.
     *
     * @type { Length }
     * @relation centerY?: number | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: ?Length

    /**
     * Z-axis anchor, that is, the z-component of the 3D rotation center point.
     *
     * @type { Length }
     * @relation centerZ?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerZ: ?Length

    /**
     * Distance from the user to the z=0 plane.
     * The axis and center of rotation are set based on the coordinate system,
     * which remains where it is when the component is moved.
     *
     * @type { Float32 }
     * @relation perspective?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var perspective: ?Float32

    /**
     * RotateOptions constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(angle: ?Float32, x!: ?Float32 = None, y!: ?Float32 = None, z!: ?Float32 = None, centerX!: ?Length = None,
        centerY!: ?Length = None, centerZ!: ?Length = None, perspective!: ?Float32 = None) {
        this.angle = angle ?? throw IllegalArgumentException("The type now is not supported.")
        this.x = x ?? 0.0
        this.y = y ?? 0.0
        this.z = z ?? 0.0
        this.centerX = transAppResourceToLength(centerX ?? 50.percent)
        this.centerY = transAppResourceToLength(centerY ?? 50.percent)
        this.centerZ = transAppResourceToLength(centerZ ?? 0)
        this.perspective = perspective ?? 0.0
    }
}

@C
struct CRotateOptions {
    let angle: Float32
    let x: Float32
    let y: Float32
    let z: Float32
    let centerX: Float64
    let centerXType: UInt32
    let centerY: Float64
    let centerYType: UInt32
    let centerZ: Float64
    let centerZType: UInt32
    let perspective: Float32

    init(options: RotateOptions) {
        angle = options.angle ?? throw IllegalArgumentException("The type now is not supported.")
        x = options.x ?? 0.0
        y = options.y ?? 0.0
        z = options.z ?? 0.0
        centerX = (options.centerX ?? 50.percent).value
        centerXType = UInt32((options.centerX ?? 50.percent).unitType.getValue())
        centerY = (options.centerY ?? 50.percent).value
        centerYType = UInt32((options.centerY ?? 50.percent).unitType.getValue())
        centerZ = (options.centerZ ?? 0).value
        centerZType = UInt32((options.centerZ ?? 0).unitType.getValue())
        perspective = options.perspective ?? 0.0
    }
}

/**
 * Defines the Edge object.
 *
 * @relation declare enum TransitionEdge
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TransitionEdge {
    /**
     * Top edge
     *
     * @relation TOP
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top |
    /**
     * Bottom edge of the window.
     *
     * @relation BOTTOM
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom |
    /**
     * Start edge of the window, which is the left edge for left-to-right
     * scripts and the right edge for right-to-left scripts.
     *
     * @relation START
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start |
    /**
     * End edge of the window, which is the right edge for left-to-right scripts
     * and the left edge for right-to-left scripts.
     *
     * @relation END
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End |
    ...

    func getValue(): Int32 {
        match (this) {
            case Top => 0
            case Bottom => 1
            case Start => 2
            case End => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the transition effect
 *
 * @relation declare class TransitionEffect 
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TransitionEffect <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Creates an opacity transition effect with alpha value.
     *
     * @param { Float64 } alpha - opacity alpha value, value range [0, 1].
     * @returns { TransitionEffect }
     * @relation static opacity(alpha: number): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func opacity(alpha: ?Float64): TransitionEffect {
        let tmpAlpha = alpha ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectOpacity(tmpAlpha))
        }
    }

    /**
     * Creates a translate transition effect
     *
     * @param { TranslateOptions } options - translate options
     * @returns { TransitionEffect }
     * @relation static translate(options: TranslateOptions): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func translate(options: ?TranslateOptions): TransitionEffect {
        let tmpOptions = options ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectTranslate(CTranslateOptions(tmpOptions)))
        }
    }

    /**
     * Creates a scale transition effect
     *
     * @param { ScaleOptions } options - scale options
     * @returns { TransitionEffect }
     * @relation static scale(options: ScaleOptions): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func scale(options: ?ScaleOptions): TransitionEffect {
        let tmpOptions = options ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectScale(CScaleOptions(tmpOptions)))
        }
    }

    /**
     * Creates a rotation transition effect
     *
     * @param { RotateOptions } options - rotate options
     * @returns { TransitionEffect }
     * @relation static rotate(options: RotateOptions): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func rotate(options: ?RotateOptions): TransitionEffect {
        let tmpOptions = options ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectRotate(CRotateOptions(tmpOptions)))
        }
    }

    /**
     * Creates a move transition effect
     *
     * @param { TransitionEdge } edge - the edge that component will move to
     * @returns { TransitionEffect }
     * @relation static move(edge: TransitionEdge): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func move(edge: ?TransitionEdge): TransitionEffect {
        let tmpEdge = edge ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectMove(tmpEdge.getValue()))
        }
    }

    /**
     * reates an asymmetric transition effect
     *
     * @param { TransitionEffect } appear - the transition which will be attached when the component is appear
     * @param { TransitionEffect } disappear - the transition which will be attached when the component is disappear
     * @returns { TransitionEffect }
     * @relation static asymmetric(appear: TransitionEffect, disappear: TransitionEffect): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func asymmetric(appear: ?TransitionEffect, disappear: ?TransitionEffect): TransitionEffect {
        let tmpAppear = appear ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpDisappear = disappear ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectAsymmetric(tmpAppear.getID(), tmpDisappear.getID()))
        }
    }

    /**
     * Combines another transition effect
     *
     * @param { TransitionEffect } transitionEffect - transition effect which is be combined
     * @returns { TransitionEffect } combined transition effect
     * @relation combine(transitionEffect: TransitionEffect): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func combine(transitionEffect: ?TransitionEffect): TransitionEffect {
        let tmpTransitionEffect = transitionEffect ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTransitionEffectCombine(this.getID(), tmpTransitionEffect.getID())
        }
        return this
    }


    /**
     * Set the animation of current transition effect
     *
     * @param { AnimateParam } value - animation parameters
     * @returns { TransitionEffect }
     * @relation animation(value: AnimateParam): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animation(value: ?AnimateParam): TransitionEffect {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            let nativeParam = parseAnimateParam(tmpValue)
            FfiOHOSAceFrameworkTransitionEffectAnimation(this.getID(), nativeParam)
            nativeParam.free()
        }
        return this
    }

    /**
     * Disables the transition effect
     *
     * @relation static get IDENTITY(): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let IDENTITY: TransitionEffect = unsafe {
        TransitionEffect(FfiOHOSAceFrameworkTransitionEffectIdentity())
    }

    /**
     * Specifies a transition effect with transparency of 0, which is equivalent to TransitionEffect.opacity(0).
     *
     * @relation static get OPACITY(): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let OPACITY: TransitionEffect = TransitionEffect.opacity(0.0)

    /**
     * Defines a slide transition effect
     *
     * @relation static get SLIDE(): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let SLIDE: TransitionEffect = 
        TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.Start),
            TransitionEffect.move(TransitionEdge.End))

    /**
     * Specify a transition effect where the element enters by shrinking first and then expanding as it slides in from the right,
     * and exits by shrinking first and then expanding as it slides out to the left, with a minimum scale ratio of 0.8.
     * It comes with default animation parameters, which can also be overridden.
     * The default animation duration is set to 600ms, and the specified animation curve is cubicBezierCurve(0.24, 0.0, 0.50, 1.0).
     *
     * @relation static get SLIDE_SWITCH(): TransitionEffect;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let SLIDE_SWITCH: TransitionEffect = unsafe {
        TransitionEffect(FfiOHOSAceFrameworkTransitionEffectSlideSwitch())
    }
}
