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

foreign {
    func FfiOHOSAceFrameworkRichTextCreate(content: CString): Unit

    func FfiOHOSAceFrameworkRichTextOnStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichTextOnComplete(callback: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichText <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: String) {
        unsafe {
            let cString = LibC.mallocCString(content)
            FfiOHOSAceFrameworkRichTextCreate(cString)
            LibC.free(cString)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStart(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe { FfiOHOSAceFrameworkRichTextOnStart(lambdaData.getID()) }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onComplete(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe { FfiOHOSAceFrameworkRichTextOnComplete(lambdaData.getID()) }
        this
    }
}
