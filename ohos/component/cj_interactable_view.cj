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

import ohos.image.PixelMap

public type VectorTouchTestInfoHandle = CPointer<Unit>

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchObject {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TouchObject(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var touchType: TouchType,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var id: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            deprecated: 10,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var screenX: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            deprecated: 10,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var screenY: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var x: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var y: Float64
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ClickEvent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ClickEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var x: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var y: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var timestamp: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var source: SourceType,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var target: EventTarget,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var windowX: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var windowY: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var displayX: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var displayY: Float64
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragInfo {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DragInfo(
        @!APILevel[
            12,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var extraParams: String,
        @!APILevel[
            12,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var dragEvent: Position
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DragBehavior {
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COPY
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MOVE
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    UNKNOWN
    | ...

    static func parseValue(value: Int32): DragBehavior {
        match (value) {
            case 0 => COPY
            case 1 => MOVE
            case _ => UNKNOWN
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DragResult {
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG_SUCCESSFUL
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG_CANCELED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DROP_ENABLED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DROP_DISABLED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG_DEFAULT
    | ...

    func getValue(): Int32 {
        match (this) {
            case DRAG_DEFAULT => -1
            case DRAG_SUCCESSFUL => 0
            case DRAG_FAILED => 1
            case DRAG_CANCELED => 2
            case DROP_ENABLED => 3
            case DROP_DISABLED => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
    static func parseValue(value: Int32): DragResult {
        match (value) {
            case 0 => DRAG_SUCCESSFUL
            case 1 => DRAG_FAILED
            case 2 => DRAG_CANCELED
            case 3 => DROP_ENABLED
            case 4 => DROP_DISABLED
            case _ => DRAG_DEFAULT
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PreDragStatus {
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ACTION_DETECTING_STATUS
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    READY_TO_TRIGGER_DRAG_ACTION
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PREVIEW_LIFT_STARTED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PREVIEW_LIFT_FINISHED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PREVIEW_LANDING_STARTED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PREVIEW_LANDING_FINISHED
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ACTION_CANCELED_BEFORE_DRAG
    | ...

    func getValue(): Int32 {
        match (this) {
            case ACTION_DETECTING_STATUS => 0
            case READY_TO_TRIGGER_DRAG_ACTION => 1
            case PREVIEW_LIFT_STARTED => 2
            case PREVIEW_LIFT_FINISHED => 3
            case PREVIEW_LANDING_STARTED => 4
            case PREVIEW_LANDING_FINISHED => 5
            case ACTION_CANCELED_BEFORE_DRAG => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parseValue(value: Int32): PreDragStatus {
        match (value) {
            case 0 => ACTION_DETECTING_STATUS
            case 1 => READY_TO_TRIGGER_DRAG_ACTION
            case 2 => PREVIEW_LIFT_STARTED
            case 3 => PREVIEW_LIFT_FINISHED
            case 4 => PREVIEW_LANDING_STARTED
            case 5 => PREVIEW_LANDING_FINISHED
            case 6 => ACTION_CANCELED_BEFORE_DRAG
            case _ => ACTION_DETECTING_STATUS
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragEvent {
    let evtPtr: CPointer<Unit>
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let useCustomDropAnimation: Bool
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let dragBehavior: DragBehavior
    init(ptr: CPointer<Unit>, use: Bool, behavior: DragBehavior) {
        evtPtr = ptr
        useCustomDropAnimation = use
        dragBehavior = behavior
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setResult(dragRect: DragResult): Unit {
        unsafe {
            FfiDragEventSetResult(evtPtr, dragRect.getValue())
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getResult(): DragResult {
        unsafe {
            let ret = FfiDragEventGetResult(evtPtr)
            DragResult.parseValue(ret)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPreviewRect(): Rectangle {
        unsafe {
            let rect = FfiDragEventGetPreviewRect(evtPtr)
            Rectangle(
                x: rect.x.vp,
                y: rect.y.vp,
                width: rect.width.percent,
                height: rect.height.percent
            )
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getVelocityX(): Float64 {
        unsafe {
            FfiDragEventGetVelocityX(evtPtr)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getVelocityY(): Float64 {
        unsafe {
            FfiDragEventGetVelocityY(evtPtr)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getVelocity(): Float64 {
        unsafe {
            FfiDragEventGetVelocity(evtPtr)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getWindowX(): Float64 {
        unsafe {
            FfiDragEventGetWindowX(evtPtr)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getWindowY(): Float64 {
        unsafe {
            FfiDragEventGetWindowY(evtPtr)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getDisplayX(): Float64 {
        unsafe {
            FfiDragEventGetDisplayX(evtPtr)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getDisplayY(): Float64 {
        unsafe {
            FfiDragEventGetDisplayY(evtPtr)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getModifierKeyState(keys: Array<String>): Bool {
        unsafe {
            let keyPtr = FFIVectorString(keys.size)
            for (i in 0..keys.size) {
                keyPtr.setElement(i, keys[i])
            }
            let ret = FfiDragEventGetModifierKeyState(evtPtr, keyPtr.getNativeHandle())
            keyPtr.free()
            ret
        }
    }
    ~init() {
        unsafe {
            FfiDragEventFree(evtPtr)
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DragItemInfo {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DragItemInfo(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var pixelMap!: Option<PixelMap> = Option.None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var builder!: Option<() -> Unit> = Option.None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var extraInfo!: String = ""
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MouseEvent {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public MouseEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var timestamp: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var screenX: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var screenY: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var x: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var y: Float64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var button: MouseButton,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var action: MouseAction
    ) {}
}

@!APILevel[
    19,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchTestInfo {
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let windowX: Float32
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let windowY: Float32
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let parentX: Float32
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let parentY: Float32
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let x: Float32
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let y: Float32
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let rect: RectResult
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let id: String
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(windowX: Float32, windowY: Float32, parentX: Float32, parentY: Float32, x: Float32, y: Float32,
        rect: RectResult, id: String) {
        this.windowX = windowX
        this.windowY = windowY
        this.parentX = parentX
        this.parentY = parentY
        this.x = x
        this.y = y
        this.rect = rect
        this.id = id
    }

    func parseToNative(): CJTouchTestInfo {
        return CJTouchTestInfo(
            windowX,
            windowY,
            parentX,
            parentY,
            x,
            y,
            RectResultParams(rect.x, rect.y, rect.width, rect.height),
            ExternalString(id)
        )
    }
}

@!APILevel[
    19,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TouchTestStrategy {
    @!APILevel[
        19,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        19,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FORWARD_COMPETITION
    | @!APILevel[
        19,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FORWARD
    | ...

    func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case FORWARD_COMPETITION => 1
            case FORWARD => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchResult {
    let strategy: Int32
    let id: String
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strategy: TouchTestStrategy, id!: String = "") {
        if (strategy.getValue() == TouchTestStrategy.DEFAULT.getValue() && id == "") {
            this.strategy = TouchTestStrategy.DEFAULT.getValue()
        } else {
            this.strategy = strategy.getValue()
        }
        this.id = id
    }
    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(cTouchResult: CTouchResult) {
        this.strategy = cTouchResult.strategy
        this.id = cTouchResult.id.toString()
    }

    func parseToNative(): CTouchResult {
        return CTouchResult(
            strategy,
            ExternalString(id)
        )
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TouchEvent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isStopPropagation: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func stopPropagation(): Unit {
        this.isStopPropagation = true
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TouchEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var eventType: TouchType,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var touches: ArrayList<TouchObject>,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var changedTouches: ArrayList<TouchObject>,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var timestamp: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var target: EventTarget,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var source: SourceType
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class KeyEvent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isStopPropagation: Bool = false
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func stopPropagation(): Unit {
        this.isStopPropagation = true
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public KeyEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var keyText: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var keyType: KeyType,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var keyCode: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var keySource: KeySource,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var metaKey: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var deviceId: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var timestamp: Int64
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class InteractableView <: RemoteData {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onClick(callback: (ClickEvent) -> Unit): This {
        let wrapper = {
            evt: CJClickEvent => callback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnClick(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onChildTouchTest(callback: (Array<TouchTestInfo>) -> TouchResult): This {
        let wrapper = {
            value: VectorTouchTestInfoHandle =>
            let handle = FFIVectorTouchTestInfo(value)
            let arr: Array<TouchTestInfo> = Array<TouchTestInfo>(handle.getSize()) {
                i => parseTouchTestInfo(handle.getElement(i))
            }
            let touchResult = callback(arr)
            handle.free()
            return touchResult.parseToNative()
        }
        let lambdaTouchTest = Callback1Param<VectorTouchTestInfoHandle, CTouchResult>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkInteractableOnChildTouchTest(lambdaTouchTest.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onAppear(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAppear(Callback0Param<Unit>(callback).getID())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDisAppear(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDisAppear(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onTouch(callback: (TouchEvent) -> Unit): This {
        let wrapper = {
            evt: CJTouchEvent =>
            var resolved = parseCJTouchEvent(evt)
            callback(resolved)
            return resolved.isStopPropagation
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnTouch(CallbackCJTouchEvent(wrapper).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onHover(callback: (Bool) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnHover(Callback1Param<Bool, Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onAreaChange(callback: (Area, Area) -> Unit): This {
        let wrapper = {
            lastArea: CJArea, area: CJArea => callback(parseCJArea(lastArea), parseCJArea(area))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAreaChanged(CallbackCJAreaChangedEvent(wrapper).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onVisibleAreaChange(raitos: Array<Float64>, callback: (Bool, Float64) -> Unit): This {
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
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onMouse(callback: (MouseEvent) -> Unit): This {
        let wrapper = {
            evt: CJMouseEvent =>
            var resolved = parseCJMouseEvent(evt)
            callback(resolved)
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnMouse(CallbackCJMouseEvent(wrapper).getID())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onKeyEvent(callback: (KeyEvent) -> Unit): This {
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
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onFocus(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnFocus(Callback0Param<Unit>(callback).getID())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onBlur(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnBlur(Callback0Param<Unit>(callback).getID())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragStart(callback: (DragInfo) -> DragItemInfo): This {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        let ret = callback(parseCJDragEvent(evt))
                        let pixelMapId = match (ret.pixelMap) {
                            case Some(v) => v.getID()
                            case None => 0
                        }
                        let builderId = match (ret.builder) {
                            case None => 0
                            case Some(v) => Callback0Param<Unit>(v).getID()
                        }
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
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragStart(callback: (DragInfo) -> (() -> Unit)): This {
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
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragStart(callback: (DragInfo) -> Unit): This {
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragStart(callback: (DragEvent, ?String) -> DragItemInfo): This {
        unsafe {
            let wrapper = {
                event: CJDragEvent, extraParams: CString =>
                let dragEvent = DragEvent(
                    event.evtPtr,
                    event.useCustomDropAnimation,
                    DragBehavior.parseValue(event.dragBehavior)
                )
                var strOpt = Option<String>.None
                if (!extraParams.isNull() && extraParams.isNotEmpty()) {
                    strOpt = extraParams.toString()
                }
                var ret = callback(dragEvent, strOpt)
                let pixelMapId = match (ret.pixelMap) {
                    case Some(v) => v.getID()
                    case None => 0
                }
                let builderId = match (ret.builder) {
                    case Some(v) => Callback0Param<Unit>(v).getID()
                    case None => 0
                }
                return CJDragItemInfo(
                    pixelMapId: pixelMapId,
                    builderId: builderId,
                    extraInfo: LibC.mallocCString(ret.extraInfo)
                )
            }
            let lambdaData = Callback2Param<CJDragEvent, CString, CJDragItemInfo>(wrapper)
            FfiInteractableViewOnDragStart(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragStart(callback: (DragEvent, ?String) -> (() -> Unit)): This {
        unsafe {
            let wrapper = {
                event: CJDragEvent, extraParams: CString =>
                let dragEvent = DragEvent(
                    event.evtPtr,
                    event.useCustomDropAnimation,
                    DragBehavior.parseValue(event.dragBehavior)
                )
                var strOpt = Option<String>.None
                if (!extraParams.isNull() && extraParams.isNotEmpty()) {
                    strOpt = extraParams.toString()
                }
                var ret = callback(dragEvent, strOpt)
                return CJDragItemInfo(builderId: Callback0Param<Unit>(ret).getID())
            }
            let lambdaData = Callback2Param<CJDragEvent, CString, CJDragItemInfo>(wrapper)
            FfiInteractableViewOnDragStart(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragStart(callback: (DragEvent, ?String) -> Unit): This {
        unsafe {
            let wrapper = {
                event: CJDragEvent, extraParams: CString =>
                let dragEvent = DragEvent(
                    event.evtPtr,
                    event.useCustomDropAnimation,
                    DragBehavior.parseValue(event.dragBehavior)
                )
                var strOpt = Option<String>.None
                if (!extraParams.isNull() && extraParams.isNotEmpty()) {
                    strOpt = extraParams.toString()
                }
                callback(dragEvent, strOpt)
                return CJDragItemInfo()
            }
            let lambdaData = Callback2Param<CJDragEvent, CString, CJDragItemInfo>(wrapper)
            FfiInteractableViewOnDragStart(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onPreDrag(callback: (PreDragStatus) -> Unit): This {
        unsafe {
            let wrapper = {
                status: Int32 => callback(PreDragStatus.parseValue(status))
            }
            let lambdaData = Callback1Param<Int32, Unit>(wrapper)
            FfiInteractableViewOnPreDrag(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragEnter(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragEnter(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }

    func onDragCommonEvent(callback: (DragEvent, ?String) -> Unit, ffiFunc: CFunc<(Int64) -> Unit>): Unit {
        let wrapper = {
            event: CJDragEvent, extraParams: CString =>
            let dragEvent = DragEvent(
                event.evtPtr,
                event.useCustomDropAnimation,
                DragBehavior.parseValue(event.dragBehavior)
            )
            var strOpt = Option<String>.None
            if (!extraParams.isNull() && extraParams.isNotEmpty()) {
                strOpt = extraParams.toString()
            }
            callback(dragEvent, strOpt)
        }
        let lambdaData = Callback2Param<CJDragEvent, CString, Unit>(wrapper)
        unsafe {
            ffiFunc(lambdaData.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragEnter(callback: (DragEvent, ?String) -> Unit): This {
        onDragCommonEvent(callback, FfiInteractableViewOnDragEnter)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragMove(callback: (DragEvent, ?String) -> Unit): This {
        onDragCommonEvent(callback, FfiInteractableViewOnDragMove)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragLeave(callback: (DragEvent, ?String) -> Unit): This {
        onDragCommonEvent(callback, FfiInteractableViewOnDragLeave)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDrop(callback: (DragEvent, ?String) -> Unit): This {
        onDragCommonEvent(callback, FfiInteractableViewOnDrop)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragEnd(callback: (DragEvent, ?String) -> Unit): This {
        onDragCommonEvent(callback, FfiInteractableViewOnDragEnd)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragMove(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragMove(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDragLeave(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragLeave(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onDrop(callback: (DragInfo) -> Unit): This {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDrop(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onGestureRecognizerJudgeBegin(
        callback: (BaseGestureEvent, GestureRecognizer, Array<GestureRecognizer>) -> GestureJudgeResult,
        exposeInnerGesture: Bool): This {
        let wrapper = {
            cjGestureEvent: CJBaseGestureEvent, gestureRecognizerId: Int64, gestureRecognizerIdArray: VectorInt64Handle =>
            let gestureRecognizer = getGestureRecognizer(gestureRecognizerId)
            let handle = FFIVectorInt64(gestureRecognizerIdArray)
            let arr: Array<Int64> = Array<Int64>(handle.getSize()) {
                idx => handle.getElement(idx)
            }
            let gestureRecognizerArray = Array<GestureRecognizer>(arr.size, {index => getGestureRecognizer(arr[index])})
            let gestureEvent = parseCJBaseGestureEvent(cjGestureEvent, gestureRecognizer.getType())
            let result = callback(gestureEvent, gestureRecognizer, gestureRecognizerArray)
            return result.getValue()
        }
        let onJudgeBegin = Callback3Param<CJBaseGestureEvent, Int64, VectorInt64Handle, Int32>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOnGestureRecognizerJudgeBegin(onJudgeBegin.getID(), exposeInnerGesture)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onGestureRecognizerJudgeBegin(
        callback: (BaseGestureEvent, GestureRecognizer, Array<GestureRecognizer>) -> GestureJudgeResult): This {
        let wrapper = {
            cjGestureEvent: CJBaseGestureEvent, gestureRecognizerId: Int64, gestureRecognizerIdArray: VectorInt64Handle =>
            let gestureRecognizer = getGestureRecognizer(gestureRecognizerId)
            let handle = FFIVectorInt64(gestureRecognizerIdArray)
            let arr: Array<Int64> = Array<Int64>(handle.getSize()) {
                idx => handle.getElement(idx)
            }
            let gestureRecognizerArray = Array<GestureRecognizer>(arr.size, {index => getGestureRecognizer(arr[index])})
            let gestureEvent = parseCJBaseGestureEvent(cjGestureEvent, gestureRecognizer.getType())
            let result = callback(gestureEvent, gestureRecognizer, gestureRecognizerArray)
            return result.getValue()
        }
        let onJudgeBegin = Callback3Param<CJBaseGestureEvent, Int64, VectorInt64Handle, Int32>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOnGestureRecognizerJudgeBegin(onJudgeBegin.getID(), false)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shouldBuiltInRecognizerParallelWith(
        callback: (GestureRecognizer, Array<GestureRecognizer>) -> GestureRecognizer): This {
        let wrapper = {
            gestureRecognizerId: Int64, gestureRecognizerIdArray: VectorInt64Handle =>
            let gestureRecognizer = getGestureRecognizer(gestureRecognizerId)
            let handle = FFIVectorInt64(gestureRecognizerIdArray)
            let arr: Array<Int64> = Array<Int64>(handle.getSize()) {
                idx => handle.getElement(idx)
            }
            let gestureRecognizerArray = Array<GestureRecognizer>(arr.size, {index => getGestureRecognizer(arr[index])})
            let result = callback(gestureRecognizer, gestureRecognizerArray)
            return result.getID()
        }
        let shouldBuiltInRecognizerParallelWithFunc = Callback2Param<Int64, VectorInt64Handle, Int64>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractShouldBuiltInRecognizerParallelWith(
                shouldBuiltInRecognizerParallelWithFunc.getID())
        }
        this
    }

    protected func getGestureRecognizer(id: Int64): GestureRecognizer {
        var recognizer = GestureRecognizer(id)
        match (recognizer.getType()) {
            case PAN_GESTURE => return PanRecognizer(id)
            case _ => return GestureRecognizer(id)
        }
    }

    protected init() {
        super()
    }
    protected init(id: Int64) {
        super(id)
    }
}
