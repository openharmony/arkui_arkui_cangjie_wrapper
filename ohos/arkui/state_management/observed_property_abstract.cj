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
import std.collection.*

/**
 * Defines class ObservedPropertyAbstract.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ObservedPropertyAbstract <: Observable {
    protected let info: String
    protected let dependentElementIds_: ArrayList<Int64> = ArrayList<Int64>()

    /**
     * ObservedPropertyAbstract constructor.
     *
     * @params { String } info
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(info: String) {
        this.info = info
    }

    protected func getInfo(): String {
        return this.info
    }

    /**
     *
     * @params { Observer } observer
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func subscribeEx(observer: Observer): Unit

    /**
     *
     * @params { Observer } observer
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribeEx(observer: Observer): Unit

    protected func notifyChanges() {
        notifyChangesInner(info, dependentElementIds_)
    }

    protected func recordDependentUpdate() {
        let elmtId = ViewStackProcessor.GetElmtIdToAccountFor()
        if (elmtId < 0) {
            return
        }
        dependentElementIds_.add(elmtId)
        ()
    }

    /**
     *
     * @params { Int64 } rmElmtId
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func purgeDependencyOnElmtId(rmElmtId: Int64): Unit {
        this.dependentElementIds_.removeIf({
            v => v == rmElmtId
        })
    }
}
