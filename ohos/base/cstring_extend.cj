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

import ohos.hilog.HilogChannel
import ohos.labels.APILevel

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public let BaseLog = HilogChannel(1, 0xD003901, "Cangjie-Base")

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public let AppLog = HilogChannel(0, 0xD003903, "Cangjie-App")

foreign func FfiOHOSAceFrameworkThrowNativeError(msg: CString): Unit

foreign func FfiOHOSAceFrameworkNativeLog(msg: CString): Unit

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func throwNativeError(msg: String): Unit {
    unsafe {
        let unsafeMsg = LibC.mallocCString(msg)
        FfiOHOSAceFrameworkThrowNativeError(unsafeMsg)
        LibC.free(unsafeMsg)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func nativeLog(msg: String): Unit {
    unsafe {
        let unsafeMsg = LibC.mallocCString(msg)
        FfiOHOSAceFrameworkNativeLog(unsafeMsg)
        LibC.free(unsafeMsg)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getOrThrow<T>(optData: Option<T>, msg!: String = ""): T {
    match (optData) {
        case None =>
            throwNativeError(msg + "\n")
            throw NoneValueException(msg + "\n")
        case Some(data) => data
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CStringExtend {
    func free(): Unit
    func toStringOption(): ?String
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend CString <: CStringExtend {
    public func free(): Unit {
        unsafe {
            LibC.free(this)
        }
    }

    public func toStringOption(): ?String {
        if (this.isNull()) {
            return Option<String>.None
        }
        this.toString()
    }
}
