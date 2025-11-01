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

package ohos.arkui.component.lazy_for_each

import ohos.arkui.component.common.{UINodeBase, ItemGeneratorFunc, KeyGeneratorFunc}
import ohos.arkui.component.native_struct.{BaseLazyForEachFuncs}
import ohos.arkui.component.custom_component.CustomView
import ohos.base.{nativeLog}
import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException

import std.collection.HashMap

foreign {
    func FfiOHOSAceFrameworkLazyForEachCreate(viewID: Int64, parentView: Int64, lazyForEachFuncsRef: Int64): Unit

    func FfiOHOSAceFrameworkLazyForEachPop(): Unit
}

class LazyForEachFuncs<T> <: BaseLazyForEachFuncs {
    private var cacheData: Option<(T, Int64)> = None
    /*
     * native pass a listener to cangjie, but cangjie user may not restore this listener, and native pass the same listener mult times(register and unregister).
     * In such cases, cangjie should recognize the listener as the same object. We could use RemoteDataManager if there are more scenarios in the future.
     */
    private let cacheListener = HashMap<Int64, DataChangeListener>();
    let dataSource_: IDataSource<T>
    let itemGeneratorFunc_: ItemGeneratorFunc<T>
    let keyGeneratorFunc_: KeyGeneratorFunc<T>
    let parentView_: CustomView

    init(parent: CustomView, dataSource: IDataSource<T>, itemGeneratorFunc: ItemGeneratorFunc<T>,
        keyGeneratorFunc: KeyGeneratorFunc<T>) {
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
     * @params index: The corresponding index value.
     * @returns The data corresponding to the index value.
     */
    func getDataAndCache(index: Int64): T {
        let data: T = dataSource_.getData(index)
        cacheData = (data, index)
        return data
    }

    /**
     * Get the cached data.
     *
     * @params index: The corresponding index value.
     * @returns The data corresponding to the index value.
     */
    func getCachedData(index: Int64): T {
        let msg = "cached data index does not exist!"
        match (cacheData) {
            case None =>
                nativeLog(msg)
                throw BusinessException(100001, msg)
            case Some(realData) =>
                if (index != realData[1]) {
                    nativeLog(msg)
                    throw BusinessException(100001, msg)
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
        dataSource_.registerDataChangeListener(listener)
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
     * @params listener: Data change listener.
     */
    func onRemoveDataChangeListener(listener: DataChangeListener): Unit {
        dataSource_.unregisterDataChangeListener(listener)
        listener.release()
    }
}

/**
 * Lazy loading.
 * A component that implements lazy loading, rendering only the items currently visible on the screen.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LazyForEach<T> <: UINodeBase {
    var child: () -> Unit = {=>}
    private static var uniqueKey = 0

    /**
     * Constructs a LazyForEach component.
     *
     * @param { IDataSource<T> } dataSource - LazyForEach data source, need to implement the IDataSource interface.
     * @param { ItemGeneratorFunc<T> } itemGenerator - Sub-component generator function, create a sub-component for each data in the array.
     * @param { KeyGeneratorFunc<T> } [keyGenerator] - Key generator function, used to generate a unique and fixed key for each data.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(dataSource: IDataSource<T>, itemGenerator!: ItemGeneratorFunc<T>,
        keyGenerator!: ?KeyGeneratorFunc<T> = None) {}

    /**
     * Lazy loading.
     * A component that implements lazy loading, rendering only the items currently visible on the screen.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public init() {}

    /**
     * Lazy loading.
     * A component that implements lazy loading, rendering only the items currently visible on the screen.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func create<T>(viewID: Int64, parentView: CustomView, dataSource: IDataSource<T>,
        itemGeneratorFunc!: ItemGeneratorFunc<T>,
        keyGeneratorFunc!: KeyGeneratorFunc<T> = {
            _: T, idx: Int64 =>
            uniqueKey++
            return "${viewID} - ${idx} - ${uniqueKey}"
        }): This {
        let funcs = LazyForEachFuncs<T>(parentView, dataSource, itemGeneratorFunc, keyGeneratorFunc)
        unsafe {
            FfiOHOSAceFrameworkLazyForEachCreate(viewID, parentView.nativeView_inner__.getID(), funcs.getID())
        }
        this
    }

    func genChild(): Unit {
        child()
    }

    func lazyForEachPop(): Unit {
        unsafe { FfiOHOSAceFrameworkLazyForEachPop() }
    }

    protected func initial(): Unit {
        genChild()
        lazyForEachPop()
    }

    protected func update(): Unit {
        lazyForEachPop()
    }
}
