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

import ohos.hilog.HilogChannel
import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkThrowNativeError(msg: CString): Unit
    func FfiOHOSAceFrameworkNativeLog(msg: CString): Unit
}

protected let BaseLog = HilogChannel(1, 0xD003901, "Cangjie-Base")
protected let AppLog = HilogChannel(0, 0xD003903, "Cangjie-App")

protected func throwNativeError(msg: String): Unit {
    unsafe {
        try (unsafeMsg = LibC.mallocCString(msg).asResource()) {
            FfiOHOSAceFrameworkThrowNativeError(unsafeMsg.value)
        }
    }
}

protected func nativeLog(msg: String): Unit {
    unsafe {
        try (unsafeMsg = LibC.mallocCString(msg).asResource()) {
            FfiOHOSAceFrameworkNativeLog(unsafeMsg.value)
        }
    }
}

protected func getOrThrow<T>(optData: Option<T>, msg!: String = ""): T {
    match (optData) {
        case None =>
            throwNativeError(msg + "\n")
            throw BusinessException(100001, msg + "\n")
        case Some(data) => data
    }
}

protected interface CStringExtend {
    func free(): Unit
    func toStringOption(): ?String
}

extend CString <: CStringExtend {
    @!Hide
    public func free(): Unit {
        unsafe {
            LibC.free(this)
        }
    }

    @!Hide
    public func toStringOption(): ?String {
        if (this.isNull()) {
            return Option<String>.None
        }
        this.toString()
    }
}
