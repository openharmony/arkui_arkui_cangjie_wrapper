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

package ohos.arkui.component.progress

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive

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

/**
 * Current status of progress bar.
 *
 * @enum
 * @relation enum ProgressStatus
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressStatus {
    /**
     * Loading status.
     *
     * @relation LOADING
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Loading |
    /**
     * Processing status.
     *
     * @relation PROGRESSING
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Progressing
    | ...

    func getValue(): Int32 {
        match (this) {
            case Progressing => 0
            case Loading => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Progress common style options.
 *
 * @interface CommonProgressStyleOptions
 * @relation interface CommonProgressStyleOptions
 */
sealed interface CommonProgressStyleOptions {}

/**
 * Defines the ring style Options.
 *
 * @extends CommonProgressStyleOptions
 * @interface RingStyleOptions
 * @relation interface RingStyleOptions extends ScanEffectOptions, CommonProgressStyleOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RingStyleOptions <: CommonProgressStyleOptions {
    /**
     * Defines the strokeWidth property.
     *
     * @type { Length }
     * @relation strokeWidth?: Length
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    /**
     * Enables progress shadow.
     *
     * @type { Bool }
     * @relation shadow?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: Bool

    /**
     * The status of progress, default is PROGRESSING. Set to LOADING status will trigger the loading animation.
     *
     * @type { ProgressStatus }
     * @relation status?: ProgressStatus
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var status: ProgressStatus

    /**
     * Enable smooth effect.
     *
     * @type { ?boolean }
     * @default true
     * @relation enableSmoothEffect?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: Bool

    /**
     * Enable scan effect.
     *
     * @type { ?boolean }
     * @default false
     * @relation enableScanEffect?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableScanEffect: Bool

    /**
     * Constructor the ring style Options.
     *
     * @param { Length } strokeWidth
     * @param { Bool } shadow
     * @param { ProgressStatus } status
     * @param { Bool } enableSmoothEffect
     * @param { Bool } enableScanEffect
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length = 4.vp, shadow!: Bool = false,
        status!: ProgressStatus = ProgressStatus.Progressing, enableSmoothEffect!: Bool = true,
        enableScanEffect!: Bool = false) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.shadow = shadow
        this.status = status
        this.enableSmoothEffect = enableSmoothEffect
        this.enableScanEffect = enableScanEffect
    }
}

/**
 * Defines Progress Component.
 *
 * @relation const Progress: ProgressInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Progress <: CommonMethodComponent<ProgressAttribute> & ProgressAttribute {
    /**
     * Called when the progress bar is set.
     *
     * @param { Float64 } value
     * @param { Float64 } total
     * @param { ProgressType } progressType
     * @returns { Progress }
     * @relation (options: ProgressOptions): ProgressAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Float64, total!: Float64 = 100.0, progressType!: ProgressType = ProgressType.Linear) {
        unsafe {
            FfiOHOSAceFrameworkProgressCreate(value, total, progressType.getValue())
        }
    }

    /**
     * Called when the current progress value is set.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation value(value: number): ProgressAttribute<Type>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func value(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetValue(value)
        }
        this
    }

    /**
     * Called when the progress bar foreground is set.
     *
     * @param { ResourceColor } value - indicates the color of the progress.
     * @returns { This } the attribute of the progress.
     * @relation color(value: ResourceColor | LinearGradient): ProgressAttribute<Type>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetColor(transAppResourceToResourceColor(value))
        }
        this
    }

    protected override func backgroundColorInner(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetBackgroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    /**
     * Called when the style of progress bar is set.
     *
     * @param { Length } strokeWidth
     * @param { Int32 } scaleCount
     * @param { Length } scaleWidth
     * @returns { This } the attribute of the progress.
     * @relation style(value: Style): ProgressAttribute<Type>
     */
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

    /**
     * Called when the style of progress bar is set.
     *
     * @param { RingStyleOptions } value - indicates the style of the progress.
     * @returns { This } the attribute of the progress.
     * @relation style(value: LinearStyleOptions | RingStyleOptions | CapsuleStyleOptions | ProgressStyleOptions): ProgressAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(value: RingStyleOptions): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetRingStyle(
                RingStyle(value.strokeWidth.value, value.strokeWidth.unitType.getValue(), value.shadow,
                    value.status.getValue(), value.enableSmoothEffect, value.enableScanEffect))
        }
        this
    }
}
