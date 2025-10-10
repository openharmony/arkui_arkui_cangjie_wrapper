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

package ohos.arkui.component.for_each

import ohos.arkui.component.native_struct.*
import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.arkui.state_management.ObservedArrayList
import std.collection.ArrayList

@C
struct SetIdResultFFI {
    SetIdResultFFI(
        let diffIndexArrayPtr: VectorToCFFIArray,
        let duplicateIdsPtr: VectorToCFFIArray,
        let removedChildElmtIdsPtr: VectorToCFFIArray
    ) {}
}

protected struct SetIdResult {
    SetIdResult(
        protected let diffIndexArray: ArrayList<Int64>,
        protected let duplicateIds: ArrayList<Int64>,
        protected let removedChildElmtIds: ArrayList<Int64>
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

type KeyGenFuncType<T> = (T, Int64) -> String
type ItemGenFuncType<T> = (T, Int64) -> Unit

/**
 * The ForEach class is used to create a list of elements based on a data source.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ForEach <: UINodeBase {
    var child: () -> Unit = {=>}

    /*
     * Define the ForEach component.
     *
     * @param { CollectionEx<T> } arr - the array collection to be used in UI.
     * @param { ItemGenFuncType<T> } itemGenerator - item generator function.
     * @param { KeyGenFuncType<T> } keyGenerator - key generator function.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(arr: CollectionEx<T>, itemGenerator!: ItemGenFuncType<T>,
        keyGenerator!: ?ItemGenFuncType<T> = None) {}

    /**
     * Set the value, array, and key.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        this.child = subcomponent
        unsafe {
            FfiOHOSAceFrameworkForEachCreate()
        }
    }

    /**
     * pop for each node of framework.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pop(): Unit {
        unsafe { FfiOHOSAceFrameworkForEachPop() }
    }

    /**
     * initialize the ForEach component.
     */
    protected func initial(): Unit {
        genChild()
        pop()
    }

    /**
     * update the ForEach component.
     */
    protected func update(): Unit {
        genChild()
        pop()
    }

    func genChild(): Unit {
        child()
    }

    /**
     * Sets the new ID array for given element ID.
     *
     * @params elmtId: The ID of the element.
     * @params newIdArray: The Array containing the new ID array elements.
     * @returns ArrayList<Int64>: An Array containing the processed ID.
     */
    protected static func setIdArray(elmtId: Int64, newIdArray: ArrayList<String>): SetIdResult {
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
     * @params id: The ID of the child element.
     */
    protected static func createNewChildStart(id: String): Unit {
        unsafe {
            try (id_ = LibC.mallocCString(id).asResource()) {
                FfiOHOSAceFrameworkViewCreateNewChildStart(id_.value)
            }
        }
    }

    /**
     * Finished the creation of the new child.
     *
     * @params id: The ID of the child element.
     */
    protected static func createNewChildFinish(id: String): Unit {
        unsafe {
            try (id_ = LibC.mallocCString(id).asResource()) {
                FfiOHOSAceFrameworkViewCreateNewChildFinish(id_.value)
            }
        }
    }
}
