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

package ohos.state_manage

import std.collection.ArrayList
import ohos.labels.APILevel

foreign func FfiOHOSAceFrameworkIsPartialUpdate(): Bool

func isPartialUpdate(): Bool {
    return true
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ObservedComplexAbstract <: Observable {
    private var dependentElementIds_: ArrayList<Int64> = ArrayList<Int64>()
    protected var info: String = ""
    protected var propsInfo: ArrayList<String> = ArrayList<String>()

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func subscribeInner(observer: Observer): Unit

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribeInner(observer: Observer): Unit

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func set(v: ObservedComplexAbstract): Unit

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func inheritObservers(newObservers: ArrayList<Observer>) {
        for (observer in newObservers) {
            subscribeInner(observer)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setDependentElementIds(dependentElementIds: ArrayList<Int64>) {
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

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getInfo(): String {
        return this.info
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setInfo(info: String) {
        this.info = info
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPropsInfo(): ArrayList<String> {
        return propsInfo
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPropsInfo(info: String): Unit {
        propsInfo.add(info)
    }

    protected func notifyRead() {
        if (!isPartialUpdate()) {
            notifyReadInner(info)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func notifyChanges() {
        if (isPartialUpdate()) {
            notifyChangesInner(info, dependentElementIds_)
        } else {
            notifyChangesInner(info)
        }
    }
}
