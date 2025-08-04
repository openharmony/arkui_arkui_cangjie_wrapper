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

import ohos.base.*
import ohos.labels.APILevel
import std.collection.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalStorage {
    protected let storage: HashMap<String, ObservedPropertyAbstract>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this.storage = HashMap<String, ObservedPropertyAbstract>()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToBeDeleted(): Bool {
        return this.clear()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func has(propName: String): Bool {
        return this.storage.contains(propName)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keys(): EquatableCollection<String> {
        return this.storage.keys()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(): Int64 {
        return this.storage.size
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get<T>(propName: String): ?T {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case Some(v) => match (v as ObservedProperty<T>) {
                case Some(o) => return Some(o.get())
                case None => return None
            }
            case None => return None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func set<T>(propName: String, newValue: T): Bool {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case Some(v) => match (v as ObservedProperty<T>) {
                case Some(o) =>
                    o.set(newValue)
                    return true
                case None => return false
            }
            case None => return false
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setOrCreate<T>(propName: String, newValue: T): Bool {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case Some(v) => match (v as ObservedProperty<T>) {
                case Some(o) => o.set(newValue)
                case None => ()
            }
            case None => this.addNewPropertyInternal<T>(propName, newValue)
        }
        return true
    }

    private func addNewPropertyInternal<T>(propName: String, value: T): Unit {
        this.storage.add(propName, ObservedProperty<T>(propName, value))
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func link<T>(propName: String): ?ObservedProperty<T> {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case Some(v) => match (v as ObservedProperty<T>) {
                case Some(o) => return o
                case None => None
            }
            case None => None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case None => this.setOrCreate<T>(propName, defaultValue)
            case _ => ()
        }
        return this.link<T>(propName).getOrThrow()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func `prop`<T>(propName: String): ?ObservedProperty<T> {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case Some(v) => match (v as ObservedProperty<T>) {
                case Some(o) => return o
                case None => None
            }
            case None => None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case None => this.setOrCreate(propName, defaultValue)
            case _ => ()
        }
        return this.`prop`<T>(propName).getOrThrow()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func delete(propName: String): Bool {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case Some(v) =>
                if (v.numberOfSubscribers() > 0) {
                    BaseLog.error("Subscribers need to unsubscribe before `prop` deletion.")
                    return false
                }
                this.storage.remove(propName)
                return true
            case None => return false
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clear(): Bool {
        for (propName in this.keys()) {
            var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
            match (p) {
                case Some(v) =>
                    if (v.numberOfSubscribers() > 0) {
                        BaseLog.error("Subscribers need to unsubscribe before `prop` deletion.")
                        return false
                    }
                case None => ()
            }
        }
        this.storage.clear()
        return true
    }
}
