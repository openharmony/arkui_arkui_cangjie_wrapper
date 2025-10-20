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

package ohos.arkui.state_management

import std.collection.*
import ohos.base.*
import ohos.labels.APILevel

/**
 * Defines class SubscriberManager.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SubscriberManager {
    private static let instance = SubscriberManager()

    private var nextStateId: Int64 = 0
    private var subscriberById: HashMap<Int64, Observer> = HashMap<Int64, Observer>()

    /**
     * Gets the singleton instance of SubscriberManager.
     *
     * @returns { SubscriberManager } The singleton instance of SubscriberManager.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getInstance(): SubscriberManager {
        instance
    }

    protected func makeId(): Int64 {
        var now = this.nextStateId
        this.nextStateId++
        return now
    }

    /**
     * Checks if a subscriber with the given ID exists.
     *
     * @param { Int64 } id - The ID of the subscriber to check.
     * @returns { Bool } True if a subscriber with the given ID exists, false otherwise.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func has(id: Int64): Bool {
        return subscriberById.contains(id)
    }

    /**
     * Gets the subscriber with the given ID.
     *
     * @param { Int64 } id - The ID of the subscriber to retrieve.
     * @returns { Option<Observer> } The subscriber with the given ID, or None if not found.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get(id: Int64): Option<Observer> {
        return subscriberById.get(id)
    }

    /**
     * Removes a subscriber from the manager.
     *
     * @param { Observer } value - The subscriber to remove.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func delete(value: Observer): Unit {
        subscriberById.remove(value.id())
    }

    /**
     * Adds a subscriber to the manager.
     *
     * @param { Observer } value - The subscriber to add.
     * @returns { Bool } True if the subscriber was added successfully, false if a subscriber with the same ID already exists.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func add(value: Observer): Bool {
        let id = value.id()
        if (this.has(id)) {
            BaseLog.debug("this has same id ${id}")
            return false
        }
        this.subscriberById.add(id, value)
        return true
    }

    protected func sizeOfManager(): Int64 {
        this.subscriberById.size
    }

    protected func dumpSubscriberInfo(): Unit {
        print("Dump of SubscriberManager +++ (sart) \n")
        print("Current Size: ${subscriberById.size}\n")
        for (idx in subscriberById.keys()) {
            print("Id: ${idx} \n")
        }
        print("Dump of SubscriberManager +++ (end) \n")
    }
}
