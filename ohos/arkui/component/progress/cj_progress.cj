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

protected package ohos.arkui.component.progress

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressStatus {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LOADING
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PROGRESSING
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RingStyleOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var status: ProgressStatus

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableScanEffect: Bool

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Progress <: ViewBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Float64, total!: Float64 = 100.0, `type`!: ProgressType = ProgressType.Linear) {
        unsafe {
            FfiOHOSAceFrameworkProgressCreate(value, total, `type`.getValue())
        }
    }

    @!APILevel[
        21,
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
        21,
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
        21,
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
        21,
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

    // progress does not need to implement pop function
    protected override func pop(): Unit {}

    @!APILevel[
        21,
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
}
