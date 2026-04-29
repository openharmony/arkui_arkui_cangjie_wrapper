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

import ohos.labels.{APILevel, Hide}
import std.collection.{ArrayList}

/**
 * Defines class ObservedPropertyAbstract.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public abstract class ObservedPropertyAbstract <: Observable {
    protected let info: String
    protected let dependentElementIds_: ArrayList<Int64> = ArrayList<Int64>()

    private let profilerDependentDepsPerObserver_: ArrayList<(Int64, ArrayList<Int64>)> = ArrayList<(Int64, ArrayList<Int64>)>()

    /**
     * ObservedPropertyAbstract constructor.
     *
     * @param { String } info - Information about the property.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public init(info: String) {
        this.info = info
    }

    protected func getInfo(): String {
        return this.info
    }

    /**
     * Subscribe an observer.
     *
     * @param { Observer } observer - The observer to subscribe.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func subscribeEx(observer: Observer): Unit

    /**
     * Unsubscribe an observer.
     *
     * @param { Observer } observer - The observer to unsubscribe.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func unsubscribeEx(observer: Observer): Unit

    protected open func subscribeExFromObservedModel(observer: Observer): Unit {
        subscribeEx(observer)
    }

    protected func notifyChanges() {
        notifyChangesInner(info, dependentElementIds_)
    }

    private func profilerFindOrAddObserverDeps(observerCompId: Int64): ArrayList<Int64> {
        for (entry in profilerDependentDepsPerObserver_) {
            if (entry[0] == observerCompId) {
                return entry[1]
            }
        }
        let deps = ArrayList<Int64>()
        profilerDependentDepsPerObserver_.add((observerCompId, deps))
        deps
    }

    protected func recordDependentUpdate() {
        let elmtId = ViewStackProcessor.getElmtIdToAccountFor()
        if (elmtId < 0) {
            return
        }
        dependentElementIds_.add(elmtId)
        let ownerId = profilerDependencyCurrentObserver()
        if (ownerId >= 0) {
            profilerFindOrAddObserverDeps(ownerId).add(elmtId)
        }
        ()
    }

    /**
     * Remove the dependency of this property on a specific element ID.
     *
     * @param { Int64 } rmElmtId - The element ID to remove dependency on.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func purgeDependencyOnElmtId(rmElmtId: Int64): Unit {
        this.dependentElementIds_.removeIf({
            v => v == rmElmtId
        })
        for (entry in profilerDependentDepsPerObserver_) {
            entry[1].removeIf({
                v => v == rmElmtId
            })
        }
    }

    protected func getProfilerDependentElementIdsForDump(forObserverCompId: Int64): ArrayList<Int64> {
        let result = ArrayList<Int64>()
        for (entry in profilerDependentDepsPerObserver_) {
            if (entry[0] == forObserverCompId) {
                for (elementId in entry[1]) {
                    result.add(elementId)
                }
                return result
            }
        }
        result
    }
}