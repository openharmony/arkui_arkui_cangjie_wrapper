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

internal import ohos.labels.APILevel
internal import ohos.base.*
internal import ohos.ffi.*
internal import ohos.ui_resource.*
internal import std.collection.*
internal import ohos.resource_manager.AppResource

foreign func FfiOHOSAceFrameworkContainerBasePop(): Unit

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ContainerBase <: ViewBase {
    var child: () -> Unit = {=>}

    protected open override func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkContainerBasePop()
        }
    }

    protected open func genChild(): Unit {
        child()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open override func initial() {
        genChild()
        pop()
    }

    protected init() {
        super()
    }
    protected init(id: Int64) {
        super(id)
    }
}
