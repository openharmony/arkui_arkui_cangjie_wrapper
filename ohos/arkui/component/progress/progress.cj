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
import ohos.business_exception.BusinessException

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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressStatus {
    /**
     * Loading status.
     *
     * @relation LOADING
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Loading |
    /**
     * Processing status.
     *
     * @relation PROGRESSING
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Progressing
    | ...

    func getValue(): Int32 {
        match (this) {
            case Progressing => 0
            case Loading => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Progress common style options.
 *
 * @interface CommonProgressStyleOptions
 * @relation interface CommonProgressStyleOptions
 */
 @!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface CommonProgressStyleOptions {}

/**
 * Defines the ring style Options.
 *
 * @extends CommonProgressStyleOptions
 * @interface RingStyleOptions
 * @relation interface RingStyleOptions extends ScanEffectOptions, CommonProgressStyleOptions
 */
@!APILevel[
    22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: ?Length

    /**
     * Enables progress shadow.
     *
     * @type { Bool }
     * @relation shadow?: boolean
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?Bool

    /**
     * The status of progress, default is PROGRESSING. Set to LOADING status will trigger the loading animation.
     *
     * @type { ProgressStatus }
     * @relation status?: ProgressStatus
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var status: ?ProgressStatus

    /**
     * Enable smooth effect.
     *
     * @type { ?boolean }
     * @default true
     * @relation enableSmoothEffect?: boolean
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableSmoothEffect: ?Bool

    /**
     * Enable scan effect.
     *
     * @type { ?boolean }
     * @default false
     * @relation enableScanEffect?: boolean
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableScanEffect: ?Bool

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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: ?Length = None, shadow!: ?Bool = None,
        status!: ?ProgressStatus = None, enableSmoothEffect!: ?Bool = None,
        enableScanEffect!: ?Bool = None) {
        this.strokeWidth = transAppResourceToLength(strokeWidth ?? 4.vp)
        this.shadow = shadow ?? false
        this.status = status ?? ProgressStatus.Progressing
        this.enableSmoothEffect = enableSmoothEffect ?? true
        this.enableScanEffect = enableScanEffect ?? false
    }
}

/**
 * Defines Progress Component.
 *
 * @relation const Progress: ProgressInterface
 */
@!APILevel[
    22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?Float64, total!: ?Float64 = None, progressType!: ?ProgressType = None) {
        let tmpProgressType = progressType ?? ProgressType.Linear
        
        unsafe {
            FfiOHOSAceFrameworkProgressCreate(value ?? 0.0, total ?? 100.0, tmpProgressType.getValue())
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func value(value: ?Float64): This {
        unsafe {
            FfiOHOSAceFrameworkProgressSetValue(value ?? 0.0)
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkProgressSetColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    protected override func backgroundColorInner(color: ?ResourceColor): This {
        let tmpColor = color ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkProgressSetBackgroundColor(transAppResourceToResourceColor(tmpColor))
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(strokeWidth!: ?Length = None, scaleCount!: ?Int32 = None, scaleWidth!: ?Length = None): This {
        var strokeWidth_ = transAppResourceToLength(strokeWidth ?? 10.vp)
        var scaleWidth_ = transAppResourceToLength(scaleWidth ?? 2.vp)
        unsafe {
            FfiOHOSAceFrameworkProgressSetStyle(strokeWidth_.value, strokeWidth_.unitType.getValue(), scaleCount ?? 120,
                scaleWidth_.value, scaleWidth_.unitType.getValue())
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(value: ?RingStyleOptions): This {
        let tmpValue = value ?? RingStyleOptions()
        unsafe {
            FfiOHOSAceFrameworkProgressSetRingStyle(
                RingStyle((tmpValue.strokeWidth ?? 4.vp).value, (tmpValue.strokeWidth ?? 4.vp).unitType.getValue(), tmpValue.shadow ?? false,
                    (tmpValue.status ?? ProgressStatus.Progressing).getValue(), tmpValue.enableSmoothEffect ?? true, tmpValue.enableScanEffect ?? false))
        }
        this
    }
}
