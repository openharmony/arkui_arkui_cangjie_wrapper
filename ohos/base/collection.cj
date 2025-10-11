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

package ohos.base

import ohos.labels.APILevel

protected type VectorStringHandle = CPointer<Unit>

protected type VectorInt32Handle = CPointer<Unit>

protected type VectorInt64Handle = CPointer<Unit>

protected type VectorUInt8Handle = CPointer<Unit>

protected type VectorUInt32Handle = CPointer<Unit>

protected type VectorFloat32Handle = CPointer<Unit>

protected type VectorFloat64Handle = CPointer<Unit>

protected type VectorBoolHandle = CPointer<Unit>

foreign func FFICJCommonCreateVectorString(size: Int64): VectorStringHandle

foreign func FFICJCommonVectorStringSetElement(vec: VectorStringHandle, index: Int64, value: CString): Unit

foreign func FFICJCommonVectorStringGetElement(vec: VectorStringHandle, index: Int64): CString

foreign func FFICJCommonVectorStringDelete(vec: VectorStringHandle): Unit

foreign func FFICJCommonVectorStringGetSize(vec: VectorStringHandle): Int64

foreign func FFICJCommonCreateVectorInt32(size: Int64): VectorInt32Handle

foreign func FFICJCommonVectorInt32SetElement(vec: VectorInt32Handle, index: Int64, value: Int32): Unit

foreign func FFICJCommonVectorInt32GetElement(vec: VectorInt32Handle, index: Int64): Int32

foreign func FFICJCommonVectorInt32Delete(vec: VectorInt32Handle): Unit

foreign func FFICJCommonVectorInt32GetSize(vec: VectorInt32Handle): Int64

foreign func FFICJCommonCreateVectorInt64(size: Int64): VectorInt64Handle

foreign func FFICJCommonVectorInt64SetElement(vec: VectorInt64Handle, index: Int64, value: Int64): Unit

foreign func FFICJCommonVectorInt64GetElement(vec: VectorInt64Handle, index: Int64): Int64

foreign func FFICJCommonVectorInt64Delete(vec: VectorInt64Handle): Unit

foreign func FFICJCommonVectorInt64GetSize(vec: VectorInt64Handle): Int64

foreign func FFICJCommonCreateVectorUInt8(size: Int64): VectorUInt8Handle

foreign func FFICJCommonVectorUInt8SetElement(vec: VectorUInt8Handle, index: Int64, value: UInt8): Unit

foreign func FFICJCommonVectorUInt8GetElement(vec: VectorUInt8Handle, index: Int64): UInt8

foreign func FFICJCommonVectorUInt8Delete(vec: VectorUInt8Handle): Unit

foreign func FFICJCommonVectorUInt8GetSize(vec: VectorUInt8Handle): Int64

foreign func FFICJCommonCreateVectorUInt32(size: Int64): VectorUInt32Handle

foreign func FFICJCommonVectorUInt32SetElement(vec: VectorUInt32Handle, index: Int64, value: UInt32): Unit

foreign func FFICJCommonVectorUInt32GetElement(vec: VectorUInt32Handle, index: Int64): UInt32

foreign func FFICJCommonVectorUInt32Delete(vec: VectorUInt32Handle): Unit

foreign func FFICJCommonVectorUInt32GetSize(vec: VectorUInt32Handle): Int64

foreign func FFICJCommonCreateVectorFloat32(size: Int64): VectorFloat32Handle

foreign func FFICJCommonVectorFloat32SetElement(vec: VectorFloat32Handle, index: Int64, value: Float32): Unit

foreign func FFICJCommonVectorFloat32GetElement(vec: VectorFloat32Handle, index: Int64): Float32

foreign func FFICJCommonVectorFloat32Delete(vec: VectorFloat32Handle): Unit

foreign func FFICJCommonVectorFloat32GetSize(vec: VectorFloat32Handle): Int64

foreign func FFICJCommonCreateVectorFloat64(size: Int64): VectorFloat64Handle

foreign func FFICJCommonVectorFloat64SetElement(vec: VectorFloat64Handle, index: Int64, value: Float64): Unit

foreign func FFICJCommonVectorFloat64GetElement(vec: VectorFloat64Handle, index: Int64): Float64

foreign func FFICJCommonVectorFloat64Delete(vec: VectorFloat64Handle): Unit

foreign func FFICJCommonVectorFloat64GetSize(vec: VectorFloat64Handle): Int64

foreign func FFICJCommonCreateVectorBool(size: Int64): VectorBoolHandle

foreign func FFICJCommonVectorBoolSetElement(vec: VectorBoolHandle, index: Int64, value: Bool): Unit

foreign func FFICJCommonVectorBoolGetElement(vec: VectorBoolHandle, index: Int64): Bool

foreign func FFICJCommonVectorBoolDelete(vec: VectorBoolHandle): Unit

foreign func FFICJCommonVectorBoolGetSize(vec: VectorBoolHandle): Int64

protected class FFIVectorString {
    private let vecHandle: VectorStringHandle
    protected init(vec: VectorStringHandle) {
        vecHandle = vec
    }
    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorString(size) }
    }
    protected func setElement(index: Int64, value: String): Unit {
        unsafe {
            try (unsafeStr = LibC.mallocCString(value).asResource()) {
                FFICJCommonVectorStringSetElement(vecHandle, index, unsafeStr.value)
            }
        }
    }
    protected func getElement(index: Int64): String {
        unsafe { FFICJCommonVectorStringGetElement(vecHandle, index).toString() }
    }
    protected func free(): Unit {
        unsafe { FFICJCommonVectorStringDelete(vecHandle) }
    }
    protected func getSize(): Int64 {
        unsafe { FFICJCommonVectorStringGetSize(vecHandle) }
    }
    protected func getNativeHandle(): VectorStringHandle {
        vecHandle
    }
}

protected class FFIVectorInt32 {
    private let vecHandle: VectorInt32Handle
    protected init(vec: VectorInt32Handle) {
        vecHandle = vec
    }
    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorInt32(size) }
    }
    protected func setElement(index: Int64, value: Int32): Unit {
        unsafe { FFICJCommonVectorInt32SetElement(vecHandle, index, value) }
    }
    protected func getElement(index: Int64): Int32 {
        unsafe { FFICJCommonVectorInt32GetElement(vecHandle, index) }
    }
    protected func free(): Unit {
        unsafe { FFICJCommonVectorInt32Delete(vecHandle) }
    }
    protected func getSize(): Int64 {
        unsafe { FFICJCommonVectorInt32GetSize(vecHandle) }
    }
    protected func getNativeHandle(): VectorInt32Handle {
        vecHandle
    }
}

protected class FFIVectorInt64 {
    private let vecHandle: VectorInt64Handle
    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorInt64(size) }
    }
    protected func setElement(index: Int64, value: Int64): Unit {
        unsafe { FFICJCommonVectorInt64SetElement(vecHandle, index, value) }
    }
    protected func free(): Unit {
        unsafe { FFICJCommonVectorInt64Delete(vecHandle) }
    }
    protected func getNativeHandle(): VectorInt64Handle {
        vecHandle
    }
}

protected class FFIVectorUInt8 {
    private let vecHandle: VectorUInt8Handle
    protected init(vec: VectorUInt8Handle) {
        vecHandle = vec
    }
    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorUInt8(size) }
    }
    protected func setElement(index: Int64, value: UInt8): Unit {
        unsafe { FFICJCommonVectorUInt8SetElement(vecHandle, index, value) }
    }
    protected func getElement(index: Int64): UInt8 {
        unsafe { FFICJCommonVectorUInt8GetElement(vecHandle, index) }
    }
    protected func free(): Unit {
        unsafe { FFICJCommonVectorUInt8Delete(vecHandle) }
    }
    protected func getSize(): Int64 {
        unsafe { FFICJCommonVectorUInt8GetSize(vecHandle) }
    }
    protected func getNativeHandle(): VectorUInt8Handle {
        vecHandle
    }
}

protected class FFIVectorUInt32 {
    private let vecHandle: VectorUInt32Handle
    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorUInt32(size) }
    }
    protected func setElement(index: Int64, value: UInt32): Unit {
        unsafe { FFICJCommonVectorUInt32SetElement(vecHandle, index, value) }
    }
    protected func free(): Unit {
        unsafe { FFICJCommonVectorUInt32Delete(vecHandle) }
    }
    protected func getNativeHandle(): VectorUInt32Handle {
        vecHandle
    }
}

protected class FFIVectorFloat32 {
    private let vecHandle: VectorFloat32Handle
    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorFloat32(size) }
    }
    protected func setElement(index: Int64, value: Float32): Unit {
        unsafe { FFICJCommonVectorFloat32SetElement(vecHandle, index, value) }
    }
    protected func free(): Unit {
        unsafe { FFICJCommonVectorFloat32Delete(vecHandle) }
    }
    protected func getNativeHandle(): VectorFloat32Handle {
        vecHandle
    }
}

protected class FFIVectorFloat64 {
    private let vecHandle: VectorFloat64Handle
    protected init(vec: VectorFloat64Handle) {
        vecHandle = vec
    }
    protected init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorFloat64(size) }
    }
    protected func setElement(index: Int64, value: Float64): Unit {
        unsafe { FFICJCommonVectorFloat64SetElement(vecHandle, index, value) }
    }
    protected func getElement(index: Int64): Float64 {
        unsafe { FFICJCommonVectorFloat64GetElement(vecHandle, index) }
    }
    protected func free(): Unit {
        unsafe { FFICJCommonVectorFloat64Delete(vecHandle) }
    }
    protected func getSize(): Int64 {
        unsafe { FFICJCommonVectorFloat64GetSize(vecHandle) }
    }
    protected func getNativeHandle(): VectorFloat64Handle {
        vecHandle
    }
}
