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

func isEqual<T>(value: T, newValue: T): Bool {
    newValue is Equatable<T> && (newValue as Equatable<T>).getOrThrow() == value
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ObservedProperty<T> <: ObservedPropertyAbstract {
    private var internalValue: T
    private let subProps_ = ArrayList<ObservedProperty<T>>()

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(info: String, initValue: T) {
        super(info)
        this.internalValue = initValue
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) => v.setDependentElementIds(dependentElementIds_)
            case _ => ()
        }
    }

    private func setInternalValue(newValue: T) {
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) =>
                let newObservedObject = newValue as ObservedComplexAbstract
                v.set(newObservedObject.getOrThrow())
            case _ => this.internalValue = newValue
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get(): T {
        recordDependentUpdate()
        notifyRead()
        this.internalValue
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getInner(): T {
        this.internalValue
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func set(newValue: T): Unit {
        if (isEqual<T>(internalValue, newValue)) {
            return
        }
        this.setInternalValue(newValue)
        this.notifyChanges()
        for (subProp in subProps_) {
            subProp.set(newValue)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func subscribeEx(observer: Observer) {
        subscribe(observer)
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) =>
                v.subscribeInner(observer)
                v.setInfo(info)
            case _ => ()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribeEx(observer: Observer) {
        unsubscribe(observer)
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) =>
                v.unsubscribeInner(observer)
            case _ => ()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createProp(info: String): ObservedProperty<T> {
        let result = ObservedProperty<T>(info, internalValue)
        subProps_.add(result)
        result
    }
}
