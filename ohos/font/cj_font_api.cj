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

package ohos.font

import ohos.base.*
import ohos.labels.APILevel

protected type VectorUIFontAliasInfoHandle = CPointer<Unit>

protected type VectorUIFontAdjustInfoHandle = CPointer<Unit>

protected type VectorUIFontGenericInfoHandle = CPointer<Unit>

protected type VectorUIFontFallbackInfoHandle = CPointer<Unit>

protected type VectorUIFontFallbackGroupInfoHandle = CPointer<Unit>

protected type VectorUIFontConfigHandle = CPointer<Unit>

@C
protected struct NativeUIFontAliasInfo {
    protected NativeUIFontAliasInfo(
        let name: ExternalString,
        let weight: UInt32
    ) {}
}

@C
protected struct NativeUIFontAdjustInfo {
    protected NativeUIFontAdjustInfo(
        let weight: UInt32,
        let to: UInt32
    ) {}
}

@C
protected struct NativeUIFontGenericInfo {
    protected NativeUIFontGenericInfo(
        let family: ExternalString,
        let alias: CPointer<Unit>,
        let adjust: CPointer<Unit>
    ) {}
}

@C
protected struct NativeUIFontFallbackInfo {
    protected NativeUIFontFallbackInfo(
        let language: ExternalString,
        let family: ExternalString
    ) {}
}

@C
protected struct NativeUIFontFallbackGroupInfo {
    protected NativeUIFontFallbackGroupInfo(
        let fontSetName: ExternalString,
        let fallback: CPointer<Unit>
    ) {}
}

@C
struct NativeUIFontConfig {
    NativeUIFontConfig(
        let fontDir: CPointer<Unit>,
        let generic: CPointer<Unit>,
        let fallbackGroups: CPointer<Unit>
    ) {}
}

foreign func FFICJVectorNativeUIFontAliasInfoDelete(vec: VectorUIFontAliasInfoHandle): Unit

foreign func FFICJVectorNativeUIFontAliasInfoGetSize(vec: VectorUIFontAliasInfoHandle): Int64

foreign func FFICJVectorNativeUIFontAliasInfoGetElement(vec: VectorUIFontAliasInfoHandle, index: Int64): NativeUIFontAliasInfo

foreign func FFICJVectorNativeUIFontAdjustInfoDelete(vec: VectorUIFontAdjustInfoHandle): Unit

foreign func FFICJVectorNativeUIFontAdjustInfoGetSize(vec: VectorUIFontAdjustInfoHandle): Int64

foreign func FFICJVectorNativeUIFontAdjustInfoGetElement(vec: VectorUIFontAdjustInfoHandle, index: Int64): NativeUIFontAdjustInfo

foreign func FFICJVectorNativeUIFontGenericInfoDelete(vec: VectorUIFontGenericInfoHandle): Unit

foreign func FFICJVectorNativeUIFontGenericInfoGetSize(vec: VectorUIFontGenericInfoHandle): Int64

foreign func FFICJVectorNativeUIFontGenericInfoGetElement(vec: VectorUIFontGenericInfoHandle, index: Int64): NativeUIFontGenericInfo

foreign func FFICJVectorNativeUIFontFallbackInfoDelete(vec: VectorUIFontFallbackInfoHandle): Unit

foreign func FFICJVectorNativeUIFontFallbackInfoGetSize(vec: VectorUIFontFallbackInfoHandle): Int64

foreign func FFICJVectorNativeUIFontFallbackInfoGetElement(vec: VectorUIFontFallbackInfoHandle, index: Int64): NativeUIFontFallbackInfo

foreign func FFICJVectorNativeUIFontFallbackGroupInfoDelete(vec: VectorUIFontFallbackGroupInfoHandle): Unit

foreign func FFICJVectorNativeUIFontFallbackGroupInfoGetSize(vec: VectorUIFontFallbackGroupInfoHandle): Int64

foreign func FFICJVectorNativeUIFontFallbackGroupInfoGetElement(vec: VectorUIFontFallbackGroupInfoHandle, index: Int64): NativeUIFontFallbackGroupInfo

protected class FFIVectorUIFontAliasInfo {
    private let vecHandle: VectorUIFontAliasInfoHandle

    protected init(vec: VectorUIFontAliasInfoHandle) {
        vecHandle = vec
    }

    protected func getElement(index: Int64): NativeUIFontAliasInfo {
        unsafe {
            FFICJVectorNativeUIFontAliasInfoGetElement(vecHandle, index)
        }
    }

    protected func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontAliasInfoGetSize(vecHandle) }
    }

    protected func free(): Unit {
        unsafe { FFICJVectorNativeUIFontAliasInfoDelete(vecHandle) }
    }
}

protected class FFIVectorUIFontAdjustInfo {
    private let vecHandle: VectorUIFontAdjustInfoHandle

    protected init(vec: VectorUIFontAdjustInfoHandle) {
        vecHandle = vec
    }

    protected func getElement(index: Int64): NativeUIFontAdjustInfo {
        unsafe {
            FFICJVectorNativeUIFontAdjustInfoGetElement(vecHandle, index)
        }
    }

    protected func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontAdjustInfoGetSize(vecHandle) }
    }

    protected func free(): Unit {
        unsafe { FFICJVectorNativeUIFontAdjustInfoDelete(vecHandle) }
    }
}

protected class FFIVectorUIFontGenericInfo {
    private let vecHandle: VectorUIFontGenericInfoHandle

    protected init(vec: VectorUIFontGenericInfoHandle) {
        vecHandle = vec
    }

    protected func getElement(index: Int64): NativeUIFontGenericInfo {
        unsafe {
            FFICJVectorNativeUIFontGenericInfoGetElement(vecHandle, index)
        }
    }

    protected func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontGenericInfoGetSize(vecHandle) }
    }

    protected func free(): Unit {
        unsafe { FFICJVectorNativeUIFontGenericInfoDelete(vecHandle) }
    }
}

protected class FFIVectorUIFontFallbackInfo {
    private let vecHandle: VectorUIFontFallbackInfoHandle

    protected init(vec: VectorUIFontFallbackInfoHandle) {
        vecHandle = vec
    }

    protected func getElement(index: Int64): NativeUIFontFallbackInfo {
        unsafe {
            FFICJVectorNativeUIFontFallbackInfoGetElement(vecHandle, index)
        }
    }

    protected func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontFallbackInfoGetSize(vecHandle) }
    }

    protected func free(): Unit {
        unsafe { FFICJVectorNativeUIFontFallbackInfoDelete(vecHandle) }
    }
}

protected class FFIVectorUIFontFallbackGroupInfo {
    private let vecHandle: VectorUIFontFallbackGroupInfoHandle

    protected init(vec: VectorUIFontFallbackGroupInfoHandle) {
        vecHandle = vec
    }

    protected func getElement(index: Int64): NativeUIFontFallbackGroupInfo {
        unsafe {
            FFICJVectorNativeUIFontFallbackGroupInfoGetElement(vecHandle, index)
        }
    }

    protected func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontFallbackGroupInfoGetSize(vecHandle) }
    }

    protected func free(): Unit {
        unsafe { FFICJVectorNativeUIFontFallbackGroupInfoDelete(vecHandle) }
    }
}
