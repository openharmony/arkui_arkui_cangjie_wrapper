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

package ohos.arkui.component.gesture

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.ArrayList

enum EventTargetInfoType {
    | Normal
    | Scrollable

    func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Scrollable => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parseValue(value: Int32): EventTargetInfoType {
        match (value) {
            case 0 => Normal
            case 1 => Scrollable
            case _ => Normal
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FingerInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let id: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let globalX: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let globalY: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let localX: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let localY: Float64

    init(id: Int32, globalX: Float64, globalY: Float64, localX: Float64, localY: Float64) {
        this.id = id
        this.globalX = globalX
        this.globalY = globalY
        this.localX = localX
        this.localY = localY
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GestureEvent <: BaseEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let repeat: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let fingerList: ArrayList<FingerInfo>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let offsetX: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let offsetY: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let scale: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let pinchCenterX: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let pinchCenterY: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let angle: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let speed: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let velocityX: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let velocityY: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let velocity: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviveId: Int64,
        repeat: Bool,
        offsetX: Float64,
        offsetY: Float64,
        angle: Float64,
        scale: Float64,
        pinchCenterX: Float64,
        pinchCenterY: Float64,
        speed: Float64,
        fingerList: ArrayList<FingerInfo>,
        velocityX: Float64,
        velocityY: Float64,
        velocity: Float64
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviveId
        )
        this.repeat = repeat
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.angle = angle
        this.scale = scale
        this.pinchCenterX = pinchCenterX
        this.pinchCenterY = pinchCenterY
        this.speed = speed
        this.fingerList = fingerList
        this.velocityX = velocityX
        this.velocityY = velocityY
        this.velocity = velocity
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GestureInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let tag: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let `type`: GestureTypes

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let isSystemGesture: Bool

    init(tag: String, `type`: GestureTypes, isSystemGesture: Bool) {
        this.tag = tag
        this.`type` = `type`
        this.isSystemGesture = isSystemGesture
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BaseEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let target: EventTarget

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let timestamp: Int64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let source: SourceType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let pressure: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let tiltX: Int64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let tiltY: Int64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let sourceTool: SourceTool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let axisHorizontal: Option<Float32>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let axisVertical: Option<Float32>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let getModifierKeyState: Option<(Array<String>) -> Bool>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let deviceId: Int64

    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64
    ) {
        this.target = target
        this.timestamp = timestamp
        this.source = source
        this.pressure = pressure
        this.tiltX = tiltX
        this.tiltY = tiltY
        this.sourceTool = sourceTool
        this.axisHorizontal = axisHorizontal
        this.axisVertical = axisVertical
        this.getModifierKeyState = getModifierKeyState
        this.deviceId = deviceId
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BaseGestureEvent <: BaseEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let fingerList: ArrayList<FingerInfo>

    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64,
        fingerList: ArrayList<FingerInfo>
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviceId
        )
        this.fingerList = fingerList
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TapGestureEvent <: BaseGestureEvent {
    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64,
        fingerList: ArrayList<FingerInfo>
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviceId,
            fingerList
        )
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LongPressGestureEvent <: BaseGestureEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let repeat: Bool
    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64,
        fingerList: ArrayList<FingerInfo>,
        repeat: Bool
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviceId,
            fingerList
        )
        this.repeat = repeat
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PanGestureEvent <: BaseGestureEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let offsetX: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let offsetY: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let velocityX: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let velocityY: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let velocity: Float64

    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64,
        fingerList: ArrayList<FingerInfo>,
        offsetX: Float64,
        offsetY: Float64,
        velocityX: Float64,
        velocityY: Float64,
        velocity: Float64
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviceId,
            fingerList,
        )
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.velocityX = velocityX
        this.velocityY = velocityY
        this.velocity = velocity
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PinchGestureEvent <: BaseGestureEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let scale: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let pinchCenterX: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let pinchCenterY: Float64

    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64,
        fingerList: ArrayList<FingerInfo>,
        scale: Float64,
        pinchCenterX: Float64,
        pinchCenterY: Float64
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviceId,
            fingerList
        )
        this.scale = scale
        this.pinchCenterX = pinchCenterX
        this.pinchCenterY = pinchCenterY
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotationGestureEvent <: BaseGestureEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let angle: Float64

    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64,
        fingerList: ArrayList<FingerInfo>,
        angle: Float64
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviceId,
            fingerList
        )
        this.angle = angle
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwipeGestureEvent <: BaseGestureEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let angle: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let speed: Float64

    init(
        target: EventTarget,
        timestamp: Int64,
        source: SourceType,
        pressure: Float64,
        tiltX: Int64,
        tiltY: Int64,
        sourceTool: SourceTool,
        axisHorizontal: Option<Float32>,
        axisVertical: Option<Float32>,
        getModifierKeyState: Option<(Array<String>) -> Bool>,
        deviceId: Int64,
        fingerList: ArrayList<FingerInfo>,
        angle: Float64,
        speed: Float64
    ) {
        super(
            target,
            timestamp,
            source,
            pressure,
            tiltX,
            tiltY,
            sourceTool,
            axisHorizontal,
            axisVertical,
            getModifierKeyState,
            deviceId,
            fingerList
        )
        this.angle = angle
        this.speed = speed
    }
}

@C
struct CJBaseEvent {
    CJBaseEvent(
        let target: CPointer<CJEventTarget>,
        let timestamp: Int64,
        let source: Int32,
        let pressure: Float64,
        let tiltX: Int64,
        let tiltY: Int64,
        let sourceTool: Int32,
        let axisHorizontal: CPointer<Float32>,
        let axisVertical: CPointer<Float32>,
        let deviceId: Int64
    ) {}
}

@C
struct CJGestureInfo {
    CJGestureInfo(
        let tag: CString,
        let `type`: Int32,
        let isSystemGesture: Bool
    ) {}
}

@C
struct CJBaseGestureEvent {
    CJBaseGestureEvent(
        let baseEvent: CPointer<CJBaseEvent>,
        let fingerList: CPointer<CJFingerInfo>,
        let fingerListSize: Int32,
        let repeat: Bool,
        let offsetX: Float64,
        let offsetY: Float64,
        let velocityX: Float64,
        let velocityY: Float64,
        let velocity: Float64,
        let scale: Float64,
        let pinchCenterX: Float64,
        let pinchCenterY: Float64,
        let angle: Float64,
        let speed: Float64
    ) {}
}

func parseCJBaseGestureEvent(event: CJBaseGestureEvent, types: GestureTypes): BaseGestureEvent {
    let fingerList: ArrayList<FingerInfo> = ArrayList<FingerInfo>()

    let baseEvent = unsafe { event.baseEvent.read() }

    BaseLog.debug("parseCJBaseGestureEvent start")

    for (i in 0..event.fingerListSize) {
        let fingerInfo = unsafe { event.fingerList.read(Int64(i)) }
        fingerList.add(
            FingerInfo(
                fingerInfo.id,
                fingerInfo.globalX,
                fingerInfo.globalY,
                fingerInfo.localX,
                fingerInfo.localY
            )
        )
    }

    BaseLog.debug("parseCJBaseGestureEvent FingerInfo success")
    match (types) {
        case GestureTypes.TAP_GESTURE =>
            BaseLog.debug("parseCJBaseGestureEvent TAP_GESTURE start")
            return TapGestureEvent(
                unsafe { parseCJTarget(baseEvent.target.read()) },
                baseEvent.timestamp,
                SourceType.parseValue(baseEvent.source),
                baseEvent.pressure,
                baseEvent.tiltX,
                baseEvent.tiltY,
                SourceTool.parseValue(baseEvent.sourceTool),
                Option.None,
                Option.None,
                Option.None,
                baseEvent.deviceId,
                fingerList
            )
        case GestureTypes.LONG_PRESS_GESTURE =>
            BaseLog.debug("parseCJBaseGestureEvent LONG_PRESS_GESTURE start")
            return LongPressGestureEvent(
                unsafe { parseCJTarget(baseEvent.target.read()) },
                baseEvent.timestamp,
                SourceType.parseValue(baseEvent.source),
                baseEvent.pressure,
                baseEvent.tiltX,
                baseEvent.tiltY,
                SourceTool.parseValue(baseEvent.sourceTool),
                Option.None,
                Option.None,
                Option.None,
                baseEvent.deviceId,
                fingerList,
                event.repeat
            )
        case GestureTypes.PAN_GESTURE =>
            BaseLog.debug("parseCJBaseGestureEvent PAN_GESTURE start")
            return PanGestureEvent(
                unsafe { parseCJTarget(baseEvent.target.read()) },
                baseEvent.timestamp,
                SourceType.parseValue(baseEvent.source),
                baseEvent.pressure,
                baseEvent.tiltX,
                baseEvent.tiltY,
                SourceTool.parseValue(baseEvent.sourceTool),
                Option.None,
                Option.None,
                Option.None,
                baseEvent.deviceId,
                fingerList,
                event.offsetX,
                event.offsetY,
                event.velocityX,
                event.velocityY,
                event.velocity
            )
        case GestureTypes.PINCH_GESTURE =>
            BaseLog.debug("parseCJBaseGestureEvent PINCH_GESTURE start")
            return PinchGestureEvent(
                unsafe { parseCJTarget(baseEvent.target.read()) },
                baseEvent.timestamp,
                SourceType.parseValue(baseEvent.source),
                baseEvent.pressure,
                baseEvent.tiltX,
                baseEvent.tiltY,
                SourceTool.parseValue(baseEvent.sourceTool),
                Option.None,
                Option.None,
                Option.None,
                baseEvent.deviceId,
                fingerList,
                event.scale,
                event.pinchCenterX,
                event.pinchCenterY,
            )
        case GestureTypes.SWIPE_GESTURE =>
            BaseLog.debug("parseCJBaseGestureEvent SWIPE_GESTURE start")
            return SwipeGestureEvent(
                unsafe { parseCJTarget(baseEvent.target.read()) },
                baseEvent.timestamp,
                SourceType.parseValue(baseEvent.source),
                baseEvent.pressure,
                baseEvent.tiltX,
                baseEvent.tiltY,
                SourceTool.parseValue(baseEvent.sourceTool),
                Option.None,
                Option.None,
                Option.None,
                baseEvent.deviceId,
                fingerList,
                event.angle,
                event.speed
            )
        case GestureTypes.ROTATION_GESTURE =>
            BaseLog.debug("parseCJBaseGestureEvent ROTATION_GESTURE start")
            return RotationGestureEvent(
                unsafe { parseCJTarget(baseEvent.target.read()) },
                baseEvent.timestamp,
                SourceType.parseValue(baseEvent.source),
                baseEvent.pressure,
                baseEvent.tiltX,
                baseEvent.tiltY,
                SourceTool.parseValue(baseEvent.sourceTool),
                Option.None,
                Option.None,
                Option.None,
                baseEvent.deviceId,
                fingerList,
                event.angle
            )
        case _ =>
            BaseLog.debug("parseCJBaseGestureEvent BaseGestureEvent start")
            return BaseGestureEvent(
                unsafe { parseCJTarget(baseEvent.target.read()) },
                baseEvent.timestamp,
                SourceType.parseValue(baseEvent.source),
                baseEvent.pressure,
                baseEvent.tiltX,
                baseEvent.tiltY,
                SourceTool.parseValue(baseEvent.sourceTool),
                Option.None,
                Option.None,
                Option.None,
                baseEvent.deviceId,
                fingerList
            )
    }
}

func parseCJGestureInfo(info: CJGestureInfo): GestureInfo {
    GestureInfo(
        info.tag.toString(),
        GestureTypes.parseValue(info.`type`),
        info.isSystemGesture
    )
}

func parseCJGestureEvent(event: CJGestureEventV2): GestureEvent {
    let fingerList: ArrayList<FingerInfo> = ArrayList<FingerInfo>()

    for (i in 0..event.fingerListSize) {
        let fingerInfo = unsafe { event.fingerList.read(Int64(i)) }
        fingerList.add(
            FingerInfo(
                fingerInfo.id,
                fingerInfo.globalX,
                fingerInfo.globalY,
                fingerInfo.localX,
                fingerInfo.localY
            )
        )
    }

    let baseEvtInfoPtr = event.baseEvtInfo

    GestureEvent(
        unsafe { parseCJTarget(event.target.read()) },
        event.timestamp,
        SourceType.parseValue(event.source),
        event.pressure,
        event.tiltX,
        event.tiltY,
        SourceTool.parseValue(event.sourceTool),
        event.axisHorizontal,
        event.axisVertical,
        {
            value: Array<String> =>
            let param = FFIVectorString(value.size)
            for (i in 0..value.size) {
                param.setElement(i, value[i])
            }
            let ret = unsafe { FfiOHOSAceFrameworkGestureGetModifierKeyState(baseEvtInfoPtr, param.getNativeHandle()) }
            param.free()
            ret
        },
        event.deviveId,
        event.repeat,
        event.offsetX,
        event.offsetY,
        event.angle,
        event.scale,
        event.pinchCenterX,
        event.pinchCenterY,
        event.speed,
        fingerList,
        event.velocityX,
        event.velocityY,
        event.velocity,
    )
}

func getOrDefault(value: Int64, min: Int64, max: Int64, default: Int64): Int64 {
    if (value < min || value > max) {
        return default
    }
    return value
}

func getOrDefault(value: Float64, min: Float64, max: Float64, default: Float64): Float64 {
    if (value < min || value > max) {
        return default
    }
    return value
}

func getOrDefault(value: Int32, min: Int32, max: Int32, default: Int32): Int32 {
    if (value < min || value > max) {
        return default
    }
    return value
}

foreign {
    func FfiOHOSAceFrameworkGestureCreate(priority: Int32, mask: Int32): Unit

    func FfiOHOSAceFrameworkGestureSetTag(tag: CString): Unit

    func FfiOHOSAceFrameworkGestureOnActionV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionStartV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionUpdateV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionEndV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionCancel(callback: Int64): Unit

    func FfiOHOSAceFrameworkGesturePop(): Unit

    func FfiOHOSAceFrameworkGestureFinish(): Unit

    func FfiOHOSAceFrameworkTapGestureCreate(count: Int32, fingers: Int32): Unit

    func FfiOHOSAceFrameworkLongPressGestureCreate(fingers: Int32, repeat: Bool, duration: Int32): Unit

    func FfiOHOSAceFrameworkPinchGestureCreate(fingers: Int32, distance: Float64): Unit

    func FfiOHOSAceFrameworkSwipeGestureCreate(fingers: Int32, direction: UInt32, speed: Float64): Unit

    func FfiOHOSAceFrameworkRotationGestureCreate(fingers: Int32, angle: Float64): Unit

    func FfiOHOSAceFrameworkPanGestureCreate(fingers: Int32, direction: UInt32, distance: Float64): Unit

    func FfiOHOSAceFrameworkPanGestureCreateWithOptions(panGestureOptions: Int64): Unit

    func FfiOHOSAceFrameworkGestureGroupCreate(mode: Int32): Unit

    func FfiOHOSAceFrameworkPanGestureOptionsCtor(fingers: Int32, direction: UInt32, distance: Float64): Int64

    func FfiOHOSAceFrameworkPanGestureOptionsSetDirection(SelfID: Int64, direction: UInt32): Unit

    func FfiOHOSAceFrameworkPanGestureOptionsSetDistance(SelfID: Int64, distance: Float64): Unit

    func FfiOHOSAceFrameworkPanGestureOptionsSetFingers(SelfID: Int64, fingers: Int32): Unit

    func FfiOHOSAceFrameworkTapGestureHandlerCtor(count: Int32, fingers: Int32): Int64

    func FfiOHOSAceFrameworkLongPressGestureHandlerCtor(fingers: Int32, repeat: Bool, duration: Int32): Int64

    func FfiOHOSAceFrameworkPinchGestureHandlerCtor(fingers: Int32, distance: Float64): Int64

    func FfiOHOSAceFrameworkSwipeGestureHandlerCtor(fingers: Int32, direction: UInt32, speed: Float64): Int64

    func FfiOHOSAceFrameworkRotationGestureHandlerCtor(fingers: Int32, angle: Float64): Int64

    func FfiOHOSAceFrameworkPanGestureHandlerCtor(fingers: Int32, direction: UInt32, distance: Float64): Int64

    func FfiOHOSAceFrameworkGestureGroupHandlerCtor(mode: Int32, vectorHandle: VectorInt64Handle): Int64

    func FfiOHOSAceFrameworkGestureGroupHandlerSetOnCancel(id: Int64, callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureHandlerSetTag(id: Int64, tag: CString): Unit

    func FfiOHOSAceFrameworkGestureHandlerSetOnAction(id: Int64, callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureHandlerSetOnActionStart(id: Int64, callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureHandlerSetOnActionUpdate(id: Int64, callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureHandlerSetOnActionEnd(id: Int64, callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureHandlerSetOnActionCancel(id: Int64, callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureGetModifierKeyState(baseEvtInfo: CPointer<Unit>, param: VectorStringHandle): Bool

    func FfiOHOSAceFrameworkViewAbstractSetGestureHandler(elemId: Int64, gestureId: Int64, priority: Int32, mask: Int32): Unit

    func FfiOHOSAceFrameworkViewAbstractClearGestureHandlers(elemId: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractRemoveGestureHandlerByTag(elemId: Int64, tag: CString): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOnGestureJudgeBegin(elemId: Int64): Unit

    func FfiOHOSAceFrameworkGestureRecognizerGetTag(id: Int64): ExternalString

    func FfiOHOSAceFrameworkGestureRecognizerGetType(id: Int64): Int32

    func FfiOHOSAceFrameworkGestureRecognizerIsEnabled(id: Int64): Bool

    func FfiOHOSAceFrameworkGestureRecognizerIsValid(id: Int64): Bool

    func FfiOHOSAceFrameworkGestureRecognizerSetEnabled(id: Int64, enabled: Bool): Unit

    func FfiOHOSAceFrameworkGestureRecognizerIsBuiltIn(id: Int64): Bool

    func FfiOHOSAceFrameworkGestureRecognizerGetState(id: Int64): Int32

    func FfiOHOSAceFrameworkGestureRecognizerGetEventTargetInfo(id: Int64): Int64

    func FfiOHOSAceFrameworkEventTargetInfoGetId(id: Int64): ExternalString

    func FfiOHOSAceFrameworkPanRecognizerGetPanGestureOptions(id: Int64): Int64

    func FfiOHOSAceFrameworkScrollableTargetInfoIsBegin(id: Int64): Bool

    func FfiOHOSAceFrameworkScrollableTargetInfoIsEnd(id: Int64): Bool

    func FfiOHOSAceFrameworkEventTargetInfoGetType(id: Int64): Int32

    func FfiOHOSAceFrameworkGestureRecognizerCtor(): Int64
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class GestureHandler <: RemoteDataLite {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id: Int64) {
        super(id)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TapGestureHandler <: GestureHandler {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(count!: Int32 = 1, fingers!: Int32 = 1) {
        super(
            unsafe {
                FfiOHOSAceFrameworkTapGestureHandlerCtor(getOrDefault(count, 1, Int32.Max, 1),
                    getOrDefault(fingers, 1, 10, 1))
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAction(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnAction(this.getID(), onActionCallback.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PanGestureHandler <: GestureHandler {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0) {
        super(
            unsafe {
                FfiOHOSAceFrameworkPanGestureHandlerCtor(getOrDefault(fingers, 1, 10, 1), direction.getValue(),
                    getOrDefault(distance, 0.0, Float64.Max, 5.0))
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionStart(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionStartCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionStart(this.getID(), onActionStartCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionUpdate(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionUpdate(this.getID(), onActionCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionEnd(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionEnd(this.getID(), onActionCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionCancel(callback: () -> Unit): This {
        let wrapper = {
            => callback()
        }
        let onActionCancelCallback = Callback0Param<Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionCancel(this.getID(), onActionCancelCallback.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LongPressGestureHandler <: GestureHandler {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fingers!: Int32 = 1, repeat!: Bool = false, duration!: Int32 = 500) {
        super(
            unsafe {
                FfiOHOSAceFrameworkLongPressGestureHandlerCtor(getOrDefault(fingers, 1, 10, 1), repeat,
                    getOrDefault(duration, 0, Int32.Max, 500))
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAction(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnAction(this.getID(), onActionCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionEnd(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionEnd(this.getID(), onActionCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionCancel(callback: () -> Unit): This {
        let onActionCancelCallback = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionCancel(this.getID(), onActionCancelCallback.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PinchGestureHandler <: GestureHandler {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fingers!: Int32 = 2, distance!: Float64 = 5.0) {
        super(
            unsafe {
                FfiOHOSAceFrameworkPinchGestureHandlerCtor(getOrDefault(fingers, 2, 5, 2),
                    getOrDefault(distance, 0.0, Float64.Max, 5.0))
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionStart(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionStartCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionStart(this.getID(), onActionStartCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionUpdate(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionUpdateCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionUpdate(this.getID(), onActionUpdateCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionEnd(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionEndCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionEnd(this.getID(), onActionEndCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionCancel(callback: () -> Unit): This {
        let onActionCancelCallback = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionCancel(this.getID(), onActionCancelCallback.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotationGestureHandler <: GestureHandler {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fingers!: Int32 = 2, angle!: Float64 = 1.0) {
        super(
            unsafe {
                FfiOHOSAceFrameworkRotationGestureHandlerCtor(getOrDefault(fingers, 2, 5, 2),
                    getOrDefault(angle, 0.0, 360.0, 1.0))
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionStart(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionStartCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionStart(this.getID(), onActionStartCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionUpdate(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionUpdateCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionUpdate(this.getID(), onActionUpdateCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionEnd(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionEndCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionEnd(this.getID(), onActionEndCallback.getID())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionCancel(callback: () -> Unit): This {
        let onActionCancelCallback = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnActionCancel(this.getID(), onActionCancelCallback.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SwipeGestureHandler <: GestureHandler {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fingers!: Int32 = 1, direction!: SwipeDirection = SwipeDirection.All, speed!: Float64 = 100.0) {
        super(
            unsafe {
                FfiOHOSAceFrameworkSwipeGestureHandlerCtor(getOrDefault(fingers, 1, 10, 1), direction.getValue(),
                    getOrDefault(speed, 0.0, Float64.Max, 100.0))
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAction(callback: (GestureEvent) -> Unit): This {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEvent(evt))
        }
        let onActionCallback = CallbackCJGestureEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureHandlerSetOnAction(this.getID(), onActionCallback.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GestureGroupHandler <: GestureHandler {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(mode: GestureMode, gesture: Array<GestureHandler>) {
        super(
            unsafe {
                let vecFFi = FFIVectorInt64(gesture.size)
                var index = 0
                for (item in gesture) {
                    vecFFi.setElement(index, item.getID())
                    index++
                }
                let id = FfiOHOSAceFrameworkGestureGroupHandlerCtor(mode.getValue(), vecFFi.getNativeHandle())
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCancel(callback: () -> Unit): This {
        let onCancelCallback = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkGestureGroupHandlerSetOnCancel(this.getID(), onCancelCallback.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIGestureEvent {
    let elementID: Int64
    init(elementID: Int64) {
        this.elementID = elementID
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addGesture(gesture: GestureHandler, priority!: GesturePriority = GesturePriority.Low,
        mask!: GestureMask = GestureMask.Normal): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetGestureHandler(elementID, gesture.getID(), priority.getValue(),
                mask.getValue())
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addParallelGesture(gesture: GestureHandler, mask!: GestureMask = GestureMask.Normal): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetGestureHandler(elementID, gesture.getID(),
                GesturePriorityInner.Parallel.getValue(), mask.getValue())
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeGestureByTag(tag: String): Unit {
        unsafe {
            try (tagCString = LibC.mallocCString(tag).asResource()) {
                FfiOHOSAceFrameworkViewAbstractRemoveGestureHandlerByTag(elementID, tagCString.value)
            }
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clearGestures(): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractClearGestureHandlers(elementID)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface GestureModifier {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func applyGesture(event: UIGestureEvent): Unit
}
