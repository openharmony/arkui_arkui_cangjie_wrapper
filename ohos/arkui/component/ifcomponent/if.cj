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

/**
 * Bindings for IfElse defined in cj_ifelse.cpp/h
 *
 * non-public API
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class If <: UINodeBase {
    var child: () -> Unit = {=>}

    /**
     * Defines the constructor of If.
     *
     * @param { () -> Unit } subcomponent
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
     * Set the branchId.
     * BranchId identifies uniquely the if .. <1> .. else if .<2>. else .<3>.branch.
     *
     * @param { Int32 } value - branchId
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
     * Get the branchId.
     *
     * @returns { Int32 } branchId.
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
