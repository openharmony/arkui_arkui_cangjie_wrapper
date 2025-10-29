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

package ohos.arkui.component.rich_text

import ohos.arkui.component.common.{CommonMethodComponent}
import ohos.ffi.{Callback0Param}
import ohos.base.{ResourceStr}
import ohos.resource.{AppResource, getResourceString}
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRichTextCreate(content: CString): Unit
    func FfiOHOSAceFrameworkRichTextOnStart(callback: Int64): Unit
    func FfiOHOSAceFrameworkRichTextOnComplete(callback: Int64): Unit
}

/**
 * A component that displays rich text content formatted in HTML or loaded from a resource file.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichText <: CommonMethodComponent<RichText> & RichTextAttribute {
    /**
     * Creates a RichText component.
     * Initializes a RichText component with HTML content or a resource file.
     *
     * @param { ?ResourceStr } content - HTML format string or local resource file.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: ?ResourceStr) {
        let tmpContent = content ?? ""
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
     * Called when the rich text content begins loading.
     *
     * @param { ?() -> Unit } callback - Callback function when loading starts.
     * @returns { This } Returns the RichText instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStart(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? { => }
        let lambdaData = Callback0Param<Unit>(tmpCallback)
        unsafe { FfiOHOSAceFrameworkRichTextOnStart(lambdaData.getID()) }
        this
    }

    /**
     * Triggered when the RichText loading ends.
     * Called when the rich text content finishes loading, either successfully or with an error.
     *
     * @param { ?() -> Unit } callback - Callback function when loading completes.
     * @returns { This } Returns the RichText instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onComplete(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? { => }
        let lambdaData = Callback0Param<Unit>(tmpCallback)
        unsafe { FfiOHOSAceFrameworkRichTextOnComplete(lambdaData.getID()) }
        this
    }
}
