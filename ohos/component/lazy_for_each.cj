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

package ohos.component

foreign {
    func FfiOHOSAceFrameworkLazyForEachCreate(viewID: Int64, parentView: Int64, lazyForEachFuncsRef: Int64): Unit

    func FfiOHOSAceFrameworkLazyForEachPop(): Unit
}

type KeyGenFuncType<T> = (T, Int64) -> String

type ItemGenFuncType<T> = (T, Int64) -> Unit

abstract class BaseLazyForEachFuncs <: FFIData {
    protected func generateKey(index: Int64): String
    protected func generateItem(index: Int64): Unit
    protected func getTotalCount(): Int64
    protected func dataChangeListenerRegister(listenerId: Int64): Unit
    protected func dataChangeListenerUnregister(listenerId: Int64): Unit
    protected func startMarkLazy(id: String): Unit
    protected func endMarkLazy(): Unit
    protected func removeChildGroup(id: String): Unit
}

class LazyForEachFuncs<T> <: BaseLazyForEachFuncs {
    private var cacheData: Option<(T, Int64)> = None
    /*
     * native pass a listener to cangjie, but cangjie user may not restore this listener, and native pass the same listener mult times(register and unregister).
     * In such cases, cangjie should recognize the listener as the same object. We could use RemoteDataManager if there are more scenarios in the future.
     */
    private let cacheListener = HashMap<Int64, DataChangeListener>();
    let dataSource_: IDataSource<T>
    let itemGeneratorFunc_: ItemGenFuncType<T>
    let keyGeneratorFunc_: KeyGenFuncType<T>
    let parentView_: CustomView

    init(parent: CustomView, dataSource: IDataSource<T>, itemGeneratorFunc: ItemGenFuncType<T>,
        keyGeneratorFunc: KeyGenFuncType<T>) {
        super()
        dataSource_ = dataSource
        itemGeneratorFunc_ = itemGeneratorFunc
        keyGeneratorFunc_ = keyGeneratorFunc
        parentView_ = parent
        registerSelf()
    }

    protected func generateKey(idx: Int64): String {
        let data: T = getDataAndCache(idx)
        keyGeneratorFunc_(data, idx)
    }

    protected func generateItem(idx: Int64): Unit {
        let data: T = getCachedData(idx)
        itemGeneratorFunc_(data, idx)
    }

    protected func getTotalCount(): Int64 {
        return dataSource_.totalCount()
    }

    protected func startMarkLazy(id: String): Unit {
        parentView_.markLazyForEachProcess(id)
    }

    protected func endMarkLazy(): Unit {
        parentView_.resetLazyForEachProcess()
    }

    protected func removeChildGroup(id: String): Unit {
        parentView_.removeChildGroupById(id)
    }

    /**
     * Destroy listener.
     *
     * @since 11
     */
    protected func onDestroyed(): Unit {
        for ((k, v) in cacheListener) {
            onRemoveDataChangeListener(v)
        }
        cacheListener.clear()
        super.onDestroyed()
    }

    /**
     * Get the data and cache it.
     *
     * @param index: The corresponding index value.
     * @return The data corresponding to the index value.
     * @since 11
     */
    func getDataAndCache(index: Int64): T {
        let data: T = dataSource_.getData(index)
        cacheData = (data, index)
        return data
    }

    /**
     * Get the cached data.
     *
     * @param index: The corresponding index value.
     * @return The data corresponding to the index value.
     * @since 11
     */
    func getCachedData(index: Int64): T {
        let msg = "cached data index does not exist!"
        match (cacheData) {
            case None =>
                nativeLog(msg)
                throw NoneValueException(msg)
            case Some(realData) =>
                if (index != realData[1]) {
                    nativeLog(msg)
                    throw NoneValueException(msg)
                }
                cacheData = None
                realData[0]
        }
    }

    protected func dataChangeListenerRegister(listenerId: Int64) {
        let listener = if (cacheListener.contains(listenerId)) {
            cacheListener[listenerId]
        } else {
            let tmpListner = DataChangeListener(listenerId)
            cacheListener.add(listenerId, tmpListner)
            tmpListner
        }
        dataSource_.onRegisterDataChangeListener(listener)
    }

    protected func dataChangeListenerUnregister(listenerId: Int64) {
        if (cacheListener.contains(listenerId)) {
            let listener = cacheListener[listenerId]
            onRemoveDataChangeListener(listener)
            cacheListener.remove(listenerId)
        }
    }

    /**
     * Remove data change listener.
     *
     * @param listener: Data change listener.
     * @since 11
     */
    func onRemoveDataChangeListener(listener: DataChangeListener): Unit {
        dataSource_.onUnregisterDataChangeListener(listener)
        listener.release()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LazyForEach <: ComponentRender {
    var child: () -> Unit = {=>}
    private static var uniqueKey_ = 0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LazyForEach() {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func create<T>(viewID: Int64, parentView: CustomView, dataSource: IDataSource<T>,
        itemGeneratorFunc!: ItemGenFuncType<T>,
        keyGeneratorFunc!: KeyGenFuncType<T> = {
            _: T, idx: Int64 =>
            uniqueKey_++
            return "${viewID} - ${idx} - ${uniqueKey_}"
        }): LazyForEach {
        let funcs = LazyForEachFuncs<T>(parentView, dataSource, itemGeneratorFunc, keyGeneratorFunc)
        unsafe {
            FfiOHOSAceFrameworkLazyForEachCreate(viewID, parentView.nativeView.getID(), funcs.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lazyForEachPop(): Unit {
        unsafe { FfiOHOSAceFrameworkLazyForEachPop() }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func initial(): Unit {
        genChild()
        lazyForEachPop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func update(): Unit {
        lazyForEachPop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func genChild(): Unit {
        child()
    }
}

@C
func OHOSAceFrameworkLazyForEachFuncsGenerateKey(funcsID: Int64, idx: Int64): ExternalString {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let resStr = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").generateKey(idx)
    return ExternalString(resStr)
}

@C
func OHOSAceFrameworkLazyForEachFuncsGenerateItem(funcsID: Int64, idx: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").generateItem(idx)
    0
}

@C
func OHOSAceFrameworkLazyForEachFuncsGetTotalCount(funcsID: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let resStr = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").getTotalCount()
    return resStr
}

@C
func OHOSAceFrameworkLazyForEachFuncsDataChangeListenerRegister(funcsID: Int64, idx: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").dataChangeListenerRegister(idx)
    0
}

@C
func OHOSAceFrameworkLazyForEachFuncsDataChangeListenerUnregister(funcsID: Int64, idx: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").dataChangeListenerUnregister(idx)
    0
}

@C
func OHOSAceFrameworkLazyForEachFuncsMarkLazy(funcsID: Int64, key: CString): Unit {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let funcs = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}")
    funcs.startMarkLazy(key.toString())
}

@C
func OHOSAceFrameworkLazyForEachFuncsResetLazy(funcsID: Int64): Unit {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let funcs = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}")
    funcs.endMarkLazy()
}

@C
func OHOSAceFrameworkLazyForEachFuncsRemoveChildGroup(funcsID: Int64, composedId: CString): Unit {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let funcs = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}")
    funcs.removeChildGroup(composedId.toString())
}
