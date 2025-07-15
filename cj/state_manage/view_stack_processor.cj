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

package ohos.state_manage

import ohos.labels.APILevel

foreign func FfiOHOSAceFrameworkAllocateNewElmetIdForNextComponent(): Int64

foreign func FfiOHOSAceFrameworkStartGetAccessRecordingFor(elmtId: Int64): Unit

foreign func FfiOHOSAceFrameworkGetElmtIdToAccountFor(): Int32

foreign func FfiOHOSAceFrameworkStopGetAccessRecording(): Unit

foreign func FfiOHOSAceFrameworkImplicitPopBeforeContinue(): Unit

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ViewStackProcessor {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func AllocateNewElmetIdForNextComponent(): Int64 {
        unsafe {
            FfiOHOSAceFrameworkAllocateNewElmetIdForNextComponent()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func StartGetAccessRecordingFor(elmtId: Int64): Unit {
        unsafe {
            FfiOHOSAceFrameworkStartGetAccessRecordingFor(elmtId)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func GetElmtIdToAccountFor(): Int64 {
        unsafe {
            Int64(FfiOHOSAceFrameworkGetElmtIdToAccountFor())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func StopGetAccessRecording(): Unit {
        unsafe {
            FfiOHOSAceFrameworkStopGetAccessRecording()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func ImplicitPopBeforeContinue(): Unit {
        unsafe {
            FfiOHOSAceFrameworkImplicitPopBeforeContinue()
        }
    }
}
