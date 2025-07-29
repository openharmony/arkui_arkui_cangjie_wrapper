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

protected package ohos.arkui.component.native_struct

import ohos.base.*
import ohos.ffi.*

@C
protected struct NativeAnimateParam {
    protected NativeAnimateParam(
        let duration: NativeOptionInt32,
        let tempo: NativeOptionFloat32,
        let curve: NativeOptionCString,
        let delay: NativeOptionInt32,
        let iterations: NativeOptionInt32,
        let playMode: NativeOptionInt32,
        let onFinish: NativeOptionCallBack,
        let finishCallbackType: NativeOptionInt32,
        let min: NativeOptionInt32,
        let max: NativeOptionInt32,
        let expected: NativeOptionInt32
    ) {}

    protected init() {
        this.duration = NativeOptionInt32(false, 0)
        this.tempo = NativeOptionFloat32(false, 0.0)
        this.curve = unsafe { NativeOptionCString(false, CString(CPointer())) }
        this.delay = NativeOptionInt32(false, 0)
        this.iterations = NativeOptionInt32(false, 0)
        this.playMode = NativeOptionInt32(false, 0)
        this.onFinish = NativeOptionCallBack(false, Callback0Param<Unit>({=>}).getID())
        this.finishCallbackType = NativeOptionInt32(false, 0)
        this.min = NativeOptionInt32(false, 0)
        this.max = NativeOptionInt32(false, 0)
        this.expected = NativeOptionInt32(false, 0)
    }

    protected func free() {
        this.curve.free()
    }
}

@C
protected struct NativeOptionAnimateParam {
    protected NativeOptionAnimateParam(
        let hasValue: Bool,
        let value: NativeAnimateParam
    ) {}

    protected func free() {
        this.value.free()
    }
}
