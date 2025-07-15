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

foreign func FfiOHOSAceFrameworkHyperlinkCreate(address: CString, content: CString): Unit

foreign func FfiOHOSAceFrameworkHyperlinkColor(color: UInt32): Unit

foreign func FfiOHOSAceFrameworkHyperlinkPop(): Unit

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Hyperlink <: ContainerBase {
    @!APILevel[
        16,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(address!: String, content!: String = "") {
        unsafe {
            let addressStr = LibC.mallocCString(address)
            let contentStr = LibC.mallocCString(content)
            FfiOHOSAceFrameworkHyperlinkCreate(addressStr, contentStr)
            LibC.free(addressStr)
            LibC.free(contentStr)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(address!: AppResource, content!: String = "") {
        this(address: getResourceString(address), content: content)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(address!: String, content!: AppResource) {
        this(address: address, content: getResourceString(content))
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(address!: AppResource, content!: AppResource) {
        this(address: getResourceString(address), content: getResourceString(content))
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(address: String, subcomponent: () -> Unit) {
        this(address: address, content: "")
        this.child = subcomponent
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(address: AppResource, subcomponent: () -> Unit) {
        this(address: getResourceString(address), content: "")
        this.child = subcomponent
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkHyperlinkColor(transAppResourceToResourceColor(value))
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkHyperlinkPop()
        }
    }
}
