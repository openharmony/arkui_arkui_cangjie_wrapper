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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EventTarget {
    /**
     * Area information of the target element.
     *
     * @relation area: Area;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var area: ?Area

    /**
     * constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(area: ?Area) {
        this.area = area ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * Defines the area property.
 *
 * @relation declare interface Area
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Area {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var position: ?Position

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var globalPosition: ?Position

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        width: ?Length,
        height: ?Length,
        position: ?Position,
        globalPosition: ?Position
    ) {
        this.width = width ?? throw IllegalArgumentException("The type now is not supported.")
        this.height = height ?? throw IllegalArgumentException("The type now is not supported.")
        this.position = position ?? throw IllegalArgumentException("The type now is not supported.")
        this.globalPosition = globalPosition ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Position {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?Length = None, y!: ?Length = None) {
        this.x = x ?? 0
        this.y = y ?? 0
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MotionPathOptions {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var path: ?String
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var from: ?Float64
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var to: ?Float64
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rotatable: ?Bool

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        path!: ?String,
        from!: ?Float64 = None,
        to!: ?Float64 = None,
        rotatable!: ?Bool = None
    ) {
        this.path = path ?? throw IllegalArgumentException("The type now is not supported.")
        this.from = from ?? 0.0
        this.to = to ?? 1.0
        this.rotatable = rotatable ?? false
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SharedTransitionOptions {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var motionPath: ?MotionPathOptions
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var zIndex: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var effectType: ?SharedTransitionEffectType

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: ?Int32 = None,
        curve!: ?Curve = None,
        delay!: ?Int32 = None,
        motionPath!: ?MotionPathOptions = None,
        zIndex!: ?Int32 = None,
        effectType!: ?SharedTransitionEffectType = None
    ) {
        this.duration = duration ?? 1000
        this.curve = curve ?? Curve.Linear
        this.delay = delay ?? 0
        this.motionPath = motionPath ?? MotionPathOptions(path: "")
        this.zIndex = zIndex ?? 0
        this.effectType = effectType ?? SharedTransitionEffectType.Exchange
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimateParam {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var tempo: ?Float32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var iterations: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var playMode: ?PlayMode
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onFinish: Option<() -> Unit>
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var finishCallbackType: ?FinishCallbackType
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var expectedFrameRateRange: Option<ExpectedFrameRateRange>

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: ?Int32 = None,
        tempo!: ?Float32 = None,
        curve!: ?Curve = None,
        delay!: ?Int32 = None,
        iterations!: ?Int32 = None,
        playMode!: ?PlayMode = None,
        onFinish!: Option<() -> Unit> = Option.None,
        finishCallbackType!: ?FinishCallbackType = None,
        expectedFrameRateRange!: Option<ExpectedFrameRateRange> = Option.None
    ) {
        this.duration = duration ?? 1000
        this.tempo = tempo ?? 1.0
        this.curve = curve ?? Curve.EaseInOut
        this.delay = delay ?? 0
        this.iterations = iterations ?? 1
        this.playMode = playMode ?? PlayMode.Normal
        this.onFinish = onFinish
        this.finishCallbackType = finishCallbackType ?? FinishCallbackType.Removed
        this.expectedFrameRateRange = expectedFrameRateRange
    }
}

/**
 * Defines the HorizontalAlignment.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class HorizontalAlignment {
    /*
     * ID of the component that functions as the anchor point.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: ?String

    /*
     * alignment mode relative to the anchor component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var align: ?HorizontalAlign

    /**
    * Defines the constructor of HorizontalAlignment.
    *
    * @param { String } anchor
    * @param { HorizontalAlign } align
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(anchor: ?String, align: ?HorizontalAlign) {
        this.anchor = anchor ?? throw IllegalArgumentException("The type now is not supported.")
        this.align = align ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * Defines the VerticalAlignment.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class VerticalAlignment {
    /*
     * ID of the component that functions as the anchor point.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: ?String

    /*
     * alignment mode relative to the anchor component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var align: ?VerticalAlign

    /**
    * Defines the constructor of VerticalAlignment.
    *
    * @param { String } anchor
    * @param { VerticalAlign } align
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(anchor: ?String, align: ?VerticalAlign) {
        this.anchor = anchor ?? throw IllegalArgumentException("The type now is not supported.")
        this.align = align ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * Defines the Bias.
 *
 * @relation interface Bias
 */
@!APILevel[
    22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var horizontal: ?Float32

    /**
     * Vertical ratio of the Bias, it must be >= 0.
     *
     * @type { Float32 }
     * @default 0.5
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var vertical: ?Float32

    /**
    * Defines the constructor of Bias.
    *
    * @param { Float32 } horizontal
    * @param { Float32 } vertical
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(horizontal!: ?Float32 = None, vertical!: ?Float32 = None) {
        this.horizontal = horizontal ?? 0.5
        this.vertical = vertical ?? 0.5
    }
}

/**
 * Defines the font used for text.
 *
 * @relation declare interface Font
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Fonts {
    /**
    * font size.
    *
    * @relation size?: Length;
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?Length

    /**
     * font weight.
     *
     * @relation weight?: FontWeight | number | string;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: ?FontWeight

    /**
     * font family.
     *
     * @relation family?: string | Resource;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: ?String

    /**
     * font style.
     *
     * @relation style?: FontStyle;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?FontStyle

    /**
     * constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: ?Length = None, weight!: ?FontWeight = None, family!: ?ResourceStr = None,
        style!: ?FontStyle = None ) {
        this.size = transAppResourceToLength(size ?? 16.fp)
        this.weight = weight ?? FontWeight.Normal
        this.family = transResourceStrToString(family ?? "HarmonyOS Sans")
        this.style = style ?? FontStyle.Normal
    }
}

/**
 * Defines the border radius property.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BorderRadiuses {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topLeft: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topRight: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomLeft: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomRight: ?Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(topLeft!: ?Length = None, topRight!: ?Length = None, bottomLeft!: ?Length = None,
        bottomRight!: ?Length = None) {
        this.topLeft = transAppResourceToLength(topLeft ?? 0.vp)
        this.topRight = transAppResourceToLength(topRight ?? 0.vp)
        this.bottomLeft = transAppResourceToLength(bottomLeft ?? 0.vp)
        this.bottomRight = transAppResourceToLength(bottomRight ?? 0.vp)
    }

    protected func toCBorderRadiuses(): CBorderRadiuses {
        return CBorderRadiuses(topLeft ?? 0.vp, topRight ?? 0.vp, bottomLeft ?? 0.vp, bottomRight ?? 0.vp)
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
                    return parseLengthFromString(lengthStringArray[index]).getOrDefault({ => 0.vp})
                })

                return BorderRadiuses(
                    topLeft: lengthArray[0],
                    topRight: lengthArray[1],
                    bottomLeft: lengthArray[2],
                    bottomRight: lengthArray[3]
                )
            } else {
                let borderRadius = parseLengthFromString(value).getOrDefault({ => 0.vp})
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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Margin {
    protected let top: Length
    protected let right: Length
    protected let bottom: Length
    protected let left: Length

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(top!: ?Length = None, right!: ?Length = None, bottom!: ?Length = None, left!: ?Length = None) {
        this.top = transAppResourceToLength(top ?? 0.vp)
        this.right = transAppResourceToLength(right ?? 0.vp)
        this.bottom = transAppResourceToLength(bottom ?? 0.vp)
        this.left = transAppResourceToLength(left ?? 0.vp)
    }

    protected static func parseFromString(value: String): Option<Margin> {
        try {
            let jsonString = value.trimAscii()
            if (jsonString.startsWith("[")) {
                let jsonString = value.trimAscii()
                let kayValueStringArray = jsonString.removePrefix("[").removeSuffix("]").split(",", removeEmpty: true)

                let lengthArray = Array<Length>(4, { index =>
                    return parseLengthFromString(kayValueStringArray[index]).getOrDefault({ => 0.vp})
                })

                return Margin(
                    left: lengthArray[0],
                    right: lengthArray[1],
                    top: lengthArray[2],
                    bottom: lengthArray[3]
                )
            } else {
                let margin = parseLengthFromString(value).getOrDefault({ => 0.vp})
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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShadowOptions {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: ?Float64
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowType: ?ShadowType
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: ?Float64
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: ?Float64
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: ?Bool

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        radius!: ?Float64,
        shadowType!: ?ShadowType = None,
        color!: ?ResourceColor = None,
        offsetX!: ?Float64 = None,
        offsetY!: ?Float64 = None,
        fill!: ?Bool = None
    ) {
        this.radius = radius ?? throw IllegalArgumentException("The type now is not supported.")
        this.shadowType = shadowType ?? ShadowType.Color
        this.color = color ?? Color.Black
        this.offsetX = offsetX ?? 0.0
        this.offsetY = offsetY ?? 0.0
        this.fill = fill ?? false
    }
    protected func toActionSheetShadowNative(): NativeActionSheetShadowOptions {
        return NativeActionSheetShadowOptions(
            this.radius ?? throw IllegalArgumentException("The type now is not supported."),
            Int32((this.shadowType ?? ShadowType.Color).getValue()),
            transAppResourceToResourceColor(this.color ?? Color.Black),
            this.offsetX ?? 0.0,
            this.offsetY ?? 0.0,
            this.fill ?? false
        )
    }
    protected func toNative(): NativeTextShadowV2 {
        return NativeTextShadowV2(
            this.radius ?? throw IllegalArgumentException("The type now is not supported."),
            this.offsetX ?? 0.0,
            this.offsetY ?? 0.0,
            transAppResourceToResourceColor(this.color ?? Color.Black),
            this.fill ?? false,
            (this.shadowType ?? ShadowType.Color).getValue()
        )
    }
}

protected func parseLengthFromString(value: String): Option<Length> {
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
    let duration = NativeOptionInt32(true, params.duration ?? 1000)
    let tempo = NativeOptionFloat32(true, params.tempo ?? 1.0)
    let delay = NativeOptionInt32(true, params.delay ?? 0)
    let iterations = NativeOptionInt32(true, params.iterations ?? 1)
    let playMode = NativeOptionInt32(true, (params.playMode ?? PlayMode.Normal).getValue())
    let finishCallbackType = NativeOptionInt32(true, (params.finishCallbackType ?? FinishCallbackType.Removed).getValue())
    let onFinish = if (let Some(value) <- params.onFinish) {
        NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
    } else {
        NativeOptionCallBack(false, INVALID_CALLBACK_ID)
    }

    let min = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, (value.min ?? throw IllegalArgumentException("The type now is not supported.")))
    } else {
        NativeOptionInt32(false, 0)
    }

    let max = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, (value.max ?? throw IllegalArgumentException("The type now is not supported.")))
    } else {
        NativeOptionInt32(false, 0)
    }

    let expected = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, (value.expected ?? throw IllegalArgumentException("The type now is not supported.")))
    } else {
        NativeOptionInt32(false, 0)
    }

    let curveCStrng = unsafe { NativeOptionCString(true, LibC.mallocCString((params.curve ?? Curve.EaseInOut).getValue())) }

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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Offset {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dx: ?Length
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dy: ?Length
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(dx: ?Length, dy: ?Length) {
        let tmpDx = dx ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpDy = dy ?? throw IllegalArgumentException("The type now is not supported.")
        this.dx = transAppResourceToLength(tmpDx)
        this.dy = transAppResourceToLength(tmpDy)
    }
}

protected func parseOffset(offset: Offset): NativeOffset {
    return NativeOffset(
        NativeLength(
            (offset.dx ?? throw IllegalArgumentException("The type now is not supported.")).value,
            (offset.dx ?? throw IllegalArgumentException("The type now is not supported.")).unitType.getValue()
        ),
        NativeLength(
            (offset.dy ?? throw IllegalArgumentException("The type now is not supported.")).value,
            (offset.dy ?? throw IllegalArgumentException("The type now is not supported.")).unitType.getValue()
        )
    )
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ExpectedFrameRateRange {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var min: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var max: ?Int32
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var expected: ?Int32

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        min!: ?Int32,
        max!: ?Int32,
        expected!: ?Int32
    ) {
        this.min = min ?? throw IllegalArgumentException("The type now is not supported.")
        this.max = max ?? throw IllegalArgumentException("The type now is not supported.")
        this.expected = expected ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * Defines the align rule options of relative container.
 *
 * @relation interface AlignRuleOption
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlignRuleOptions {
    /**
    * Left alignment.
    * <br>anchor: ID of the component that functions as the anchor point.
    * <br>align: alignment mode relative to the anchor component.
    *
    * @type { ?HorizontalAlignment }
    * @relation left?: { anchor: string, align: HorizontalAlign }
    */
    @!APILevel[
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bias: ?Bias

    /**
    * Defines the constructor of AlignRuleOptions.
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(left!: ?HorizontalAlignment = None, right!: ?HorizontalAlignment = None,
        middle!: ?HorizontalAlignment = None, top!: ?VerticalAlignment = None,
        bottom!: ?VerticalAlignment = None, center!: ?VerticalAlignment = None,
        bias!: ?Bias = None
    ) {
        this.left = left
        this.right = right
        this.middle = middle
        this.top = top
        this.bottom = bottom
        this.center = center
        this.bias = bias ?? Bias()
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeStyles {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ?BorderStyle
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: ?BorderStyle
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: ?BorderStyle
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ?BorderStyle

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: ?BorderStyle = None,
        right!: ?BorderStyle = None,
        bottom!: ?BorderStyle = None,
        left!: ?BorderStyle = None
    ) {
        this.top = top ?? BorderStyle.Solid
        this.right = right ?? BorderStyle.Solid
        this.bottom = bottom ?? BorderStyle.Solid
        this.left = left ?? BorderStyle.Solid
    }

    protected func toNative(): NativeEdgeStyles {
        return NativeEdgeStyles(
            (top ?? BorderStyle.Solid).getValue(),
            (right ?? BorderStyle.Solid).getValue(),
            (bottom ?? BorderStyle.Solid).getValue(),
            (left ?? BorderStyle.Solid).getValue()
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
    22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: ?Length
    /**
     * Offset on the x-axis.
     * Unit: vp.
     *
     * @type { Length }
     * @default 5
     * @relation offsetX?: number | Resource
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: ?Length
    /**
     * Offset on the y-axis.
     * Unit: vp.
     *
     * @type { Length }
     * @default 5
     * @relation offsetY?: number | Resource
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: ?Length

    protected init(radius: ?Length, offsetX: ?Length, offsetY: ?Length) {
        this.radius = radius ?? 20.vp
        this.offsetX = offsetX ?? 5.vp
        this.offsetY = offsetY ?? 5.vp
    }
}

/**
 * Provide an interface for the text style of picker
 *
 * @class PickerTextStyle
 * @relation interface PickerTextStyle
 */
@!APILevel[
    22,
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
        22,
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
        22,
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
        22,
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
    22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: ?Length = None, weight!: ?FontWeight = None, family!: ?ResourceStr = None,
        style!: ?FontStyle = None) {
        this.size = transAppResourceToLength(size ?? 16.fp)
        this.weight = weight ?? FontWeight.Normal
        this.family = transResourceStrToString(family ?? "HarmonyOS Sans")
        this.style = style ?? FontStyle.Normal
    }
}

/**
 * TextContentControllerBase
 *
 * @relation declare abstract class TextContentControllerBase
 */
public interface TextContentControllerBase {

}
