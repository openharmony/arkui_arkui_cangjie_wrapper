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
import ohos.base.*

foreign func FfiOHOSAceFrameworkComponentIdGetInspectorByKey(id: CString): ExternalString

foreign func FfiOHOSAceFrameworkComponentIdGetInspectorTree(): ExternalString

foreign func FfiOHOSAceFrameworkComponentIdSendEventByKey(id: CString, action: IntNative, params: CString): Bool

foreign func FfiOHOSAceFrameworkComponentIdSendTouchEvent(cJTouchInfo: CJTouchInfo): Bool

foreign func FfiOHOSAceFrameworkComponentIdSendKeyEvent(cJKeyEvent: CJKeyEvent): Bool

foreign func FfiOHOSAceFrameworkComponentIdSendMouseEvent(cJMouseEvent: CJMouseEvent): Bool

/**
 * Obtains all attributes of the component with the specified ID.
 *
 * @param { String } id - ID of the component for which the event is to be sent.
 * @returns { String }
 * @relation declare function getInspectorByKey(id: string): string
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getInspectorByKey(id: String): String {
    var result = ""
    unsafe {
        try(cId = LibC.mallocCString(id).asResource()) {
            let cRes = FfiOHOSAceFrameworkComponentIdGetInspectorByKey(cId.value)
            result = cRes.toString()
            cRes.free()
        }
    }
    return result
}

/**
 * Get components tree.
 *
 * @returns { String }
 * @relation declare function getInspectorTree(): Object
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getInspectorTree(): String {
    unsafe {
        let cResult = FfiOHOSAceFrameworkComponentIdGetInspectorTree()
        let result = cResult.toString()
        cResult.free()
        return result
    }
}

/**
 * Sends an event to the component with the specified ID.
 *
 * @param { String } id - ID of the component for which the event is to be sent.
 * @param { IntNative } action - Type of the event to be sent. The options are as follows: Click event: 10 LongClick: 11.
 * @param { String } params - Event parameters. If there is no parameter, pass an empty string "".
 * @returns { Bool }
 * @relation declare function sendEventByKey(id: string, action: number, params: string): boolean
 */
@!APILevel[
    22,
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

/**
 * Send touch event.
 *
 * @param { TouchObject } event - TouchObject to be sent.
 * @returns { Bool }
 * @relation declare function sendTouchEvent(event: TouchObject): boolean
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func sendTouchEvent(event: TouchObject): Bool {
    unsafe {
        return FfiOHOSAceFrameworkComponentIdSendTouchEvent(CJTouchInfo(event))
    }
}

/**
 * Send key event.
 *
 * @param { KeyEvent } event - KeyEvent to be sent.
 * @returns { Bool }
 * @relation declare function sendKeyEvent(event: KeyEvent): boolean
 */
@!APILevel[
    22,
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

/**
 * Send mouse event.
 *
 * @param { MouseEvent } event - MouseEvent to be sent.
 * @returns { Bool }
 * @relation declare function sendMouseEvent(event: MouseEvent): boolean
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func sendMouseEvent(event: MouseEvent): Bool {
    unsafe {
        return FfiOHOSAceFrameworkComponentIdSendMouseEvent(CJMouseEvent(event))
    }
}
