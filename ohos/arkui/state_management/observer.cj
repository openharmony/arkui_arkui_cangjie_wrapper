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

package ohos.arkui.state_management

import ohos.labels.APILevel
import std.collection.{ArrayList}

/**
 * Defines interface Observer.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public interface Observer {
    /**
     * Called when a state update occurs.
     * 
     * @param { String } info - Information about the updated state.
     * @param { ArrayList<Int64> } dependentElmtIds - List of element IDs that depend on this state.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    func onStateUpdate(info: String, dependentElmtIds: ArrayList<Int64>): Unit

    /**
     * Notifies when a property is read.
     * 
     * @param { String } info - Information about the property being read.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    func notifyRead(info: String): Unit

    /**
     * Gets the unique identifier of the observer.
     * 
     * @returns { Int64 } The unique identifier.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    func id(): Int64

    /**
     * Prepares the observer for deletion, cleaning up any resources.
     * 
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    func aboutToBeDeleted(): Unit
}
