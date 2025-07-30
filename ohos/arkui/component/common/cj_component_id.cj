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

package ohos.arkui.component.common

import ohos.labels.APILevel

foreign func FfiOHOSAceFrameworkComponentIdGetInspectorByKey(id: CString): ExternalString

foreign func FfiOHOSAceFrameworkComponentIdGetInspectorTree(): ExternalString

foreign func FfiOHOSAceFrameworkComponentIdSendEventByKey(id: CString, action: IntNative, params: CString): Bool

foreign func FfiOHOSAceFrameworkComponentIdSendTouchEvent(cJTouchInfo: CJTouchInfo): Bool

foreign func FfiOHOSAceFrameworkComponentIdSendKeyEvent(cJKeyEvent: CJKeyEvent): Bool

foreign func FfiOHOSAceFrameworkComponentIdSendMouseEvent(cJMouseEvent: CJMouseEvent): Bool

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func sendEventByKey(id: String, action: IntNative, params: String): Bool {
    unsafe {
        var result = true
        try (cId = LibC.mallocCString(id).asResource(), cParams = LibC.mallocCString(params).asResource()) {
            result = FfiOHOSAceFrameworkComponentIdSendEventByKey(cId.value, action, cParams.value)
        }
        return result
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func sendTouchEvent(event: TouchObject): Bool {
    unsafe {
        return FfiOHOSAceFrameworkComponentIdSendTouchEvent(CJTouchInfo(event))
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func sendKeyEvent(event: KeyEvent): Bool {
    unsafe {
        let cEvent = CJKeyEvent(event)
        let result = FfiOHOSAceFrameworkComponentIdSendKeyEvent(cEvent)
        cEvent.free()
        return result
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func sendMouseEvent(event: MouseEvent): Bool {
    unsafe {
        return FfiOHOSAceFrameworkComponentIdSendMouseEvent(CJMouseEvent(event))
    }
}
