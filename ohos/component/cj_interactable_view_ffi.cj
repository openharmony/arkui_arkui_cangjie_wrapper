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

public type VectorCPointerTouchTestInfoHandle = CPointer<Unit>

@C
struct CJClickEvent {
    CJClickEvent(
        let x: Float64,
        let y: Float64,
        let timestamp: Int64,
        let source: Int32,
        let target: CPointer<CJEventTarget>,
        let windowX: Float64,
        let windowY: Float64,
        let displayX: Float64,
        let displayY: Float64
    ) {}
}

@C
struct CJTouchInfo {
    CJTouchInfo(
        let touchType: UInt8,
        let fingerId: Int32,
        let globalX: Float64,
        let globalY: Float64,
        let localX: Float64,
        let localY: Float64
    ) {}

    init(touchObject: TouchObject) {
        touchType = touchObject.touchType.getValue()
        fingerId = touchObject.id
        globalX = touchObject.screenX
        globalY = touchObject.screenY
        localX = touchObject.x
        localY = touchObject.y
    }
}

@C
public struct CJTouchTestInfo {
    CJTouchTestInfo(
        var windowX: Float32,
        var windowY: Float32,
        var parentX: Float32,
        var parentY: Float32,
        var x: Float32,
        var y: Float32,
        var rect: RectResultParams,
        var id: ExternalString
    ) {}
}

@C
public struct CTouchResult {
    CTouchResult(
        var strategy: Int32,
        var id: ExternalString
    ) {}
}

@C
struct CJTouchEvent {
    CJTouchEvent(
        let eventType: UInt8,
        let touches_: CPointer<CJTouchInfo>,
        let touchesSize: Int32,
        let changedTouches_: CPointer<CJTouchInfo>,
        let changedTouchesSize: Int32,
        let timestamp: Int64,
        let target: CPointer<CJEventTarget>,
        let sourceType: Int32
    ) {}
}

@C
struct CJKeyEvent {
    CJKeyEvent(
        let keyText: CString,
        let keyType: Int32,
        let keyCode: Int32,
        let keySource: Int32,
        let metaKey: Int32,
        let deviceId: Int64,
        let timestamp: Int64
    ) {}

    init(kv: KeyEvent) {
        unsafe {
            keyText = LibC.mallocCString(kv.keyText)
            keyType = kv.keyType.getValue()
            keyCode = kv.keyCode
            keySource = kv.keySource.getValue()
            metaKey = kv.metaKey
            deviceId = kv.deviceId
            timestamp = kv.timestamp
        }
    }

    func free() {
        unsafe {
            LibC.free(keyText)
        }
    }
}

@C
struct CJMouseEvent {
    CJMouseEvent(
        let timestamp: Int64,
        let screenX: Float64,
        let screenY: Float64,
        let x: Float64,
        let y: Float64,
        let button: Int32,
        let action: Int32
    ) {}

    init(me: MouseEvent) {
        timestamp = me.timestamp
        screenX = me.screenX
        screenY = me.screenY
        x = me.x
        y = me.y
        button = me.button.getValue()
        action = me.action.getValue()
    }
}

@C
struct CJDragInfo {
    CJDragInfo(
        let extraParams: CString,
        let dragEvent: CPointer<CJPosition>
    ) {}
}

@C
struct CJDragItemInfo {
    CJDragItemInfo(
        let pixelMapId!: Int64 = 0,
        let builderId!: Int64 = 0,
        let extraInfo!: CString = unsafe { LibC.mallocCString("") }
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkInteractableViewOnClick(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnTouch(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableOnChildTouchTest(callback: Int64): Unit

    func FFICJCreateVectorTouchTestInfo(size: Int64): VectorCPointerTouchTestInfoHandle

    func FFICJVectorTouchTestInfoSetElement(vec: VectorCPointerTouchTestInfoHandle, index: Int64,
        touchTestInfo: CJTouchTestInfo): Unit

    func FFICJVectorTouchTestInfoGetElement(vec: VectorCPointerTouchTestInfoHandle, index: Int64): CJTouchTestInfo

    func FFICJVectorTouchTestInfoDelete(vec: VectorCPointerTouchTestInfoHandle): Unit

    func FFICJVectorTouchTestInfoGetSize(vec: VectorCPointerTouchTestInfoHandle): Int64

    func FfiOHOSAceFrameworkInteractableViewOnAppear(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnDisAppear(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnHover(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnAreaChanged(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnVisibleAreaChange(raitosVals: VectorFloat64Handle, callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnMouse(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnKey(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnDelete(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnDragStart(callback: Int64, name: UInt32): Unit

    func FfiOHOSAceFrameworkInteractableViewOnDragEnter(callback: Int64, name: UInt32): Unit

    func FfiOHOSAceFrameworkInteractableViewOnDragMove(callback: Int64, name: UInt32): Unit

    func FfiOHOSAceFrameworkInteractableViewOnDragLeave(callback: Int64, name: UInt32): Unit

    func FfiOHOSAceFrameworkInteractableViewOnDrop(callback: Int64, name: UInt32): Unit

    func FfiOHOSAceFrameworkInteractableViewOnFocus(callback: Int64): Unit

    func FfiOHOSAceFrameworkInteractableViewOnBlur(callback: Int64): Unit

    func FfiInteractableViewOnDragStart(callback: Int64): Unit

    func FfiDragEventSetResult(ptr: CPointer<Unit>, result: Int32): Unit

    func FfiDragEventGetResult(ptr: CPointer<Unit>): Int32

    func FfiDragEventGetPreviewRect(ptr: CPointer<Unit>): NativeRectangle

    func FfiDragEventGetVelocityX(ptr: CPointer<Unit>): Float64

    func FfiDragEventGetVelocityY(ptr: CPointer<Unit>): Float64

    func FfiDragEventGetVelocity(ptr: CPointer<Unit>): Float64

    func FfiDragEventGetWindowX(ptr: CPointer<Unit>): Float64

    func FfiDragEventGetWindowY(ptr: CPointer<Unit>): Float64

    func FfiDragEventGetDisplayX(ptr: CPointer<Unit>): Float64

    func FfiDragEventGetDisplayY(ptr: CPointer<Unit>): Float64

    func FfiDragEventFree(ptr: CPointer<Unit>): Unit

    func FfiDragEventGetModifierKeyState(ptr: CPointer<Unit>, keys: VectorStringHandle): Bool

    func FfiInteractableViewOnDragEnter(callback: Int64): Unit

    func FfiInteractableViewOnDragMove(callback: Int64): Unit

    func FfiInteractableViewOnDragLeave(callback: Int64): Unit

    func FfiInteractableViewOnDrop(callback: Int64): Unit

    func FfiInteractableViewOnDragEnd(callback: Int64): Unit

    func FfiInteractableViewOnPreDrag(callback: Int64): Unit

    func FfiOHOSAceFrameworkViewAbstractSetOnGestureRecognizerJudgeBegin(elemId: Int64, exposeInnerGesture: Bool): Unit
}

func parseCJTouchEvent(cjTouchEvent: CJTouchEvent): TouchEvent {
    let touches: ArrayList<TouchObject> = ArrayList<TouchObject>()
    let changedTouches: ArrayList<TouchObject> = ArrayList<TouchObject>()
    if (cjTouchEvent.touches_.isNull()) {
        throw NoneValueException("Touches info is null")
    }
    for (i in 0..cjTouchEvent.touchesSize) {
        let touchInfo = unsafe { cjTouchEvent.touches_.read(Int64(i)) }
        touches.add(
            TouchObject(TouchType.parseValue(touchInfo.touchType), touchInfo.fingerId, touchInfo.globalX,
                touchInfo.globalY, touchInfo.localX, touchInfo.localY))
    }
    if (cjTouchEvent.changedTouches_.isNull()) {
        throw NoneValueException("Changed Touches info is null")
    }
    for (i in 0..cjTouchEvent.changedTouchesSize) {
        let touchInfo = unsafe { cjTouchEvent.changedTouches_.read(Int64(i)) }
        changedTouches.add(
            TouchObject(TouchType.parseValue(touchInfo.touchType), touchInfo.fingerId, touchInfo.globalX,
                touchInfo.globalY, touchInfo.localX, touchInfo.localY))
    }
    if (cjTouchEvent.target.isNull()) {
        throw NoneValueException("Touch event target is null")
    }
    TouchEvent(TouchType.parseValue(cjTouchEvent.eventType), touches, changedTouches, cjTouchEvent.timestamp,
        parseCJTarget(unsafe { cjTouchEvent.target.read() }), SourceType.parseValue(cjTouchEvent.sourceType))
}

func parseCJTarget(cjTarget: CJEventTarget): EventTarget {
    unsafe {
        if (cjTarget.area.isNull()) {
            throw NoneValueException("Touch target area is null")
        }
        let cjArea = cjTarget.area.read()
        if (cjArea.position.isNull()) {
            throw NoneValueException("Touch area position is null")
        }
        if (cjArea.globalPosition.isNull()) {
            throw NoneValueException("Touch area global position is null")
        }
        EventTarget(
            Area(
                cjTarget.area.read().width,
                cjTarget.area.read().height,
                Position(
                    cjTarget.area.read().position.read().x,
                    cjTarget.area.read().position.read().y
                ),
                Position(
                    cjTarget.area.read().globalPosition.read().x,
                    cjTarget.area.read().globalPosition.read().y
                )
            )
        )
    }
}

func parseTouchTestInfo(touchTestInfo: CJTouchTestInfo): TouchTestInfo {
    let item = TouchTestInfo(
        touchTestInfo.windowX,
        touchTestInfo.windowY,
        touchTestInfo.parentX,
        touchTestInfo.parentY,
        touchTestInfo.x,
        touchTestInfo.y,
        RectResult(touchTestInfo.rect),
        touchTestInfo.id.toString()
    )
    unsafe {
        touchTestInfo.id.free()
    }
    return item
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FFIVectorTouchTestInfo {
    private let vecHandle: VectorTouchTestInfoHandle
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(vec: VectorTouchTestInfoHandle) {
        vecHandle = vec
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorTouchTestInfo(size) }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setElement(index: Int64, value: CJTouchTestInfo): Unit {
        unsafe { FFICJVectorTouchTestInfoSetElement(vecHandle, index, value) }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getElement(index: Int64): CJTouchTestInfo {
        unsafe { FFICJVectorTouchTestInfoGetElement(vecHandle, index) }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func free(): Unit {
        unsafe { FFICJVectorTouchTestInfoDelete(vecHandle) }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getSize(): Int64 {
        unsafe { FFICJVectorTouchTestInfoGetSize(vecHandle) }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getNativeHandle(): VectorTouchTestInfoHandle {
        vecHandle
    }
}

func parseCJClickEvent(cjClickEvent: CJClickEvent): ClickEvent {
    unsafe {
        if (cjClickEvent.target.isNull()) {
            throw NoneValueException("Click target is null")
        }
        ClickEvent(
            cjClickEvent.x,
            cjClickEvent.y,
            cjClickEvent.timestamp,
            SourceType.parseValue(cjClickEvent.source),
            parseCJTarget(cjClickEvent.target.read()),
            cjClickEvent.windowX,
            cjClickEvent.windowY,
            cjClickEvent.displayX,
            cjClickEvent.displayY
        )
    }
}

func parseCJKeyEvent(cjKeyEvent: CJKeyEvent): KeyEvent {
    KeyEvent(
        cjKeyEvent.keyText.toString(),
        KeyType.parseValue(cjKeyEvent.keyType),
        cjKeyEvent.keyCode,
        KeySource.parseValue(cjKeyEvent.keySource),
        cjKeyEvent.metaKey,
        cjKeyEvent.deviceId,
        cjKeyEvent.timestamp
    )
}

func parseCJDragEvent(cjDragEvent: CJDragInfo): DragInfo {
    unsafe {
        if (cjDragEvent.dragEvent.isNull()) {
            throw NoneValueException("Drag event position is null")
        }
        DragInfo(
            cjDragEvent.extraParams.toString(),
            Position(cjDragEvent.dragEvent.read().x, cjDragEvent.dragEvent.read().y),
        )
    }
}

func parseCJMouseEvent(cjMouseEvent: CJMouseEvent): MouseEvent {
    return MouseEvent(
        cjMouseEvent.timestamp,
        cjMouseEvent.screenX,
        cjMouseEvent.screenY,
        cjMouseEvent.x,
        cjMouseEvent.y,
        MouseButton.parseValue(cjMouseEvent.button),
        MouseAction.parseValue(cjMouseEvent.action)
    )
}

@C
struct CJDragEvent {
    CJDragEvent(
        let evtPtr: CPointer<Unit>,
        let useCustomDropAnimation: Bool,
        let dragBehavior: Int32
    ) {}
}
