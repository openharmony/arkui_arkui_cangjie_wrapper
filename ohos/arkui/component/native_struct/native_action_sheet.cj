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

@C
protected struct NativeActionSheetShadowOptions {
    protected NativeActionSheetShadowOptions(
        let radius: Float64,
        let shadowType: Int32,
        let color: UInt32,
        let offsetX: Float64,
        let offsetY: Float64,
        let fill: Bool
    ) {}
}

@C
protected struct NativeConfirm {
    protected NativeConfirm(
        let value: CString,
        let action: Int64,
        let enabled: Bool,
        let defaultFocus: Bool,
        let style: Int32
    ) {}

    protected func free(): Unit {
        unsafe {
            LibC.free(value)
        }
    }
}

@C
protected struct NativeOptionOffset {
    protected NativeOptionOffset(
        let hasValue: Bool,
        let value: NativeOffset
    ) {}
}

@C
protected struct NativeOptionRadius {
    protected NativeOptionRadius(
        let hasValue: Bool,
        let value: CBorderRadiuses
    ) {}
}

@C
protected struct NativeOptionRectangle {
    protected NativeOptionRectangle(
        protected let hasValue: Bool,
        protected let value: NativeRectangle
    ) {}
}
