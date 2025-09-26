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
import ohos.base.*
import std.collection.ArrayList

type VectorCPointerTouchTestInfoHandle = CPointer<Unit>

foreign {
    func FfiDragEventGetResult(ptr: CPointer<Unit>): Int32
    func FfiInteractableViewOnDragStart(callback: Int64): Unit
    func FfiDragEventGetVelocityX(ptr: CPointer<Unit>): Float64
    func FfiDragEventGetVelocityY(ptr: CPointer<Unit>): Float64
    func FfiDragEventGetVelocity(ptr: CPointer<Unit>): Float64
    func FfiDragEventGetWindowX(ptr: CPointer<Unit>): Float64
    func FfiDragEventGetWindowY(ptr: CPointer<Unit>): Float64
    func FfiDragEventGetDisplayX(ptr: CPointer<Unit>): Float64
    func FfiDragEventGetDisplayY(ptr: CPointer<Unit>): Float64
    func FfiDragEventFree(ptr: CPointer<Unit>): Unit
    func FfiInteractableViewOnDragEnter(callback: Int64): Unit
    func FfiInteractableViewOnDragMove(callback: Int64): Unit
    func FfiInteractableViewOnDragLeave(callback: Int64): Unit
    func FfiInteractableViewOnDrop(callback: Int64): Unit
    func FfiInteractableViewOnDragEnd(callback: Int64): Unit
    func FfiInteractableViewOnPreDrag(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnClick(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnTouch(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableOnChildTouchTest(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnAppear(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnDisAppear(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnHover(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnAreaChanged(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnMouse(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnKey(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnDelete(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnFocus(callback: Int64): Unit
    func FfiOHOSAceFrameworkInteractableViewOnBlur(callback: Int64): Unit
    func FfiDragEventSetResult(ptr: CPointer<Unit>, result: Int32): Unit
    func FfiDragEventGetPreviewRect(ptr: CPointer<Unit>): NativeRectangle
    func FfiOHOSAceFrameworkInteractableViewOnDrop(callback: Int64, name: UInt32): Unit
    func FFICJCreateVectorTouchTestInfo(size: Int64): VectorCPointerTouchTestInfoHandle
    func FFICJVectorTouchTestInfoDelete(vec: VectorCPointerTouchTestInfoHandle): Unit
    func FFICJVectorTouchTestInfoGetSize(vec: VectorCPointerTouchTestInfoHandle): Int64
    func FfiOHOSAceFrameworkInteractableViewOnDragStart(callback: Int64, name: UInt32): Unit
    func FfiOHOSAceFrameworkInteractableViewOnDragEnter(callback: Int64, name: UInt32): Unit
    func FfiOHOSAceFrameworkInteractableViewOnDragMove(callback: Int64, name: UInt32): Unit
    func FfiOHOSAceFrameworkInteractableViewOnDragLeave(callback: Int64, name: UInt32): Unit
    func FfiDragEventGetModifierKeyState(ptr: CPointer<Unit>, keys: VectorStringHandle): Bool
    func FfiOHOSAceFrameworkInteractableViewOnVisibleAreaChange(raitosVals: VectorFloat64Handle, callback: Int64): Unit
    func FfiOHOSAceFrameworkViewAbstractSetOnGestureRecognizerJudgeBegin(elemId: Int64, exposeInnerGesture: Bool): Unit
}

@C
struct CJTouchInfo {
    let touchType: UInt8
    let fingerId: Int32
    let globalX: Float64
    let globalY: Float64
    let localX: Float64
    let localY: Float64

    init(touchObject: TouchObject) {
        touchType = (touchObject.touchType ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
        fingerId = touchObject.id ?? throw IllegalArgumentException("The type now is not supported.")
        globalX = touchObject.screenX ?? throw IllegalArgumentException("The type now is not supported.")
        globalY = touchObject.screenY ?? throw IllegalArgumentException("The type now is not supported.")
        localX = touchObject.x ?? throw IllegalArgumentException("The type now is not supported.")
        localY = touchObject.y ?? throw IllegalArgumentException("The type now is not supported.")
    }
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
    let keyText: CString
    let keyType: Int32
    let keyCode: Int32
    let keySource: Int32
    let metaKey: Int32
    let deviceId: Int64
    let timestamp: Int64

    init(kv: KeyEvent) {
        keyText =  unsafe { LibC.mallocCString(kv.keyText ?? throw IllegalArgumentException("The type now is not supported.")) }
        keyType = (kv.keyType ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
        keyCode = kv.keyCode ?? throw IllegalArgumentException("The type now is not supported.")
        keySource = (kv.keySource ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
        metaKey = kv.metaKey ?? throw IllegalArgumentException("The type now is not supported.")
        deviceId = kv.deviceId ?? throw IllegalArgumentException("The type now is not supported.")
        timestamp = kv.timestamp ?? throw IllegalArgumentException("The type now is not supported.")
    }

    func free() {
        unsafe {
            LibC.free(keyText)
        }
    }
}

@C
struct CJMouseEvent {
    let timestamp: Int64
    let screenX: Float64
    let screenY: Float64
    let x: Float64
    let y: Float64
    let button: Int32
    let action: Int32

    init(mouseEvent: MouseEvent) {
        timestamp = mouseEvent.timestamp ?? throw IllegalArgumentException("The type now is not supported.")
        screenX = mouseEvent.screenX ?? throw IllegalArgumentException("The type now is not supported.")
        screenY = mouseEvent.screenY ?? throw IllegalArgumentException("The type now is not supported.")
        x = mouseEvent.x ?? throw IllegalArgumentException("The type now is not supported.")
        y = mouseEvent.y ?? throw IllegalArgumentException("The type now is not supported.")
        button = (mouseEvent.button ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
        action = (mouseEvent.action ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
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

func parseCJTouchEvent(cjTouchEvent: CJTouchEvent): TouchEvent {
    let touches: ArrayList<TouchObject> = ArrayList<TouchObject>()
    let changedTouches: ArrayList<TouchObject> = ArrayList<TouchObject>()
    if (cjTouchEvent.touches_.isNull()) {
        throw BusinessException(100001, "Internal error.")
    }

    for (i in 0..cjTouchEvent.touchesSize) {
        let touchInfo = unsafe { cjTouchEvent.touches_.read(Int64(i)) }
        touches.add(
            TouchObject(TouchType.parseValue(touchInfo.touchType), touchInfo.fingerId, touchInfo.globalX,
                touchInfo.globalY, touchInfo.localX, touchInfo.localY))
    }
    if (cjTouchEvent.changedTouches_.isNull()) {
        throw BusinessException(100001, "Internal error.")
    }
    for (i in 0..cjTouchEvent.changedTouchesSize) {
        let touchInfo = unsafe { cjTouchEvent.changedTouches_.read(Int64(i)) }
        changedTouches.add(
            TouchObject(TouchType.parseValue(touchInfo.touchType), touchInfo.fingerId, touchInfo.globalX,
                touchInfo.globalY, touchInfo.localX, touchInfo.localY))
    }
    if (cjTouchEvent.target.isNull()) {
        throw BusinessException(100001, "Internal error.")
    }
    TouchEvent(TouchType.parseValue(cjTouchEvent.eventType), touches.toArray(), changedTouches.toArray(), cjTouchEvent.timestamp,
        parseCJTarget(unsafe { cjTouchEvent.target.read() }), SourceType.parseValue(cjTouchEvent.sourceType))
}

protected func parseCJTarget(cjTarget: CJEventTarget): EventTarget {
    unsafe {
        if (cjTarget.area.isNull()) {
            throw BusinessException(100001, "Internal error.")
        }
        let cjArea = cjTarget.area.read()
        if (cjArea.position.isNull()) {
            throw BusinessException(100001, "Internal error.")
        }
        if (cjArea.globalPosition.isNull()) {
            throw BusinessException(100001, "Internal error.")
        }
        EventTarget(
            Area(
                cjTarget.area.read().width,
                cjTarget.area.read().height,
                Position(
                    x: cjTarget.area.read().position.read().x,
                    y: cjTarget.area.read().position.read().y
                ),
                Position(
                    x: cjTarget.area.read().globalPosition.read().x,
                    y: cjTarget.area.read().globalPosition.read().y
                )
            )
        )
    }
}

protected func parseCJClickEvent(cjClickEvent: CJClickEvent): ClickEvent {
    unsafe {
        if (cjClickEvent.target.isNull()) {
            throw BusinessException(100001, "Internal error.")
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
            throw BusinessException(100001, "Internal error.")
        }
        DragInfo(
            cjDragEvent.extraParams.toString(),
            Position(x: cjDragEvent.dragEvent.read().x, y: cjDragEvent.dragEvent.read().y),
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

func parseCJArea(area: CJArea): Area {
    Area(
        area.width,
        area.height,
        unsafe { Position(x: area.position.read().x, y: area.position.read().y) },
        unsafe { Position(x: area.globalPosition.read().x, y: area.globalPosition.read().y) }
    )
}
