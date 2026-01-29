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

package ohos.arkui.component.common

import ohos.arkui.component.native_struct.{NativeAnimateParam}
import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{Length, LengthProp}
import ohos.ffi.{RemoteDataLite, releaseFFIData}
import ohos.business_exception.BusinessException
import ohos.labels.{APILevel}
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
 * Configuration options for translation transformations.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TranslateOptions {

    /**
     * Translation distance along the x-axis.
     * For the number type, the unit is vp, and the value range is (-∞, +∞).
     * For the string type, the value follows the format of length string type.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Length

    /**
     * Translation distance along the y-axis.
     * For the number type, the unit is vp, and the value range is (-∞, +∞).
     * For the string type, the value follows the format of length string type.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Length

    /**
     * Distance to translate along the z-axis. The value is a floating
     * point number, the default value is 0.0, and the unit is px.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: ?Length

    /**
     * Creates a new TranslateOptions instance with the specified properties.
     *
     * @param { ?Length } x - Translation distance along the x-axis
     * @param { ?Length } y - Translation distance along the y-axis
     * @param { ?Length } z - Translation distance along the z-axis
     */
    @!APILevel[
        since: "22",
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
 * Configuration options for scaling transformations.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleOptions {

    /**
     * Scale ratio along the x-axis.
     * x > 1: The component is scaled up along the x-axis.
     * 0 < x < 1: The component is scaled down along the x-axis.
     * x < 0: The component is scaled in the reverse direction of the x-axis.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float32

    /**
     * Scale ratio along the y-axis.
     * y > 1: The component is scaled up along the y-axis.
     * 0 < y < 1: The component is scaled down along the y-axis.
     * y < 0: The component is scaled in the reverse direction of the y-axis.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float32

    /**
     * Scale ratio along the z-axis. z > 1: The component is scaled up along the z-axis.
     * <br>0 < z < 1: The component is scaled down along the z-axis.
     * <br>z < 0: The component is scaled in the reverse direction of the z-axis.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: ?Float32

    /**
     * X coordinate of the transformation center point (anchor). Unit is vp.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: ?Length

    /**
     * Y coordinate of the transformation center point (anchor). Unit is vp.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: ?Length

    /**
     * Creates a new ScaleOptions instance with the specified properties.
     *
     * @param { ?Float32 } x - Scale ratio along the x-axis
     * @param { ?Float32 } y - Scale ratio along the y-axis
     * @param { ?Float32 } z - Scale ratio along the z-axis
     * @param { ?Length } centerX - X coordinate of the transformation center
     * @param { ?Length } centerY - Y coordinate of the transformation center
     */
    @!APILevel[
        since: "22",
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
 * Configuration options for rotation transformations.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotateOptions {

    /**
     * Rotation angle in degrees.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var angle: ?Float32

    /**
     * X coordinate of the rotation axis vector.
     * Defines the x-component of the rotation axis.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float32

    /**
     * Y coordinate of the rotation axis vector.
     * Defines the y-component of the rotation axis.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float32

    /**
     * Z coordinate of the rotation axis vector.
     * Defines the z-component of the rotation axis.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: ?Float32

    /**
     * X coordinate of the transformation center point (anchor). Unit is vp.
     * Defines the x-coordinate of the rotation center point.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: ?Length

    /**
     * Y coordinate of the transformation center point (anchor). Unit is vp.
     * Defines the y-coordinate of the rotation center point.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: ?Length

    /**
     * Z-axis anchor, that is, the z-component of the 3D rotation center point.
     * @default 0.vp
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerZ: ?Length

    /**
     * Distance from the user to the z=0 plane.
     * The axis and center of rotation are set based on the coordinate system,
     * which remains where it is when the component is moved.
     * @default 0.0
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var perspective: ?Float32

    /**
     * Creates a new RotateOptions instance with the specified properties.
     *
     * @param { ?Float32 } angle - Rotation angle in degrees
     * @param { ?Float32 } [x] - X coordinate of the rotation axis vector
     * @param { ?Float32 } [y] - Y coordinate of the rotation axis vector
     * @param { ?Float32 } [z] - Z coordinate of the rotation axis vector
     * @param { ?Length } [centerX] - X coordinate of the transformation center
     * @param { ?Length } [centerY] - Y coordinate of the transformation center
     * @param { ?Length } [centerZ] - Z coordinate of the transformation center
     * @param { ?Float32 } [perspective] - Perspective distance
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(angle: ?Float32, x!: ?Float32 = None, y!: ?Float32 = None, z!: ?Float32 = None, centerX!: ?Length = None,
        centerY!: ?Length = None, centerZ!: ?Length = None, perspective!: ?Float32 = None) {
        this.angle = angle ?? 0.0
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
        angle = Float32(options.angle ?? 0.0)
        x = Float32(options.x ?? 0.0)
        y = Float32(options.y ?? 0.0)
        z = Float32(options.z ?? 0.0)
        centerX = (options.centerX ?? 50.percent).value
        centerXType = UInt32((options.centerX ?? 50.percent).unitType.getValue())
        centerY = (options.centerY ?? 50.percent).value
        centerYType = UInt32((options.centerY ?? 50.percent).unitType.getValue())
        centerZ = (options.centerZ ?? 0).value
        centerZType = UInt32((options.centerZ ?? 0).unitType.getValue())
        perspective = Float32(options.perspective ?? 0.0)
    }
}

/**
 * This enum specifies the edges of a component for transition effects.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TransitionEdge {
    /**
     * Represents the top edge of the component or window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top |
    /**
     * Bottom edge of the window.
     * Represents the bottom edge of the component or window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom |
    /**
     * Start edge of the window, which is the left edge for left-to-right
     * scripts and the right edge for right-to-left scripts.
     * Represents the logical start edge based on text direction.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start |
    /**
     * End edge of the window, which is the right edge for left-to-right scripts
     * and the left edge for right-to-left scripts.
     * Represents the logical end edge based on text direction.
     */
    @!APILevel[
        since: "22",
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
 * Defines the transition effect.
 * This class provides methods to create various transition effects for components.
 */
@!APILevel[
    since: "22",
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
     * The component fades in or out based on the alpha value.
     *
     * @param { Float64 } alpha - opacity alpha value, value range [0, 1].
     * @returns { TransitionEffect } - A new TransitionEffect instance with opacity effect.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func opacity(alpha: Float64): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectOpacity(alpha))
        }
    }

    /**
     * Sets the translation effect for page transitions.
     * The component moves from one position to another during the transition.
     *
     * @param { TranslateOptions } options - Translation effect for page transitions
     * <br> specifying the start value for entrance and the end value for exit.
     * @default x: 0, y: 0, z:0.
     * @returns { TransitionEffect } - A new TransitionEffect instance with translation effect.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func translate(options: TranslateOptions): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectTranslate(CTranslateOptions(options)))
        }
    }

    /**
     * Creates a scale transition effect.
     * The component scales up or down during the transition.
     *
     * @param { ?ScaleOptions } options - scale options. Scale ratio along the x-, y-, and z-axis.
     * <br>**centerX** and **centerY** are used to set the scale center point.
     * <br>default value is x: 1, y: 1, z: 1, centerX: 50.percent, centerY: 50.percent.
     * @returns { TransitionEffect } - A new TransitionEffect instance with scale effect.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func scale(options: ?ScaleOptions): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectScale(CScaleOptions(options ?? ScaleOptions())))
        }
    }

    /**
     * Creates a rotation transition effect.
     * The component rotates during the transition.
     *
     * @param { ?RotateOptions } options - rotate options.
     * Set the rotation effect for component transitions when inserting and deleting.
     * The value represents the starting rotation point for the inserting animation and the ending rotation point for the deleting animation.
     * -x: Horizontal component of the rotational vector.
     * -y: Vertical component of the rotational vector.
     * -z: Vertical component of the rotational vector.
     * -centerX, centerY specify the rotation center point, with default values of 50.percent,
     * meaning that the default rotation center point is the center point of the component.
     * -The center point of (0, 0) represents the upper-left corner of the component.
     * -centerZ refers to the Z-axis anchor point. The default value of centerZ is 0.
     * -perspective indicates the visual distance. The perspective property does not support transition animation.
     * <br>default value is x: 0.0, y: 0.0, z: 0.0, centerX: 50.percent, centerY: 50.percent, centerY: 0.0, perspective:0.0.
     * @returns { TransitionEffect } - A new TransitionEffect instance with rotation effect.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func rotate(options: ?RotateOptions): TransitionEffect {
        let tmpOptions = options ?? RotateOptions(0.0)
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectRotate(CRotateOptions(tmpOptions)))
        }
    }

    /**
     * Creates a move transition effect.
     * The component moves in from or out to the specified edge.
     *
     * @param { TransitionEdge } edge - The edge that component will move to
     * @returns { TransitionEffect } - A new TransitionEffect instance with move effect.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func move(edge: TransitionEdge): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectMove(edge.getValue()))
        }
    }

    /**
     * Creates an asymmetric transition effect.
     * Different effects are applied when the component appears and disappears.
     *
     * @param { TransitionEffect } appear - the transition which will be attached when the component is appear.
     * @param { TransitionEffect } disappear - the transition which will be attached when the component is disappear.
     * @returns { TransitionEffect } - A new TransitionEffect instance with asymmetric effect.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func asymmetric(appear: TransitionEffect, disappear: TransitionEffect): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectAsymmetric(appear.getID(), disappear.getID()))
        }
    }

    /**
     * Combines another transition effect.
     * Allows multiple transition effects to be applied simultaneously.
     *
     * @param { TransitionEffect } transitionEffect - transition effect which is be combined.
     * @returns { TransitionEffect } combined transition effect.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func combine(transitionEffect: TransitionEffect): TransitionEffect {
        unsafe {
            FfiOHOSAceFrameworkTransitionEffectCombine(this.getID(), transitionEffect.getID())
        }
        return this
    }

    /**
     * Set the animation of current transition effect.
     * Configures the animation parameters for the transition effect.
     *
     * @param { ?AnimateParam } value - animation parameters.
     * @returns { TransitionEffect } - The current TransitionEffect instance with updated animation parameters.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animation(value: ?AnimateParam): TransitionEffect {
        unsafe {
            let nativeParam = parseAnimateParam(value ?? AnimateParam())
            FfiOHOSAceFrameworkTransitionEffectAnimation(this.getID(), nativeParam)
            nativeParam.free()
        }
        return this
    }

    /**
     * Disables the transition effect.
     * Represents a transition effect that does nothing.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let IDENTITY: TransitionEffect = unsafe {
        TransitionEffect(FfiOHOSAceFrameworkTransitionEffectIdentity())
    }

    /**
     * Specifies a transition effect with transparency of 0, which is equivalent to TransitionEffect.opacity(0).
     * The component becomes completely transparent during the transition.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let OPACITY: TransitionEffect = TransitionEffect.opacity(0.0)

    /**
     * Defines a slide transition effect.
     * The component slides in from the start edge and slides out to the end edge.
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let SLIDE_SWITCH: TransitionEffect = unsafe {
        TransitionEffect(FfiOHOSAceFrameworkTransitionEffectSlideSwitch())
    }
}
