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

import ohos.base.*
import ohos.labels.APILevel
import std.collection.*

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ObservedArrayList<T> <: ObservedComplexAbstract & ArrayLike<T> {
    private var internalValue: ArrayList<T>

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(initValue: ArrayList<T>) {
        this.internalValue = initValue
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(initValue: Array<T>) {
        this.internalValue = ArrayList<T>(initValue)
    }

    private func setInternalValue(newValue: ArrayList<T>) {
        this.internalValue = newValue
    }

    private func setInternalValue(newValue: ObservedArrayList<T>) {
        this.internalValue = newValue.get()
        for (item in internalValue) {
            let observedItem = item as ObservedComplexAbstract
            match (observedItem) {
                case Some(v) =>
                    // if item in ObservedArray is observed, new item should inherit observers form observedArray
                    v.inheritObservers(getObservers())
                case _ => ()
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func subscribeInner(observer: Observer): Unit {
        subscribe(observer)
        for (arrItem in internalValue) {
            let observedItem = arrItem as ObservedComplexAbstract
            match (observedItem) {
                case Some(v) =>
                    v.subscribeInner(observer)
                    v.setInfo(info)
                case _ => ()
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribeInner(observer: Observer): Unit {
        unsubscribe(observer)
        for (arrItem in internalValue) {
            let observedItem = arrItem as ObservedComplexAbstract
            match (observedItem) {
                case Some(v) => v.unsubscribeInner(observer)
                case _ => ()
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get(): ArrayList<T> {
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
    public func set(newValue: ArrayList<T>): Unit {
        this.setInternalValue(newValue)
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func set(newValue: Array<T>): Unit {
        this.setInternalValue(ArrayList<T>(newValue))
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func set(newValue: ObservedComplexAbstract): Unit {
        let observedArray = newValue as ObservedArrayList<T>
        this.setInternalValue(
            observedArray.getOrThrow(
                {
                    => IllegalArgumentException("Type is mismatched, it should be ObservedArrayList<T>")
                }))
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func [](index: Int64): T {
        recordDependentUpdate()
        notifyRead()
        return internalValue[index]
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func [](index: Int64, value!: T): Unit {
        if (isEqual<T>(internalValue[index], value)) {
            return
        }
        this.internalValue[index] = value
        let realValue = internalValue[index] as ObservedComplexAbstract
        match (realValue) {
            case Some(v) => v.inheritObservers(getObservers())
            case _ => ()
        }
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop size: Int64 {
        get() {
            this.internalValue.size
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func isEmpty(): Bool {
        return internalValue.isEmpty()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clone(): ObservedArrayList<T> {
        return ObservedArrayList<T>(this.get())
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clear(): Unit {
        if (isEmpty()) {
            return
        }
        internalValue.clear()
        this.notifyChanges()
    }

    private func inheritObservers(element: T): Unit {
        match (element as ObservedComplexAbstract) {
            case Some(v) => v.inheritObservers(getObservers())
            case _ => ()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func append(element: T): Unit {
        internalValue.add(element)
        inheritObservers(element)
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func appendAll(elements: Collection<T>): Unit {
        if (elements.isEmpty()) {
            return
        }
        internalValue.add(all: elements)
        for (element in elements) {
            inheritObservers(element)
        }
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func insert(index: Int64, element: T): Unit {
        internalValue.add(element, at: index)
        inheritObservers(element)
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func insertAll(index: Int64, elements: Collection<T>): Unit {
        if (elements.isEmpty()) {
            return
        }
        internalValue.add(all: elements, at: index)
        for (element in elements) {
            inheritObservers(element)
        }
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func prepend(element: T): Unit {
        internalValue.add(element, at: 0)
        inheritObservers(element)
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func prependAll(elements: Collection<T>): Unit {
        if (elements.isEmpty()) {
            return
        }
        internalValue.add(all: elements, at: 0)
        for (element in elements) {
            inheritObservers(element)
        }
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func remove(index: Int64): T {
        let removeElement = internalValue.remove(at: index)
        this.notifyChanges()
        return removeElement
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func remove(range: Range<Int64>): Unit {
        internalValue.remove(range)
        this.notifyChanges()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeIf(predicate: (T) -> Bool): Unit {
        internalValue.removeIf(predicate)
        this.notifyChanges()
    }
}
