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

package ohos.arkui.component.lazy_for_each

import ohos.ffi.{RemoteData}
import ohos.labels.{APILevel, Hide}

foreign {
    func FfiOHOSAceFrameworkDataChangeListenerOnDataReloaded(dataChangeListenId: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataAdded(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataDeleted(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataChanged(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataMoved(dataChangeListenId: Int64, fromIdx: Int64, toIdx: Int64): Unit
}

/**
 * Developers need to implement this interface to provide data to LazyForEach component.
 * This interface defines the methods required for LazyForEach to access and monitor data.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface IDataSource<T> {
    /**
     * Returns the count of all data items available in the data source.
     *
     * @returns { Int64 } The total number of data items in the data source.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func totalCount(): Int64
    
    /**
     * Obtains the data item that matches the specified index.
     * Retrieves a specific data item from the data source by its index.
     *
     * @param { Int64 } index - The zero-based index of the data item to retrieve.
     * @returns { T } The data item at the specified index.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func getData(index: Int64): T
    
    /**
     * Adds a listener that will be notified when the data in the source changes.
     *
     * @param { DataChangeListener } listener - The listener to be registered for data changes.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func registerDataChangeListener(listener: DataChangeListener): Unit
    
    /**
     * Removes a previously registered listener so it will no longer be notified of data changes.
     *
     * @param { DataChangeListener } listener - The listener to be unregistered from data changes.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func unregisterDataChangeListener(listener: DataChangeListener): Unit
}

/**
 * Data change listener.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataChangeListener <: RemoteData {
    protected DataChangeListener(id: Int64) {
        super(id)
    }

    /**
     * Invoked when all data is reloaded. For data items whose key remains unchanged,
     * the original child component is used. For data items whose key changes, a new child component is created.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataReloaded(): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataReloaded(getID()) }
    }

    /**
     * Invoked when data is added to the position indicated by the specified index.
     *
     * @param { IntNative } index - The index at which to insert the data record.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataAdd(index: IntNative): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataAdded(getID(), Int64(index)) }
    }

    /**
     * Invoked when data is deleted from the position indicated by the specified index.
     * LazyForEach will update the displayed content accordingly.
     *
     * @param { IntNative } index - The index at which to delete the data record.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataDelete(index: IntNative): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataDeleted(getID(), Int64(index)) }
    }

    /**
     * Invoked when data in the position indicated by the specified index is changed.
     *
     * @param { IntNative } index - The index of the data to be changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataChange(index: IntNative): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataChanged(getID(), Int64(index)) }
    }

    /**
     * Invoked when data is moved, that is, when data is swapped between the from and to positions.
     *
     * @param { IntNative } from - The start position for the movement.
     * @param { IntNative } to - The end position for the movement.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataMove(from: IntNative, to: IntNative): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataMoved(getID(), Int64(from), Int64(to)) }
    }
}
