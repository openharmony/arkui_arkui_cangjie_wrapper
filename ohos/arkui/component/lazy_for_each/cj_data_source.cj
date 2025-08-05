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

protected package ohos.arkui.component.lazy_for_each

import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkDataChangeListenerOnDataReloaded(dataChangeListenId: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataAdded(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataDeleted(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataChanged(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataMoved(dataChangeListenId: Int64, fromIdx: Int64, toIdx: Int64): Unit
}

@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface IDataSource<T> {
    func totalCount(): Int64
    func getData(index: Int64): T
    func onRegisterDataChangeListener(listener: DataChangeListener): Unit
    func onUnregisterDataChangeListener(listener: DataChangeListener): Unit
}

@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataChangeListener <: RemoteData {
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataChangeListener(id: Int64) {
        super(id)
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataReloaded(): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataReloaded(getID()) }
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataAdd(index: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataAdded(getID(), index) }
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataDelete(index: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataDeleted(getID(), index) }
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataChange(index: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataChanged(getID(), index) }
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataMove(fromIdx: Int64, toIdx: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataMoved(getID(), fromIdx, toIdx) }
    }
}
