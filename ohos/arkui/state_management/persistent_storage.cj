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
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.*
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkPersistentGetString(key: CString): NativeOptionCString

    func FfiOHOSAceFrameworkPersistentGetInt64(key: CString): NativeOptionInt64

    func FfiOHOSAceFrameworkPersistentGetFloat64(key: CString): NativeOptionFloat64

    func FfiOHOSAceFrameworkPersistentGetBool(key: CString): NativeOptionBool

    func FfiOHOSAceFrameworkPersistentSetString(key: CString, value: CString, notify: Int64): Unit

    func FfiOHOSAceFrameworkPersistentSetInt64(key: CString, value: Int64, notify: Int64): Unit

    func FfiOHOSAceFrameworkPersistentSetFloat64(key: CString, value: Float64, notify: Int64): Unit

    func FfiOHOSAceFrameworkPersistentSetBool(key: CString, value: Bool, notify: Int64): Unit

    func FfiOHOSAceFrameworkPersistentDelete(key: CString): Unit

    func FfiOHOSAceFrameworkPersistentClear(): Unit
}

/**
 * Handles notification callback with string parameters.
 *
 * @params key Key parameter passed as CString
 * @params value Value parameter passed as CString
 * @returns
 */
func notifyCallbackString(key: CString, value: CString): Unit {
    AppStorage.setOrCreate<String>(key.toString(), value.toString())
}

/**
 * Notification callback function for handling key-value pairs with Int64 type values.
 *
 * @params key Key as a CString, which is converted to a String internally
 * @params value Value of type Int64
 * @returns
 */
func notifyCallbackInt64(key: CString, value: Int64): Unit {
    AppStorage.setOrCreate<Int64>(key.toString(), value)
}

/**
 * Notification callback function for handling key-value pairs with Float64 type values.
 *
 * @params key Key as a CString, which is converted to a String internally
 * @params value Value of type Float64
 * @returns
 */
func notifyCallbackFloat64(key: CString, value: Float64): Unit {
    AppStorage.setOrCreate<Float64>(key.toString(), value)
}

/**
 * Notification callback function for handling key-value pairs with Bool type values.
 *
 * @params key Key as a CString, which is converted to a String internally
 * @params value Value of type Bool
 * @returns
 */
func notifyCallbackBool(key: CString, value: Bool): Unit {
    AppStorage.setOrCreate<Bool>(key.toString(), value)
}

/**
 * Defines the PersistentStorage interface.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PersistentStorage <: Observer {
    protected static var instance: ?PersistentStorage = None
    protected let links: HashMap<String, ObservedPropertyAbstract>
    private let subId: Int64

    private init() {
        links = HashMap<String, ObservedPropertyAbstract>()
        subId = SubscriberManager.getInstance().makeId()
        SubscriberManager.getInstance().add(this)
    }

    /**
     * Called when a state update occurs in the observed properties.
     * This method is triggered when any of the persistent properties change.
     *
     * @param { String } _.
     * @param { ArrayList<Int64> } _.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func onStateUpdate(_: String, _: ArrayList<Int64>): Unit {
        innerPropertyHasChanged()
    }

    /**
     * Notifies when a property is read.
     * This method is called when a property value is accessed.
     *
     * @param { String } _.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func notifyRead(_: String): Unit {}

    /**
     * Gets the unique identifier of the PersistentStorage instance.
     *
     * @returns { Int64 } The unique identifier of this PersistentStorage instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func id(): Int64 {
        subId
    }

    /**
     * Prepares the PersistentStorage instance for deletion, cleaning up any resources.
     * This method cleans up all persistent properties and resets the instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func aboutToBeDeleted(): Unit {
        PersistentStorage.getOrCreate().innerAboutToBeDeleted()
        PersistentStorage.instance = None
    }

    private func innerKeys(): EquatableCollection<String> {
        links.keys()
    }

    private static func getOrCreate(): PersistentStorage {
        match (PersistentStorage.instance) {
            case None => PersistentStorage.instance = PersistentStorage()
            case Some(v) => ()
        }
        PersistentStorage.instance.getOrThrow({
            => BusinessException(100001, "Internal error.")
        })
    }

    /**
     * Called when a persistence property is stored.
     * This method makes an AppStorage property persistent by storing its value across application restarts.
     *
     * @param { String } key.
     * @param { T } defaultValue.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func persistProp<T>(key: String, defaultValue: T): Unit {
        PersistentStorage.getOrCreate().innerPersistProp(key, defaultValue)
    }

    /**
     * Persist given AppStorage properties with given names.
     * If a property does not exist in AppStorage, add it and initialize it with given value.
     * Works as persistProp for multiple properties at once.
     *
     * @param { Array<(String, T)> } props.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func persistProps<T>(props: Array<(String, T)>): Unit {
        PersistentStorage.getOrCreate().innerPersistProps(props)
    }

    /**
     * Reverse of persistProp.
     * Stops persisting the property with the given name and removes it from persistent storage.
     *
     * @param { String } key.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func deleteProp(key: String): Unit {
        PersistentStorage.getOrCreate().innerDeleteProp(key)
    }

    /**
     * Inform persisted AppStorage property names.
     * Returns an array containing the names of all currently persistent properties.
     *
     * @returns { Array<String> } Array of AppStorage keys representing the names of persistent properties.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func keys(): Array<String> {
        PersistentStorage.getOrCreate().innerKeys().toArray()
    }

    // invoke when property changed by appstorge operation
    private func innerPropertyHasChanged(): Unit {
        BaseLog.debug("Property has changed")
        write()
    }

    private func innerPersistProp<T>(propName: String, defaultValue: T): Unit {
        if (!(defaultValue is String) && !(defaultValue is Int64) && !(defaultValue is Float64) &&
            !(defaultValue is Bool)) {
            BaseLog.error("PersistentStorage: ${propName} type error, only support String, Int64, Float64 and Bool.")
            return
        }
        if (persistHelper(propName, defaultValue)) {
            unsafe {
                var cProp: ?CString = None
                var cValue: ?CString = None
                try {
                    cProp = LibC.mallocCString(propName)
                    let val = this.links.get(propName).getOrThrow()

                    if (let Some(v) <- (val as ObservedProperty<String>)) {
                        cValue = LibC.mallocCString(v.get())
                        FfiOHOSAceFrameworkPersistentSetString(
                            cProp.getOrThrow(),
                            cValue.getOrThrow(),
                            Callback2Param<CString, CString, Unit>(notifyCallbackString).getID()
                        )
                    }

                    if (let Some(v) <- (val as ObservedProperty<Int64>)) {
                        FfiOHOSAceFrameworkPersistentSetInt64(
                            cProp.getOrThrow(),
                            v.get(),
                            Callback2Param<CString, Int64, Unit>(notifyCallbackInt64).getID()
                        )
                    }

                    if (let Some(v) <- (val as ObservedProperty<Float64>)) {
                        FfiOHOSAceFrameworkPersistentSetFloat64(
                            cProp.getOrThrow(),
                            v.get(),
                            Callback2Param<CString, Float64, Unit>(notifyCallbackFloat64).getID()
                        )
                    }

                    if (let Some(v) <- (val as ObservedProperty<Bool>)) {
                        FfiOHOSAceFrameworkPersistentSetBool(
                            cProp.getOrThrow(),
                            v.get(),
                            Callback2Param<CString, Bool, Unit>(notifyCallbackBool).getID()
                        )
                    }
                } finally {
                    cValue?.free()
                    cProp?.free()
                }
            }
        }
    }

    private func innerPersistProps<T>(properties: Array<(String, T)>): Unit {
        for (item in properties) {
            persistHelper(item[0], item[1])
        }
        write()
    }

    private func persistHelper<T>(propName: String, defaultValue: T): Bool {
        if (links.contains(propName)) {
            BaseLog.debug("PersistentStorage: persistProp: ${propName} is already persisted")
            return false
        }
        let link = AppStorage.link<T>(propName)
        if (let Some(v) <- link) {
            links.add(propName, v)
            return true
        }

        unsafe {
            let key = LibC.mallocCString(propName)
            var value: ?T = defaultValue
            if (defaultValue is String) {
                let nativeRes = FfiOHOSAceFrameworkPersistentGetString(key)
                if (nativeRes.hasValue) {
                    value = nativeRes.value.toString() as T ?? defaultValue
                }
                nativeRes.free()
            }
            if (defaultValue is Int64) {
                let nativeRes = FfiOHOSAceFrameworkPersistentGetInt64(key)
                if (nativeRes.hasValue) {
                    value = nativeRes.value as T ?? defaultValue
                }
            }
            if (defaultValue is Float64) {
                let nativeRes = FfiOHOSAceFrameworkPersistentGetFloat64(key)
                if (nativeRes.hasValue) {
                    value = nativeRes.value as T ?? defaultValue
                }
            }
            if (defaultValue is Bool) {
                let nativeRes = FfiOHOSAceFrameworkPersistentGetBool(key)
                if (nativeRes.hasValue) {
                    value = nativeRes.value as T ?? defaultValue
                }
            }
            let newLink = AppStorage.setAndLink<T>(propName, value.getOrThrow())
            newLink.subscribeEx(this)
            links.add(propName, newLink)
            LibC.free(key)
        }
        return true
    }

    private func write(): Unit {
        unsafe {
            for (propName in innerKeys()) {
                var cKey: ?CString = None
                var cValue: ?CString = None
                try {
                    cKey = LibC.mallocCString(propName)
                    let value = links.get(propName).getOrThrow()
                    if (let Some(v) <- (value as ObservedProperty<String>)) {
                        cValue = LibC.mallocCString(v.get())
                        FfiOHOSAceFrameworkPersistentSetString(
                            cKey.getOrThrow(),
                            cValue.getOrThrow(),
                            Callback2Param<CString, CString, Unit>(notifyCallbackString).getID()
                        )
                    }

                    if (let Some(v) <- (value as ObservedProperty<Int64>)) {
                        FfiOHOSAceFrameworkPersistentSetInt64(
                            cKey.getOrThrow(),
                            v.get(),
                            Callback2Param<CString, Int64, Unit>(notifyCallbackInt64).getID()
                        )
                    }

                    if (let Some(v) <- (value as ObservedProperty<Float64>)) {
                        FfiOHOSAceFrameworkPersistentSetFloat64(
                            cKey.getOrThrow(),
                            v.get(),
                            Callback2Param<CString, Float64, Unit>(notifyCallbackFloat64).getID()
                        )
                    }

                    if (let Some(v) <- (value as ObservedProperty<Bool>)) {
                        FfiOHOSAceFrameworkPersistentSetBool(
                            cKey.getOrThrow(),
                            v.get(),
                            Callback2Param<CString, Bool, Unit>(notifyCallbackBool).getID()
                        )
                    }
                } finally {
                    cValue?.free()
                    cKey?.free()
                }
            }
        }
    }

    private func innerDeleteProp(propName: String): Unit {
        let link = links.get(propName);
        match (link) {
            case Some(v) =>
                v.unsubscribeEx(this)
                links.remove(propName)
                unsafe {
                    let cstr = LibC.mallocCString(propName)
                    FfiOHOSAceFrameworkPersistentDelete(cstr)
                    LibC.free(cstr)
                }
            case None => ()
        }
    }

    private func innerAboutToBeDeleted(): Unit {
        for (propName in innerKeys()) {
            var p: Option<ObservedPropertyAbstract> = links.get(propName)
            match (p) {
                case Some(v) =>
                    if (v.numberOfSubscribers() > 0) {
                        v.unsubscribeEx(this)
                    }
                case None => ()
            }
        }
        links.clear()
        unsafe {
            FfiOHOSAceFrameworkPersistentClear()
        }
    }
}
