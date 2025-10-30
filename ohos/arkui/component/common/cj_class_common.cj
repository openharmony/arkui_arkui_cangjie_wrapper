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

import ohos.arkui.component.native_struct.{CBorderRadiuses, NativeActionSheetShadowOptions, NativeTextShadowV2, NativeEdgeStyles, CJBlurOptions, CJMotionPathOptions,NativeAnimateParam}
import ohos.arkui.component.util.{transAppResourceToLength, transResourceStrToString, transAppResourceToResourceColor}
import ohos.base.{Length, ResourceStr, ResourceColor, NativeOffset, Color, NativeOptionInt32, NativeOptionFloat32, NativeOptionCallBack, NativeOptionCString, NativeLength, LengthProp}
import ohos.ffi.{Callback0Param}
import ohos.business_exception.BusinessException
import ohos.labels.APILevel
import std.convert.{Parsable}

/**
 * Defines the event target.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EventTarget {
    /**
     * Area information of the target element.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var area: Area

    /**
     * EventTarget constructor.
     *
     * @param { Area } area - The area of EventTarget.
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
     * Area constructor.
     *
     * @param { Length } width - The width of the area.
     * @param { Length } height - The height of the area.
     * @param { Position } position - The local position of the area.
     * @param { Position } globalPosition - The global position of the area.
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
     * The x-coordinate of the position.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Length

    /**
     * The y-coordinate of the position.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Length

    /**
     * Position constructor.
     *
     * @param { ?Length } x - The x-coordinate of the position.
     * @param { ?Length } y - The y-coordinate of the position.
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
     * MotionPathOptions constructor.
     *
     * @param { ?String } path - The path of motion.
     * @param { ?Float64 } from - The starting of motion.
     * @param { ?Float64 } to - The ending of motion.
     * @param { ?Bool } rotatable - Whether retatable.
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
     * <br>Unit: ms.
     * <br>Value range: [0, +∞).
     *
     * @default 1000
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
     *
     * @default Curve.Linear
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve

    /**
     * Animation delay time, in ms.
     *
     * @default 0
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
     *
     * @default SharedTransitionEffectType.Exchange
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var effectType: ?SharedTransitionEffectType

    /**
     * SharedTransitionOptions constructor.
     *
     * @param { ?Int32 } duration - The transition duration.
     * @param { ?Curve } curve - The transition curve.
     * @param { ?Int32 } delay - The transition delay.
     * @param { ?MotionPathOptions } motionPath - The transition path.
     * @param { ?Int32 } zIndex - The transition zIndex.
     * @param { ?SharedTransitionEffectType } effectType - The transition effect type.
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
     *
     * @default 1000
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Int32
    /**
     * Animation playback speed. A larger value indicates faster animation playback, and a smaller value indicates slower
     * animation playback. The value 0 means that there is no animation.
     *
     * @default 1.0
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var tempo: ?Float32
    /**
     * Animation curve.
     *
     * @default Curve.EaseInOut
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: ?Curve
    /**
     * Animation delay time, in ms. By default, the animation has no delay.
     *
     * @default 0
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
     *
     * @default 1
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var iterations: ?Int32
    /**
     * Playback mode. By default, the animation is played from the beginning after the playback is complete.
     *
     * @default PlayMode.Normal
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
     *
     * @default FinishCallbackType.Removed
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
     * AnimateParam constructor.
     *
     * @param { ?Int32 } duration - The animation duration.
     * @param { ?Float32 } tempo - The animation playback speed.
     * @param { ?Curve } curve - The animation curve.
     * @param { ?Int32 } delay - The animation delay.
     * @param { ?Int32 } iterations - The playback times.
     * @param { ?PlayMode } playMode - The play mode.
     * @param { Option<() -> Unit> } onFinish - The callback on finish.
     * @param { ?FinishCallbackType } finishCallbackType - The callback finish type.
     * @param { Option<ExpectedFrameRateRange> } expectedFrameRateRange - Expected frame rate range of the animation.
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
 * Controls how components are aligned horizontally within their container or relative to an anchor.
 * Provides precise horizontal positioning capabilities for UI layout.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class HorizontalAlignParam {
    /**
     * ID of the component that functions as the anchor point.
     * Specifies the reference component for relative alignment positioning.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: ?String

    /**
     * Alignment mode relative to the anchor component.
     * Defines how this component should be horizontally positioned relative to the anchor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var align: ?HorizontalAlign

    /**
     * Defines the constructor of HorizontalAlignParam.
     *
     * @param { ?String } anchor - ID of the component that functions as the anchor point
     * @param { ?HorizontalAlign } align - Alignment mode relative to the anchor component
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
 * Controls how components are aligned vertically within their container or relative to an anchor.
 * Provides precise vertical positioning capabilities for UI layout.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class VerticalAlignParam {
    /**
     * ID of the component that functions as the anchor point.
     * Specifies the reference component for relative alignment positioning.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var anchor: ?String

    /**
     * Alignment mode relative to the anchor component.
     * Defines how this component should be vertically positioned relative to the anchor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var align: ?VerticalAlign

    /**
     * Defines the constructor of VerticalAlignParam.
     *
     * @param { ?String } anchor - ID of the component that functions as the anchor point
     * @param { ?VerticalAlign } align - Alignment mode relative to the anchor component
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Bias {

    /**
     * Horizontal ratio of the Bias, it must be >= 0.
     *
     * @default 0.5
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var horizontal: ?Float64

    /**
     * Vertical ratio of the Bias, it must be >= 0.
     *
     * @default 0.5
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var vertical: ?Float64

    /**
     * Defines the constructor of Bias.
     *
     * @param { ?Float64 } horizontal - Horizontal ratio of the Bias, it must be >= 0.
     * @param { ?Float64 } vertical - Vertical ratio of the Bias, it must be >= 0.
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Fonts {
    /**
     * Font size.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?Length

    /**
     * Font weight.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: ?FontWeight

    /**
     * Font family.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: ?String

    /**
     * Font style.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?FontStyle

    /**
     * Fonts constructor.
     *
     * @param { ?Length } size - The font size.
     * @param { ?FontWeight } weight - The font weight.
     * @param { ?ResourceStr } family - The font family.
     * @param { ?FontStyle } style - The font style.
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
     * BorderRadiuses constructor.
     *
     * @param { ?Length } topLeft - The top left.
     * @param { ?Length } topRight - The top right.
     * @param { ?Length } bottomLeft - The bottom left.
     * @param { ?Length } bottomRight - The bottom right.
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
     * Margin constructor.
     *
     * @param { ?Length } top - The top of margin.
     * @param { ?Length } right - The right of margin.
     * @param { ?Length } bottom - The bottom of margin.
     * @param { ?Length } left - The left of margin.
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
 * Provides configuration options for rendering shadows behind UI components.
 * Allows fine-tuning of shadow appearance including blur, color, offset, and fill properties.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShadowOptions {
    /**
     * Blur radius of the shadow.
     * Controls the softness of the shadow edges. Higher values create more blurred shadows.
     *
     * @default 0.0
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: ?Float64
    /**
     * Specifies the rendering method for the shadow, affecting performance and visual quality.
     *
     * @default ShadowType.Color
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowType: ?ShadowType
    /**
     * Color of the shadow.
     * Defines the color tint applied to the shadow. Can be any valid resource color.
     *
     * @default Black
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor
    /**
     * Offset of the shadow along the x-axis. Unit is px.
     * Controls the horizontal positioning of the shadow relative to the component.
     * Positive values shift the shadow to the right, negative values to the left.
     *
     * @default 0.0
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: ?Float64
    /**
     * Offset of the shadow along the y-axis. Unit is px.
     * Controls the vertical positioning of the shadow relative to the component.
     * Positive values shift the shadow downward, negative values upward.
     *
     * @default 0.0
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
     * <br>**NOTE**<br>This attribute does not take effect in textShadow.
     *
     * @default false
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: ?Bool

    /**
     * ShadowOptions constructor.
     *
     * @param { ?Float64 } radius - Blur radius of the shadow.
     * @param { ?ShadowType } shadowType - Shadow type.
     * @param { ?ResourceColor } color - Color of the shadow.
     * @param { ?Float64 } offsetX - Offset of the shadow along the x-axis.
     * @param { ?Float64 } offsetY - Offset of the shadow along the y-axis.
     * @param { ?Bool } fill - Whether to fill the inside of the component with shadow.
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
     * @param { ?Length } dx - X offset.
     * @param { ?Length } dy - Y offset.
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
 * Defines the frame rate range for animations, allowing control over animation smoothness and performance.
 * Provides fine-grained control over animation frame rates for optimal balance between visual quality and resource usage.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ExpectedFrameRateRange {
    /**
     * Specifies the lowest acceptable frame rate for the animation.
     * The minimum value should be less than or equal to the maximum value.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var min: ?Int32
    /**
     * Specifies the highest desired frame rate for the animation.
     * The maximum value should be greater than or equal to the minimum value.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var max: ?Int32
    /**
     * The expected frame rate of dynamical callback rate range.
     * Represents the target frame rate that the animation should attempt to maintain.
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
     * @param { ?Int32 } min - The minimum animation drawing FPS.
     * @param { ?Int32 } max - The maximum animation drawing FPS.
     * @param { ?Int32 } expected - The expected frame rate of dynamical callback rate range. The value should be between the minimum and maximum value
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
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ?HorizontalAlignParam

    /**
     * Right alignment.
     * <br>anchor: ID of the component that functions as the anchor point.
     * <br>align: alignment mode relative to the anchor component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: ?HorizontalAlignParam

    /**
     * Horizontal center alignment.
     * <br>anchor: ID of the component that functions as the anchor point.
     * <br>align: alignment mode relative to the anchor component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var middle: ?HorizontalAlignParam

    /**
     * Top alignment.
     * <br>anchor: ID of the component that functions as the anchor point.
     * <br>align: alignment mode relative to the anchor component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ?VerticalAlignParam

    /**
     * Bottom alignment.
     * <br>anchor: ID of the component that functions as the anchor point.
     * <br>align: alignment mode relative to the anchor component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: ?VerticalAlignParam

    /**
     * Vertical center alignment.
     * <br>anchor: ID of the component that functions as the anchor point.
     * <br>align: alignment mode relative to the anchor component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var center: ?VerticalAlignParam

    /**
     * Offset of the component under the anchor constraints.
     * <br>The value is the ratio of the distance to the left/upper anchor to the total distance between anchors.
     * The Bias default value is horizontal: 0.5 and vertical: 0.5.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bias: ?Bias

    /**
     * Defines the constructor of AlignRuleOptions.
     *
     * @param { ?HorizontalAlignParam } left - The param of left align.
     * @param { ?HorizontalAlignParam } right - The param of right align.
     * @param { ?HorizontalAlignParam } middle - The param of middle align.
     * @param { ?VerticalAlignParam } top - The param of top align.
     * @param { ?VerticalAlignParam } bottom - The param of bottom align.
     * @param { ?VerticalAlignParam } center - The param of center align.
     * @param { Bias } bias - Defines the bias ratio in horizontal and vertical direction.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(left!: ?HorizontalAlignParam = None, right!: ?HorizontalAlignParam = None,
        middle!: ?HorizontalAlignParam = None, top!: ?VerticalAlignParam = None,
        bottom!: ?VerticalAlignParam = None, center!: ?VerticalAlignParam = None,
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
     * @param { ?BorderStyle } top - Top border style.
     * @param { ?BorderStyle } right - Right border style.
     * @param { ?BorderStyle } bottom - Bottom border style.
     * @param { ?BorderStyle } left - Left border style.
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class MultiShadowOptions {
    protected var impl: MultiShadowOptionsImpl = MultiShadowOptionsImpl()
    /**
     * Shadow blur radius. Unit: vp.
     * <p>**NOTE**:
     * <br>A value less than or equal to 0 is handled as the default value.
     * </p>
     *
     * @default 20
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: ?Length
    /**
     * Offset on the x-axis. Unit: vp.
     *
     * @default 5
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: ?Length
    /**
     * Offset on the y-axis. Unit: vp.
     *
     * @default 5
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
 * Provide a class for the text style of picker.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PickerTextStyle {
    /**
     * Font color.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor

    /**
     * Text style.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var font: ?Font

    /**
     * PickerTextStyle constructor.
     *
     * @param { ?ResourceColor } color - Font color.
     * @param { ?Font } font - Text style.
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
 * Provide a class for the text style of picker.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Font {
    /**
     * font size.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?Length
    /**
     * font weight.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: ?FontWeight
    /**
     * font family.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: ?ResourceStr
    /**
     * font style.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?FontStyle

    /**
     * Font constructor.
     *
     * @param { ?Length } size - Font size.
     * @param { ?FontWeight } weight - Font weight.
     * @param { ?ResourceStr } family - Font family.
     * @param { ?FontStyle } style - Font style.
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

/*
 * Defines a bindable property.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Bindable<T> {
    /**
     * Defines value of the bindable property.
     */
    public let value: T

    /**
     * Defines the callback of the bindable property which will be invoked when the property value changes.
     */
    public let onChange: (T) -> Unit
    /**
     * Bindable constructor.
     *
     * @param { T } value - value of the bindable property.
     * @param { (T) -> Unit } onChange - callback of the bindable property.
     */
    public init(value: T, onChange: (T) -> Unit) {
        this.value = value
        this.onChange = onChange
    }
}

/**
 * TextContentControllerBase interface.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface TextContentControllerBase {

}
