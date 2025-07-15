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

@C
struct RingStyle {
    RingStyle(
        let value: Float64,
        let unitType: Int32,
        let shadow: Bool,
        let status: Int32,
        let enableSmoothEffect: Bool,
        let enableScanEffect: Bool
    ) {}
}

@C
struct ScaleRingStyle {
    ScaleRingStyle(
        let strokeWidthValue: Float64,
        let strokeWidthUnit: Int32,
        let scaleCount: Int32,
        let scaleWidthValue: Float64,
        let scaleWidthUnit: Int32,
        let enableSmoothEffect: Bool
    ) {}
}

@C
struct LinearStyle {
    LinearStyle(
        let strokeWidthValue: Float64,
        let strokeWidthUnit: Int32,
        let radiusValue: Float64,
        let radiusUnit: Int32,
        let enableSmoothEffect: Bool,
        let enableScanEffect: Bool
    ) {}
}

@C
struct CapsuleStyle {
    CapsuleStyle(
        let borderColor: Float32,
        let borderWidthValue: Float64,
        let borderWidthUnit: Int32,
        let content: CString,
        let fontColor: Float32,
        let showDefaultPercentage: Bool,
        let enableSmoothEffect: Bool,
        let enableScanEffect: Bool,
        let fontSizeValue: Float64,
        let fontSizeUnit: Int32,
        let fontWeight: Int32,
        let fontStyle: Int32
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkProgressCreate(value: Float64, total: Float64, `type`: Int32): Unit

    func FfiOHOSAceFrameworkProgressSetValue(value: Float64): Unit

    func FfiOHOSAceFrameworkProgressSetColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkProgressSetBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkProgressSetStyle(strokeWidth: Float64, strokeWidthUnit: Int32, scaleCount: Int32,
        scaleWidth: Float64, scaleWidthUnit: Int32): Unit

    func FfiOHOSAceFrameworkProgressSetLinearStyle(linearStyle: LinearStyle): Unit

    func FfiOHOSAceFrameworkProgressSetCapsuleStyle(capsuleStyle: CapsuleStyle, family: CString): Unit

    func FfiOHOSAceFrameworkProgressSetScaleRingStyle(scaleRingStyle: ScaleRingStyle): Unit

    func FfiOHOSAceFrameworkProgressSetRingStyle(ringStyle: RingStyle): Unit

    func FfiOHOSAceFrameworkProgressSetEclipseStyle(enableSmoothEffect: Bool): Unit

    func FfiOHOSAceFrameworkProgressSetGradientColor(color: VectorUInt32Handle, number: VectorFloat64Handle,
        unitType: VectorInt32Handle): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ProgressOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: Float64

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var total: Float64

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var progressType: ProgressType

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Float64, total!: Float64 = 100.0, progressType!: ProgressType = ProgressType.Linear) {
        this.value = value
        this.total = total
        this.progressType = progressType
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressStatus {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LOADING
    | PROGRESSING
    | ...

    func getValue(): Int32 {
        match (this) {
            case PROGRESSING => 0
            case LOADING => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ProgressStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scaleCount: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scaleWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length = 4.vp, scaleCount!: Int32 = 120, scaleWidth!: Length = 2.vp,
        enableSmoothEffect!: Bool = true) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.scaleCount = scaleCount
        this.scaleWidth = transAppResourceToLength(scaleWidth)
        this.enableSmoothEffect = enableSmoothEffect
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EclipseStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(enableSmoothEffect!: Bool = true) {
        this.enableSmoothEffect = enableSmoothEffect
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleRingStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scaleCount: Int32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scaleWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length = 4.vp, scaleCount!: Int32 = 120, scaleWidth!: Length = 2.vp,
        enableSmoothEffect!: Bool = true) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.scaleCount = scaleCount
        this.scaleWidth = transAppResourceToLength(scaleWidth)
        this.enableSmoothEffect = enableSmoothEffect
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RingStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var status: ProgressStatus

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableScanEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length = 4.vp, shadow!: Bool = false,
        status!: ProgressStatus = ProgressStatus.PROGRESSING, enableSmoothEffect!: Bool = true,
        enableScanEffect!: Bool = false) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.shadow = shadow
        this.status = status
        this.enableSmoothEffect = enableSmoothEffect
        this.enableScanEffect = enableScanEffect
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LinearStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeRadius: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableScanEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length = 4.vp, strokeRadius!: Length, enableSmoothEffect!: Bool = true,
        enableScanEffect!: Bool = false) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.strokeRadius = transAppResourceToLength(strokeRadius)
        this.enableSmoothEffect = enableSmoothEffect
        this.enableScanEffect = enableScanEffect
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length = 4.vp, enableSmoothEffect!: Bool = true, enableScanEffect!: Bool = false) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.strokeRadius = match (strokeWidth.unitType.getValue()) {
            case 0 => (strokeWidth.value / 2.0).px
            case 1 => (strokeWidth.value / 2.0).vp
            case 2 => (strokeWidth.value / 2.0).fp
            case 3 => (strokeWidth.value / 2.0).percent
            case 4 => (strokeWidth.value / 2.0).lpx
            case _ => throw IllegalArgumentException("Unreachable")
        }
        this.enableSmoothEffect = enableSmoothEffect
        this.enableScanEffect = enableScanEffect
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Linear
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ring
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Eclipse
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScaleRing
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Capsule
    | ...

    func getValue(): Int32 {
        match (this) {
            case Linear => 0
            case Ring => 1
            case Eclipse => 2
            case ScaleRing => 3
            case Capsule => 4
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
public class ProgressConfiguration {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: Float32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var total: Float32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: Float32, total: Float32) {
        this.value = value
        this.total = total
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Fonts {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: FontWeight

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: String

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: FontStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal) {
        this.size = transAppResourceToLength(size)
        this.weight = weight
        this.family = family
        this.style = style
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: AppResource,
        style!: FontStyle = FontStyle.Normal) {
        this(size: size, weight: weight, family: getResourceString(family), style: style)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CapsuleStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var content: String

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var font: Fonts

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: ResourceColor

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: ResourceColor

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showDefaultPercentage: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableScanEffect: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content!: String = "HarmonyOS Sans", font!: Fonts = Fonts(), borderWidth!: Length = 1.vp,
        borderColor!: ResourceColor = Color(0x33007dff), fontColor!: ResourceColor = Color(0xff182431),
        showDefaultPercentage!: Bool = false, enableSmoothEffect!: Bool = true, enableScanEffect!: Bool = false) {
        this.content = content
        this.font = font
        this.borderWidth = transAppResourceToLength(borderWidth)
        this.borderColor = transAppResourceToResourceColor(borderColor)
        this.fontColor = transAppResourceToResourceColor(fontColor)
        this.showDefaultPercentage = showDefaultPercentage
        this.enableSmoothEffect = enableSmoothEffect
        this.enableScanEffect = enableScanEffect
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
public class Progress <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(option: ProgressOptions) {
        unsafe {
            FfiOHOSAceFrameworkProgressCreate(option.value, option.total, option.progressType.getValue())
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
    public init(value!: Float64, total!: Float64 = 100.0, `type`!: ProgressType = ProgressType.Linear) {
        unsafe {
            FfiOHOSAceFrameworkProgressCreate(value, total, `type`.getValue())
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
    public func value(baseValue: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetValue(baseValue)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(baseColor: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetColor(transAppResourceToResourceColor(baseColor))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: Array<ColorStop>): This {
        let colors = FFIVectorUInt32(value.size)
        let number = FFIVectorFloat64(value.size)
        let unitType = FFIVectorInt32(value.size)
        for (i in 0..value.size) {
            colors.setElement(i, value[i].color)
            number.setElement(i, value[i].offset.value)
            unitType.setElement(i, value[i].offset.unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkProgressSetGradientColor(colors.getNativeHandle(), number.getNativeHandle(),
                unitType.getNativeHandle())
            colors.free()
            number.free()
            unitType.free()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func backgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetBackgroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(strokeWidth!: Length = 10.vp, scaleCount!: Int32 = 120, scaleWidth!: Length = 2.vp): This {
        var strokeWidth_ = transAppResourceToLength(strokeWidth)
        var scaleWidth_ = transAppResourceToLength(scaleWidth)
        unsafe {
            FfiOHOSAceFrameworkProgressSetStyle(strokeWidth_.value, strokeWidth_.unitType.getValue(), scaleCount,
                scaleWidth_.value, scaleWidth.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(ringStyle: RingStyleOptions): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetRingStyle(
                RingStyle(ringStyle.strokeWidth.value, ringStyle.strokeWidth.unitType.getValue(), ringStyle.shadow,
                    ringStyle.status.getValue(), ringStyle.enableSmoothEffect, ringStyle.enableScanEffect))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(eclipseStyle: EclipseStyleOptions): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetEclipseStyle(eclipseStyle.enableSmoothEffect)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(scaleRingStyle: ScaleRingStyleOptions): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetScaleRingStyle(
                ScaleRingStyle(scaleRingStyle.strokeWidth.value, scaleRingStyle.strokeWidth.unitType.getValue(),
                    scaleRingStyle.scaleCount, scaleRingStyle.scaleWidth.value,
                    scaleRingStyle.scaleWidth.unitType.getValue(), scaleRingStyle.enableSmoothEffect))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(progressStyle: ProgressStyleOptions): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetScaleRingStyle(
                ScaleRingStyle(progressStyle.strokeWidth.value, progressStyle.strokeWidth.unitType.getValue(),
                    progressStyle.scaleCount, progressStyle.scaleWidth.value,
                    progressStyle.scaleWidth.unitType.getValue(), progressStyle.enableSmoothEffect))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(linearStyle: LinearStyleOptions): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetLinearStyle(
                LinearStyle(linearStyle.strokeWidth.value, linearStyle.strokeWidth.unitType.getValue(),
                    linearStyle.strokeRadius.value, linearStyle.strokeRadius.unitType.getValue(),
                    linearStyle.enableSmoothEffect, linearStyle.enableScanEffect))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(capsuleStyle: CapsuleStyleOptions): This {
        unsafe {
            try (contentValue = LibC.mallocCString(capsuleStyle.content).asResource(),
                familyValue = LibC.mallocCString(capsuleStyle.font.family).asResource()) {
                FfiOHOSAceFrameworkProgressSetCapsuleStyle(
                    CapsuleStyle(Float32(capsuleStyle.borderColor.toUInt32()), capsuleStyle.borderWidth.value,
                        capsuleStyle.borderWidth.unitType.getValue(), contentValue.value,
                        Float32(capsuleStyle.fontColor.toUInt32()), capsuleStyle.showDefaultPercentage,
                        capsuleStyle.enableSmoothEffect, capsuleStyle.enableScanEffect, capsuleStyle.font.size.value,
                        capsuleStyle.font.size.unitType.getValue(), capsuleStyle.font.weight.toInt32(),
                        capsuleStyle.font.style.getValue()),
                    familyValue.value
                )
            }
        }
        this
    }

    // progress does not need to implement pop function
    protected override func pop(): Unit {}
}
