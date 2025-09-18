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

import std.collection.ArrayList
import ohos.labels.APILevel

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Observable {
    // Record all the observers.
    private var observers: ArrayList<Observer> = ArrayList<Observer>()

    protected func getObservers() {
        return this.observers
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func subscribe(observer: Observer): Unit {
        // Add to observer list.
        observers.add(observer)
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribe(observer: Observer): Unit {
        observers.removeIf {
            o => o.id() == observer.id()
        }
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func isSubscribed(observer: Observer): Bool {
        for (o in observers) {
            if (o.id() == observer.id()) {
                return true
            }
        }
        return false
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func numberOfSubscribers(): Int64 {
        return this.observers.size
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribeAll(): Unit {
        observers.clear()
    }

    protected func notifyChangesInner(info: String, dependentElmtIds: ArrayList<Int64>) {
        for (observer in observers) {
            observer.onStateUpdate(info, dependentElmtIds)
        }
    }
}
