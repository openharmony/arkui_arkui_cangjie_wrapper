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

/**
 * AppStorage singleton is sub-class of see LocalStorage for
 * UI state of app-wide access and same life cycle as the app.
 *
 * @relation declare class AppStorage
 */
@!APILevel[
    21,
    stagemodelonly: true,
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
        return AppStorage.instance.getOrThrow()
    }

    /**
     * Create and return a two-way sync ("link") to named property
     *
     * @param { String } propName - name of source property in AppStorage
     * @returns { ?ObservedProperty<T> } instance of ObservedProperty<T>, return 'None' if named property does not already exist in AppStorage
     * @relation static link<T>(propName: string): SubscribedAbstractProperty<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func link<T>(propName: String): ?ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.link<T>(propName)
    }

    /**
     * Like see @link(), but will create and initialize a new source property in AppStorage if missing
     * Same as see LocalStorage.setAndLink()
     *
     * @param { String } propName - name of source property in AppStorage
     * @param { T } defaultValue - value to be used for initializing new property in AppStorage
     *        default value must be of type T, can be None.
     * @returns { ObservedProperty<T> } instance of ObservedProperty<T>.
     * @relation static setAndLink<T>(propName: string, defaultValue: T): SubscribedAbstractProperty<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.setAndLink<T>(propName, defaultValue)
    }

    /**
     * Create and return a one-way sync ('prop') to named property
     *
     * @param { String } propName - name of source property in AppStorage
     * @returns { ?ObservedProperty<T> } instance of ObservedProperty<T>, return None if named property does not already exist in AppStorage.
     * @relation static prop<T>(propName: string): SubscribedAbstractProperty<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func `prop`<T>(propName: String): ?ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.`prop`<T>(propName)
    }

    /**
     *
     * Like prop(), will create and initialize a new source property in AppStorage if missing
     * Same as see LocalStorage.setAndProp()
     *
     * @param { String } propName - name of source property in AppStorage
     * @param { T } defaultValue - value to be used for initializing new property in AppStorage.
     * @returns { ObservedProperty<T> } instance of  ObservedProperty<T>.
     * @relation static setAndProp<T>(propName: string, defaultValue: T): SubscribedAbstractProperty<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.setAndProp<T>(propName, defaultValue)
    }

    /**
     * Checks if AppStorage has a property with given name
     * returns true if property with given name exists
     * same as ES6 Map.prototype.has()
     * Same as see LocalStorage.has()
     *
     * @param { String } propName - searched property
     * @returns { Bool } true if property with such name exists in AppStorage
     * @relation static has(propName: string): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func has(propName: String): Bool {
        return AppStorage.getOrCreate().storage.has(propName)
    }

    /**
     * Same as see LocalStorage.get()
     * Obtain the value of property with given name, returns undefined if the property does not exist in AppStorage.
     *
     * @param { String } propName
     * @returns { ?T } property value of type T if found or None
     * @relation static get<T>(propName: string): T | undefined;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func get<T>(propName: String): ?T {
        return AppStorage.getOrCreate().storage.get<T>(propName)
    }

    /**
     * Set value of given property in AppStorage
     * Method sets nothing and returns false if property with this name does not exist in AppStorage.
     * Same as see LocalStorage.set()
     *
     * @param { String } propName
     * @param { T } newValue - must be of type T
     * @returns { Bool } true on success, i.e. when above conditions are satisfied, otherwise false
     * @relation static set<T>(propName: string, newValue: T): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func set<T>(propName: String, newValue: T): Bool {
        return AppStorage.getOrCreate().storage.set<T>(propName, newValue)
    }

    /**
     * Set value of given property, if it exists, see set() .
     * Add property if no property with given name in AppStorage, and initialize with given value.
     * newValue can be undefined or null from API 12
     * see LocalStorage.setOrCreate()
     *
     * @param { String } propName
     * @param { T } newValue - must be of type T
     * @relation static setOrCreate<T>(propName: string, newValue: T): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setOrCreate<T>(propName: String, newValue: T): Unit {
        AppStorage.getOrCreate().storage.setOrCreate<T>(propName, newValue)
    }

    /**
     * Delete property with given name from AppStorage
     * Use with caution:
     * Before deleting a prop from AppStorage all its subscribers need to
     * unsubscribe from the property.
     * This method fails and returns false if given property still has subscribers
     * Another reason for failing is unknown property name.
     * Developer advise:
     * Subscribers to a property in AppStorage are created with see link(), see prop()
     * and also via @StorageLink and @StorageProp state variable decorators.
     * That means as long as their is a @Component instance that uses such decorated variable
     * or a sync relationship with a SubscribedAbstractProperty variable the property can not
     * (and also should not!) be deleted from AppStorage.
     * Same as see LocalStorage.delete()
     *
     * @param { String } propName
     * @returns { Bool } false if method failed
     * @relation static delete(propName: string): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func delete(propName: String): Bool {
        AppStorage.getOrCreate().storage.delete(propName)
    }

    /**
     * Provide names of all properties in AppStorage
     * same as ES6 Map.prototype.keys()
     * Same as see LocalStorage.keys()
     *
     * @returns {  EquatableCollection<String> } return a Map Iterator
     * @relation static keys(): IterableIterator<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func keys(): EquatableCollection<String> {
        return AppStorage.getOrCreate().storage.keys()
    }

    /**
     * Method returns the number of properties currently in AppStorage
     *
     * @returns { Int64 } Returns the number of properties currently in AppStorage
     * @relation static size(): number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation static clear(): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func clear(): Bool {
        return AppStorage.getOrCreate().storage.clear()
    }
}
