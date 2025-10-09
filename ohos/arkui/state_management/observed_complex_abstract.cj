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

/**
 * Defines class ObservedComplexAbstract.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ObservedComplexAbstract <: Observable {
    private var dependentElementIds_: ArrayList<Int64> = ArrayList<Int64>()
    protected var info: String = ""
    protected var propsInfo: ArrayList<String> = ArrayList<String>()

    protected func subscribeInner(observer: Observer): Unit

    protected func unsubscribeInner(observer: Observer): Unit

    /**
     *
     * @param { ObservedComplexAbstract } v
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func set(v: ObservedComplexAbstract): Unit

    protected func inheritObservers(newObservers: ArrayList<Observer>) {
        for (observer in newObservers) {
            subscribeInner(observer)
        }
    }

    protected func setDependentElementIds(dependentElementIds: ArrayList<Int64>) {
        this.dependentElementIds_ = dependentElementIds
    }

    protected func recordDependentUpdate() {
        let elmtId = ViewStackProcessor.GetElmtIdToAccountFor()
        if (elmtId < 0) {
            return
        }
        dependentElementIds_.add(elmtId)
        ()
    }

    protected func getInfo(): String {
        return this.info
    }

    protected func setInfo(info: String) {
        this.info = info
    }

    protected func getPropsInfo(): ArrayList<String> {
        return propsInfo
    }

    /**
     *
     * @param { String } info
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPropsInfo(info: String): Unit {
        propsInfo.add(info)
    }

    protected func notifyChanges() {
        notifyChangesInner(info, dependentElementIds_)
    }
}
