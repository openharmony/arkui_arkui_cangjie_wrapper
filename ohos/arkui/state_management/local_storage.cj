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
import ohos.business_exception.BusinessException

/**
 * LocalStorage
 * Class implements a Map of ObservableObjectBase UI state variables.
 * Instances can be created to manage UI state within a limited "local"
 * access, and life cycle as defined by the app.
 * AppStorage singleton is sub-class of LocalStorage for
 * UI state of app-wide access and same life cycle as the app.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalStorage {
    protected let storage: HashMap<String, ObservedPropertyAbstract>

    /**
     * Construct new instance of LocalStorage
     * initialize with all properties and their values that Object.keys(params) returns
     * Property values must not be undefined.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this.storage = HashMap<String, ObservedPropertyAbstract>()
    }

    /**
     * Prepares the LocalStorage instance for deletion by clearing all properties.
     * This function calls clear() internally which removes all properties from storage
     * after ensuring no property has active subscribers.
     * 
     * @returns { Bool } true if all properties were successfully cleared and the instance 
     *         is ready for deletion, false if there are still active subscribers 
     *         preventing cleanup.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToBeDeleted(): Bool {
        return this.clear()
    }

    /**
     * Check if LocalStorage has a property with given name.
     * Return true if property with given name exists.
     * Same as ES6 Map.prototype.has().
     *
     * @param { String } propName - searched property.
     * @returns { Bool } true if property with such name exists in LocalStorage.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func has(propName: String): Bool {
        return this.storage.contains(propName)
    }

    /**
     * Provide names of all properties in LocalStorage.
     * Same as ES6 Map.prototype.keys().
     *
     * @returns { EquatableCollection<String> }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keys(): EquatableCollection<String> {
        return this.storage.keys()
    }

    /**
     * Returns number of properties in LocalStorage.
     * Same as Map.prototype.size().
     *
     * @returns { Int64 } return number of properties.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(): Int64 {
        return this.storage.size
    }

    /**
     * Returns value of given property.
     * Returns undefined if no property with this name.
     *
     * @param { String } propName
     * @returns { ?T } property value if found.
     */
    @!APILevel[
        22,
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

    /**
     * Set value of given property in LocalStorage.
     * Method sets nothing and returns false if property with this name does not exist in LocalStorage.
     * newValue can be undefined or null from API 12.
     *
     * @param { String } propName
     * @param { T } newValue - must be of type T.
     * @returns { Bool } true on success.
     */
    @!APILevel[
        22,
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

    /**
     * Set value of given property, if it exists, see set() .
     * Add property if no property with given name and initialize with given value.
     * newValue can be undefined or null from API 12.
     *
     * @param { String } propName
     * @param { T } newValue - must be of type T, can be undefined or null.
     * @returns { boolean } true on success, i.e. when above conditions are satisfied, otherwise false.
     */
    @!APILevel[
        22,
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

    /**
     * Create and return a two-way sync "(link") to named property.
     *
     * @param { String } propName - name of source property in LocalStorage.
     * @returns { ?ObservedProperty<T> } instance of ObservedProperty<T>.
     */
    @!APILevel[
        22,
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

    /**
     * Like see link(), but will create and initialize a new source property in LocalStorage if missing.
     *
     * @param { String } propName - name of source property in LocalStorage
     * @param { T } defaultValue - value to be used for initializing new property in LocalStorage
     *        default value must be of type T.
     * @returns { ObservedProperty<T> } instance of  ObservedProperty<T>. Apps can use SDK functions of base class ObservedProperty<T>
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case None => this.setOrCreate<T>(propName, defaultValue)
            case _ => ()
        }
        return this.link<T>(propName).getOrThrow({
            => BusinessException(100001, "Internal error.")
        })
    }

    /**
     * Create and return a one-way sync ('prop') to named property.
     *
     * @param { String } propName - name of source property in LocalStorage.
     * @returns { ?ObservedProperty<T> } instance of ObservedProperty<T>.
     */
    @!APILevel[
        22,
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

    /**
     * Like see prop(), will create and initialize a new source property in LocalStorage if missing.
     *
     * @param { String } propName - name of source property in LocalStorage.
     * @param { T } defaultValue - value to be used for initializing new property in LocalStorage.
     *         Default value must be of type T.
     * @returns { ObservedProperty<T> } instance of ObservedProperty<T>.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        var p: Option<ObservedPropertyAbstract> = this.storage.get(propName)
        match (p) {
            case None => this.setOrCreate(propName, defaultValue)
            case _ => ()
        }
        return this.`prop`<T>(propName).getOrThrow({
            => BusinessException(100001, "Internal error.")
        })
    }

    /**
     * Delete property from StorageBase.
     * Use with caution:
     * Before deleting a prop from LocalStorage all its subscribers need to
     * unsubscribe from the property.
     * This method fails and returns false if given property still has subscribers.
     * Another reason for failing is unknown property.
     * Developer advise:
     * Subscribers are created with see link(), see prop()
     * and also via @LocalStorageLink and @LocalStorageProp state variable decorators.
     * That means as long as their is a @Component instance that uses such decorated variable
     * or a sync relationship with a SubscribedAbstractProperty variable the property can nit
     * (and also should not!) be deleted from LocalStorage.
     *
     * @param { String } propName
     * @returns { Bool } false if method failed.
     */
    @!APILevel[
        22,
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

    /**
     * Delete all properties from the LocalStorage instance.
     * Precondition is that there are no subscribers.
     * Method returns false and deletes no properties if there is any property
     * that still has subscribers.
     *
     * @returns { Bool }
     */
    @!APILevel[
        22,
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
