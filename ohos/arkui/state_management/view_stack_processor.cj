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

package ohos.arkui.state_management

import ohos.labels.APILevel

foreign func FfiOHOSAceFrameworkAllocateNewElmetIdForNextComponent(): Int32

foreign func FfiOHOSAceFrameworkStartGetAccessRecordingFor(elmtId: Int64): Unit

foreign func FfiOHOSAceFrameworkGetElmtIdToAccountFor(): Int32

foreign func FfiOHOSAceFrameworkStopGetAccessRecording(): Unit

foreign func FfiOHOSAceFrameworkImplicitPopBeforeContinue(): Unit

/**
 * ViewStackProcessor declaration.
 *
 * Implemntation in C++ and exposed to cangjie
 * all definitions in this file are framework internal.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ViewStackProcessor {
    /**
     * Make and return new elementId, will be used to create the next Component.
     *
     * @returns { Int64 } The new element ID.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func AllocateNewElmetIdForNextComponent(): Int64 {
        unsafe {
            Int64(FfiOHOSAceFrameworkAllocateNewElmetIdForNextComponent())
        }
    }
    
    /**
     * Start Get access recording, and account all access to given elmtId.
     * Note this can be a different elmtId than the one used to create new Component.
     *
     * @param { Int64 } elmtId - The element ID to start access recording for.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func StartGetAccessRecordingFor(elmtId: Int64): Unit {
        unsafe {
            FfiOHOSAceFrameworkStartGetAccessRecordingFor(elmtId)
        }
    }
    
    /**
     * Get the elmtId to which any get access should be accounted.
     * note this can be the same as the currently created elmtId (top of stack)
     * but also a different one (in case a whole subtree gets accounted its root elmtId)
     *
     * returns the elmtId given by StartGetAccessRecordingFor -1 no access recording
     *
     * @returns { Int64 } The element ID.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func GetElmtIdToAccountFor(): Int64 {
        unsafe {
            Int64(FfiOHOSAceFrameworkGetElmtIdToAccountFor())
        }
    }

    /**
     * Stop get access recording
     * also invalidates any reserved but unclaimed elmtId for Component creation.
     * 
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func StopGetAccessRecording(): Unit {
        unsafe {
            FfiOHOSAceFrameworkStopGetAccessRecording()
        }
    }

    /**
     * when nesting observeComponentCreation functions, such as in the case of
     * If, and the if branch creates a Text etc that requires an implict pop
     * this function is needed after executing the inner observeComponentCreation
     * and before read ViewStackProcessor.GetTopMostElementId();
     * 
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func ImplicitPopBeforeContinue(): Unit {
        unsafe {
            FfiOHOSAceFrameworkImplicitPopBeforeContinue()
        }
    }
}
