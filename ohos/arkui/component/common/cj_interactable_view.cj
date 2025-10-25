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

import ohos.arkui.component.native_struct.*
import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap

/**
 * Defines the base event.
 * This class serves as the foundation for all event types in the system,
 * providing common properties that all events share.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class BaseEvent {
    /**
     * Display area of the element that triggers the gesture event.
     * Contains information about the target element's position and dimensions.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var target: ?EventTarget

    /**
     * Timestamp of the event.
     * Represents the time when the event occurred in milliseconds since Unix epoch.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64

    /**
     * Event input device.
     * Indicates the type of device that generated the event (e.g. mouse, touch screen).
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var source: ?SourceType

    /**
     * Indicates the ID of the input device that triggers the current key.
     * Useful for identifying which specific device generated the event in multi-device scenarios.
     */
    @!APILevel[
        22,
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
 * Represents detailed information about a single touch point in a touch event.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchObject {
    /**
     * Type of the touch event.
     * Indicates what type of touch action occurred (e.g., Down, Up, Move, Cancel).
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touchType: TouchType

    /**
     * Finger unique identifier.
     * Used to track individual fingers in multi-touch scenarios.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: Int32

    /**
     * X coordinate of the point relative to the global display.
     * Position of the touch point in screen coordinates.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenX: Float64

    /**
     * Y coordinate of the point relative to the global display.
     * Position of the touch point in screen coordinates.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenY: Float64

    /**
     * X coordinate of the touch point relative to the upper left corner of the event responding component.
     * Position of the touch point relative to the component that received the event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Y coordinate of the touch point relative to the upper edge of the touched element.
     * Position of the touch point relative to the component that received the event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * TouchObject constructor.
     *
     * @param { TouchType } touchType - Type of the touch event
     * @param { Int32 } id - Finger unique identifier
     * @param { Float64 } screenX - X coordinate relative to global display
     * @param { Float64 } screenY - Y coordinate relative to global display
     * @param { Float64 } x - X coordinate relative to the component
     * @param { Float64 } y - Y coordinate relative to the component
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(touchType: TouchType, id: Int32, screenX: Float64, screenY: Float64, x: Float64, y: Float64) {
        this.touchType = touchType
        this.id = id
        this.screenX = screenX
        this.screenY = screenY
        this.x = x
        this.y = y
    }
}

/**
 * The tap action triggers this method invocation.
 * Represents a click/tap event with detailed position information.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ClickEvent <: BaseEvent {
    /**
     * X coordinate of the click point relative to the left edge of the clicked element.
     * Position within the clicked component's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64
    /**
     * Y coordinate of the click point relative to the upper edge of the clicked element.
     * Position within the clicked component's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * X coordinate of the click relative to the upper left corner of the application window.
     * Position within the application window's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowX: Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application window.
     * Position within the application window's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowY: Float64
    /**
     * X coordinate of the click relative to the upper left corner of the application screen.
     * Position within the device screen's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var displayX: Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application screen.
     * Position within the device screen's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var displayY: Float64

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
 * Contains information about a drag operation.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragInfo {
    /**
     * Can contain custom data associated with the drag operation.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraParams: ?String
    /**
     * Current position of the drag operation.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touchPoint: ?Position

    init(extraParams: String, touchPoint: Position) {
        this.extraParams = extraParams
        this.touchPoint = touchPoint
    }
}

/**
 * Contains information about the visual representation of a dragged item.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragItemInfo {
    /**
     * Visual representation of the dragged item as a PixelMap.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var pixelMap: ?PixelMap

    /**
     * Uses the custom builder for drawing, if pixelMap is set, this value is ignored.
     * Custom visual representation of the dragged item.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: ?CustomBuilder

    /**
     * Additional custom data associated with the drag operation.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraInfo: ?String

    /**
     * Creates a new DragItemInfo instance with the specified properties.
     *
     * @param { ?PixelMap } pixelMap - Visual representation as PixelMap
     * @param { ?CustomBuilder } builder - Custom visual representation
     * @param { ?String } extraInfo - Additional information about the drag
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(pixelMap: ?PixelMap, builder: ?CustomBuilder, extraInfo: ?String) {
        this.pixelMap = pixelMap ?? PixelMap(0)
        this.builder = builder ?? {=>}
        this.extraInfo = extraInfo ?? ""
    }
}

/**
 * The mouse click action triggers this method invocation.
 * Represents a mouse event with detailed position and button information.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MouseEvent <: BaseEvent {
    /**
     * X coordinate of the mouse pointer relative to the upper left corner of the application window.
     * Position within the application window's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenX: Float64

    /**
     * Y coordinate of the mouse pointer relative to the upper left corner of the application window.
     * Position within the application window's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenY: Float64

    /**
     * X coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     * Position within the clicked component's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Y coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     * Position within the clicked component's coordinate system.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Indicates which mouse button was pressed (e.g., Left, Right, Middle).
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var button: MouseButton

    /**
     * Indicates the type of mouse action that occurred (e.g., Press, Release, Move, Hover).
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: MouseAction

    /**
     * MouseEvent constructor.
     *
     * @param { Int64 } timestamp
     * @param { Float64 } screenX
     * @param { Float64 } screenY
     * @param { Float64 } x
     * @param { Float64 } y
     * @param { MouseButton } button
     * @param { MouseAction } action
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(timestamp: Int64, screenX: Float64, screenY: Float64, x: Float64, y: Float64, button: MouseButton,
        action: MouseAction) {
        super(timestamp: timestamp)
        this.screenX = screenX
        this.screenY = screenY
        this.x = x
        this.y = y
        this.button = button
        this.action = action
    }
}

/**
 * Represents a touch event containing information about all touch points.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchEvent <: BaseEvent {
    var isStopPropagation: Bool = false

    /**
     * Indicates the primary type of touch action for this event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var eventType: TouchType

    /**
     * Array containing information about all active touch points.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touches: Array<TouchObject>

    /**
     * Array containing information about touch points that changed in this event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var changedTouches: Array<TouchObject>

    init(eventType: TouchType, touches: Array<TouchObject>, changedTouches: Array<TouchObject>, timestamp: Int64,
        target: EventTarget, source: SourceType) {
        super(source: source, target: target, timestamp: timestamp)    
        this.eventType = eventType
        this.touches = touches
        this.changedTouches = changedTouches
    }

    /**
     * Stops the event from bubbling upwards or downwards.
     * Prevents the event from propagating to parent or child components.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopPropagation(): Unit {
        this.isStopPropagation = true
    }
}

/**
 * Represents a keyboard event with detailed information about the key press.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class KeyEvent {
    var isStopPropagation: Bool = false

    /**
     * The string representation of the key that was pressed.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyText: String

    /**
     * Indicates whether the key was pressed down or released.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyType: KeyType

    /**
     * The numeric code representing the physical key that was pressed.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyCode: Int32

    /**
     * Type of the input device that triggers the current key, such as the keyboard or handle.
     * Indicates the source device of the key event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keySource: KeySource

    /**
     * Indicates the status of the key when the key is pressed.
     * The value 1 indicates the pressed state, and the value 0 indicates the unpressed state.
     * Used for modifier keys like Ctrl, Shift, Alt.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var metaKey: Int32

    /**
     * Timestamp when the key was pressed.
     * Time when the key event occurred in milliseconds since Unix epoch.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64

    /**
     * Indicates the ID of the input device that triggers the current key.
     * Useful for identifying which specific keyboard generated the event in multi-device scenarios.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var deviceId: Int64

    /**
     * KeyEvent constructor.
     *
     * @param { String } keyText
     * @param { KeyType } keyType
     * @param { Int32 } keyCode
     * @param { KeySource } keySource
     * @param { Int32 } metaKey
     * @param { Int64 } deviceId
     * @param { Int64 } timestamp
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(keyText: String, keyType: KeyType, keyCode: Int32, keySource: KeySource, metaKey: Int32,
        deviceId: Int64, timestamp: Int64) {
        this.keyText = keyText
        this.keyType = keyType
        this.keyCode = keyCode
        this.keySource = keySource
        this.metaKey = metaKey
        this.deviceId = deviceId
        this.timestamp = timestamp
    }

    /**
     * Stops the event from bubbling upwards or downwards.
     * Prevents the event from propagating to parent or child components.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopPropagation(): Unit {
        this.isStopPropagation = true
    }
}
