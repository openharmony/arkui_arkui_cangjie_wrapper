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

package ohos.arkui.component.rich_text

import ohos.arkui.component.common.*
import ohos.ffi.*
import ohos.base.*
import ohos.resource.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRichTextCreate(content: CString): Unit
    func FfiOHOSAceFrameworkRichTextOnStart(callback: Int64): Unit
    func FfiOHOSAceFrameworkRichTextOnComplete(callback: Int64): Unit
}

/**
 * Defines RichText Component.
 *
 * @relation interface RichTextInterface
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichText <: CommonMethodComponent<RichTextAttribute> & RichTextAttribute {
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: ?ResourceStr) {
        let tmpContent = content ?? throw IllegalArgumentException("The type now is not supported.")
        var value = match (tmpContent) {
            case res: AppResource => getResourceString(res)
            case _ => (tmpContent as String) ?? ""
        }
        unsafe {
            try (cString = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkRichTextCreate(cString.value)
            }
        }
    }

    /**
     * Triggered when the RichText loading starts.
     *
     * @param { () -> Unit } callback
     * @returns { This } 
     * @relation onStart(callback: () => void): RichTextAttribute;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStart(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? throw IllegalArgumentException("The type now is not supported.")
        let lambdaData = Callback0Param<Unit>(tmpCallback)
        unsafe { FfiOHOSAceFrameworkRichTextOnStart(lambdaData.getID()) }
        this
    }

    /**
     * Triggered when the RichText loading ends.
     *
     * @param { () -> Unit } callback
     * @returns { This } 
     * @relation onComplete(callback: () => void): RichTextAttribute;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onComplete(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? throw IllegalArgumentException("The type now is not supported.")
        let lambdaData = Callback0Param<Unit>(tmpCallback)
        unsafe { FfiOHOSAceFrameworkRichTextOnComplete(lambdaData.getID()) }
        this
    }
}
