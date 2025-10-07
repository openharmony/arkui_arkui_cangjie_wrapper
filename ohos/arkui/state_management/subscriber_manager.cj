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

import std.collection.*
import ohos.base.*
import ohos.labels.APILevel

/**
 * Defines class SubscriberManager.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SubscriberManager {
    private static let instance = SubscriberManager()

    private var nextStateId: Int64 = 0
    private var subscriberById: HashMap<Int64, Observer> = HashMap<Int64, Observer>()

    /**
     *
     * @returns { SubscriberManager }
     */
    @!APILevel[
        22,
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
     *
     * @params { Int64 } id
     * @returns { Bool }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func has(id: Int64): Bool {
        return subscriberById.contains(id)
    }

    /**
     *
     * @params { Int64 } id
     * @returns { Option<Observer> }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get(id: Int64): Option<Observer> {
        return subscriberById.get(id)
    }

    /**
     *
     * @params { Observer } value
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func delete(value: Observer): Unit {
        subscriberById.remove(value.id())
    }

    /**
     *
     * @params { Observer } value
     * @returns { Bool }
     */
    @!APILevel[
        22,
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
