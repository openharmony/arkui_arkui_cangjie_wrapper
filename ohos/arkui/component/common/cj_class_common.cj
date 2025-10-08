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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EventTarget {
    /**
     * Area information of the target element.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var area: Area

    /**
     * constructor
     * @params { Area } area
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(area: Area) {
        this.area = area
    }
}

/**
 * Defines the area property.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Area {
    /**
     * Defines the width property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length

    /**
     * Defines the height property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Length

    /**
     * Defines the local position.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var position: Position

    /**
     * Defines the global position.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var globalPosition: Position

    /**
     * Area constructor
     * @params { Length } width
     * @params { Length } height
     * @params { Position } position
     * @params { Position } globalPosition
     */
    @!APILevel[
        22,
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

/**
 * Defines the position.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Position {
    /**
     * Coordinate x of the Position.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Length

    /**
     * Coordinate y of the Position.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Length

    /**
     * Position constructor
     * @params { ?Length } x
     * @params { ?Length } y
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?Length = None, y!: ?Length = None) {
        this.x = x ?? 0
        this.y = y ?? 0
    }
}

/**
 * Defines the motion path options.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MotionPathOptions {
    /**
     * Motion path of the translation animation.
     * The **svg** path string is used.
     * In the value, **start** and **end** can be used in place of the start point and end point,
     * for example, **'Mstart.x start.y L50 50 Lend.x end.y Z'**.
     * If this parameter is set to an empty string, the path animation is not set.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var path: ?String

    /**
     * Start point of the motion path.
     * Value range: [0, 1].
     * A value less than 0 or greater than 1 evaluates to the default value **0**.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var from: ?Float64

    /**
     * End point of the motion path.
     * Value range: [0, 1].
     * A value less than 0 or greater than 1 evaluates to the default value **1**,
     * provided that the value of **to** is greater than or equal to the value of **from**.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var to: ?Float64

    /**
     * Whether to rotate along the path.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rotatable: ?Bool

    /**
     * MotionPathOptions constructor
     * @params { ?String } path
     * @params { ?Float64 } from
     * @params { ?Float64 } to
     * @params { ?Bool } rotatable
     */
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
        this.path = path ?? ""
        this.from = from ?? 0.0
        this.to = to ?? 1.0
        this.rotatable = rotatable ?? false
    }
}

/**
 * Defines the shard transition function params.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SharedTransitionOptions {
    /**
     * Animation duration.
     * <br>Default value: **1000**.
     * <br>Unit: ms.
     * <br>Value range: [0, +∞).
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Int32

    /**
     * Animation curve.<br>You are advised to specify the curve using the **Curve** or
     * ** ICurve** type.<br>For the string type, this parameter indicates an animation
     * interpolation curve. For available values, see the **curve** parameter in
     * AnimateParam.
     * <br>Default value: **Curve.Linear**.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve

    /**
     * Animation delay time, in ms.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: ?Int32

    /**
     * The motion path info.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var motionPath: ?MotionPathOptions

    /**
     * Z index info.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var zIndex: ?Int32

    /**
     * the animate type.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var effectType: ?SharedTransitionEffectType

    /**
     * SharedTransitionOptions constructor
     * @params { ?Int32 } duration
     * @params { ?Curve } curve
     * @params { ?Int32 } delay
     * @params { ?MotionPathOptions } motionPath
     * @params { ?Int32 } zIndex
     * @params { ?SharedTransitionEffectType } effectType
     */
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

/**
 * Defines the animate function params.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimateParam {
    /**
     * Animation duration, in ms.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Int32
    /**
     * Animation playback speed. A larger value indicates faster animation playback, and a smaller value indicates slower
     * animation playback. The value 0 means that there is no animation.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var tempo: ?Float32
    /**
     * Animation curve.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve
    /**
     * Animation delay time, in ms. By default, the animation has no delay.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: ?Int32
    /**
     * Number of times that the animation is played. By default, the animation is played once.
     * The value **-1** indicates that the animation is played for an unlimited number of times. 
     * The value **0** indicates that there is no animation.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var iterations: ?Int32
    /**
     * Playback mode. By default, the animation is played from the beginning after the playback is complete.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var playMode: ?PlayMode
    /**
     * Callback invoked when the animation playback is complete.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onFinish: Option<() -> Unit>
    /**
     * Type of the **onFinish** callback.
     * Default value: FinishCallbackType.Removed.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var finishCallbackType: ?FinishCallbackType
    /**
     * Expected frame rate range of the animation.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var expectedFrameRateRange: Option<ExpectedFrameRateRange>

    /**
     * AnimateParam constructor
     * @params { ?Int32 } duration
     * @params { ?Float32 } tempo
     * @params { ?Curve } curve
     * @params { ?Int32 } delay
     * @params { ?Int32 } iterations
     * @params { ?PlayMode } playMode
     * @params { Option<() -> Unit> } onFinish
     * @params { ?FinishCallbackType } finishCallbackType
     * @params { Option<ExpectedFrameRateRange> } expectedFrameRateRange
     */
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
    /**
     * ID of the component that functions as the anchor point.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: ?String

    /**
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
     * @params { ?String } anchor
     * @params { ?HorizontalAlign } align
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(anchor: ?String, align: ?HorizontalAlign) {
        this.anchor = anchor ?? ""
        this.align = align ?? HorizontalAlign.Start
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
    /**
     * ID of the component that functions as the anchor point.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: ?String

    /**
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
     * @params { ?String } anchor
     * @params { ?VerticalAlign } align
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(anchor: ?String, align: ?VerticalAlign) {
        this.anchor = anchor ?? ""
        this.align = align ?? VerticalAlign.Top
    }
}

/**
 * Defines the Bias.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Bias {

    /**
     * Horizontal ratio of the Bias, it must be >= 0.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var horizontal: ?Float64

    /**
     * Vertical ratio of the Bias, it must be >= 0.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var vertical: ?Float64

    /**
     * Defines the constructor of Bias.
     *
     * @params { ?Float64 } horizontal
     * @params { ?Float64 } vertical
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(horizontal!: ?Float64 = None, vertical!: ?Float64 = None) {
        this.horizontal = horizontal ?? 0.5
        this.vertical = vertical ?? 0.5
    }
}

/**
 * Defines the font used for text.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Fonts {
    /**
     * font size.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?Length

    /**
     * font weight.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: ?FontWeight

    /**
     * font family.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: ?String

    /**
     * font style.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?FontStyle

    /**
     * Fonts constructor
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
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
    /**
     * top-left property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topLeft: ?Length

    /**
     * top-right property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topRight: ?Length

    /**
     * bottom-left property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomLeft: ?Length

    /**
     * bottom-right property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomRight: ?Length

    /**
     * BorderRadiuses constructor
     * @params { ?Length } topLeft
     * @params { ?Length } topRight
     * @params { ?Length } bottomLeft
     * @params { ?Length } bottomRight
     */
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

/**
 * Defines the margin property.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Margin {
    protected let top: Length
    protected let right: Length
    protected let bottom: Length
    protected let left: Length

    /**
     * Margin constructor
     * @params { ?Length } top
     * @params { ?Length } right
     * @params { ?Length } bottom
     * @params { ?Length } left
     */
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

/**
 * Define the options of shadow
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShadowOptions {
    /**
     * Blur radius of the shadow.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: ?Float64
    /**
     * Shadow type.
     * <br>Default value: **COLOR**.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowType: ?ShadowType
    /**
     * Color of the shadow. Default value: **Black**
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor
    /**
     * Offset of the shadow along the x-axis. Unit is px. Default value is 0.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: ?Float64
    /**
     * Offset of the shadow along the y-axis. Unit is px. Default value is 0.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: ?Float64
    /**
     * Whether to fill the inside of the component with shadow. **true**: Fill
     * the inside of the component with shadow.
     * <br>**false**: Do not fill the inside of the component with shadow.
     * <br>The default value is **false**.
     * <br>**NOTE**<br>This attribute does not take effect in textShadow.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: ?Bool

    /**
     * ShadowOptions constructor
     * @params { ?Float64 } radius
     * @params { ?ShadowType } shadowType
     * @params { ?ResourceColor } color
     * @params { ?Float64 } offsetX
     * @params { ?Float64 } offsetY
     * @params { ?Bool } fill
     */
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
        this.radius = radius ?? 0.0
        this.shadowType = shadowType ?? ShadowType.Color
        this.color = color ?? Color.Black
        this.offsetX = offsetX ?? 0.0
        this.offsetY = offsetY ?? 0.0
        this.fill = fill ?? false
    }
    protected func toActionSheetShadowNative(): NativeActionSheetShadowOptions {
        return NativeActionSheetShadowOptions(
            this.radius ?? 0.0,
            Int32((this.shadowType ?? ShadowType.Color).getValue()),
            transAppResourceToResourceColor(this.color ?? Color.Black),
            this.offsetX ?? 0.0,
            this.offsetY ?? 0.0,
            this.fill ?? false
        )
    }
    protected func toNative(): NativeTextShadowV2 {
        return NativeTextShadowV2(
            this.radius ?? 0.0,
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
            case None => throw BusinessException(100001, "Internal error.")
        }
    } else if (realString.contains("px")) {
        let valueString = realString.removeSuffix("px")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.px
            case None => throw BusinessException(100001, "Internal error.")
        }
    } else if (realString.contains("fp")) {
        let valueString = realString.removeSuffix("fp")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.fp
            case None => throw BusinessException(100001, "Internal error.")
        }
    } else if (realString.contains("lpx")) {
        let valueString = realString.removeSuffix("lpx")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.lpx
            case None => throw BusinessException(100001, "Internal error.")
        }
    } else if (realString.contains("%")) {
        let valueString = realString.removeSuffix("%")
        let valueNumber = Float64.tryParse(valueString)
        match (valueNumber) {
            case Some(v) => return v.percent
            case None => throw BusinessException(100001, "Internal error.")
        }
    } else {
        let valueNumber = Float64.tryParse(realString)
        match (valueNumber) {
            case Some(v) => return v.vp
            case None => throw BusinessException(100001, "Internal error.")
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
        NativeOptionInt32(true, (value.min ?? -1))
    } else {
        NativeOptionInt32(false, 0)
    }

    let max = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, (value.max ?? -1))
    } else {
        NativeOptionInt32(false, 0)
    }

    let expected = if (let Some(value) <- params.expectedFrameRateRange) {
        NativeOptionInt32(true, (value.expected ?? -1))
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Offset {
    /**
     * dx property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dx: ?Length
    /**
     * dy property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dy: ?Length
    /**
     * Offset constructor.
     *
     * @params { ?Length } dx
     * @params { ?Length } dy
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(dx: ?Length, dy: ?Length) {
        this.dx = transAppResourceToLength(dx ?? 0.0.vp)
        this.dy = transAppResourceToLength(dy ?? 0.0.vp)
    }
}

protected func parseOffset(offset: Offset): NativeOffset {
    return NativeOffset(
        NativeLength(
            (offset.dx ?? 0.0.vp).value,
            (offset.dx ?? 0.0.vp).unitType.getValue()
        ),
        NativeLength(
            (offset.dy ?? 0.0.vp).value,
            (offset.dy ?? 0.0.vp).unitType.getValue()
        )
    )
}

/**
 * Interface for ExpectedFrameRateRange.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ExpectedFrameRateRange {
    /**
     * The minimum animation drawing FPS.
     * The minimum value should be less than or equal to the maximum value.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var min: ?Int32
    /**
     * The maximum animation drawing FPS.
     * The maximum value should be greater than or equal to the minimum value.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var max: ?Int32
    /**
     * The expected frame rate of dynamical callback rate range.
     * The value should be between the minimum and maximum value.
     * Otherwise, the actual callback rate will be dynamically
     * adjusted to better align with other animation sources.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var expected: ?Int32

    /**
     * ExpectedFrameRateRange constructor.
     *
     * @params { ?Int32 } min
     * @params { ?Int32 } max
     * @params { ?Int32 } expected
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        min!: ?Int32,
        max!: ?Int32,
        expected!: ?Int32
    ) {
        this.min = min
        this.max = max
        this.expected = expected
    }
}

/**
 * Defines the align rule options of relative container.
 *
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
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bias: ?Bias

    /**
     * Defines the constructor of AlignRuleOptions.
     *
     * @params { ?HorizontalAlignment } left
     * @params { ?HorizontalAlignment } right
     * @params { ?HorizontalAlignment } middle
     * @params { ?VerticalAlignment } top
     * @params { ?VerticalAlignment } bottom
     * @params { ?VerticalAlignment } center
     * @params { Bias } bias
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

/**
 * Defines the border style property.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeStyles {
    /**
     * top property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ?BorderStyle
    /**
     * right property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: ?BorderStyle
    /**
     * bottom property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: ?BorderStyle
    /**
     * left property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ?BorderStyle

    /**
     * Defines the constructor of EdgeStyles.
     *
     * @params { ?BorderStyle } top
     * @params { ?BorderStyle } right
     * @params { ?BorderStyle } bottom
     * @params { ?BorderStyle } left
     * @returns { This }
     */
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PickerTextStyle {
    /**
     * Font color.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor

    /**
     * Text style.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var font: ?Font

    /**
     * PickerTextStyle constructor.
     *
     * @params { ?ResourceColor } color
     * @params { ?Font } font
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Font {
    /**
     * font size.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?Length
    /**
     * font weight.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: ?FontWeight
    /**
     * font family.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: ?ResourceStr
    /**
     * font style.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?FontStyle

    /**
     * Font constructor.
     *
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface TextContentControllerBase {

}
