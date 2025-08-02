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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EventTarget {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var area: Area

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(area: Area) {
        this.area = area
    }
}

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
    public var width: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float64

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
        width: Float64,
        height: Float64,
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
    public var x: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x: Float64, y: Float64) {
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
    public var pathFrom: Float64 = 0.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var pathTo: Float64 = 1.0
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
        pathFrom!: Float64 = 0.0,
        pathTo!: Float64 = 1.0,
        rotatable!: Bool = false
    ) {
        this.path = path
        this.pathFrom = pathFrom
        this.pathTo = pathTo
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
    public var effectType: SharedTransitionEffectType = SharedTransitionEffectType.SharedEffectExchange

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
        effectType!: SharedTransitionEffectType = SharedTransitionEffectType.SharedEffectExchange
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
    * @returns { HorizontalAlignment }
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
    * @returns { VerticalAlignment }
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
    public var horizontal: Float32 = 0.5

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
    public var vertical: Float32 = 0.5

    /**
    * Defines the constructor of Bias.
    *
    * @param { Float32 } horizontal
    * @param { Float32 } vertical
    * @returns { Bias }
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


@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Fonts {
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Length

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: FontWeight

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: String

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: FontStyle

    @!APILevel[
        21,
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
        21,
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
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp) {
        this.top = transAppResourceToLength(top)
        this.right = transAppResourceToLength(right)
        this.bottom = transAppResourceToLength(bottom)
        this.left = transAppResourceToLength(left)
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
    public var radius: Float64 = 0.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowType: UInt32 = ShadowType.COLOR.getValue()
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: UInt32 = 0xff000000
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: Float64 = 0.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: Float64 = 0.0
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: Bool = false    
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(radius!: Float64, offsetX!: Float64, offsetY!: Float64, color!: ResourceColor) {
        this.radius = radius
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.color = transAppResourceToResourceColor(color)
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(radius!: Float64, shadowType!: ShadowType, color!: ResourceColor = Color.BLACK, offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0, fill!: Bool = false) {
        this.radius = radius
        this.shadowType = shadowType.getValue()
        this.color = transAppResourceToResourceColor(color)
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.fill = fill
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}    
    func parseToNative(): NativeShadowOptions {
        return NativeShadowOptions(
            radius,
            shadowType,
            color,
            offsetX,
            offsetY,
            fill
        )
    }
    protected func optionToNative(): NativeTextShadowV2 {
        return NativeTextShadowV2(this.radius, this.offsetX, this.offsetY, this.color, this.fill, this.shadowType)
    }    
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeStyle {
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
        top: BorderStyle,
        right: BorderStyle,
        bottom: BorderStyle,
        left: BorderStyle
    ) {
        this.top = top
        this.right = right
        this.bottom = bottom
        this.left = left
    }

    protected func toNative(): NativeEdgeStyle {
        NativeEdgeStyle(
            top.getValue(),
            right.getValue(),
            bottom.getValue(),
            left.getValue()
        )
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let SOLID = EdgeStyle(
        BorderStyle.Solid,
        BorderStyle.Solid,
        BorderStyle.Solid,
        BorderStyle.Solid
    )
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let DASHED = EdgeStyle(
        BorderStyle.Dashed,
        BorderStyle.Dashed,
        BorderStyle.Dashed,
        BorderStyle.Dashed
    )
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let DOTTED = EdgeStyle(
        BorderStyle.Dotted,
        BorderStyle.Dotted,
        BorderStyle.Dotted,
        BorderStyle.Dotted
    )
}

protected func parseAnimateParam(params: AnimateParam): NativeAnimateParam {
    let duration = NativeOptionInt32(true, params.duration)

    let tempo = NativeOptionFloat32(true, params.tempo)

    let curveCStrng = unsafe {
        NativeOptionCString(true, LibC.mallocCString(params.curve.getValue()))
    }

    let delay = unsafe {
        NativeOptionInt32(true, params.delay)
    }

    let iterations = unsafe {
        NativeOptionInt32(true, params.iterations)
    }

    let playMode = unsafe {
        NativeOptionInt32(true, params.playMode.getValue())
    }

    let onFinish = unsafe {
        match (params.onFinish) {
            case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }
    }

    let finishCallbackType = unsafe {
        NativeOptionInt32(true, params.finishCallbackType.getValue())
    }

    let min = unsafe {
        match (params.expectedFrameRateRange) {
            case Some(value) => NativeOptionInt32(true, value.min)
            case None => NativeOptionInt32(false, 0)
        }
    }

    let max = unsafe {
        match (params.expectedFrameRateRange) {
            case Some(value) => NativeOptionInt32(true, value.max)
            case None => NativeOptionInt32(false, 0)
        }
    }

    let expected = unsafe {
        match (params.expectedFrameRateRange) {
            case Some(value) => NativeOptionInt32(true, value.expected)
            case None => NativeOptionInt32(false, 0)
        }
    }

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
    public var left: ?HorizontalAlignment = None

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
    public var right: ?HorizontalAlignment = None

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
    public var middle: ?HorizontalAlignment = None

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
    public var top: ?VerticalAlignment = None

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
    public var bottom: ?VerticalAlignment = None

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
    public var center: ?VerticalAlignment = None

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
    public var bias: Bias = Bias()

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
    * @returns { AlignRuleOption }
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
