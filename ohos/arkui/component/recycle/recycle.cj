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

package ohos.arkui.component.recycle

import ohos.arkui.component.common.{CommonMethodComponent, CommonMethod}
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRecycleCreate(): Unit

    func FfiOHOSAceFrameworkRecyclePop(): Unit
}

/**
 * Recycle
 *
 * non-public API
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public class __Recycle__ <: CommonMethodComponent<__Recycle__> & RecycleAttribute {
    /**
     * Create a Recycle
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public init() {
        unsafe {
            FfiOHOSAceFrameworkRecycleCreate()
        }
    }
    /**
     * Create a Recycle
     *
     * @param {() -> Unit} child
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkRecycleCreate()
        }
        this.child = child
    }

    /**
     * Pop a Recycle
     *
     * @returns {This}
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public override func pop() {
        unsafe {
            FfiOHOSAceFrameworkRecyclePop()
        }
    }
}

/**
 * Recycle
 *
 * non-public API
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
sealed interface RecycleAttribute <: CommonMethod<RecycleAttribute> {}
