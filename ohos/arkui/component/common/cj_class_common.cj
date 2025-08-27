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
import std.convert.*

/**
 * Defines the event target.
 *
 * @relation declare interface EventTarget
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EventTarget {
    /**
     * Area information of the target element.
     *
     * @relation area: Area;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var area: Area

    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(area: Area) {
        this.area = area
    }
}

/**
 * Defines the area property.
 *
 * @relation declare interface Area
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Area {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var position: Position

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var globalPosition: Position

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        width: Length,
        height: Length,
        position: Position,
        globalPosition: Position
    ) {
        this.width = width
        this.height = height
        this.position = position
        this.globalPosition = globalPosition
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Position {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Length = 0, y!: Length = 0) {
        this.x = x
        this.y = y
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MotionPathOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var path: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var from: Float64 = 0.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var to: Float64 = 1.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rotatable: Bool = false

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        path!: String,
        from!: Float64 = 0.0,
        to!: Float64 = 1.0,
        rotatable!: Bool = false
    ) {
        this.path = path
        this.from = from
        this.to = to
        this.rotatable = rotatable
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SharedTransitionOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: Int32 = 1000
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: Curve = Curve.Linear
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: Int32 = 0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var motionPath: MotionPathOptions = MotionPathOptions(path: "")
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var zIndex: Int32 = 0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var effectType: SharedTransitionEffectType = SharedTransitionEffectType.Exchange

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: Int32 = 1000,
        curve!: Curve = Curve.Linear,
        delay!: Int32 = 0,
        motionPath!: MotionPathOptions = MotionPathOptions(path: ""),
        zIndex!: Int32 = 0,
        effectType!: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
    ) {
        this.duration = duration
        this.curve = curve
        this.delay = delay
        this.motionPath = motionPath
        this.zIndex = zIndex
        this.effectType = effectType
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimateParam {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var tempo: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: Curve
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var iterations: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var playMode: PlayMode
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onFinish: Option<() -> Unit>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var finishCallbackType: FinishCallbackType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var expectedFrameRateRange: Option<ExpectedFrameRateRange>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: Int32 = 1000,
        tempo!: Float32 = 1.0,
        curve!: Curve = Curve.EaseInOut,
        delay!: Int32 = 0,
        iterations!: Int32 = 1,
        playMode!: PlayMode = PlayMode.Normal,
        onFinish!: Option<() -> Unit> = Option.None,
        finishCallbackType!: FinishCallbackType = FinishCallbackType.Removed,
        expectedFrameRateRange!: Option<ExpectedFrameRateRange> = Option.None
    ) {
        this.duration = duration
        this.tempo = tempo
        this.curve = curve
        this.delay = delay
        this.iterations = iterations
        this.playMode = playMode
        this.onFinish = onFinish
        this.finishCallbackType = finishCallbackType
        this.expectedFrameRateRange = expectedFrameRateRange
    }
}

/**
 * Defines the HorizontalAlignment.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class HorizontalAlignment {
    /*
     * ID of the component that functions as the anchor point.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: String

    /*
     * alignment mode relative to the anchor component.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var align: HorizontalAlign

    /**
    * Defines the constructor of HorizontalAlignment.
    *
    * @param { String } anchor
    * @param { HorizontalAlign } align
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(anchor: String, align: HorizontalAlign) {
        this.anchor = anchor
        this.align = align
    }
}

/**
 * Defines the VerticalAlignment.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class VerticalAlignment {
    /*
     * ID of the component that functions as the anchor point.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: String

    /*
     * alignment mode relative to the anchor component.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var align: VerticalAlign

    /**
    * Defines the constructor of VerticalAlignment.
    *
    * @param { String } anchor
    * @param { VerticalAlign } align
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(anchor: String, align: VerticalAlign) {
        this.anchor = anchor
        this.align = align
    }
}

/**
 * Defines the Bias.
 *
 * @relation interface Bias
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Bias {

    /**
     * Horizontal ratio of the Bias, it must be >= 0.
     *
     * @type { Float32 }
     * @default 0.5
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var horizontal: Float32

    /**
     * Vertical ratio of the Bias, it must be >= 0.
     *
     * @type { Float32 }
     * @default 0.5
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var vertical: Float32

    /**
    * Defines the constructor of Bias.
    *
    * @param { Float32 } horizontal
    * @param { Float32 } vertical
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(horizontal!: Float32 = 0.5, vertical!: Float32 = 0.5) {
        this.horizontal = horizontal
        this.vertical = vertical
    }
}

/**
 * Defines the font used for text.
 *
 * @relation declare interface Font
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Fonts {
    /**
    * font size.
    *
    * @relation size?: Length;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Length

    /**
     * font weight.
     *
     * @relation weight?: FontWeight | number | string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: FontWeight

    /**
     * font family.
     *
     * @relation family?: string | Resource;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: String

    /**
     * font style.
     *
     * @relation style?: FontStyle;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: FontStyle

    /**
     * constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: ResourceStr = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal) {
        this.size = transAppResourceToLength(size)
        this.weight = weight
        this.family = transResourceStrToString(family)
        this.style = style
    }
}

/**
 * Defines the border radius property.
 *
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BorderRadiuses {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topLeft: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topRight: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomLeft: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomRight: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp) {
        this.topLeft = transAppResourceToLength(topLeft)
        this.topRight = transAppResourceToLength(topRight)
        this.bottomLeft = transAppResourceToLength(bottomLeft)
        this.bottomRight = transAppResourceToLength(bottomRight)
    }

    protected func toCBorderRadiuses(): CBorderRadiuses {
        return CBorderRadiuses(topLeft, topRight, bottomLeft, bottomRight)
    }

    protected static func parseFromString(value: String): Option<BorderRadiuses> {
        try {
            let jsonString = value.trimAscii()
            if (jsonString.startsWith("{")) {
                let kayValueStringArray = jsonString.removePrefix("{").removeSuffix("}").split(",", removeEmpty: true)
                let lengthStringArray = Array<String>(4, { index =>
                    return kayValueStringArray[index].split(":")[1]
                })
                let lengthArray = Array<Length>(4, { index =>
                    return parseLengthFromString(lengthStringArray[index])
                })

                return BorderRadiuses(
                    topLeft: lengthArray[0],
                    topRight: lengthArray[1],
                    bottomLeft: lengthArray[2],
                    bottomRight: lengthArray[3]
                )
            } else {
                let borderRadius = parseLengthFromString(value)
                return BorderRadiuses(
                    topLeft: borderRadius,
                    topRight: borderRadius,
                    bottomLeft: borderRadius,
                    bottomRight: borderRadius
                )
            }
        } catch(e: Exception) {
            return Option.None
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Margin {
    protected let top: Length
    protected let right: Length
    protected let bottom: Length
    protected let left: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp) {
        this.top = transAppResourceToLength(top)
        this.right = transAppResourceToLength(right)
        this.bottom = transAppResourceToLength(bottom)
        this.left = transAppResourceToLength(left)
    }

    protected static func parseFromString(value: String): Option<Margin> {
        try {
            let jsonString = value.trimAscii()
            if (jsonString.startsWith("[")) {
                let jsonString = value.trimAscii()
                let kayValueStringArray = jsonString.removePrefix("[").removeSuffix("]").split(",", removeEmpty: true)

                let lengthArray = Array<Length>(4, { index =>
                    return parseLengthFromString(kayValueStringArray[index])
                })

                return Margin(
                    left: lengthArray[0],
                    right: lengthArray[1],
                    top: lengthArray[2],
                    bottom: lengthArray[3]
                )
            } else {
                let margin = parseLengthFromString(value)
                return Margin(
                    left: margin,
                    right: margin,
                    top: margin,
                    bottom: margin
                )
            }
        } catch(e: Exception) {
            return Option.None
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShadowOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowType: ShadowType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        radius!: Float64,
        shadowType!: ShadowType = ShadowType.Color,
        color!: ResourceColor = Color.Black,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        fill!: Bool = false
    ) {
        this.radius = radius
        this.shadowType = shadowType
        this.color = color
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.fill = fill
    }
    protected func toActionSheetShadowNative(): NativeActionSheetShadowOptions {
        return NativeActionSheetShadowOptions(
            this.radius,
            Int32(this.shadowType.getValue()),
            transAppResourceToResourceColor(this.color),
            this.offsetX,
            this.offsetY,
            this.fill
        )
    }
    protected func toNative(): NativeTextShadowV2 {
        return NativeTextShadowV2(
            this.radius,
            this.offsetX,
            this.offsetY,
            transAppResourceToResourceColor(this.color),
            this.fill,
            this.shadowType.getValue()
        )
    }
}

protected func parseLengthFromString(value: String): Length {
    var realString = value.removePrefix('"').removeSuffix('"')
    if (realString.contains("vp")) {
        let valueString = realString.removeSuffix("vp")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.vp
            case None => throw IllegalArgumentException("The value is not a Length String.")
        }
    } else if (realString.contains("px")) {
        let valueString = realString.removeSuffix("px")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.px
            case None => throw IllegalArgumentException("The value is not a Length String.")
        }
    } else if (realString.contains("fp")) {
        let valueString = realString.removeSuffix("fp")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.fp
            case None => throw IllegalArgumentException("The value is not a Length String.")
        }
    } else if (realString.contains("lpx")) {
        let valueString = realString.removeSuffix("lpx")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.lpx
            case None => throw IllegalArgumentException("The value is not a Length String.")
        }
    } else if (realString.contains("%")) {
        let valueString = realString.removeSuffix("%")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.percent
            case None => throw IllegalArgumentException("The value is not a Length String.")
        }
    } else {
        let valueNumber = Float64.tryParse(realString)
        match (valueNumber) {
            case Some(v) => return v.vp
            case None => throw IllegalArgumentException("The value is not a Length String.")
        }
    }
}

protected func parseAnimateParam(params: AnimateParam): NativeAnimateParam {
    let duration = NativeOptionInt32(true, params.duration)
    let tempo = NativeOptionFloat32(true, params.tempo)
    let delay = NativeOptionInt32(true, params.delay)
    let iterations = NativeOptionInt32(true, params.iterations)
    let playMode = NativeOptionInt32(true, params.playMode.getValue())
    let finishCallbackType = NativeOptionInt32(true, params.finishCallbackType.getValue())
    let onFinish = if (let Some(value) <- params.onFinish) {
        NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
    } else {
        NativeOptionCallBack(false, INVALID_CALLBACK_ID)
    }

    let min = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, value.min)
    } else {
        NativeOptionInt32(false, 0)
    }

    let max = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, value.max)
    } else {
        NativeOptionInt32(false, 0)
    }

    let expected = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, value.expected)
    } else {
        NativeOptionInt32(false, 0)
    }

    let curveCStrng = unsafe { NativeOptionCString(true, LibC.mallocCString(params.curve.getValue())) }

    return NativeAnimateParam(
        duration,
        tempo,
        curveCStrng,
        delay,
        iterations,
        playMode,
        onFinish,
        finishCallbackType,
        min,
        max,
        expected
    )
}

/**
 * Defines the offset property.
 *
 * @relation declare interface Offset
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Offset {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dx: Length
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dy: Length
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(dx: Length, dy: Length) {
        this.dx = transAppResourceToLength(dx)
        this.dy = transAppResourceToLength(dy)
    }
}

protected func parseOffset(offset: Offset): NativeOffset {
    return NativeOffset(
        NativeLength(
            offset.dx.value,
            offset.dx.unitType.getValue()
        ),
        NativeLength(
            offset.dy.value,
            offset.dy.unitType.getValue()
        )
    )
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ExpectedFrameRateRange {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var min: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var max: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var expected: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        min!: Int32,
        max!: Int32,
        expected!: Int32
    ) {
        this.min = min
        this.max = max
        this.expected = expected
    }
}

/**
 * Defines the align rule options of relative container.
 *
 * @relation interface AlignRuleOption
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlignRuleOption {
    /**
    * Left alignment.
    * <br>anchor: ID of the component that functions as the anchor point.
    * <br>align: alignment mode relative to the anchor component.
    *
    * @type { ?HorizontalAlignment }
    * @relation left?: { anchor: string, align: HorizontalAlign }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ?HorizontalAlignment

    /**
    * Right alignment.
    * <br>anchor: ID of the component that functions as the anchor point.
    * <br>align: alignment mode relative to the anchor component.
    *
    * @type { ?HorizontalAlignment }
    * @relation right?: { anchor: string, align: HorizontalAlign }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: ?HorizontalAlignment

    /**
    * Horizontal center alignment.
    * <br>anchor: ID of the component that functions as the anchor point.
    * <br>align: alignment mode relative to the anchor component.
    *
    * @type { ?HorizontalAlignment }
    * @relation middle?: { anchor: string, align: HorizontalAlign }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var middle: ?HorizontalAlignment

    /**
    * Top alignment.
    * <br>anchor: ID of the component that functions as the anchor point.
    * <br>align: alignment mode relative to the anchor component.
    *
    * @type { ?VerticalAlignment }
    * @relation top?: { anchor: string, align: VerticalAlign }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ?VerticalAlignment

    /**
    * Bottom alignment.
    * <br>anchor: ID of the component that functions as the anchor point.
    * <br>align: alignment mode relative to the anchor component.
    *
    * @type { ?VerticalAlignment }
    * @relation bottom?: { anchor: string, align: VerticalAlign }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: ?VerticalAlignment

    /**
    * Vertical center alignment.
    * <br>anchor: ID of the component that functions as the anchor point.
    * <br>align: alignment mode relative to the anchor component.
    *
    * @type { ?VerticalAlignment }
    * @relation center?: { anchor: string, align: VerticalAlign }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var center: ?VerticalAlignment

    /**
    * Offset of the component under the anchor constraints.
    * <br>The value is the ratio of the distance to the left/upper anchor to the total distance between anchors.
    *
    * @type { ?Bias }
    * @relation bias?: Bias
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bias: Bias

    /**
    * Defines the constructor of AlignRuleOption.
    *
    * @param { ?HorizontalAlignment } left
    * @param { ?HorizontalAlignment } right
    * @param { ?HorizontalAlignment } middle
    * @param { ?VerticalAlignment } top
    * @param { ?VerticalAlignment } bottom
    * @param { ?VerticalAlignment } center
    * @param { Bias } bias
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(left!: ?HorizontalAlignment = None, right!: ?HorizontalAlignment = None,
        middle!: ?HorizontalAlignment = None, top!: ?VerticalAlignment = None,
        bottom!: ?VerticalAlignment = None, center!: ?VerticalAlignment = None,
        bias!: Bias = Bias()
    ) {
        this.left = left
        this.right = right
        this.middle = middle
        this.top = top
        this.bottom = bottom
        this.center = center
        this.bias = bias
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeStyles {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: BorderStyle
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: BorderStyle
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: BorderStyle
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: BorderStyle

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: BorderStyle = BorderStyle.Solid,
        right!: BorderStyle = BorderStyle.Solid,
        bottom!: BorderStyle = BorderStyle.Solid,
        left!: BorderStyle = BorderStyle.Solid
    ) {
        this.top = top
        this.right = right
        this.bottom = bottom
        this.left = left
    }

    protected func toNative(): NativeEdgeStyles {
        return NativeEdgeStyles(
            top.getValue(),
            right.getValue(),
            bottom.getValue(),
            left.getValue()
        )
    }
}
protected class MultiShadowOptionsImpl {}

/**
 * Defines the options of Shadow.
 *
 * @class MultiShadowOptions
 * @relation interface MultiShadowOptions
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class MultiShadowOptions {
    protected var impl: MultiShadowOptionsImpl = MultiShadowOptionsImpl()
    /**
     * Shadow blur radius.
     * Unit: vp.
     * <p>**NOTE**:
     * <br>A value less than or equal to 0 is handled as the default value.
     * </p>
     *
     * @type { Length }
     * @default 20
     * @relation radius?: number | Resource
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Length = 20.vp
    /**
     * Offset on the x-axis.
     * Unit: vp.
     *
     * @type { Length }
     * @default 5
     * @relation offsetX?: number | Resource
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: Length = 5.vp
    /**
     * Offset on the y-axis.
     * Unit: vp.
     *
     * @type { Length }
     * @default 5
     * @relation offsetY?: number | Resource
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: Length = 5.vp

    protected init(radius: Length, offsetX: Length, offsetY: Length) {
        this.radius = radius
        this.offsetX = offsetX
        this.offsetY = offsetY
    }
}

/**
 * Provide an interface for the text style of picker
 *
 * @class PickerTextStyle
 * @relation interface PickerTextStyle
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PickerTextStyle {
    /**
     * Font color.
     *
     * @type { ?ResourceColor }
     * @relation color?: ResourceColor
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor

    /**
     * Text style.
     *
     * @type { ?Font }
     * @relation font?: Font
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var font: ?Font

    /**
     * PickerTextStyle constructor.
     *
     * @param { ?ResourceColor } color
     * @param { ?Font } font
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(color!: ?ResourceColor = None, font!: ?Font = None) {
        this.color = color
        this.font = font
    }
}

/**
 * Provide an interface for the text style of picker
 *
 * @class PickerTextStyle
 * @relation interface PickerTextStyle
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Font {
    /**
     * font size.
     *
     * @type { ?Length }
     * @relation size?: Length
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?Length
    /**
     * font weight.
     *
     * @type { ?FontWeight }
     * @relation weight?: FontWeight | number | string
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: ?FontWeight
    /**
     * font family.
     *
     * @type { ?ResourceStr }
     * @relation family?: string | Resource
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: ?ResourceStr
    /**
     * font style.
     *
     * @type { ?FontStyle }
     * @relation style?: FontStyle
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?FontStyle

    /**
     * Font constructor.
     *
     * @param { ?Length } size
     * @param { ?FontWeight } weight
     * @param { ?ResourceStr } family
     * @param { ?FontStyle } style
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: ?Length = None, weight!: ?FontWeight = None, family!: ?ResourceStr = None, style!: ?FontStyle = None) {
        this.size = size
        this.weight = weight
        this.family = family
        this.style = style
    }
}

/**
 * TextContentControllerBase
 *
 * @relation declare abstract class TextContentControllerBase
 */
public interface TextContentControllerBase {

}