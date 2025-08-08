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
    func FfiOHOSAceFrameworkDataChangeListenerOnDataReloaded(dataChangeListenId: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataAdded(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataDeleted(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataChanged(dataChangeListenId: Int64, index: Int64): Unit

    func FfiOHOSAceFrameworkDataChangeListenerOnDataMoved(dataChangeListenId: Int64, fromIdx: Int64, toIdx: Int64): Unit

    func FfiFrameworkDataChangeListenerOnDataSetChanged(dataChangeListenId: Int64, dataOps: NativeOperation): Unit
}

@C
struct NativeOperation {
    let size: Int64
    let cjNativeOperation: CPointer<CJNativeOperation>

    init(infos: ArrayList<CJNativeOperation>) {
        this.size = infos.size
        this.cjNativeOperation = if (size > 0) {
            let ptr = unsafe { LibC.malloc<CJNativeOperation>(count: size) }
            if (ptr.isNotNull()) {
                for (i in 0..size) {
                    unsafe { ptr.write(i, infos[i]) }
                }
                ptr
            } else {
                CPointer<CJNativeOperation>()
            }
        } else {
            CPointer<CJNativeOperation>()
        }
    }

    func free(): Unit {
        if (!cjNativeOperation.isNull()) {
            for (i in 0..size) {
                unsafe { cjNativeOperation.read(i).free() }
            }
            unsafe { LibC.free<CJNativeOperation>(cjNativeOperation) }
        }
    }
}

@C
struct CJNativeOperation {
    var ty: CString = CString(CPointer<UInt8>())
    var count: Int32 = 1
    var index: Int32 = -1
    var coupleFromIndex: Int32 = -1
    var coupleToIndex: Int32 = -1
    var key: CString = CString(CPointer<UInt8>())
    var coupleFromKey: CString = CString(CPointer<UInt8>())
    var coupleToKey: CString = CString(CPointer<UInt8>())
    var keyList: CArrString = CArrString(CPointer<CString>(), 0)

    init(dataAddOp: DataAddOperation) {
        var ptr: ?CPointer<CString> = None
        try {
            this.ty = unsafe { LibC.mallocCString("add") }
            this.index = dataAddOp.index
            this.count = dataAddOp.count
            if (let Some(v) <- dataAddOp.key) {
                this.key = unsafe { LibC.mallocCString(v) }
            } else if (let Some(v) <- dataAddOp.keys) {
                ptr = unsafe { LibC.malloc<CString>(count: v.size) }
                if (ptr.getOrThrow().isNull()) {
                    return
                }
                for (i in 0..v.size) {
                    unsafe { ptr?.write(i, LibC.mallocCString(v[i])) }
                }
                this.keyList = CArrString(ptr.getOrThrow(), v.size)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(ty)
                LibC.free(key)
                if (let Some(v) <- ptr) {
                    LibC.free(v)
                }
                keyList.free()
            }
            throw e
        }
    }

    init(dataDeleteOp: DataDeleteOperation) {
        try {
            this.ty = unsafe { LibC.mallocCString("delete") }
            this.index = dataDeleteOp.index
            this.count = dataDeleteOp.count
        } catch (e: Exception) {
            unsafe {
                LibC.free(ty)
            }
            throw e
        }
    }

    init(dataChangeOp: DataChangeOperation) {
        try {
            this.ty = unsafe { LibC.mallocCString("change") }
            this.index = dataChangeOp.index
            if (let Some(v) <- dataChangeOp.key) {
                this.key = unsafe { LibC.mallocCString(v) }
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(ty)
                LibC.free(key)
            }
            throw e
        }
    }
    init(dataMoveOp: DataMoveOperation) {
        try {
            this.ty = unsafe { LibC.mallocCString("move") }
            this.coupleFromIndex = dataMoveOp.from
            this.coupleToIndex = dataMoveOp.to
            if (let Some(v) <- dataMoveOp.key) {
                this.key = unsafe { LibC.mallocCString(v) }
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(ty)
                LibC.free(key)
            }
            throw e
        }
    }
    init(dataExchangeOp: DataExchangeOperation) {
        try {
            this.ty = unsafe { LibC.mallocCString("exchange") }
            this.coupleFromIndex = dataExchangeOp.start
            this.coupleToIndex = dataExchangeOp.end
            this.coupleFromKey = unsafe { LibC.mallocCString(dataExchangeOp.key.start) }
            this.coupleToKey = unsafe { LibC.mallocCString(dataExchangeOp.key.end) }
        } catch (e: Exception) {
            unsafe {
                LibC.free(ty)
                LibC.free(coupleFromKey)
                LibC.free(coupleToKey)
            }
            throw e
        }
    }

    init(_: DataReloadOperation) {
        try {
            this.ty = unsafe { LibC.mallocCString("reload") }
        } catch (e: Exception) {
            unsafe {
                LibC.free(ty)
            }
            throw e
        }
    }

    func free() {
        unsafe {
            LibC.free(ty)
            LibC.free(key)
            LibC.free(coupleFromKey)
            LibC.free(coupleToKey)
            keyList.free()
        }
    }
}

func parseDataOperation(dataOperation: DataOperation): CJNativeOperation {
    return match (dataOperation) {
        case dataAddOp: DataAddOperation => CJNativeOperation(dataAddOp)
        case dataDeleteOp: DataDeleteOperation => CJNativeOperation(dataDeleteOp)
        case dataChangeOp: DataChangeOperation => CJNativeOperation(dataChangeOp)
        case dataMoveOp: DataMoveOperation => CJNativeOperation(dataMoveOp)
        case dataExchangeOp: DataExchangeOperation => CJNativeOperation(dataExchangeOp)
        case dataReloadOp: DataReloadOperation => CJNativeOperation(dataReloadOp)
        case _ => throw IllegalArgumentException("Invaild DataOperation")
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface DataOperation {}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataAddOperation <: DataOperation {
    var ty = "add"
    var index: Int32
    var count: Int32 = 1
    var key: ?String = None
    var keys: ?Array<String> = None

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataAddOperation(index: Int32, count!: Int32 = 1, key!: ?String = None, keys!: ?Array<String> = None) {
        this.index = index
        this.count = count
        this.key = key
        this.keys = keys
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataDeleteOperation <: DataOperation {
    var ty = "delete"
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataDeleteOperation(public let index: Int32, public let count!: Int32 = 1) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataChangeOperation <: DataOperation {
    var ty = "change"
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataChangeOperation(public let index: Int32, public let key!: ?String = "") {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataMoveOperation <: DataOperation {
    var ty = "move"
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataMoveOperation(public let from!: Int32, public let to!: Int32, public let key!: ?String = "") {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataExchangeOperation <: DataOperation {
    var ty = "exchange"
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataExchangeOperation(public let start!: Int32, public let end!: Int32,
        public let key!: ExchangeKey = ExchangeKey()) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataReloadOperation <: DataOperation {
    var ty = "reload"
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataReloadOperation() {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ExchangeKey {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ExchangeKey(public let start!: String = "", public let end!: String = "") {}
}

@!APILevel[
    12,
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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataChangeListener <: RemoteData {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DataChangeListener(id: Int64) {
        super(id)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataReloaded(): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataReloaded(getID()) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataAdd(index: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataAdded(getID(), index) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataDelete(index: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataDeleted(getID(), index) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataChange(index: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataChanged(getID(), index) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDataMove(fromIdx: Int64, toIdx: Int64): Unit {
        unsafe { FfiOHOSAceFrameworkDataChangeListenerOnDataMoved(getID(), fromIdx, toIdx) }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDatasetChange(dataOperations: ArrayList<DataOperation>): Unit {
        unsafe {
            if (!dataOperations.isEmpty()) {
                var infos: ArrayList<CJNativeOperation> = ArrayList<CJNativeOperation>()
                for (dp in dataOperations) {
                    infos.add(parseDataOperation(dp))
                }
                var nativeOperation = NativeOperation(infos)
                FfiFrameworkDataChangeListenerOnDataSetChanged(getID(), nativeOperation)
                nativeOperation.free()
            }
        }
        return
    }
}
