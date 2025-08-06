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

package ohos.base

import ohos.labels.APILevel

foreign func free(src: CString): Unit

@C
struct RetDimension {
    RetDimension(
        let value: Float64,
        let unit: Int32
    ) {}
}

@C
protected struct ExternalString {
    let value_: CString
    let free_: CFunc<(CString) -> Unit>
    protected init(value: String) {
        unsafe {
            try(unsafeVal = LibC.mallocCString(value).asResource()) {
                value_ = unsafeVal.value
            }
            free_ = free
        }
    }
    protected func isNull(): Bool {
        return value_.isNull()
    }
    protected func toString(): String {
        if (value_.isNull()) {
            return ""
        }
        value_.toString()
    }
    protected unsafe func free(): Unit {
        if (!value_.isNull()) {
            free_(value_)
        }
    }
}

@C
protected struct NativeOffset {
    protected NativeOffset(
        protected let dx: NativeLength,
        protected let dy: NativeLength
    ) {}
}

@C
protected struct NativeLength {
    protected NativeLength(
        protected let value: Float64,
        protected let unitType: Int32
    ) {}
}

@C
protected struct NativeOptionLength {
    protected NativeOptionLength(
        protected let hasValue: Bool,
        protected let value: NativeLength
    ) {}
}

@C
protected struct NativeOptionInt32 {
    protected NativeOptionInt32(
        protected let hasValue: Bool,
        protected let value: Int32
    ) {}
}

@C
protected struct NativeOptionUInt32 {
    protected NativeOptionUInt32(
        protected let hasValue: Bool,
        protected let value: UInt32
    ) {}
}

@C
protected struct NativeOptionFloat32 {
    protected NativeOptionFloat32(
        protected let hasValue: Bool,
        protected let value: Float32
    ) {}
}

@C
protected struct NativeOptionFloat64 {
    protected NativeOptionFloat64(
        protected let hasValue: Bool,
        protected let value: Float64
    ) {}
}

@C
protected struct NativeOptionCallBack {
    protected NativeOptionCallBack(
        protected let hasValue: Bool,
        protected let value: Int64
    ) {}
}

@C
protected struct NativeOptionCString {
    protected NativeOptionCString(
        protected let hasValue: Bool,
        protected let value: CString
    ) {}
    protected func free() {
        this.value.free()
    }
}

@C
protected struct NativeOptionInt64 {
    protected NativeOptionInt64(
        protected let hasValue: Bool,
        protected let value: Int64
    ) {}
}

@C
protected struct NativeOptionBool {
    protected NativeOptionBool(
        protected let hasValue: Bool,
        protected let value: Bool
    ) {}
}

@C
protected struct CArrInt32 {
    protected CArrInt32(
        protected let head: CPointer<Int32>,
        protected let size: Int64
    ) {}
}

@C
protected struct NativeOptionCArrInt32 {
    protected NativeOptionCArrInt32(
        protected let hasValue: Bool,
        protected let value: CArrInt32
    ) {}
}
