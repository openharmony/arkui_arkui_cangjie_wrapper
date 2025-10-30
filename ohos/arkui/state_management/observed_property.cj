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

import ohos.labels.APILevel
import std.collection.{ArrayList}

func isEqual<T>(value: T, newValue: T): Bool {
    newValue is Equatable<T> && (newValue as Equatable<T>).getOrThrow() == value
}

/**
 * Defines class ObservedProperty.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ObservedProperty<T> <: ObservedPropertyAbstract {
    private var internalValue: T
    private let subProps_ = ArrayList<ObservedProperty<T>>()

    /**
     * ObservedProperty constructor.
     *
     * @param { String } info - Information about the property.
     * @param { T } initValue - Initial value for the property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
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

    /**
     * Gets the current value of the observed property. And record the dependency elements that need to be updated.
     *
     * @returns { T } The current value of the property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func get(): T {
        recordDependentUpdate()
        this.internalValue
    }

    protected func getInner(): T {
        this.internalValue
    }

    /**
     * Sets a new value for the observed property. Enable observers to receive updated information whenever state variables change.
     * If the new value is equal to the current value, no changes will be made.
     * Otherwise, it updates the value and notifies all subscribers of the change.
     *
     * @param { T } newValue - The new value to set.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
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

    /**
     * Subscribes an observer to this property and its nested observed objects.
     * The observer will be notified when the property value changes.
     *
     * @param { Observer } observer - The observer to subscribe.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
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

    /**
     * Unsubscribes an observer from this property and its nested observed objects.
     *
     * @param { Observer } observer - The observer to unsubscribe.
     * @returns { Unit }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func unsubscribeEx(observer: Observer) {
        unsubscribe(observer)
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) =>
                v.unsubscribeInner(observer)
            case _ => ()
        }
    }

    /**
     * Creates a new property that shares the same value as this property.
     *
     * @param { String } info - Information about the new property.
     * @returns { ObservedProperty<T> } A new ObservedProperty instance sharing the same value.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func createProp(info: String): ObservedProperty<T> {
        let result = ObservedProperty<T>(info, internalValue)
        subProps_.add(result)
        result
    }
}
