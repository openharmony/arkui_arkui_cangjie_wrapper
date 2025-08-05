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

const INVALID_CALLBACK_ID = 0

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ModalTransition {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ALPHA
    | ...

    func getValue(): UInt32 {
        match (this) {
            case DEFAULT => 0
            case NONE => 1
            case ALPHA => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetSize {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MEDIUM
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LARGE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FIT_CONTENT
    | ...

    func getValue(): Int32 {
        match (this) {
            case MEDIUM => 0
            case LARGE => 1
            case FIT_CONTENT => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SheetType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    POPUP
    | ...

    func getValue(): Int32 {
        match (this) {
            case BOTTOM => 0
            case CENTER => 1
            case POPUP => 2
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
public enum DragPreviewMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AUTO
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DISABLE_SCALE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ENABLE_DEFAULT_SHADOW
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ENABLE_DEFAULT_RADIUS
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ENABLE_DRAG_ITEM_GRAY_EFFECT
    | ...

    func getValue(): Int32 {
        match (this) {
            case AUTO => 1
            case DISABLE_SCALE => 2
            case ENABLE_DEFAULT_SHADOW => 3
            case ENABLE_DEFAULT_RADIUS => 4
            case ENABLE_DRAG_ITEM_GRAY_EFFECT => 5
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
public enum RepeatMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SPACE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    STRETCH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    REPEAT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ROUND
    | ...

    func getValue(): Int32 {
        match (this) {
            case SPACE => 0
            case STRETCH => 1
            case REPEAT => 2
            case ROUND => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BlurOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public BlurOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var grayscale: VArray<Float32, $2>) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BlurStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public BlurStyleOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let colorMode: ThemeColorMode,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let adaptiveColor: AdaptiveColor,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let blurOptions: BlurOptions,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let scale: Float32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BackgroundBlurStyleOptions <: BlurStyleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let policy: BlurStyleActivePolicy
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let inactiveColor: ResourceColor
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        colorMode!: ThemeColorMode = ThemeColorMode.SYSTEM,
        adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        scale!: Float32 = 1.0,
        policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE,
        inactiveColor!: ResourceColor = Color.TRANSPARENT
    ) {
        super(colorMode, adaptiveColor, blurOptions, scale)
        this.policy = policy
        this.inactiveColor = transAppResourceToResourceColor(inactiveColor)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BackgroundEffectOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let radius: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let saturation: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let brightness: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let color: ResourceColor
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let adaptiveColor: AdaptiveColor
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let blurOptions: BlurOptions
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let policy: BlurStyleActivePolicy
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let inactiveColor: ResourceColor
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        radius!: Float64,
        saturation!: Float64 = 1.0,
        brightness!: Float64 = 1.0,
        color!: ResourceColor = Color.TRANSPARENT,
        adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE,
        inactiveColor!: ResourceColor = Color.TRANSPARENT
    ) {
        if (radius < 0.0) {
            this.radius = 0.0
        } else {
            this.radius = radius
        }
        if (saturation < 0.0) {
            this.saturation = 0.0
        } else {
            this.saturation = saturation
        }
        if (brightness < 0.0) {
            this.brightness = 0.0
        } else {
            this.brightness = brightness
        }
        this.color = transAppResourceToResourceColor(color)
        this.adaptiveColor = adaptiveColor
        this.blurOptions = blurOptions
        this.policy = policy
        this.inactiveColor = transAppResourceToResourceColor(inactiveColor)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ForegroundBlurStyleOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colorMode: ThemeColorMode = SYSTEM
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var adaptiveColor: AdaptiveColor = DEFAULT
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var blurOptions: BlurOptions = BlurOptions([0.0, 0.0])
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: Float32 = 1.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        colorMode!: ThemeColorMode = SYSTEM,
        adaptiveColor!: AdaptiveColor = DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0])
    ) {
        this.colorMode = colorMode
        this.adaptiveColor = adaptiveColor
        this.blurOptions = blurOptions
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        colorMode!: ThemeColorMode = SYSTEM,
        adaptiveColor!: AdaptiveColor = DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        scale!: Float32
    ) {
        this.colorMode = colorMode
        this.adaptiveColor = adaptiveColor
        this.blurOptions = blurOptions
        this.scale = scale
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Action {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public Action(
        let value!: String,
        let action!: () -> Unit
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class StateChangeEvent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public StateChangeEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let isVisible: Bool) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopupOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: String = ""
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placementOnTop: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var primaryButton: Action = Action(value: "", action: {=>})
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var secondaryButton: Action = Action(value: "", action: {=>})
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onStateChange: Option<(StateChangeEvent) -> Unit> = Option.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var messageOptions: PopupMessageOptions = PopupMessageOptions()
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: Length = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool = false
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var mask: Color = Color(0x1000000)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetSpace: Length = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: ?Placement = Option.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Position = Position(0.0, 0.0)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: Bool = true
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var popupColor: Color = Color(0x1000000)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool = true
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowPointPosition: Option<ArrowPointPosition> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowWidth: Length = 16.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowHeight: Length = 8.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Length = 20.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: Option<TransitionEffect> = Option.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: Option<(DismissPopupAction) -> Unit> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var followTransformOfTarget: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message!: String,
        placementOnTop!: Bool = false,
        primaryButton!: Action = Action(value: "", action: {=>}),
        secondaryButton!: Action = Action(value: "", action: {=>}),
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None
    ) {
        this.message = message
        this.placementOnTop = placementOnTop
        this.primaryButton = primaryButton
        this.secondaryButton = secondaryButton
        this.onStateChange = onStateChange
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        message!: String,
        placementOnTop!: Bool = false,
        primaryButton!: Action = Action(value: "", action: {=>}),
        secondaryButton!: Action = Action(value: "", action: {=>}),
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None,
        arrowOffset!: Length = 0.vp,
        showInSubWindow!: Bool,
        messageOptions!: PopupMessageOptions = PopupMessageOptions(),
        mask!: Color = Color(0x1000000),
        targetSpace!: Length = 0.vp,
        placement!: ?Placement = Option.None,
        offset!: Position = Position(0.0, 0.0),
        enableArrow!: Bool = true,
        popupColor!: Color = Color(0x1000000),
        autoCancel!: Bool = true,
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 8.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        transition!: ?TransitionEffect = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    ) {
        this.message = message
        this.placementOnTop = placementOnTop
        this.primaryButton = primaryButton
        this.secondaryButton = secondaryButton
        this.onStateChange = onStateChange
        this.messageOptions = messageOptions
        this.arrowOffset = arrowOffset
        this.showInSubWindow = showInSubWindow
        this.mask = mask
        this.targetSpace = targetSpace
        this.placement = placement
        this.offset = offset
        this.enableArrow = enableArrow
        this.popupColor = popupColor
        this.autoCancel = autoCancel
        this.width = width
        this.arrowPointPosition = arrowPointPosition
        this.arrowWidth = arrowWidth
        this.arrowHeight = arrowHeight
        this.radius = radius
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle
        this.transition = transition
        this.onWillDismiss = onWillDismiss
        this.followTransformOfTarget = followTransformOfTarget
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CustomPopupOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: () -> Unit = {=>}
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placement: Placement = Placement.Bottom
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskColor: Color = Color(0x1000000)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: Color = Color(0x1000000)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var enableArrow: Bool = true
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var autoCancel: Bool = true
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onStateChange: Option<(StateChangeEvent) -> Unit> = Option.None
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var popupColor: ?Color = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowOffset: Length = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: Bool = false
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var mask: ?Color = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetSpace: Length = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Position = Position(0.0, 0.0)
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length = 0.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowPointPosition: Option<ArrowPointPosition> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowWidth: Length = 16.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var arrowHeight: Length = 8.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Length = 20.vp
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var focusable: Bool = false
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transition: Option<TransitionEffect> = Option.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDismiss: Option<(DismissPopupAction) -> Unit> = None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var followTransformOfTarget: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        builder!: () -> Unit,
        placement!: Placement = Placement.Bottom,
        maskColor!: Color = Color(0x1000000),
        popupColor!: Color = Color(0x1000000),
        enableArrow!: Bool = true,
        autoCancel!: Bool = true,
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None
    ) {
        this.builder = builder
        this.placement = placement
        this.maskColor = maskColor
        this.popupColor = popupColor
        this.enableArrow = enableArrow
        this.autoCancel = autoCancel
        this.onStateChange = onStateChange
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        builder!: () -> Unit,
        placement!: Placement = Placement.Bottom,
        maskColor!: Color = Color(0x1000000),
        popupColor!: Color = Color(0x1000000),
        enableArrow!: Bool = true,
        autoCancel!: Bool = true,
        onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None,
        showInSubWindow!: Bool, // 5.1 start
        backgroundColor!: Color = Color(0x1000000),
        arrowOffset!: Length = 0.vp,
        mask!: ?Color = None,
        targetSpace!: Length = 0.vp,
        offset!: Position = Position(0.0, 0.0),
        width!: Length = 0.vp,
        arrowPointPosition!: ?ArrowPointPosition = None,
        arrowWidth!: Length = 16.vp,
        arrowHeight!: Length = 16.vp,
        radius!: Length = 20.vp,
        shadow!: ShadowStyle = ShadowStyle.OUTER_DEFAULT_MD,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        focusable!: Bool = false,
        transition!: Option<TransitionEffect> = Option.None,
        onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        followTransformOfTarget!: Bool = false
    ) {
        this.builder = builder
        this.placement = placement
        this.maskColor = maskColor
        this.popupColor = popupColor
        this.enableArrow = enableArrow
        this.autoCancel = autoCancel
        this.onStateChange = onStateChange
        this.backgroundColor = backgroundColor
        this.arrowOffset = arrowOffset
        this.showInSubWindow = showInSubWindow
        this.mask = mask
        this.targetSpace = targetSpace
        this.offset = offset
        this.width = width
        this.arrowPointPosition = arrowPointPosition
        this.arrowWidth = arrowWidth
        this.arrowHeight = arrowHeight
        this.radius = radius
        this.shadow = shadow
        this.backgroundBlurStyle = backgroundBlurStyle
        this.focusable = focusable
        this.transition = transition
        this.onWillDismiss = onWillDismiss
        this.followTransformOfTarget = followTransformOfTarget
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public struct PopupMessageOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public PopupMessageOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let textColor!: Color = Color(0x000000),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let font!: Fonts = Fonts()
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissPopupAction {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DismissPopupAction(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let reason!: DismissReason) {}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss() {
        unsafe {
            FfiOHOSAceFrameworkPopupDismiss()
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContentOffset {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xOffset: Float64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var yOffset: Float64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Float64, y!: Float64) {
        this.xOffset = x
        this.yOffset = y
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Int64, y!: Int64) {
        this.xOffset = Float64(x)
        this.yOffset = Float64(y)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeWidths {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp) {
        this.top = transAppResourceToLength(top)
        this.right = transAppResourceToLength(right)
        this.bottom = transAppResourceToLength(bottom)
        this.left = transAppResourceToLength(left)
    }

    func toCJEdge(): CJEdge {
        return CJEdge(top, right, bottom, left)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LinearGradientBlurOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LinearGradientBlurOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var fractionStops!: Array<(Float64, Float64)>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction!: GradientDirection
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuElement {
    var value: String
    var icon: Option<String>
    var enabled: Bool
    var action: () -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value: String,
        action: () -> Unit,
        icon!: String = "",
        enabled!: Bool = false
    ) {
        this.value = value
        this.icon = icon
        this.enabled = enabled
        this.action = action
    }

    func parseToNative(): NativeMenuElement {
        let nativeValue = NativeOptionCString(true, unsafe { LibC.mallocCString(value) })
        let nativeIcon = match (icon) {
            case Some(value) => NativeOptionCString(true, unsafe { LibC.mallocCString(value) })
            case None => NativeOptionCString(false, unsafe { LibC.mallocCString("") })
        }
        let nativeEnabled = unsafe { NativeOptionBool(true, enabled) }
        let nativeAction = unsafe { NativeOptionCallBack(true, Callback0Param<Unit>(action).getID()) }
        return NativeMenuElement(
            nativeValue,
            nativeIcon,
            nativeEnabled,
            nativeAction
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ContextMenuAnimationOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ContextMenuAnimationOptions(
        public var scale!: ?(Float64, Float64) = None,
        public var transition!: ?TransitionEffect = None,
        public var hoverScale!: ?(Float64, Float64) = None
    ) {}

    func parseCContextMenuAnimationOptions(): CJContextMenuAnimationOptions {
        var scaleFrom: NativeOptionFloat64
        var scaleTo: NativeOptionFloat64
        unsafe {
            match (scale) {
                case Some(value) =>
                    scaleFrom = NativeOptionFloat64(true, value[0])
                    scaleTo = NativeOptionFloat64(true, value[1])
                case None =>
                    scaleFrom = NativeOptionFloat64(false, 0.0)
                    scaleTo = NativeOptionFloat64(false, 0.0)
            }
        }
        let transition = unsafe {
            match (transition) {
                case Some(value) => NativeOptionInt64(true, value.getID())
                case None => NativeOptionInt64(false, 0)
            }
        }
        var hoverScaleFrom: NativeOptionFloat64
        var hoverScaleTo: NativeOptionFloat64
        unsafe {
            match (hoverScale) {
                case Some(value) =>
                    hoverScaleFrom = NativeOptionFloat64(true, value[0])
                    hoverScaleTo = NativeOptionFloat64(true, value[1])
                case None =>
                    hoverScaleFrom = NativeOptionFloat64(false, 0.0)
                    hoverScaleTo = NativeOptionFloat64(false, 0.0)
            }
        }
        return CJContextMenuAnimationOptions(scaleFrom, scaleTo, transition, hoverScaleFrom, hoverScaleTo)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ContextMenuOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ContextMenuOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var offset!: Position = Position(0.0, 0.0),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var placement!: Option<Placement> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var enableArrow!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var arrowOffset!: Length = 0.vp,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var preview!: Option<() -> Unit> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var previewAnimationOptions!: ?ContextMenuAnimationOptions = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var onAppear!: ?() -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var onDisappear!: ?() -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var aboutToAppear!: ?() -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var aboutToDisappear!: ?() -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundColor!: ResourceColor = Color.TRANSPARENT,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var transition!: ?TransitionEffect = None,
        var borderRadius!: ?BorderRadiuses = None,
        var layoutRegionMargin!: ?Margin = None
    ) {}

    func parseCContextMenuOptions(): CJContextMenuOptions {
        CJContextMenuOptions(
            NativePosition(offset.x, offset.y),
            unsafe { parsePlacement(placement) },
            enableArrow,
            NativeLength(transAppResourceToLength(arrowOffset).value,
                transAppResourceToLength(arrowOffset).unitType.getValue()),
            unsafe { parseCallBack(preview) },
            unsafe { parsePreviewAnimationOptions(previewAnimationOptions) },
            unsafe { parseCallBack(onAppear) },
            unsafe { parseCallBack(onDisappear) },
            unsafe { parseCallBack(aboutToAppear) },
            unsafe { parseCallBack(aboutToDisappear) },
            transAppResourceToResourceColor(backgroundColor),
            backgroundBlurStyle.getValue(),
            unsafe { parseTransition(transition) },
            unsafe { parseBorderRadius(borderRadius) },
            unsafe { parseLayoutRegionMargin(layoutRegionMargin) }
        )
    }
}

func parsePlacement(placement: Option<Placement>): NativeOptionInt32 {
    return match (placement) {
        case Some(value) => NativeOptionInt32(true, value.getValue())
        case None => NativeOptionInt32(false, 0)
    }
}

func parsePreviewAnimationOptions(previewAnimationOptions: ?ContextMenuAnimationOptions): NativeOptionCJContextMenuAnimationOptions {
    return match (previewAnimationOptions) {
        case Some(value) => NativeOptionCJContextMenuAnimationOptions(true, value.parseCContextMenuAnimationOptions())
        case None => NativeOptionCJContextMenuAnimationOptions(false,
            ContextMenuAnimationOptions().parseCContextMenuAnimationOptions())
    }
}

func parseCallBack(callBack: ?() -> Unit): NativeOptionCallBack {
    return match (callBack) {
        case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
        case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
    }
}

func parseTransition(transition: ?TransitionEffect): NativeOptionInt64 {
    return match (transition) {
        case Some(value) => NativeOptionInt64(true, value.getID())
        case None => NativeOptionInt64(false, 0)
    }
}

func parseBorderRadius(borderRadius: ?BorderRadiuses): NativeOptionRadius {
    return match (borderRadius) {
        case Some(value) => NativeOptionRadius(true, value.toCBorderRadiuses())
        case None => NativeOptionRadius(false, BorderRadiuses().toCBorderRadiuses())
    }
}

func parseLayoutRegionMargin(layoutRegionMargin: ?Margin): NativeOptionMargin {
    return match (layoutRegionMargin) {
        case Some(value) => NativeOptionMargin(
            true,
            NativeMargin(
                value.top.value,
                value.top.unitType.getValue(),
                value.right.value,
                value.right.unitType.getValue(),
                value.bottom.value,
                value.bottom.unitType.getValue(),
                value.left.value,
                value.left.unitType.getValue()
            )
        )
        case None => NativeOptionMargin(
            false,
            NativeMargin(
                Margin().top.value,
                Margin().top.unitType.getValue(),
                Margin().right.value,
                Margin().right.unitType.getValue(),
                Margin().bottom.value,
                Margin().bottom.unitType.getValue(),
                Margin().left.value,
                Margin().left.unitType.getValue()
            )
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuOptions <: ContextMenuOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var title: ?String
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showInSubWindow: ?Bool
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        offset!: Position = Position(0.0, 0.0),
        placement!: Option<Placement> = Option.None,
        enableArrow!: Bool = false,
        arrowOffset!: Length = 0.vp,
        preview!: Option<() -> Unit> = Option.None,
        previewAnimationOptions!: ?ContextMenuAnimationOptions = None,
        onAppear!: ?() -> Unit = None,
        onDisappear!: ?() -> Unit = None,
        aboutToAppear!: ?() -> Unit = None,
        aboutToDisappear!: ?() -> Unit = None,
        backgroundColor!: ResourceColor = Color.TRANSPARENT,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        transition!: ?TransitionEffect = None,
        borderRadius!: ?BorderRadiuses = None,
        layoutRegionMargin!: ?Margin = None,
        title!: ?String = None,
        showInSubWindow!: ?Bool = None
    ) {
        super(offset: offset, placement: placement, enableArrow: enableArrow, arrowOffset: arrowOffset, preview: preview,
            previewAnimationOptions: previewAnimationOptions, onAppear: onAppear, onDisappear: onDisappear,
            aboutToAppear: aboutToAppear, aboutToDisappear: aboutToDisappear, backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle, transition: transition, borderRadius: borderRadius,
            layoutRegionMargin: layoutRegionMargin)
        this.title = title
        this.showInSubWindow = showInSubWindow
    }

    func parseCJMenuOptions(): CJMenuOptions {
        let contextMenuOptions = ContextMenuOptions(
            offset: offset,
            placement: placement,
            enableArrow: enableArrow,
            arrowOffset: arrowOffset,
            preview: preview,
            previewAnimationOptions: previewAnimationOptions,
            onAppear: onAppear,
            onDisappear: onDisappear,
            aboutToAppear: aboutToAppear,
            aboutToDisappear: aboutToDisappear,
            backgroundColor: backgroundColor,
            backgroundBlurStyle: backgroundBlurStyle,
            transition: transition,
            borderRadius: borderRadius,
            layoutRegionMargin: layoutRegionMargin
        )
        let cjContextMenuOptions = contextMenuOptions.parseCContextMenuOptions()
        let titleValue = unsafe {
            match (title) {
                case Some(value) => NativeOptionCString(true, LibC.mallocCString(value))
                case None => NativeOptionCString(false, LibC.mallocCString(""))
            }
        }
        let showInSubWindowValue = unsafe {
            match (showInSubWindow) {
                case Some(value) => NativeOptionBool(true, value)
                case None => NativeOptionBool(false, false)
            }
        }
        return CJMenuOptions(
            cjContextMenuOptions.offset,
            cjContextMenuOptions.placement,
            cjContextMenuOptions.enableArrow,
            cjContextMenuOptions.arrowOffset,
            cjContextMenuOptions.preview,
            cjContextMenuOptions.previewAnimationOptions,
            cjContextMenuOptions.onAppear,
            cjContextMenuOptions.onDisappear,
            cjContextMenuOptions.aboutToAppear,
            cjContextMenuOptions.aboutToDisappear,
            cjContextMenuOptions.backgroundColor,
            cjContextMenuOptions.backgroundBlurStyle,
            cjContextMenuOptions.transition,
            cjContextMenuOptions.borderRadius,
            cjContextMenuOptions.layoutRegionMargin,
            titleValue,
            showInSubWindowValue
        )
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BindOptions {
    let backgroundColor: Option<Color>
    let onAppear: Option<() -> Unit>
    let onDisappear: Option<() -> Unit>
    let onWillAppear: Option<() -> Unit>
    let onWillDisappear: Option<() -> Unit>

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(backgroundColor!: Option<Color> = Option.None, onAppear!: Option<() -> Unit> = Option.None,
        onDisappear!: Option<() -> Unit> = Option.None, onWillAppear!: Option<() -> Unit> = Option.None,
        onWillDisappear!: Option<() -> Unit> = Option.None) {
        this.backgroundColor = backgroundColor
        this.onAppear = onAppear
        this.onDisappear = onDisappear
        this.onWillAppear = onWillAppear
        this.onWillDisappear = onWillDisappear
    }

    func parseCBindOptions(bindOption: BindOptions): CBindOptions {
        let backgroundColor = unsafe {
            match (bindOption.backgroundColor) {
                case Some(value) => NativeOptionUInt32(true, value.toUInt32())
                case None => NativeOptionUInt32(false, 0)
            }
        }
        let onAppear = unsafe {
            match (bindOption.onAppear) {
                case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
        }
        let onDisappear = unsafe {
            match (bindOption.onDisappear) {
                case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
        }
        let onWillAppear = unsafe {
            match (bindOption.onWillAppear) {
                case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
        }
        let onWillDisappear = unsafe {
            match (bindOption.onWillDisappear) {
                case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
        }
        return CBindOptions(backgroundColor, onAppear, onDisappear, onWillAppear, onWillDisappear)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DismissContentCoverAction {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let reason: DismissReason

    let mDismissContentCover: CFunc<() -> Unit>

    init(reason: DismissReason, dismissContentCover: CFunc<() -> Unit>) {
        this.reason = reason
        this.mDismissContentCover = dismissContentCover
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss(): Unit {
        unsafe {
            this.mDismissContentCover()
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContentCoverOptions <: BindOptions {
    let modalTransition: ModalTransition
    let onWillDismiss: Option<(DismissContentCoverAction) -> Unit>
    let transition: Option<TransitionEffect>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        modalTransition!: ModalTransition = ModalTransition.DEFAULT,
        onWillDismiss!: Option<(DismissContentCoverAction) -> Unit> = Option.None,
        transition!: Option<TransitionEffect> = Option.None,
        backgroundColor!: Option<Color> = Option.None,
        onAppear!: Option<() -> Unit> = Option.None,
        onDisappear!: Option<() -> Unit> = Option.None,
        onWillAppear!: Option<() -> Unit> = Option.None,
        onWillDisappear!: Option<() -> Unit> = Option.None
    ) {
        super(backgroundColor: backgroundColor, onAppear: onAppear, onDisappear: onDisappear, onWillAppear: onWillAppear,
            onWillDisappear: onWillDisappear)
        this.modalTransition = modalTransition
        this.onWillDismiss = onWillDismiss
        this.transition = transition
    }
    func parseCJContentCoverOptions(contentCoverOptions: ContentCoverOptions): CJContentCoverOptionsV2 {
        let bindOptions = BindOptions(
            backgroundColor: contentCoverOptions.backgroundColor,
            onAppear: contentCoverOptions.onAppear,
            onDisappear: contentCoverOptions.onDisappear,
            onWillAppear: contentCoverOptions.onWillAppear,
            onWillDisappear: contentCoverOptions.onWillDisappear
        )
        let cjBindOptions = contentCoverOptions.parseCBindOptions(bindOptions)
        let modalTransition = contentCoverOptions.modalTransition.getValue()

        let transition = unsafe {
            match (contentCoverOptions.transition) {
                case Some(value) => NativeOptionInt64(true, value.getID())
                case None => NativeOptionInt64(false, 0)
            }
        }
        let onWillDismiss = unsafe {
            match (contentCoverOptions.onWillDismiss) {
                case Some(value) =>
                    let wrapper = {
                        proxy: CJDismissContentCoverAction => value(proxy.parseToCJ())
                    }
                    let lambdaData = Callback1Param<CJDismissContentCoverAction, Unit>(wrapper);
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
        }
        return CJContentCoverOptionsV2(
            modalTransition,
            onWillDismiss,
            transition,
            cjBindOptions.backgroundColor,
            cjBindOptions.onAppear,
            cjBindOptions.onDisappear,
            cjBindOptions.onWillAppear,
            cjBindOptions.onWillDisappear
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetDismiss {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public SheetDismiss() {}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss() {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractDismiss()
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
public class DismissSheetAction {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DismissSheetAction(public let reason: DismissReason) {}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dismiss() {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractDismiss()
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
public class SpringBackAction {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public SpringBackAction() {}
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func springBack() {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSpringBack()
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
public enum SheetMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OVERLAY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMBEDDED
    | ...

    func toValue(): UInt32 {
        match (this) {
            case OVERLAY => 0
            case EMBEDDED => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func toEnum(value: UInt32): SheetMode {
        if (value == 0) {
            return SheetMode.OVERLAY
        } else if (value == 1) {
            return SheetMode.EMBEDDED
        } else {
            return SheetMode.OVERLAY
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
public enum ScrollSizeMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLLOW_DETENT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CONTINUOUS
    | ...

    func toValue(): UInt32 {
        match (this) {
            case FOLLOW_DETENT => 0
            case CONTINUOUS => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func toEnum(value: UInt32): ScrollSizeMode {
        if (value == 0) {
            return ScrollSizeMode.FOLLOW_DETENT
        } else if (value == 1) {
            return ScrollSizeMode.CONTINUOUS
        } else {
            return ScrollSizeMode.FOLLOW_DETENT
        }
    }
}

func parseToDismissSheetAction(reason: Int32): DismissSheetAction {
    return DismissSheetAction(DismissReason.toEnum(reason))
}

func parseShadowOptions(shadowOptions: ShadowOptions): NativeShadow {
    NativeShadow(
        true,
        NativeShadowOptions(
            shadowOptions.radius,
            shadowOptions.shadowType,
            shadowOptions.color,
            shadowOptions.offsetX,
            shadowOptions.offsetY,
            shadowOptions.fill
        )
    )
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetTitleOptions {
    let title: String
    let subtitle: Option<String>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(title!: String, subtitle!: Option<String> = Option.None) {
        this.title = title
        this.subtitle = subtitle
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SheetOptions <: BindOptions {
    let height: Option<SheetSize>
    let detents: Option<Array<SheetSize>>
    let preferType: Option<SheetType>
    let showClose: Option<Bool>
    let dragBar: Option<Bool>
    let blurStyle: Option<BlurStyle>
    let maskColor: Option<Color>
    let title: Option<() -> Unit>
    let enableOutsideInteractive: Option<Bool>
    let shouldDismiss: Option<(SheetDismiss) -> Unit>
    let onWillDismiss: Option<(DismissSheetAction) -> Unit>
    let onWillSpringBackWhenDismiss: Option<(SpringBackAction) -> Unit>
    let onHeightDidChange: Option<(Float32) -> Unit>
    let onDetentsDidChange: Option<(Float32) -> Unit>
    let onWidthDidChange: Option<(Float32) -> Unit>
    let onTypeDidChange: Option<(Float32) -> Unit>
    let borderWidth: Option<Length>
    let borderColor: Option<Color>
    let borderStyle: Option<EdgeStyle>
    let width: Option<Length>
    let shadow: Option<ShadowOptions>
    let mode: Option<SheetMode>
    let scrollSizeMode: Option<ScrollSizeMode>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        backgroundColor!: Option<Color> = Color.WHITE,
        onAppear!: Option<() -> Unit> = Option.None,
        onDisappear!: Option<() -> Unit> = Option.None,
        onWillAppear!: Option<() -> Unit> = Option.None,
        onWillDisappear!: Option<() -> Unit> = Option.None,
        height!: Option<SheetSize> = Option.None,
        detents!: Option<Array<SheetSize>> = Option.None,
        preferType!: Option<SheetType> = Option.None,
        showClose!: Option<Bool> = Option.None,
        dragBar!: Option<Bool> = Option.None,
        blurStyle!: Option<BlurStyle> = Option.None,
        maskColor!: Option<Color> = Option.None,
        title!: Option<() -> Unit> = Option.None,
        enableOutsideInteractive!: Option<Bool> = Option.None,
        shouldDismiss!: Option<(SheetDismiss) -> Unit> = Option.None,
        onWillDismiss!: Option<(DismissSheetAction) -> Unit> = Option.None,
        onWillSpringBackWhenDismiss!: Option<(SpringBackAction) -> Unit> = Option.None,
        onHeightDidChange!: Option<(Float32) -> Unit> = Option.None,
        onDetentsDidChange!: Option<(Float32) -> Unit> = Option.None,
        onWidthDidChange!: Option<(Float32) -> Unit> = Option.None,
        onTypeDidChange!: Option<(Float32) -> Unit> = Option.None,
        borderWidth!: Option<Length> = 0.vp,
        borderColor!: Option<Color> = Color.BLACK,
        borderStyle!: Option<EdgeStyle> = EdgeStyle.SOLID,
        width!: Option<Length> = Option.None,
        shadow!: Option<ShadowOptions> = Option.None,
        mode!: Option<SheetMode> = SheetMode.OVERLAY,
        scrollSizeMode!: Option<ScrollSizeMode> = ScrollSizeMode.FOLLOW_DETENT
    ) {
        super(backgroundColor: backgroundColor, onAppear: onAppear, onDisappear: onDisappear, onWillAppear: onWillAppear,
            onWillDisappear: onWillDisappear)
        this.height = height
        this.detents = detents
        this.preferType = preferType
        this.showClose = showClose
        this.dragBar = dragBar
        this.blurStyle = blurStyle
        this.maskColor = maskColor
        this.title = title
        this.enableOutsideInteractive = enableOutsideInteractive
        this.shouldDismiss = shouldDismiss
        this.onWillDismiss = onWillDismiss
        this.onWillSpringBackWhenDismiss = onWillSpringBackWhenDismiss
        this.onHeightDidChange = onHeightDidChange
        this.onDetentsDidChange = onDetentsDidChange
        this.onWidthDidChange = onWidthDidChange
        this.onTypeDidChange = onTypeDidChange
        this.borderWidth = borderWidth
        this.borderColor = borderColor
        this.borderStyle = borderStyle
        this.width = width
        this.shadow = shadow
        this.mode = mode
        this.scrollSizeMode = scrollSizeMode
    }

    static func parse(sheetOption: SheetOptions): CSheetOptionsV2 {
        var bindOption: BindOptions = BindOptions(
            backgroundColor: sheetOption.backgroundColor,
            onAppear: sheetOption.onAppear,
            onDisappear: sheetOption.onDisappear,
            onWillAppear: sheetOption.onWillAppear,
            onWillDisappear: sheetOption.onWillDisappear
        )
        var cbindOption: CBindOptions = sheetOption.parseCBindOptions(bindOption)

        unsafe {
            let height = match (sheetOption.height) {
                case Some(value) => NativeOptionInt32(true, value.getValue())
                case None => NativeOptionInt32(false, 0)
            }
            let detents = match (sheetOption.detents) {
                case Some(value) =>
                    let ptr = LibC.malloc<Int32>(count: 3)
                    for (i in 0..2) {
                        ptr.write(i, value[i].getValue())
                    }
                    NativeOptionCArrInt32(true, CArrInt32(CPointer<Int32>(ptr), 3))
                case None => NativeOptionCArrInt32(false, CArrInt32(CPointer<Int32>(), 0))
            }
            let preferType = match (sheetOption.preferType) {
                case Some(value) => NativeOptionInt32(true, value.getValue())
                case None => NativeOptionInt32(false, 0)
            }
            let showClose = match (sheetOption.showClose) {
                case Some(value) => NativeOptionBool(true, value)
                case None => NativeOptionBool(false, false)
            }
            let dragBar = match (sheetOption.dragBar) {
                case Some(value) => NativeOptionBool(true, value)
                case None => NativeOptionBool(false, false)
            }
            let blurStyle = match (sheetOption.blurStyle) {
                case Some(value) => NativeOptionInt32(true, value.getValue())
                case None => NativeOptionInt32(false, 0)
            }
            let maskColor = match (sheetOption.maskColor) {
                case Some(value) => NativeOptionUInt32(true, value.toUInt32())
                case None => NativeOptionUInt32(false, 0)
            }
            let title = match (sheetOption.title) {
                case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let enableOutsideInteractive = match (sheetOption.enableOutsideInteractive) {
                case Some(value) => NativeOptionBool(true, value)
                case None => NativeOptionBool(false, false)
            }
            let shouldDismiss = match (sheetOption.shouldDismiss) {
                case Some(value) =>
                    let wrapper = {
                        => value(SheetDismiss())
                    }
                    let lambdaData = Callback0Param<Unit>(wrapper)
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onWillDismiss = match (sheetOption.onWillDismiss) {
                case Some(value) =>
                    let wrapper = {
                        action: Int32 => value(parseToDismissSheetAction(action))
                    }
                    let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let springBack = match (sheetOption.onWillSpringBackWhenDismiss) {
                case Some(value) =>
                    let wrapper = {
                        => value(SpringBackAction())
                    }
                    let lambdaData = Callback0Param<Unit>(wrapper)
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onHeightDidChange = match (sheetOption.onHeightDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onDetentsDidChange = match (sheetOption.onDetentsDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onWidthDidChange = match (sheetOption.onWidthDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let onTypeDidChange = match (sheetOption.onTypeDidChange) {
                case Some(value) => NativeOptionCallBack(true, Callback1Param<Float32, Unit>(value).getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }
            let borderWidth = match (sheetOption.borderWidth) {
                case Some(value) =>
                    var value_ = transAppResourceToLength(value)
                    NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
                case None => NativeOptionLength(false, NativeLength(0.0, 0))
            }
            let borderColor = match (sheetOption.borderColor) {
                case Some(value) => NativeOptionUInt32(true, value.toUInt32())
                case None => NativeOptionUInt32(false, 0)
            }
            let borderStyle = match (sheetOption.borderStyle) {
                case Some(value) => NativeOptionEdgeStyle(true, value.toNative())
                case None => NativeOptionEdgeStyle(false, NativeEdgeStyle(0, 0, 0, 0))
            }
            let width = match (sheetOption.width) {
                case Some(value) =>
                    var value_ = transAppResourceToLength(value)
                    NativeOptionLength(true, NativeLength(value_.value, value_.unitType.getValue()))
                case None => NativeOptionLength(false, NativeLength(0.0, 0))
            }
            let shadow = match (sheetOption.shadow) {
                case Some(value) => parseShadowOptions(value)
                case None => parseShadowOptions(ShadowOptions())
            }
            let mode = match (sheetOption.mode) {
                case Some(value) => NativeOptionUInt32(true, value.toValue())
                case None => NativeOptionUInt32(false, 0)
            }
            let scrollSizeMode = match (sheetOption.scrollSizeMode) {
                case Some(value) => NativeOptionUInt32(true, value.toValue())
                case None => NativeOptionUInt32(false, 0)
            }
            return CSheetOptionsV2(
                cbindOption.backgroundColor,
                cbindOption.onAppear,
                cbindOption.onDisappear,
                cbindOption.onWillAppear,
                cbindOption.onWillDisappear,
                height,
                detents,
                preferType,
                showClose,
                dragBar,
                blurStyle,
                maskColor,
                title,
                enableOutsideInteractive,
                shouldDismiss,
                onWillDismiss,
                springBack,
                onHeightDidChange,
                onDetentsDidChange,
                onWidthDidChange,
                onTypeDidChange,
                borderWidth,
                borderColor,
                borderStyle,
                width,
                shadow,
                mode,
                scrollSizeMode,
            )
        }
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
public class Rectangle {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Length = 0.vp, y!: Length = 0.vp, width!: Length = 100.percent, height!: Length = 100.percent) {
        this.x = transAppResourceToLength(x)
        this.y = transAppResourceToLength(y)
        this.width = transAppResourceToLength(width)
        this.height = transAppResourceToLength(height)
    }

    func parseToNative(): NativeRectangle {
        return NativeRectangle(
            x.value,
            x.unitType.getValue(),
            y.value,
            y.unitType.getValue(),
            width.value,
            width.unitType.getValue(),
            height.value,
            height.unitType.getValue()
        )
    }
}

class MenuActionData <: FFIData {
    private var actionList: HashMap<String, () -> Unit> = HashMap<String, () -> Unit>()
    MenuActionData(menuList: Array<Action>) {
        super()
        registerSelf()
        for (i in menuList) {
            BaseLog.debug("menuActionData storage action: " + i.value)
            actionList.add(i.value, i.action)
        }
    }

    func actionHandle(value: String): Unit {
        let actionOption = actionList.get(value)
        match (actionOption) {
            case None => throwNativeError("no action of this menu item: " + value)
            case Some(action) => action()
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
public class EdgeOutlineStyles {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Option<OutlineStyle>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Option<OutlineStyle>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Option<OutlineStyle>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Option<OutlineStyle>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: Option<OutlineStyle> = Option.None,
        right!: Option<OutlineStyle> = Option.None,
        bottom!: Option<OutlineStyle> = Option.None,
        left!: Option<OutlineStyle> = Option.None
    ) {
        this.top = top
        this.right = right
        this.bottom = bottom
        this.left = left
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EdgeColors {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: Option<ResourceColor> = Option.None,
        right!: Option<ResourceColor> = Option.None,
        bottom!: Option<ResourceColor> = Option.None,
        left!: Option<ResourceColor> = Option.None
    ) {
        this.top = if (let Some(v) <- top) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
        }
        this.right = if (let Some(v) <- right) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
        }
        this.bottom = if (let Some(v) <- bottom) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
        }
        this.left = if (let Some(v) <- left) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
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
public class OutlineRadiuses {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topLeft: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topRight: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomLeft: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomRight: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        topLeft!: Option<Length> = Option.None,
        topRight!: Option<Length> = Option.None,
        bottomLeft!: Option<Length> = Option.None,
        bottomRight!: Option<Length> = Option.None
    ) {
        this.topLeft = if (let Some(v) <- topLeft) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.topRight = if (let Some(v) <- topRight) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.bottomLeft = if (let Some(v) <- bottomLeft) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.bottomRight = if (let Some(v) <- bottomRight) {
            transAppResourceToLength(v)
        } else {
            Option.None
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
public class EdgeOutlineWidths {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: Option<Length> = Option.None,
        right!: Option<Length> = Option.None,
        bottom!: Option<Length> = Option.None,
        left!: Option<Length> = Option.None
    ) {
        this.top = if (let Some(v) <- top) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.right = if (let Some(v) <- right) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.bottom = if (let Some(v) <- bottom) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.left = if (let Some(v) <- left) {
            transAppResourceToLength(v)
        } else {
            Option.None
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
public class LocalizedEdgeColors {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: Option<ResourceColor>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: Option<ResourceColor> = Option.None,
        end!: Option<ResourceColor> = Option.None,
        bottom!: Option<ResourceColor> = Option.None,
        start!: Option<ResourceColor> = Option.None
    ) {
        this.top = if (let Some(v) <- top) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
        }
        this.end = if (let Some(v) <- end) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
        }
        this.bottom = if (let Some(v) <- bottom) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
        }
        this.start = if (let Some(v) <- start) {
            transAppResourceToResourceColor(v)
        } else {
            Option.None
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
public class Edges {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        top!: Option<Length> = Option.None,
        right!: Option<Length> = Option.None,
        bottom!: Option<Length> = Option.None,
        left!: Option<Length> = Option.None
    ) {
        this.top = if (let Some(v) <- top) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.right = if (let Some(v) <- right) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.bottom = if (let Some(v) <- bottom) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.left = if (let Some(v) <- left) {
            transAppResourceToLength(v)
        } else {
            Option.None
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
public class DirectionalEdgesT<T> {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: T
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: T
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: T
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: T
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(start: T, end: T, top: T, bottom: T) {
        this.start = start
        this.end = end
        this.top = top
        this.bottom = bottom
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedBorderRadiuses {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomEnd: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottomStart: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topEnd: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var topStart: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        bottomEnd!: Option<Length> = Option.None,
        bottomStart!: Option<Length> = Option.None,
        topEnd!: Option<Length> = Option.None,
        topStart!: Option<Length> = Option.None
    ) {
        this.bottomEnd = if (let Some(v) <- bottomEnd) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.bottomStart = if (let Some(v) <- bottomStart) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.topEnd = if (let Some(v) <- topEnd) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.topStart = if (let Some(v) <- topStart) {
            transAppResourceToLength(v)
        } else {
            Option.None
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
public class LocalizedEdgeWidths {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        start!: Option<Length> = Option.None,
        bottom!: Option<Length> = Option.None,
        end!: Option<Length> = Option.None,
        top!: Option<Length> = Option.None
    ) {
        this.start = if (let Some(v) <- start) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.bottom = if (let Some(v) <- bottom) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.end = if (let Some(v) <- end) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
        this.top = if (let Some(v) <- top) {
            transAppResourceToLength(v)
        } else {
            Option.None
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragInteractionOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DragInteractionOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let isMultiSelectionEnabled!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let defaultAnimationBeforeLifting!: Bool = false
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LinearGradientOption {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LinearGradientOption(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let angle!: Float64 = 180.0,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let direction!: GradientDirection = GradientDirection.Bottom,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let repeating!: Bool = false
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface BorderImageOptionSourceType {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend String <: BorderImageOptionSourceType {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend AppResource <: BorderImageOptionSourceType {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend LinearGradientOption <: BorderImageOptionSourceType {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface LengthEdgeWidthsType {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend LengthType <: LengthEdgeWidthsType {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend EdgeWidths <: LengthEdgeWidthsType {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BorderImageOption {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public BorderImageOption(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let source!: BorderImageOptionSourceType,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let slice!: LengthEdgeWidthsType = LengthType.vp(0.0),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let width!: LengthEdgeWidthsType = LengthType.vp(0.0),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let outset!: LengthEdgeWidthsType = LengthType.vp(0.0),
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let repeat!: RepeatMode = RepeatMode.STRETCH,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let fill!: Bool = false
    ) {}
}
