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
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.*

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
 * @param key Key parameter passed as CString
 * @param value Value parameter passed as CString
 * @return
 * @note The caller manages the memory of the CString.
 */
func notifyCallbackString(key: CString, value: CString): Unit {
    AppStorage.setOrCreate<String>(key.toString(), value.toString())
}

/**
 * Notification callback function for handling key-value pairs with Int64 type values.
 *
 * @param key Key as a CString, which is converted to a String internally
 * @param value Value of type Int64
 * @return
 * @note The caller manages the memory of the CString.
 */
func notifyCallbackInt64(key: CString, value: Int64): Unit {
    AppStorage.setOrCreate<Int64>(key.toString(), value)
}

/**
 * Notification callback function for handling key-value pairs with Float64 type values.
 *
 * @param key Key as a CString, which is converted to a String internally
 * @param value Value of type Float64
 * @return
 * @note The caller manages the memory of the CString.
 */
func notifyCallbackFloat64(key: CString, value: Float64): Unit {
    AppStorage.setOrCreate<Float64>(key.toString(), value)
}

/**
 * Notification callback function for handling key-value pairs with Bool type values.
 *
 * @param key Key as a CString, which is converted to a String internally
 * @param value Value of type Bool
 * @return
 * @note The caller manages the memory of the CString.
 */
func notifyCallbackBool(key: CString, value: Bool): Unit {
    AppStorage.setOrCreate<Bool>(key.toString(), value)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStateUpdate(_: String, _: ArrayList<Int64>): Unit {
        innerPropertyHasChanged()
    }

    // Full update
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStateUpdate(_: String): Unit {
        innerPropertyHasChanged()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func notifyRead(_: String): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(): Int64 {
        subId
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
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
        PersistentStorage.instance.getOrThrow()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func persistProp<T>(key: String, defaultValue: T): Unit {
        PersistentStorage.getOrCreate().innerPersistProp(key, defaultValue)
    }

    @!APILevel[
        12,
        deprecated: 10,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func persistProps<T>(properties: Array<(String, T)>): Unit {
        PersistentStorage.getOrCreate().innerPersistProps(properties)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func deleteProp(key: String): Unit {
        PersistentStorage.getOrCreate().innerDeleteProp(key)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func keys(): EquatableCollection<String> {
        PersistentStorage.getOrCreate().innerKeys()
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
