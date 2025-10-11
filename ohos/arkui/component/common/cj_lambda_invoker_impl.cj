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
import ohos.base.*
import ohos.ffi.*
internal import ohos.business_exception.BusinessException

protected class CallbackCJClickEvent <: BaseCallBack {
    protected CallbackCJClickEvent(let closure: (CJClickEvent) -> Unit) {
        registerSelf()
    }
    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJClickEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJClickEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJClickEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJAreaChangedEvent <: BaseCallBack {
    CallbackCJAreaChangedEvent(let closure: (CJArea, CJArea) -> Unit) {
        registerSelf()
    }
    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 2) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJAreaChangedEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJArea>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJAreaChangedEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg1 = unsafe { CPointer<CJArea>(argv.read(1)) }
        if (ptrArg1.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJAreaChangedEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        let arg1 = unsafe { ptrArg1.read() }
        closure(arg0, arg1)
    }
}

class CallbackCJVisibleAreaChangeEvent <: BaseCallBack {
    CallbackCJVisibleAreaChangeEvent(let closure: (Bool, Float64) -> Unit) {
        registerSelf()
    }
    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 2) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJVisibleAreaChangeEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<Bool>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJVisibleAreaChangeEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg1 = unsafe { CPointer<Float64>(argv.read(1)) }
        if (ptrArg1.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJVisibleAreaChangeEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        let arg1 = unsafe { ptrArg1.read() }
        closure(arg0, arg1)
    }
}

class CallbackCJTouchEvent <: BaseCallBack {
    CallbackCJTouchEvent(let closure: (CJTouchEvent) -> Bool) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTouchEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJTouchEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTouchEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        let val = closure(arg0)
        unsafe {
            CPointer<Bool>(res).write(val)
        }
    }
}

class CallbackCJMouseEvent <: BaseCallBack {
    CallbackCJMouseEvent(let closure: (CJMouseEvent) -> Unit) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJMouseEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJMouseEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJMouseEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJDragInfo <: BaseCallBack {
    CallbackCJDragInfo(let closure: (CJDragInfo) -> Unit) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfo")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJDragInfo>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfo")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJKeyEvent <: BaseCallBack {
    CallbackCJKeyEvent(let closure: (CJKeyEvent) -> Bool) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJKeyEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJKeyEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJKeyEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        let val = closure(arg0)
        unsafe {
            CPointer<Bool>(res).write(val)
        }
    }
}

protected class CallbackCJGestureEvent <: BaseCallBack {
    protected CallbackCJGestureEvent(let closure: (CJGestureEventV2) -> Unit) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJGestureEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJGestureEventV2>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJGestureEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJDragInfoVCDragItemInfo <: BaseCallBack {
    CallbackCJDragInfoVCDragItemInfo(let closure: (CJDragInfo) -> CJDragItemInfo) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfoVCDragItemInfo")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<CJDragInfo>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfoVCDragItemInfo")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        unsafe {
            let arg0 = ptrArg0.read()
            let ret = closure(arg0)
            CPointer<CJDragItemInfo>(res).write(ret)
        }
    }
}

protected class CallbackCJWebResourceRequest <: BaseCallBack {
    protected CallbackCJWebResourceRequest(let closure: (FfiWebResourceRequest) -> Bool) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        unsafe {
            let arg0 = CPointer<FfiWebResourceRequest>(argv.read()).read()
            let ret = closure(arg0)
            CPointer<Bool>(res).write(ret)
        }
    }
}
