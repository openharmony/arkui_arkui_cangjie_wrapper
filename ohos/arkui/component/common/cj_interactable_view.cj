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
    public var target: EventTarget

    /**
     * Timestamp of the event.
     *
     * @relation timestamp: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64

    /**
     * Event input device.
     *
     * @relation source: SourceType;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var source: SourceType

    /**
     *  Indicates the ID of the input device that triggers the current key.
     *
     * @relation deviceId: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var deviceId: Int64 = 0

    var axisHorizontal: Int64 = 0

    var axisVertical: Int64 = 0

    var tiltX: Float64 = 0.0

    var tiltY: Float64 = 0.0

    init(target!: EventTarget = EventTarget(Area(0, 0, Position(), Position())), timestamp!: Int64,
        source!: SourceType = SourceType.Unknown, deviceId!: Int64 = 0) {
        this.target = target
        this.timestamp = timestamp
        this.source = source
        this.deviceId = deviceId
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
    public var touchType: TouchType

    /**
     * Finger unique identifier.
     *
     * @relation id: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: Int32

    /**
     * X coordinate of the point relative to the global display.
     *
     * @relation globalDisplayX?: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenX: Float64

    /**
     * Y coordinate of the point relative to the global display.
     *
     * @relation globalDisplayY?: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenY: Float64

    /**
     * X coordinate of the touch point relative to the upper left corner of the event responding component.
     *
     * @relation x: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Y coordinate of the touch point relative to the upper edge of the touched element.
     *
     * @relation y: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * constructor
     */
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
    public var x: Float64
    /**
     * Y coordinate of the click point relative to the upper edge of the clicked element.
     *
     * @relation y: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * X coordinate of the click relative to the upper left corner of the application window.
     *
     * @relation windowX: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowX: Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application window.
     *
     * @relation windowY: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowY: Float64
    /**
     * X coordinate of the click relative to the upper left corner of the application screen.
     *
     * @relation displayX: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var displayX: Float64
    /**
     * Y coordinate of the click relative to the upper left corner of the application screen.
     *
     * @relation displayY: number;
     */
    @!APILevel[
        21,
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
    public var extraParams: String
    /**
     * Touch point coordinates.
     *
     * @relation touchPoint?: TouchPoint;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touchPoint: Position

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
    public var pixelMap: PixelMap = PixelMap(0)

    /**
     * Uses the custom builder for drawing, if pixelMap is set, this value is ignored.
     *
     * @relation builder?: CustomBuilder;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var builder: CustomBuilder = {=>}

    /**
     * Sets the extra info for drag event.
     *
     * @relation extraInfo?: string;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var extraInfo: String

    /**
     * constructor
     */
    public init(pixelMap: PixelMap, builder: CustomBuilder, extraInfo: String) {
        this.pixelMap = pixelMap
        this.builder = builder
        this.extraInfo = extraInfo
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
    public var screenX: Float64

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
    public var screenY: Float64

    /**
     * X coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     *
     * @relation x: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Y coordinate of the mouse pointer relative to the upper left corner of the component being clicked.
     *
     * @relation y: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Mouse button of the click event.
     *
     * @relation button: MouseButton;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var button: MouseButton

    /**
     * Mouse action of the click event.
     *
     * @relation action: MouseAction;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: MouseAction

    /**
     * constructor
     */
    @!APILevel[
        21,
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
    public var eventType: TouchType

    /**
     * All finger information.
     *
     * @relation touches: TouchObject[];
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var touches: Array<TouchObject>

    /**
     * Finger information changed.
     *
     * @relation touches: TouchObject[];
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var changedTouches: Array<TouchObject>

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
    public var keyText: String

    /**
     * Type of a key.
     *
     * @relation type: KeyType;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyType: KeyType

    /**
     * Key code of a key
     *
     * @relation keyCode: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keyCode: Int32

    /**
     * Type of the input device that triggers the current key, such as the keyboard or handle.
     *
     * @relation keySource: KeySource;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var keySource: KeySource

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
    public var metaKey: Int32

    /**
     * Timestamp when the key was pressed.
     *
     * @relation timestamp: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64

    /**
     *  Indicates the ID of the input device that triggers the current key.
     *
     * @relation deviceId: number;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var deviceId: Int64

    /**
     * constructor
     */
    @!APILevel[
        21,
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
 * Defines the common method of Component.
 *
 * @relation declare class CommonMethod<T>
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
abstract sealed class InteractableView <: RemoteData {
    /*
     * Called when a click event occurs.
     *
     * @param { function } event
     * @returns { This }
     * @relation onClick(event: (event: ClickEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onClick(event: (ClickEvent) -> Unit): This {
        onClickInner(event)
    }

    protected open func onClickInner(callback: (ClickEvent) -> Unit): This {
        let wrapper = {
            evt: CJClickEvent => callback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnClick(lambdaData.getID())
        }
        this
    }

    /*
     * This callback is triggered when a component mounts a display.
     *
     * @param { function } event
     * @returns { This }
     * @relation onAppear(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAppear(event: () -> Unit): This {
        onAppearInner(event)
    }

    protected open func onAppearInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAppear(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /*
     * This callback is triggered when component uninstallation disappears.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDisAppear(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDisAppear(event: () -> Unit): This {
        onDisAppearInner(event)
    }

    protected open func onDisAppearInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDisAppear(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /*
     * Invoked when a touch event is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onTouch(event: (event: TouchEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTouch(event: (TouchEvent) -> Unit): This {
        onTouchInner(event)
    }

    protected open func onTouchInner(event: (TouchEvent) -> Unit): This {
        let wrapper = {
            evt: CJTouchEvent =>
            var resolved = parseCJTouchEvent(evt)
            event(resolved)
            return resolved.isStopPropagation
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnTouch(CallbackCJTouchEvent(wrapper).getID())
        }
        this
    }

    /*
     * Trigger a hover event.
     *
     * @param { function } event
     * @returns { This }
     * @relation onHover(event: (isHover: boolean, event: HoverEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onHover(event: (Bool) -> Unit): This {
        onHoverInner(event)
    }

    protected open func onHoverInner(callback: (Bool) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnHover(Callback1Param<Bool, Unit>(callback).getID())
        }
        this
    }

    /*
     * This callback is triggered when the size or position of this component change finished.
     *
     * @param { function } event
     * @returns { This }
     * @relation onAreaChange(event: (oldValue: Area, newValue: Area) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAreaChange(event: (Area, Area) -> Unit): This {
        onAreaChangeInner(event)
    }

    protected open func onAreaChangeInner(callback: (Area, Area) -> Unit): This {
        let wrapper = {
            lastArea: CJArea, area: CJArea => callback(parseCJArea(lastArea), parseCJArea(area))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAreaChanged(CallbackCJAreaChangedEvent(wrapper).getID())
        }
        this
    }

    /*
     * Trigger a visible area change event.
     *
     * @param { function } event
     * @returns { This }
     * @relation onVisibleAreaChange(ratios: Array<number>, event: VisibleAreaChangeCallback): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onVisibleAreaChange(raitos: Array<Float64>, event: (Bool, Float64) -> Unit): This {
        onVisibleAreaChangeInner(raitos, event)
    }

    protected open func onVisibleAreaChangeInner(raitos: Array<Float64>, callback: (Bool, Float64) -> Unit): This {
        let wrapper = {
            isVisible: Bool, currentRatio: Float64 => callback(isVisible, currentRatio)
        }
        let valuesHandle = FFIVectorFloat64(raitos.size)
        for (i in 0..raitos.size) {
            valuesHandle.setElement(i, raitos[i])
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnVisibleAreaChange(valuesHandle.getNativeHandle(),
                CallbackCJVisibleAreaChangeEvent(wrapper).getID())
        }
        valuesHandle.free()
        this
    }

    /*
     * Triggered when the component is clicked by a mouse button or the mouse pointer moves on the component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onMouse(event: (event: MouseEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onMouse(event: (MouseEvent) -> Unit): This {
        onMouseInner(event)
    }

    protected open func onMouseInner(event: (MouseEvent) -> Unit): This {
        let wrapper = {
            evt: CJMouseEvent =>
            var resolved = parseCJMouseEvent(evt)
            event(resolved)
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnMouse(CallbackCJMouseEvent(wrapper).getID())
        }
        this
    }

    /*
     * Keyboard input
     *
     * @param { function } event
     * @returns { This }
     * @relation onKeyEvent(event: (event: KeyEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onKeyEvent(event: (KeyEvent) -> Unit): This {
        onKeyEventInner(event)
    }

    protected open func onKeyEventInner(callback: (KeyEvent) -> Unit): This {
        let wrapper = {
            evt: CJKeyEvent =>
            let resolved = parseCJKeyEvent(evt)
            callback(resolved)
            return resolved.isStopPropagation
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnKey(CallbackCJKeyEvent(wrapper).getID())
        }
        this
    }

    /*
     * Trigger a event when got focus.
     *
     * @param { function } event
     * @returns { This }
     * @relation onFocus(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFocus(event: () -> Unit): This {
        onFocusInner(event)
    }

    protected open func onFocusInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnFocus(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /*
     * Triggered when the current component loses focus.
     *
     * @param { function } event
     * @returns { This }
     * @relation onBlur(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onBlur(event: () -> Unit): This {
        onBlurInner(event)
    }

    protected open func onBlurInner(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnBlur(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragStart(event: (event: DragEvent, extraParams?: string) => CustomBuilder | DragItemInfo): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: (DragInfo) -> DragItemInfo): This {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: (DragInfo) -> DragItemInfo): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        let ret = callback(parseCJDragEvent(evt))
                        let pixelMapId = ret.pixelMap.getID()
                        let builderId = Callback0Param<Unit>(ret.builder).getID()
                        return CJDragItemInfo(
                            pixelMapId: pixelMapId,
                            builderId: builderId,
                            extraInfo: LibC.mallocCString(ret.extraInfo)
                        )
                    }
                ).getID(), DragComponent.DragCommon.getValue())
        }
        this
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragStart(event: (event: DragEvent, extraParams?: string) => CustomBuilder | DragItemInfo): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: (DragInfo) -> CustomBuilder): This {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: (DragInfo) -> CustomBuilder): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        let ret = callback(parseCJDragEvent(evt))
                        return CJDragItemInfo(builderId: Callback0Param<Unit>(ret).getID())
                    }
                ).getID(), DragComponent.DragCommon.getValue())
        }
        this
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragStart(event: (event: DragEvent, extraParams?: string) => CustomBuilder | DragItemInfo): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: (DragInfo) -> Unit): This {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: (DragInfo) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        callback(parseCJDragEvent(evt))
                        return CJDragItemInfo()
                    }
                ).getID(), DragComponent.DragCommon.getValue())
        }
        this
    }

    /**
     * After binding, a callback is triggered when the component is dragged to the range of the component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragEnter(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragEnter(event: (DragInfo) -> Unit): This {
        onDragEnterInner(event)
        this
    }

    protected open func onDragEnterInner(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragEnter(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }

    /**
     * After binding, a callback is triggered when the drag moves within the range of a placeable component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragMove(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragMove(event: (DragInfo) -> Unit): This {
        onDragMoveInner(event)
    }

    protected open func onDragMoveInner(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragMove(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }

    /**
     * After binding, a callback is triggered when the component is dragged out of the component range.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragLeave(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragLeave(event: (DragInfo) -> Unit): This {
        onDragLeaveInner(event)
    }

    protected open func onDragLeaveInner(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragLeave(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }

    /**
     * The component bound to this event can be used as the drag release target.
     * This callback is triggered when the drag behavior is stopped within the scope of the component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDrop(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDrop(event: (DragInfo) -> Unit): This {
        onDropInenr(event)
    }
    /*
     * Note: the DragInfo is diff with DragEvent.
     */
    protected open func onDropInenr(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDrop(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }

    protected init() {
        super()
    }
    protected init(id: Int64) {
        super(id)
    }
}
