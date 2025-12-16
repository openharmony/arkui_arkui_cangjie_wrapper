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
import std.collection.{EquatableCollection}
import ohos.business_exception.BusinessException

/**
 * AppStorage singleton is sub-class of see LocalStorage for
 * UI state of app-wide access and same life cycle as the app.
 * Provides a centralized storage for application-wide state management.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AppStorage {
    protected static var instance: ?AppStorage = None

    private var storage: LocalStorage = LocalStorage()

    private static func getOrCreate(): AppStorage {
        match (AppStorage.instance) {
            case None => AppStorage.instance = AppStorage()
            case Some(v) => ()
        }
        return AppStorage.instance.getOrThrow({
            => BusinessException(100001, "Internal error.")
        })
    }

    /**
     * Establishes a bidirectional synchronization between a component variable and an AppStorage property.
     *
     * @param { String } propName - name of source property in AppStorage
     * @returns { ?ObservedProperty<T> } The instance of ObservedProperty<T>, return 'None' if named property does not already exist in AppStorage.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func link<T>(propName: String): ?ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.link<T>(propName)
    }

    /**
     * Like see @link(), but will create and initialize a new source property in AppStorage if missing
     * Same as see LocalStorage.setAndLink()
     *
     * @param { String } propName - name of source property in AppStorage.
     * @param { T } defaultValue - value to be used for initializing new property in AppStorage,
     * default value must be of type T, can be None.
     * @returns { ObservedProperty<T> } The instance of ObservedProperty<T>.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.setAndLink<T>(propName, defaultValue)
    }

    /**
     * Create and return a one-way sync ('prop') to named property.
     * Establishes a unidirectional synchronization from AppStorage to a component variable.
     *
     * @param { String } propName - name of source property in AppStorage.
     * @returns { ?ObservedProperty<T> } instance of ObservedProperty<T>, return None if named property does not already exist in AppStorage.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func property<T>(propName: String): ?ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.property<T>(propName)
    }

    /**
     * Like prop(), will create and initialize a new source property in AppStorage if missing.
     * Same as see LocalStorage.setAndProp().
     *
     * @param { String } propName - name of source property in AppStorage.
     * @param { T } defaultValue - value to be used for initializing new property in AppStorage.
     * @returns { ObservedProperty<T> } The instance of  ObservedProperty<T>.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.setAndProp<T>(propName, defaultValue)
    }

    /**
     * Checks if AppStorage has a property with given name.
     * Returns true if property with given name exists.
     * Same as ES6 Map.prototype.has().
     * Same as see LocalStorage.has().
     *
     * @param { String } propName - searched property
     * @returns { Bool } true if property with such name exists in AppStorage.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func has(propName: String): Bool {
        return AppStorage.getOrCreate().storage.has(propName)
    }

    /**
     * Same as see LocalStorage.get().
     * Obtain the value of property with given name, returns undefined if the property does not exist in AppStorage.
     *
     * @param { String } propName - name of the property to retrieve
     * @returns { ?T } property value of type T if found or None.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func get<T>(propName: String): ?T {
        return AppStorage.getOrCreate().storage.get<T>(propName)
    }

    /**
     * Set value of given property in AppStorage.
     * Method sets nothing and returns false if property with this name does not exist in AppStorage.
     * Same as see LocalStorage.set().
     *
     * @param { String } propName - name of the property to set
     * @param { T } newValue - must be of type T
     * @returns { Bool } true on success, i.e. when above conditions are satisfied, otherwise false.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func set<T>(propName: String, newValue: T): Bool {
        return AppStorage.getOrCreate().storage.set<T>(propName, newValue)
    }

    /**
     * Set value of given property, if it exists, see set() .
     * Add property if no property with given name in AppStorage, and initialize with given value.
     * newValue can be undefined or null from API 12.
     * see LocalStorage.setOrCreate().
     *
     * @param { String } propName - name of the property to set or create
     * @param { T } newValue - must be of type T.
     * @returns { Unit }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setOrCreate<T>(propName: String, newValue: T): Unit {
        AppStorage.getOrCreate().storage.setOrCreate<T>(propName, newValue)
    }

    /**
     * Delete property with given name from AppStorage.
     * Use with caution:
     * Before deleting a prop from AppStorage all its subscribers need to
     * unsubscribe from the property.
     * This method fails and returns false if given property still has subscribers.
     * Another reason for failing is unknown property name.
     * Developer advise:
     * Subscribers to a property in AppStorage are created with see link(), see prop()
     * and also via @StorageLink and @StorageProp state variable decorators.
     * That means as long as their is a @Component instance that uses such decorated variable
     * or a sync relationship with a SubscribedAbstractProperty variable the property can not
     * (and also should not!) be deleted from AppStorage.
     * Same as see LocalStorage.delete()
     *
     * @param { String } propName - name of the property to delete
     * @returns { Bool } false if method failed.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func delete(propName: String): Bool {
        AppStorage.getOrCreate().storage.delete(propName)
    }

    /**
     * Provide names of all properties in AppStorage.
     * Same as ES6 Map.prototype.keys().
     * Same as see LocalStorage.keys().
     *
     * @returns { EquatableCollection<String> } Return a Map Iterator.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func keys(): EquatableCollection<String> {
        return AppStorage.getOrCreate().storage.keys()
    }

    /**
     * Method returns the number of properties currently in AppStorage.
     *
     * @returns { Int64 } Returns the number of properties currently in AppStorage.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func size(): Int64 {
        return AppStorage.getOrCreate().storage.size()
    }

    /**
     * Delete all properties from the AppStorage.
     * Precondition is that there are no subscribers, see Delete().
     *
     * @returns { boolean } false and deletes no properties if there is any property that still has subscribers.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func clear(): Bool {
        return AppStorage.getOrCreate().storage.clear()
    }
}
