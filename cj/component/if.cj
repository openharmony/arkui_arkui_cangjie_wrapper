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
    func FfiOHOSAceFrameworkIfElseCreate(): Unit

    func FfiOHOSAceFrameworkIfElsePop(): Unit

    func FfiOHOSAceFrameworkIfElseSetBranchId(value: Int32): Unit

    func FfiOHOSAceFrameworkIfElseGetBranchId(): Int32
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class If <: ComponentRender {
    var child: () -> Unit = {=>}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkIfElseCreate()
        }
        this.child = subcomponent
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func branchId(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkIfElseSetBranchId(value)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getBranchId(): Int32 {
        unsafe {
            FfiOHOSAceFrameworkIfElseGetBranchId()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkIfElsePop()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func initial(): Unit {
        genChild()
        pop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func update(): Unit {
        genChild()
        pop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func genChild(): Unit {
        child()
    }
}
