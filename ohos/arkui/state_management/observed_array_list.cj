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

import ohos.base.{CollectionEx}
import ohos.labels.APILevel
import std.collection.{ArrayList}
import ohos.business_exception.BusinessException

/**
 * Defines class ObservedArrayList.
 * An observable array list that can be used for reactive state management.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ObservedArrayList<T> <: ObservedComplexAbstract & CollectionEx<T> {
    private var internalValue: ArrayList<T>

    /**
     * Creates an ObservedArrayList from an ArrayList.
     *
     * @param { ArrayList<T> } initValue - Initial values for the array list.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(initValue: ArrayList<T>) {
        this.internalValue = initValue
    }

    /**
     * Creates an ObservedArrayList from an Array.
     *
     * @param { Array<T> } initValue - Initial values for the array list.
     */
    @!APILevel[
        since: "22",
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

    protected func subscribeInner(observer: Observer): Unit {
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

    protected func unsubscribeInner(observer: Observer): Unit {
        unsubscribe(observer)
        for (arrItem in internalValue) {
            let observedItem = arrItem as ObservedComplexAbstract
            match (observedItem) {
                case Some(v) => v.unsubscribeInner(observer)
                case _ => ()
            }
        }
    }

    /**
     * Gets the current ArrayList value. And record the dependency elements that need to be updated.
     *
     * @returns { ArrayList<T> } - The current ArrayList value.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func get(): ArrayList<T> {
        recordDependentUpdate()
        this.internalValue
    }

    /**
     * Sets the current ArrayList value. Enable observers to receive updated information whenever state variables change.
     *
     * @param { ArrayList<T> } newValue - The new ArrayList value to set.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func set(newValue: ArrayList<T>): Unit {
        this.setInternalValue(newValue)
        this.notifyChanges()
    }

    /**
     * Sets the current ArrayList value from another Array object. Enable observers to receive updated information whenever state variables change.
     *
     * @param { Array<T> } newValue - The new Array value to set.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func set(newValue: Array<T>): Unit {
        this.setInternalValue(ArrayList<T>(newValue))
        this.notifyChanges()
    }

    /**
     * Sets the current ArrayList value from another ObservedComplexAbstract object. Enable observers to receive updated information whenever state variables change.
     *
     * @param { ObservedComplexAbstract } newValue - The new ObservedComplexAbstract value to set.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func set(newValue: ObservedComplexAbstract): Unit {
        let observedArray = newValue as ObservedArrayList<T>
        this.setInternalValue(
            observedArray.getOrThrow(
                {
                    => BusinessException(100001, "Internal error.")
                }))
        this.notifyChanges()
    }

    /**
     * Gets the element at the specified index in the observed array list. And record the dependency elements that need to be updated.
     *
     * @param { Int64 } index - The zero-based index of the element to get.
     * @returns { T } The element at the specified index.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func [](index: Int64): T {
        recordDependentUpdate()
        return internalValue[index]
    }

    /**
     * Sets the element at the specified index in the observed array list. Enable observers to receive updated information whenever state variables change.
     *
     * @param { Int64 } index - The zero-based index of the element to set.
     * @param { T } value - The new value to set at the specified index.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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

    /**
     * Gets the number of elements in the observed array list.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop size: Int64 {
        get() {
            this.internalValue.size
        }
    }

    /**
     * Checks if the observed array list is empty.
     *
     * @returns { Bool } true if the array list is empty, false otherwise.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func isEmpty(): Bool {
        return internalValue.isEmpty()
    }

    /**
     * Creates a shallow copy of the observed array list. This function also record the dependency elements that need to be updated.
     *
     * @returns { ObservedArrayList<T> } A new ObservedArrayList instance with the same elements.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clone(): ObservedArrayList<T> {
        return ObservedArrayList<T>(this.get())
    }

    /**
     * Removes all elements from the observed array list. Enable observers to receive updated information whenever state variables change.
     *
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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

    /**
     * Adds an element to the end of the observed array list. This function can enable observers to receive updated information whenever state variables change.
     *
     * @param { T } element - The element to append to the array list.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func append(element: T): Unit {
        internalValue.add(element)
        inheritObservers(element)
        this.notifyChanges()
    }

    /**
     * Adds all elements from a collection to the end of the observed array list. This function can enable observers to receive updated information whenever state variables change.
     *
     * @param { Collection<T> } elements - The collection of elements to append.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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

    /**
     * Inserts an element at the specified position in the observed array list. This function can enable observers to receive updated information whenever state variables change.
     *
     * @param { Int64 } index - The zero-based index at which to insert the element.
     * @param { T } element - The element to insert.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func insert(index: Int64, element: T): Unit {
        internalValue.add(element, at: index)
        inheritObservers(element)
        this.notifyChanges()
    }

    /**
     * Inserts all elements from a collection at the specified position in the observed array list. This function can enable observers to receive updated information whenever state variables change.
     *
     * @param { Int64 } index - The zero-based index at which to insert the elements.
     * @param { Collection<T> } elements - The collection of elements to insert.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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

    /**
     * Adds an element to the beginning of the observed array list. This function can enable observers to receive updated information whenever state variables change.
     *
     * @param { T } element - The element to prepend to the array list.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func prepend(element: T): Unit {
        internalValue.add(element, at: 0)
        inheritObservers(element)
        this.notifyChanges()
    }

    /**
     * Adds all elements from a collection to the beginning of the observed array list. This function can enable observers to receive updated information whenever state variables change.
     *
     * @param { Collection<T> } elements - The collection of elements to prepend.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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

    /**
     * Removes and returns the element at the specified index. Enable observers to receive updated information whenever state variables change.
     *
     * @param { Int64 } index - The zero-based index of the element to remove.
     * @returns { T } The removed element.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func remove(index: Int64): T {
        let removeElement = internalValue.remove(at: index)
        this.notifyChanges()
        return removeElement
    }

    /**
     * Removes elements in the specified range from the observed array list. Enable observers to receive updated information whenever state variables change.
     *
     * @param { Range<Int64> } range - The range of indices to remove.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func remove(range: Range<Int64>): Unit {
        internalValue.remove(range)
        this.notifyChanges()
    }

    /**
     * Removes all elements that satisfy the provided predicate.
     *
     * @param { (T) -> Bool } predicate - A function that returns true for elements to be removed. Enable observers to receive updated information whenever state variables change.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeIf(predicate: (T) -> Bool): Unit {
        internalValue.removeIf(predicate)
        this.notifyChanges()
    }
}
