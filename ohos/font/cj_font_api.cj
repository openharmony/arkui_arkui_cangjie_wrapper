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

public type VectorUIFontAliasInfoHandle = CPointer<Unit>

public type VectorUIFontAdjustInfoHandle = CPointer<Unit>

public type VectorUIFontGenericInfoHandle = CPointer<Unit>

public type VectorUIFontFallbackInfoHandle = CPointer<Unit>

public type VectorUIFontFallbackGroupInfoHandle = CPointer<Unit>

public type VectorUIFontConfigHandle = CPointer<Unit>

@C
public struct NativeUIFontAliasInfo {
    public NativeUIFontAliasInfo(
        let name: ExternalString,
        let weight: UInt32
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIFontAliasInfo {
    public UIFontAliasInfo(
        public let name: String,
        public let weight: UInt32
    ) {}
}

@C
public struct NativeUIFontAdjustInfo {
    public NativeUIFontAdjustInfo(
        let weight: UInt32,
        let to: UInt32
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIFontAdjustInfo {
    public UIFontAdjustInfo(
        public let weight: UInt32,
        public let to: UInt32
    ) {}
}

@C
public struct NativeUIFontGenericInfo {
    public NativeUIFontGenericInfo(
        let family: ExternalString,
        let alias: CPointer<Unit>,
        let adjust: CPointer<Unit>
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIFontGenericInfo {
    public UIFontGenericInfo(
        public let family: String,
        public let alias: Array<UIFontAliasInfo>,
        public let adjust: Array<UIFontAdjustInfo>
    ) {}
}

@C
public struct NativeUIFontFallbackInfo {
    public NativeUIFontFallbackInfo(
        let language: ExternalString,
        let family: ExternalString
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIFontFallbackInfo {
    public UIFontFallbackInfo(
        public let language: String,
        public let family: String
    ) {}
}

@C
public struct NativeUIFontFallbackGroupInfo {
    public NativeUIFontFallbackGroupInfo(
        let fontSetName: ExternalString,
        let fallback: CPointer<Unit>
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIFontFallbackGroupInfo {
    public UIFontFallbackGroupInfo(
        public let fontSetName: String,
        public let fallback: Array<UIFontFallbackInfo>
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

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIFontConfig {
    public UIFontConfig(
        public let fontDir: Array<String>,
        public let generic: Array<UIFontGenericInfo>,
        public let fallbackGroups: Array<UIFontFallbackGroupInfo>
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

public class FFIVectorUIFontAliasInfo {
    private let vecHandle: VectorUIFontAliasInfoHandle

    public init(vec: VectorUIFontAliasInfoHandle) {
        vecHandle = vec
    }

    public func getElement(index: Int64): NativeUIFontAliasInfo {
        unsafe {
            FFICJVectorNativeUIFontAliasInfoGetElement(vecHandle, index)
        }
    }

    public func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontAliasInfoGetSize(vecHandle) }
    }

    public func free(): Unit {
        unsafe { FFICJVectorNativeUIFontAliasInfoDelete(vecHandle) }
    }
}

public class FFIVectorUIFontAdjustInfo {
    private let vecHandle: VectorUIFontAdjustInfoHandle

    public init(vec: VectorUIFontAdjustInfoHandle) {
        vecHandle = vec
    }

    public func getElement(index: Int64): NativeUIFontAdjustInfo {
        unsafe {
            FFICJVectorNativeUIFontAdjustInfoGetElement(vecHandle, index)
        }
    }

    public func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontAdjustInfoGetSize(vecHandle) }
    }

    public func free(): Unit {
        unsafe { FFICJVectorNativeUIFontAdjustInfoDelete(vecHandle) }
    }
}

public class FFIVectorUIFontGenericInfo {
    private let vecHandle: VectorUIFontGenericInfoHandle

    public init(vec: VectorUIFontGenericInfoHandle) {
        vecHandle = vec
    }

    public func getElement(index: Int64): NativeUIFontGenericInfo {
        unsafe {
            FFICJVectorNativeUIFontGenericInfoGetElement(vecHandle, index)
        }
    }

    public func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontGenericInfoGetSize(vecHandle) }
    }

    public func free(): Unit {
        unsafe { FFICJVectorNativeUIFontGenericInfoDelete(vecHandle) }
    }
}

public class FFIVectorUIFontFallbackInfo {
    private let vecHandle: VectorUIFontFallbackInfoHandle

    public init(vec: VectorUIFontFallbackInfoHandle) {
        vecHandle = vec
    }

    public func getElement(index: Int64): NativeUIFontFallbackInfo {
        unsafe {
            FFICJVectorNativeUIFontFallbackInfoGetElement(vecHandle, index)
        }
    }

    public func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontFallbackInfoGetSize(vecHandle) }
    }

    public func free(): Unit {
        unsafe { FFICJVectorNativeUIFontFallbackInfoDelete(vecHandle) }
    }
}

public class FFIVectorUIFontFallbackGroupInfo {
    private let vecHandle: VectorUIFontFallbackGroupInfoHandle

    public init(vec: VectorUIFontFallbackGroupInfoHandle) {
        vecHandle = vec
    }

    public func getElement(index: Int64): NativeUIFontFallbackGroupInfo {
        unsafe {
            FFICJVectorNativeUIFontFallbackGroupInfoGetElement(vecHandle, index)
        }
    }

    public func getSize(): Int64 {
        unsafe { FFICJVectorNativeUIFontFallbackGroupInfoGetSize(vecHandle) }
    }

    public func free(): Unit {
        unsafe { FFICJVectorNativeUIFontFallbackGroupInfoDelete(vecHandle) }
    }
}
