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

package ohos.arkui.component.ifcomponent

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.ffi.*

foreign {
    func FfiOHOSAceFrameworkIfElseCreate(): Unit

    func FfiOHOSAceFrameworkIfElsePop(): Unit

    func FfiOHOSAceFrameworkIfElseSetBranchId(value: Int32): Unit

    func FfiOHOSAceFrameworkIfElseGetBranchId(): Int32
}

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class If <: UINodeBase {
    var child: () -> Unit = {=>}

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkIfElseCreate()
        }
        this.child = subcomponent
    }

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func branchId(value: ?Int32): Unit {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkIfElseSetBranchId(tmpValue)
        }
    }

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getBranchId(): Int32 {
        unsafe {
            FfiOHOSAceFrameworkIfElseGetBranchId()
        }
    }

    func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkIfElsePop()
        }
    }

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func initial(): Unit {
        genChild()
        pop()
    }

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func update(): Unit {
        genChild()
        pop()
    }

    func genChild(): Unit {
        child()
    }
}
