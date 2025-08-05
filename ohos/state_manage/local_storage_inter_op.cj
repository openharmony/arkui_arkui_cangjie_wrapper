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
import ohos.hilog.*
import ohos.ark_interop.*
import ohos.labels.APILevel
import std.collection.*

var globalContext: ?JSContext = None
let initLocalStorageEnvModule = JSModule.registerModule {
    context, _ => setRuntimeGlobal(context)
}

func getRuntimeGlobal() {
    let content = globalContext ?? throw NoneValueException("localStorageInterOp: get global context failed.")
    content
}

func setRuntimeGlobal(input: JSContext) {
    match (globalContext) {
        case Some(v) => ()
        case None => globalContext = input
    }
}

func interOpCall(interOpFunc: JSValue, args: Array<JSValue>, interOpThisArg: JSValue): JSValue {
    if (interOpFunc.typeof() != JSType.FUNCTION) {
        throw IllegalArgumentException("localStorageInterOp: jsvalue not function type.")
    }
    interOpFunc.asFunction(getRuntimeGlobal()).call(args, thisArg: interOpThisArg)
}

func createSubscriber(callback: JSFunction) {
    let obj: JSObject = getRuntimeGlobal().object()
    obj["id__"] = getRuntimeGlobal()
        .function({
            _: JSContext, _: JSCallInfo => Int8(0).toJSValue(getRuntimeGlobal())
        })
        .toJSValue()
    obj["syncPeerHasChanged"] = callback.toJSValue()

    return obj
}

class InterOpSubscribedAbstractProperty<T> where T <: JSInteropType<T> {
    private var innerProperty_: JSObject

    init(obj: JSObject) {
        innerProperty_ = obj
    }

    func get(): T {
        T.fromJSValue(getRuntimeGlobal(), interOpCall(innerProperty_["get"], [], innerProperty_.toJSValue()))
    }

    func set(value: T) {
        interOpCall(innerProperty_["set"], [value.toJSValue(getRuntimeGlobal())], innerProperty_.toJSValue())
    }

    func aboutToBeDeleted() {
        interOpCall(innerProperty_["aboutToBeDeleted"], [], innerProperty_.toJSValue())
    }

    func info(): String {
        String.fromJSValue(getRuntimeGlobal(), interOpCall(innerProperty_["info"], [], innerProperty_.toJSValue()))
    }

    func numberOfSubscrbers(): Int64 {
        Int64.fromJSValue(getRuntimeGlobal(),
            interOpCall(innerProperty_["numberOfSubscrbers"], [], innerProperty_.toJSValue()))
    }
}

interface ObservedPropertySyncInterOp {
    func sync(): Unit
}

class ObservedPropertyInterOp<T> <: ObservedProperty<T> & ObservedPropertySyncInterOp where T <: JSInteropType<T> {
    private var subscribedProperty_: InterOpSubscribedAbstractProperty<T>

    init(info: String, subscribedProperty: InterOpSubscribedAbstractProperty<T>) {
        super(info, subscribedProperty.get())
        subscribedProperty_ = subscribedProperty
    }

    public func set(newValue: T) {
        subscribedProperty_.set(newValue)
        super.set(newValue)
    }

    public func sync() {
        Hilog.debug(0, "cangjiePage", "sync prop ${subscribedProperty_.info()}")
        super.set(subscribedProperty_.get())
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class LocalStorageInterOp {
    private var jsStorage: ?JSObject = None
    private let storage = HashMap<String, ObservedPropertyAbstract>()
    protected static var instance_: ?LocalStorageInterOp = None

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getOrCreate(): LocalStorageInterOp {
        match (instance_) {
            case Some(v) => ()
            case None => instance_ = LocalStorageInterOp()
        }
        return instance_ ?? throw NoneValueException("localStorageInterOp: get LocalStorageInterOp failed.")
    }

    private func getJsStorage(): JSObject {
        match (jsStorage) {
            case Some(v) => ()
            case None => jsStorage = interOpCall((getRuntimeGlobal().global)["localStorageGetShared"], [],
                getRuntimeGlobal().global.toJSValue()).asObject(getRuntimeGlobal())
        }
        return jsStorage ?? throw NoneValueException("localStorageInterOp: get jsStorage failed.")
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToBeDeleted(): Bool {
        return this.clear()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func has(propName: String): Bool {
        Bool.fromJSValue(getRuntimeGlobal(),
            interOpCall(getJsStorage()["has"], [propName.toJSValue(getRuntimeGlobal())], getJsStorage().toJSValue()))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keys() {
        let it = interOpCall(getJsStorage()["keys"], [], getJsStorage().toJSValue()).asObject(getRuntimeGlobal())
        let retHashmap = HashMap<String, Int64>()
        while (true) {
            let next = interOpCall(it["next"], [], it.toJSValue()).asObject(getRuntimeGlobal())
            if (Bool.fromJSValue(getRuntimeGlobal(), next["done"]) == true) {
                break
            }
            retHashmap.add(String.fromJSValue(getRuntimeGlobal(), next["value"]), 0)
        }

        return retHashmap.keys()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(): Int64 {
        Int64.fromJSValue(getRuntimeGlobal(), interOpCall(getJsStorage()["size"], [], getJsStorage().toJSValue()))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get<T>(propName: String): T where T <: JSInteropType<T> {
        let ret = interOpCall(getJsStorage()["get"], [propName.toJSValue(getRuntimeGlobal())],
            getJsStorage().toJSValue())
        if (ret.isUndefined()) {
            throw NoneValueException("can not find ${propName}")
        } else {
            T.fromJSValue(getRuntimeGlobal(), ret)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func set<T>(propName: String, value: T): Bool where T <: JSInteropType<T> {
        Bool.fromJSValue(
            getRuntimeGlobal(),
            interOpCall(
                getJsStorage()["set"],
                [propName.toJSValue(getRuntimeGlobal()), value.toJSValue(getRuntimeGlobal())],
                getJsStorage().toJSValue()
            )
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setOrCreate<T>(propName: String, value: T): Bool where T <: JSInteropType<T> {
        Bool.fromJSValue(
            getRuntimeGlobal(),
            interOpCall(
                getJsStorage()["setOrCreate"],
                [propName.toJSValue(getRuntimeGlobal()), value.toJSValue(getRuntimeGlobal())],
                getJsStorage().toJSValue()
            )
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func link<T>(propName: String): ObservedProperty<T> where T <: JSInteropType<T> {
        callStorageLink<T>(propName)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setAndLink<T>(propName: String, value: T): ObservedProperty<T> where T <: JSInteropType<T> {
        callStorageSetAndLink<T>(propName, value)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func `prop`<T>(propName: String): ObservedProperty<T> where T <: JSInteropType<T> {
        callStorageLink<T>(propName)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setAndProp<T>(propName: String, value: T): ObservedProperty<T> where T <: JSInteropType<T> {
        callStorageSetAndLink<T>(propName, value)
    }

    private func callStorageLink<T>(propName: String) where T <: JSInteropType<T> {
        if (storage.contains(propName)) {
            ((storage.get(propName) ?? throw NoneValueException("localStorageInterOp: Link get prop failed.")) as ObservedProperty<T>) ??
                throw IllegalArgumentException("localStorageInterOp: prop as ObservedProperty failed.")
        } else {
            let property = InterOpSubscribedAbstractProperty<T>(
                interOpCall(
                    getJsStorage()["link"],
                    [propName.toJSValue(getRuntimeGlobal()),
                        createSubscriber(getRuntimeGlobal().function(hasChanged)).toJSValue()],
                    getJsStorage().toJSValue()
                ).asObject(getRuntimeGlobal()))
            let observedProperty = ObservedPropertyInterOp<T>(propName, property)
            storage.add(propName, observedProperty)
            observedProperty
        }
    }

    private func callStorageSetAndLink<T>(propName: String, value: T) where T <: JSInteropType<T> {
        if (storage.contains(propName)) {
            ((storage.get(propName) ?? throw NoneValueException("localStorageInterOp: SetAndLink get prop failed.")) as ObservedProperty<T>) ??
                throw IllegalArgumentException("localStorageInterOp: prop as ObservedProperty failed.")
        } else {
            let property = InterOpSubscribedAbstractProperty<T>(
                interOpCall(
                    getJsStorage()["setAndLink"],
                    [propName.toJSValue(getRuntimeGlobal()), value.toJSValue(getRuntimeGlobal()),
                        createSubscriber(getRuntimeGlobal().function(hasChanged)).toJSValue()],
                    getJsStorage().toJSValue()
                ).asObject(getRuntimeGlobal()))
            let observedProperty = ObservedPropertyInterOp<T>(propName, property)
            storage.add(propName, observedProperty)
            observedProperty
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func delete(propName: String): Bool {
        Bool.fromJSValue(getRuntimeGlobal(),
            interOpCall(getJsStorage()["delete"], [propName.toJSValue(getRuntimeGlobal())], getJsStorage().toJSValue()))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clear(): Bool {
        Bool.fromJSValue(getRuntimeGlobal(), interOpCall(getJsStorage()["clear"], [], getJsStorage().toJSValue()))
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hasChanged(context: JSContext, callInfo: JSCallInfo): JSValue {
        let obj = callInfo[0].asObject(getRuntimeGlobal())
        let propName = String.fromJSValue(getRuntimeGlobal(), interOpCall(obj["info"], [], obj.toJSValue()))
        Hilog.debug(0, "cangjiePage", "prop ${propName} hasChanged")
        if (storage.contains(propName)) {
            (((storage
                .get(propName) ?? throw NoneValueException("localStorageInterOp: storage get prop failed.")) as ObservedPropertySyncInterOp) ??
                    throw IllegalArgumentException("localStorageInterOp: prop as ObservedPropertySyncInterOp failed."))
                .sync()
        }

        getRuntimeGlobal().undefined().toJSValue()
    }
}
