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

class CallbackCJClickEvent <: BaseCallBack {
    CallbackCJClickEvent(let closure: (CJClickEvent) -> Unit) {
        registerSelf()
    }
    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJClickEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJClickEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJClickEvent")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJAreaChangedEvent <: BaseCallBack {
    CallbackCJAreaChangedEvent(let closure: (CJArea, CJArea) -> Unit) {
        registerSelf()
    }
    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 2) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJAreaChangedEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJArea>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJAreaChangedEvent")
            throw InvalidArgsException()
        }
        let ptrArg1 = unsafe { CPointer<CJArea>(argv.read(1)) }
        if (ptrArg1.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJAreaChangedEvent")
            throw InvalidArgsException()
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
    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 2) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJVisibleAreaChangeEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<Bool>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJVisibleAreaChangeEvent")
            throw InvalidArgsException()
        }
        let ptrArg1 = unsafe { CPointer<Float64>(argv.read(1)) }
        if (ptrArg1.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJVisibleAreaChangeEvent")
            throw InvalidArgsException()
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

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTouchEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJTouchEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTouchEvent")
            throw InvalidArgsException()
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

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJMouseEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJMouseEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJMouseEvent")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJDragInfo <: BaseCallBack {
    CallbackCJDragInfo(let closure: (CJDragInfo) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfo")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJDragInfo>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfo")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJKeyEvent <: BaseCallBack {
    CallbackCJKeyEvent(let closure: (CJKeyEvent) -> Bool) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJKeyEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJKeyEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJKeyEvent")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        let val = closure(arg0)
        unsafe {
            CPointer<Bool>(res).write(val)
        }
    }
}

class CallbackCJGestureEvent <: BaseCallBack {
    CallbackCJGestureEvent(let closure: (CJGestureEventV2) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJGestureEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJGestureEventV2>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJGestureEvent")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackFFiCheckboxGroupResult <: BaseCallBack {
    CallbackFFiCheckboxGroupResult(let closure: (FFiCheckboxGroupResult) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackFFiCheckboxGroupResult")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<FFiCheckboxGroupResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackFFiCheckboxGroupResult")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJImageComplete <: BaseCallBack {
    CallbackCJImageComplete(let closure: (CJImageComplete) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJImageComplete")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CImageComplete>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJImageComplete")
            throw InvalidArgsException()
        }
        let c_arg0 = unsafe { ptrArg0.read() }
        let arg0: CJImageComplete = CJImageComplete(c_arg0.width, c_arg0.height, c_arg0.componentWidth,
            c_arg0.componentHeight, c_arg0.loadingStatus)
        arg0.contentWidth = c_arg0.contentWidth
        arg0.contentHeight = c_arg0.contentHeight
        arg0.contentOffsetX = c_arg0.contentOffsetX
        arg0.contentOffsetY = c_arg0.contentOffsetY
        closure(arg0)
    }
}

class CallbackCJImageError <: BaseCallBack {
    CallbackCJImageError(let closure: (CJImageError) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJImageError")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CImageError>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJImageError")
            throw InvalidArgsException()
        }
        let c_arg0 = unsafe { ptrArg0.read() }
        let arg0: CJImageError = CJImageError(c_arg0.componentWidth, c_arg0.componentHeight)
        arg0.message = c_arg0.message.toString()
        closure(arg0)
    }
}

class CallbackOffset <: BaseCallBack {
    CallbackOffset(let closure: (OffsetResult) -> Unit) {
        registerSelf()
    }
    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackOffset")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<OffsetResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackOffset")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackTextPickerResult <: BaseCallBack {
    CallbackTextPickerResult(let closure: (TextPickerResult) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackTextPickerResult")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<TextPickerResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackTextPickerResult")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJWebEvent <: BaseCallBack {
    CallbackCJWebEvent(let closure: (FfiWebEvent) -> Bool) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJWebEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<FfiWebEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJWebEvent")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

class CallbackCJDragInfoVCDragItemInfo <: BaseCallBack {
    CallbackCJDragInfoVCDragItemInfo(let closure: (CJDragInfo) -> CJDragItemInfo) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfoVCDragItemInfo")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJDragInfo>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJDragInfoVCDragItemInfo")
            throw InvalidArgsException()
        }
        unsafe {
            let arg0 = ptrArg0.read()
            let ret = closure(arg0)
            CPointer<CJDragItemInfo>(res).write(ret)
        }
    }
}

class CallbackCJTransitionEvent <: BaseCallBack {
    CallbackCJTransitionEvent(let closuer: (CJRouteType, Float64) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 2) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<CJRouteType>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw InvalidArgsException()
        }
        let ptrArg1 = unsafe { CPointer<Float64>(argv.read(1)) }
        if (ptrArg1.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw InvalidArgsException()
        }
        unsafe {
            let arg0 = ptrArg0.read()
            let arg1 = ptrArg1.read()
            closuer(arg0, arg1)
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CallbackCJWebResourceRequest <: BaseCallBack {
    CallbackCJWebResourceRequest(let closure: (FfiWebResourceRequest) -> Bool) {
        registerSelf()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, res: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        unsafe {
            let arg0 = CPointer<FfiWebResourceRequest>(argv.read()).read()
            let ret = closure(arg0)
            CPointer<Bool>(res).write(ret)
        }
    }
}
