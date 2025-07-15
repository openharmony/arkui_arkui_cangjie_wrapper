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

@C
struct SetIdResultFFI {
    SetIdResultFFI(
        let diffIndexArrayPtr: VectorToCFFIArray,
        let duplicateIdsPtr: VectorToCFFIArray,
        let removedChildElmtIdsPtr: VectorToCFFIArray
    ) {}
}

struct SetIdResult {
    SetIdResult(
        let diffIndexArray: ArrayList<Int64>,
        let duplicateIds: ArrayList<Int64>,
        let removedChildElmtIds: ArrayList<Int64>
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkForEachCreateFU(viewID: CString, parentView: Int64, dataSize: Int64,
        itemGeneratorFuncRef: Int64, keyGeneratorFuncRef: Int64): Unit

    func FfiOHOSAceFrameworkForEachPop(): Unit

    func FfiOHOSAceFrameworkForEachCreate(): Unit

    func FfiOHOSAceFrameworkViewSetIdArray(elmtId: Int64, newIdArray: VectorStringHandle): VectorToCFFIArray

    func FfiOHOSAceFrameworkViewSetIdArrayReturnStruct(elmtId: Int64, newIdArray: VectorStringHandle): SetIdResultFFI

    func FfiOHOSAceFrameworkViewCreateNewChildStart(id: CString): Unit

    func FfiOHOSAceFrameworkViewCreateNewChildFinish(id: CString): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ForEach <: ComponentRender {
    var child: () -> Unit = {=>}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func create<T>(viewID: Int64, parentView: CustomView, dataSource: ArrayLike<T>,
        itemGeneratorFunc!: ItemGenFuncType<T>,
        keyGeneratorFunc!: KeyGenFuncType<T> = {
            realData: T, idx: Int64 => match (realData) {
                case realDataStr: ToString => realDataStr.toString()
                case _ => idx.toString()
            }
        }): Unit {
        // capture generic type and dataSource information in this closure: lambdaFFI.
        let lambdaViewFFI = {
            idx: Int64 =>
            let realData = dataSource[idx]
            itemGeneratorFunc(realData, idx)
        }
        let lambdaKeyFFI = {
            idx: Int64 =>
            let realData = dataSource[idx]
            let key = keyGeneratorFunc(realData, idx)
            ExternalString(key)
        }
        unsafe {
            try (viewIDCStr = LibC.mallocCString(viewID.toString()).asResource()) {
                FfiOHOSAceFrameworkForEachCreateFU(viewIDCStr.value, parentView.getID(), dataSource.size,
                    Callback1Param<Int64, Unit>(lambdaViewFFI).getID(),
                    Callback1Param<Int64, ExternalString>(lambdaKeyFFI).getID())
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func create() {
        unsafe {
            FfiOHOSAceFrameworkForEachCreate()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        this.child = subcomponent
        unsafe {
            FfiOHOSAceFrameworkForEachCreate()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pop(): Unit {
        unsafe { FfiOHOSAceFrameworkForEachPop() }
    }

    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func initial(): Unit {
        genChild()
        pop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func update(): Unit {
        genChild()
        pop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func genChild(): Unit {
        child()
    }

    /**
     * Sets the new ID array for given element ID.
     *
     * @param elmtId: The ID of the element.
     * @param newIdArray: The Array containing the new ID array elements.
     * @return ArrayList<Int64>: An Array containing the processed ID.
     * @since 11
     */
    static func setIdArray(elmtId: Int64, newIdArray: ArrayList<String>): SetIdResult {
        let vecFFi = FFIVectorString(newIdArray.size)
        var index = 0
        for (id in newIdArray) {
            vecFFi.setElement(index, id)
            index++
        }
        let setIdResultFFI = unsafe {
            FfiOHOSAceFrameworkViewSetIdArrayReturnStruct(elmtId, vecFFi.getNativeHandle())
        }
        let diffArrFFi = setIdResultFFI.diffIndexArrayPtr
        let diffSize = diffArrFFi.size
        let diffResult = ArrayList<Int64>(diffSize)
        for (idx in 0..diffSize) {
            unsafe {
                let buf = CPointer<Int64>(diffArrFFi.buffer)
                diffResult.add(buf.read(idx))
            }
        }

        let duplicateArrFFi = setIdResultFFI.duplicateIdsPtr
        let duplicateSize = duplicateArrFFi.size
        let duplicateResult = ArrayList<Int64>(duplicateSize)
        for (idx in 0..duplicateSize) {
            unsafe {
                let buf = CPointer<Int64>(duplicateArrFFi.buffer)
                duplicateResult.add(buf.read(idx))
            }
        }

        let removedArrFFi = setIdResultFFI.removedChildElmtIdsPtr
        let removedSize = removedArrFFi.size
        let removedResult = ArrayList<Int64>(removedSize)
        for (idx in 0..removedSize) {
            unsafe {
                let buf = CPointer<Int64>(removedArrFFi.buffer)
                removedResult.add(buf.read(idx))
            }
        }

        let result = SetIdResult(diffResult, duplicateResult, removedResult)

        unsafe {
            diffArrFFi.free(CPointer<Unit>(diffArrFFi.buffer))
            duplicateArrFFi.free(CPointer<Unit>(duplicateArrFFi.buffer))
            removedArrFFi.free(CPointer<Unit>(removedArrFFi.buffer))
            vecFFi.free()
        }

        return result
    }

    /**
     * Starts to create a new child element with the specified ID.
     *
     * @param id: The ID of the child element.
     * @since 11
     */
    static func createNewChildStart(id: String): Unit {
        unsafe {
            try (id_ = LibC.mallocCString(id).asResource()) {
                FfiOHOSAceFrameworkViewCreateNewChildStart(id_.value)
            }
        }
    }

    /**
     * Finished the creation of the new child.
     *
     * @param id: The ID of the child element.
     * @since 11
     */
    static func createNewChildFinish(id: String): Unit {
        unsafe {
            try (id_ = LibC.mallocCString(id).asResource()) {
                FfiOHOSAceFrameworkViewCreateNewChildFinish(id_.value)
            }
        }
    }
}
