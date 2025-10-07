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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class BaseEvent {
    /**
     * Display area of the element that triggers the gesture event.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var target: ?EventTarget

    /**
     * Timestamp of the event.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64

    /**
     * Event input device.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var source: ?SourceType

    /**
     *  Indicates the ID of the input device that triggers the current key.
     *
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
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchObject {
    /**
     * Type of the touch event.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touchType: TouchType

    /**
     * Finger unique identifier.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: Int32

    /**
     * X coordinate of the point relative to the global display.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenX: Float64

    /**
     * Y coordinate of the point relative to the global display.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenY: Float64

    /**
     * X coordinate of the touch point relative to the upper left corner of the event responding component.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Y coordinate of the touch point relative to the upper edge of the touched element.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * TouchObject constructor
     * @params { TouchType } touchType
     * @params { Int32 } id
     * @params { Float64 } screenX
     * @params { Float64 } screenY
     * @params { Float64 } x
     * @params { Float64 } y
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
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ClickEvent <: BaseEvent {
    /**
     * X coordinate of the click point relative to the left edge of the clicked element.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64
    /**
     * Y coordinate of the click point relative to the upper edge of the clicked element.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * X coordinate of the click relative to the upper left corner of the application window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowX: Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowY: Float64
    /**
     * X coordinate of the click relative to the upper left corner of the application screen.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var displayX: Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application screen.
     *
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
 * DragInfo object description
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragInfo {
    /**
     * Additional information about the drag info.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraParams: ?String
    /**
     * Touch point coordinates.
     *
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
 * DragItemInfo object description
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragItemInfo {
    /**
     * Uses the pixelMap object for drawing.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var pixelMap: ?PixelMap

    /**
     * Uses the custom builder for drawing, if pixelMap is set, this value is ignored.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: ?CustomBuilder

    /**
     * Sets the extra info for drag event.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraInfo: ?String

    /**
     * DragItemInfo constructor
     * @params { PixelMap } pixelMap
     * @params { CustomBuilder } builder
     * @params { String } extraInfo
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
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MouseEvent <: BaseEvent {
    /**
     * X coordinate of the mouse pointer relative to the upper left corner of the application window.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenX: Float64

    /**
     * Y coordinate of the mouse pointer relative to the upper left corner of the application window.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenY: Float64

    /**
     * X coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Y coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Mouse button of the click event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var button: MouseButton

    /**
     * Mouse action of the click event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: MouseAction

    /**
     * MouseEvent constructor
     * @params { Int64 } timestamp
     * @params { Float64 } screenX
     * @params { Float64 } screenY
     * @params { Float64 } x
     * @params { Float64 } y
     * @params { MouseButton } button
     * @params { MouseAction } action
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
 * Touch Action Function Parameters
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchEvent <: BaseEvent {
    var isStopPropagation: Bool = false

    /**
     * Type of the touch event.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var eventType: TouchType

    /**
     * All finger information.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touches: Array<TouchObject>

    /**
     * Finger information changed.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var changedTouches: Array<TouchObject>

    @!APILevel[
        22,
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
 * KeyEvent object description:
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class KeyEvent {
    var isStopPropagation: Bool = false

    /**
     * Key value of a key.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyText: String

    /**
     * Type of a key.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyType: KeyType

    /**
     * Key code of a key
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyCode: Int32

    /**
     * Type of the input device that triggers the current key, such as the keyboard or handle.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keySource: KeySource

    /**
     * Indicates the status of the key when the key is pressed.
     * The value 1 indicates the pressed state, and the value 0 indicates the unpressed state.
     *
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var metaKey: Int32

    /**
     * Timestamp when the key was pressed.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64

    /**
     *  Indicates the ID of the input device that triggers the current key.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var deviceId: Int64

    /**
     * KeyEvent constructor
     * @params { String } keyText
     * @params { KeyType } keyType
     * @params { Int32 } keyCode
     * @params { KeySource } keySource
     * @params { Int32 } metaKey
     * @params { Int64 } deviceId
     * @params { Int64 } timestamp
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
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopPropagation(): Unit {
        this.isStopPropagation = true
    }
}
