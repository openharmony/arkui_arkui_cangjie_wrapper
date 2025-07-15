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
    func FfiOHOSAceFrameworkMenuItemGroupCreateByBuilder(header: Int64, footer: Int64): Unit

    func FfiOHOSAceFrameworkMenuItemGroupCreateByString(header: CString, footer: CString): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuItemGroup <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(header!: String, footer!: String, child!: () -> Unit = {=>}) {
        unsafe {
            try (cheader = LibC.mallocCString(header).asResource(), cfooter = LibC.mallocCString(footer).asResource()) {
                FfiOHOSAceFrameworkMenuItemGroupCreateByString(cheader.value, cfooter.value)
            }
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(header!: AppResource, footer!: AppResource, child!: () -> Unit = {=>}) {
        this(header: getResourceString(header), footer: getResourceString(footer), child: child)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(header!: () -> Unit, footer!: () -> Unit, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkMenuItemGroupCreateByBuilder(Callback0Param<Unit>(header).getID(),
                Callback0Param<Unit>(footer).getID())
        }
        this.child = child
    }
}
