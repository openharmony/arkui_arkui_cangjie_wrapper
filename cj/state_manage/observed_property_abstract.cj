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

import ohos.labels.APILevel
import std.collection.*

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ObservedPropertyAbstract <: Observable {
    protected let info: String
    protected let dependentElementIds_: ArrayList<Int64> = ArrayList<Int64>()

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(info: String) {
        this.info = info
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
    public func subscribeEx(observer: Observer): Unit

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribeEx(observer: Observer): Unit

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

    protected func recordDependentUpdate() {
        let elmtId = ViewStackProcessor.GetElmtIdToAccountFor()
        if (elmtId < 0) {
            return
        }
        dependentElementIds_.add(elmtId)
        ()
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
    public func purgeDependencyOnElmtId(rmElmtId: Int64): Unit {
        this.dependentElementIds_.removeIf({
            v => v == rmElmtId
        })
    }
}
