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
import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap

/**
 * Defines the base event.
 *
 * @relation declare interface BaseEvent
 */
sealed abstract class BaseEvent {
    /**
     * Display area of the element that triggers the gesture event.
     *
     * @relation target: EventTarget;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var target: ?EventTarget

    /**
     * Timestamp of the event.
     *
     * @relation timestamp: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: ?Int64

    /**
     * Event input device.
     *
     * @relation source: SourceType;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var source: ?SourceType

    /**
     *  Indicates the ID of the input device that triggers the current key.
     *
     * @relation deviceId: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var deviceId: ?Int64

    var axisHorizontal: Int64 = 0

    var axisVertical: Int64 = 0

    var tiltX: Float64 = 0.0

    var tiltY: Float64 = 0.0

    init(target!: EventTarget = EventTarget(Area(0, 0, Position(), Position())), timestamp!: Int64,
        source!: SourceType = SourceType.Unknown, deviceId!: ?Int64 = None) {
        this.target = target
        this.timestamp = timestamp
        this.source = source
        this.deviceId = deviceId ?? 0
    }
}

/**
 * Type of the touch event.
 *
 * @relation declare interface TouchObject
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchObject {
    /**
     * Type of the touch event.
     *
     * @relation type: TouchType;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touchType: ?TouchType

    /**
     * Finger unique identifier.
     *
     * @relation id: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: ?Int32

    /**
     * X coordinate of the point relative to the global display.
     *
     * @relation globalDisplayX?: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenX: ?Float64

    /**
     * Y coordinate of the point relative to the global display.
     *
     * @relation globalDisplayY?: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenY: ?Float64

    /**
     * X coordinate of the touch point relative to the upper left corner of the event responding component.
     *
     * @relation x: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float64

    /**
     * Y coordinate of the touch point relative to the upper edge of the touched element.
     *
     * @relation y: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float64

    /**
     * constructor
     */
    public init(touchType: ?TouchType, id: ?Int32, screenX: ?Float64, screenY: ?Float64, x: ?Float64, y: ?Float64) {
        this.touchType = touchType ?? throw IllegalArgumentException("The type now is not supported.")
        this.id = id ?? throw IllegalArgumentException("The type now is not supported.")
        this.screenX = screenX ?? throw IllegalArgumentException("The type now is not supported.")
        this.screenY = screenY ?? throw IllegalArgumentException("The type now is not supported.")
        this.x = x ?? throw IllegalArgumentException("The type now is not supported.")
        this.y = y ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * The tap action triggers this method invocation.
 *
 * @relation declare interface ClickEvent extends BaseEvent
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ClickEvent <: BaseEvent {
    /**
     * X coordinate of the click point relative to the left edge of the clicked element.
     *
     * @relation x: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float64
    /**
     * Y coordinate of the click point relative to the upper edge of the clicked element.
     *
     * @relation y: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float64

    /**
     * X coordinate of the click relative to the upper left corner of the application window.
     *
     * @relation windowX: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowX: ?Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application window.
     *
     * @relation windowY: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowY: ?Float64
    /**
     * X coordinate of the click relative to the upper left corner of the application screen.
     *
     * @relation displayX: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var displayX: ?Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application screen.
     *
     * @relation displayY: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var displayY: ?Float64

    init(x: Float64, y: Float64, timestamp: Int64, source: SourceType, target: EventTarget, windowX: Float64,
        windowY: Float64, displayX: Float64, displayY: Float64) {
        super(source: source, target: target, timestamp: timestamp)
        this.x = x
        this.y = y
        this.windowX = windowX
        this.windowY = windowY
        this.displayX = displayX
        this.displayY = displayY
    }
}

/**
 * DragInfo object description
 *
 * @relation interface DragInfo
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragInfo {
    /**
     * Additional information about the drag info.
     *
     * @relation extraParams?: string;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraParams: ?String
    /**
     * Touch point coordinates.
     *
     * @relation touchPoint?: TouchPoint;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touchPoint: ?Position

    init(extraParams: String, touchPoint: Position) {
        this.extraParams = extraParams
        this.touchPoint = touchPoint
    }
}

/**
 * DragItemInfo object description
 *
 * @relation declare interface DragItemInfo
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragItemInfo {
    /**
     * Uses the pixelMap object for drawing.
     *
     * @relation pixelMap?: PixelMap;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var pixelMap: ?PixelMap

    /**
     * Uses the custom builder for drawing, if pixelMap is set, this value is ignored.
     *
     * @relation builder?: CustomBuilder;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: ?CustomBuilder

    /**
     * Sets the extra info for drag event.
     *
     * @relation extraInfo?: string;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraInfo: ?String

    /**
     * constructor
     */
    public init(pixelMap: ?PixelMap, builder: ?CustomBuilder, extraInfo: ?String) {
        this.pixelMap = pixelMap ?? PixelMap(0)
        this.builder = builder ?? {=>}
        this.extraInfo = extraInfo ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * The mouse click action triggers this method invocation.
 *
 * @relation declare interface MouseEvent extends BaseEvent
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MouseEvent <: BaseEvent {
    /**
     * X coordinate of the mouse pointer relative to the upper left corner of the application window.
     *
     *
     * @relation screenX: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenX: ?Float64

    /**
     * Y coordinate of the mouse pointer relative to the upper left corner of the application window.
     *
     *
     * @relation screenX: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenY: ?Float64

    /**
     * X coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     *
     * @relation x: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: ?Float64

    /**
     * Y coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     *
     * @relation y: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: ?Float64

    /**
     * Mouse button of the click event.
     *
     * @relation button: MouseButton;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var button: ?MouseButton

    /**
     * Mouse action of the click event.
     *
     * @relation action: MouseAction;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: ?MouseAction

    /**
     * constructor
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(timestamp: ?Int64, screenX: ?Float64, screenY: ?Float64, x: ?Float64, y: ?Float64, button: ?MouseButton,
        action: ?MouseAction) {
        super(timestamp: timestamp ?? throw IllegalArgumentException("The type now is not supported."))
        this.screenX = screenX ?? throw IllegalArgumentException("The type now is not supported.")
        this.screenY = screenY ?? throw IllegalArgumentException("The type now is not supported.")
        this.x = x ?? throw IllegalArgumentException("The type now is not supported.")
        this.y = y ?? throw IllegalArgumentException("The type now is not supported.")
        this.button = button ?? throw IllegalArgumentException("The type now is not supported.")
        this.action = action ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * Touch Action Function Parameters
 *
 * @relation declare interface TouchEvent extends BaseEvent
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchEvent <: BaseEvent {
    var isStopPropagation: Bool = false

    /**
     * Type of the touch event.
     *
     * @relation type: TouchType;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var eventType: ?TouchType

    /**
     * All finger information.
     *
     * @relation touches: TouchObject[];
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touches: ?Array<TouchObject>

    /**
     * Finger information changed.
     *
     * @relation touches: TouchObject[];
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var changedTouches: ?Array<TouchObject>

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    init(eventType: TouchType, touches: Array<TouchObject>, changedTouches: Array<TouchObject>, timestamp: Int64,
        target: EventTarget, source: SourceType) {
        super(source: source, target: target, timestamp: timestamp)    
        this.eventType = eventType
        this.touches = touches
        this.changedTouches = changedTouches
    }

    /**
     * Stops the event from bubbling upwards or downwards.
     *
     * @relation stopPropagation: () => void;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopPropagation(): Unit {
        this.isStopPropagation = true
    }
}

/**
 * KeyEvent object description:
 *
 * @relation declare interface KeyEvent
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class KeyEvent {
    var isStopPropagation: Bool = false

    /**
     * Key value of a key.
     *
     * @relation keyText: string;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyText: ?String

    /**
     * Type of a key.
     *
     * @relation type: KeyType;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyType: ?KeyType

    /**
     * Key code of a key
     *
     * @relation keyCode: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyCode: ?Int32

    /**
     * Type of the input device that triggers the current key, such as the keyboard or handle.
     *
     * @relation keySource: KeySource;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keySource: ?KeySource

    /**
     * Indicates the status of the key when the key is pressed.
     * The value 1 indicates the pressed state, and the value 0 indicates the unpressed state.
     *
     *
     * @relation metaKey: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var metaKey: ?Int32

    /**
     * Timestamp when the key was pressed.
     *
     * @relation timestamp: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: ?Int64

    /**
     *  Indicates the ID of the input device that triggers the current key.
     *
     * @relation deviceId: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var deviceId: ?Int64

    /**
     * constructor
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(keyText: ?String, keyType: ?KeyType, keyCode: ?Int32, keySource: ?KeySource, metaKey: ?Int32,
        deviceId: ?Int64, timestamp: ?Int64) {
        this.keyText = keyText ?? throw IllegalArgumentException("The type now is not supported.")
        this.keyType = keyType ?? throw IllegalArgumentException("The type now is not supported.")
        this.keyCode = keyCode ?? throw IllegalArgumentException("The type now is not supported.")
        this.keySource = keySource ?? throw IllegalArgumentException("The type now is not supported.")
        this.metaKey = metaKey ?? throw IllegalArgumentException("The type now is not supported.")
        this.deviceId = deviceId ?? throw IllegalArgumentException("The type now is not supported.")
        this.timestamp = timestamp ?? throw IllegalArgumentException("The type now is not supported.")
    }

    /**
     * Stops the event from bubbling upwards or downwards.
     *
     * @relation stopPropagation: () => void;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopPropagation(): Unit {
        this.isStopPropagation = true
    }
}

