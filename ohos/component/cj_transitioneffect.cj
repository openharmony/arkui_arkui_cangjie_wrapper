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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TranslateOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Length

    public init(x!: Length = 0.0.vp, y!: Length = 0.0.vp, z!: Length = 0.0.vp) {
        this.x = transAppResourceToLength(x)
        this.y = transAppResourceToLength(y)
        this.z = transAppResourceToLength(z)
    }
}

@C
struct CTranslateOptions {
    let x: Float64
    let xType: UInt32
    let y: Float64
    let yType: UInt32
    let z: Float64
    let zType: UInt32

    CTranslateOptions(options: TranslateOptions) {
        x = options.x.value
        xType = UInt32(options.x.unitType.getValue())
        y = options.y.value
        yType = UInt32(options.y.unitType.getValue())
        z = options.z.value
        zType = UInt32(options.z.unitType.getValue())
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
public class ScaleOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Length

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 0.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent) {
        this.x = x
        this.y = y
        this.z = z
        this.centerX = transAppResourceToLength(centerX)
        this.centerY = transAppResourceToLength(centerY)
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
        x = options.x
        y = options.y
        z = options.z
        centerX = options.centerX.value
        centerXType = UInt32(options.centerX.unitType.getValue())
        centerY = options.centerY.value
        centerYType = UInt32(options.centerY.unitType.getValue())
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
public class RotateOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var angle: Float32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerZ: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var perspective: Float32

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(angle: Float32, x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 0.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent, centerZ!: Length = 0, perspective!: Float32 = 0.0) {
        this.angle = angle
        this.x = x
        this.y = y
        this.z = z
        this.centerX = transAppResourceToLength(centerX)
        this.centerY = transAppResourceToLength(centerY)
        this.centerZ = transAppResourceToLength(centerZ)
        this.perspective = perspective
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
        angle = options.angle
        x = options.x
        y = options.y
        z = options.z
        centerX = options.centerX.value
        centerXType = UInt32(options.centerX.unitType.getValue())
        centerY = options.centerY.value
        centerYType = UInt32(options.centerY.unitType.getValue())
        centerZ = options.centerZ.value
        centerZType = UInt32(options.centerZ.unitType.getValue())
        perspective = options.perspective
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
public enum TransitionEdge {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | ...

    func getValue(): Int32 {
        match (this) {
            case TOP => 0
            case BOTTOM => 1
            case START => 2
            case END => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
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
public class TransitionEffect <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func opacity(number: Float64): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectOpacity(number))
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
    public static func translate(options: TranslateOptions): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectTranslate(CTranslateOptions(options)))
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
    public static func scale(options: ScaleOptions): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectScale(CScaleOptions(options)))
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
    public static func rotate(options: RotateOptions): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectRotate(CRotateOptions(options)))
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
    public static func move(edge: TransitionEdge): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectMove(edge.getValue()))
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
    public static func asymmetric(appear: TransitionEffect, disappear: TransitionEffect): TransitionEffect {
        unsafe {
            TransitionEffect(FfiOHOSAceFrameworkTransitionEffectAsymmetric(appear.getID(), disappear.getID()))
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
    public func combine(effect: TransitionEffect): TransitionEffect {
        unsafe {
            FfiOHOSAceFrameworkTransitionEffectCombine(this.getID(), effect.getID())
        }
        return this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animation(param: AnimateParam): TransitionEffect {
        unsafe {
            let nativeParam = parseAnimateParam(param)
            FfiOHOSAceFrameworkTransitionEffectAnimation(this.getID(), nativeParam)
            nativeParam.free()
        }
        return this
    }

    /**
     * @brief  static readonly IDENTITY: TransitionEffect<"identity">
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let IDENTITY = unsafe {
        TransitionEffect(FfiOHOSAceFrameworkTransitionEffectIdentity())
    }

    /**
     * @brief  static readonly OPACITY: TransitionEffect<"opacity">
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let OPACITY = TransitionEffect.opacity(0.0)

    /**
     * @brief
     * static readonly SLIDE: TransitionEffect<
     *     "asymmetric",
     *     {
     *     appear: TransitionEffect<"move", TransitionEdge>;
     *     disappear: TransitionEffect<"move", TransitionEdge>;
     *     }
     * >
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let SLIDE = TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.START),
        TransitionEffect.move(TransitionEdge.END))

    /**
     * @brief  static readonly SLIDE_SWITCH: TransitionEffect<"slideSwitch">
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let SLIDE_SWITCH = unsafe {
        TransitionEffect(FfiOHOSAceFrameworkTransitionEffectSlideSwitch())
    }
}
