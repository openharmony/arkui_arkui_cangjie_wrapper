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

/**
 * Conditional rendering.
 * Based on the judgment result, the framework selectively renders the subcomponent.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class If <: UINodeBase {
    var child: () -> Unit = {=>}

    /**
     * Constructs an If component.
     *
     * @param { () -> Unit } subcomponent - The child component to be rendered when the condition is true.
     * @returns { If }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkIfElseCreate()
        }
        this.child = subcomponent
    }

    /**
     * Sets the branch ID.
     * The branch ID uniquely identifies the if..else if..else branches.
     *
     * @param { Int32 } value - The branch ID.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func branchId(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkIfElseSetBranchId(value)
        }
    }

    /**
     * Obtains the branch ID.
     *
     * @returns { Int32 } The branch ID.
     */
    @!APILevel[
        22,
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

    protected func initial(): Unit {
        genChild()
        pop()
    }

    protected func update(): Unit {
        genChild()
        pop()
    }

    func genChild(): Unit {
        child()
    }
}
