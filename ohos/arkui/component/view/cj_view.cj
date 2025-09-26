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

package ohos.arkui.component.view

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.ArrayList

type VectorCJInt64Handle = CPointer<Unit>

foreign {
    func FfiOHOSAceFrameworkNativeViewCreate(view: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewCreateRecycle(view: Int64, isRecycling: Bool, reuseId: CString, callback: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewCtor(remoteId: Int64): Int64

    func FfiOHOSAceFrameworkNativeViewMarkNeedUpdate(nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewNeedsUpdate(nativeViewId: Int64): Bool

    func FfiOHOSAceFrameworkNativeViewMarkStatic(nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewIsStatic(nativeViewId: Int64): Bool

    func FfiOHOSAceFrameworkNativeViewDestroy(nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewIsFirstRender(nativeViewId: Int64): Bool

    func FfiOHOSAceFrameworkNativeViewResetRecycleCustomNode(nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewSyncInstanceId(nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewRestoreInstanceId(nativeViewId: Int64): Unit

    func FfiOHOSAceFrameworkNativeViewFinishUpdateFunc(nativeViewId: Int64, elmtId: Int64): Unit

    func FfiOHOSAceFrameworkViewDeletedElmtIdsHaveBeenPurged(nativeViewId: Int64, array: VectorCJInt64Handle): Unit

    func FfiOHOSAceFrameworkViewGetDeletedElemtIds(nativeViewId: Int64): VectorToCFFIArray

    func FFICJCreateVectorCJInt64(size: Int64): VectorCJInt64Handle

    func FFICJVectorCJInt64SetElement(vec: VectorCJInt64Handle, index: Int64, value: Int64): Unit

    func FFICJVectorCJInt64Delete(vec: VectorCJInt64Handle): Unit

    func FfiOHOSAceFrameworkNativeViewGetUINodeId(nativeViewId: Int64): Int32
}

protected class View <: CommonMethodComponent<ViewAttribute> & ViewAttribute {
    protected static func create(view: View): Unit {
        unsafe {
            FfiOHOSAceFrameworkNativeViewCreate(view.getID())
        }
    }
    protected static func create(remoteId: Int64): View {
        let id = unsafe {
            FfiOHOSAceFrameworkNativeViewCtor(remoteId)
        }
        View(id)
    }

    protected static func createRecycle(componentCall: View, isRecycling: Bool, reuseId: String, callback: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkNativeViewCreateRecycle(componentCall.getID(), isRecycling, LibC.mallocCString(reuseId),
                Callback0Param<Unit>(callback).getID())
        }
    }

    protected init(id: Int64) {
        super(id)
    }

    func getElementId(): Int32 {
        unsafe { FfiOHOSAceFrameworkNativeViewGetUINodeId(getID()) }
    }

    protected func markNeedUpdate(): Unit {
        unsafe {
            FfiOHOSAceFrameworkNativeViewMarkNeedUpdate(this.getID())
        }
    }

    protected func needsUpdate(): Bool {
        unsafe {
            FfiOHOSAceFrameworkNativeViewNeedsUpdate(this.getID())
        }
    }

    protected func markStatic(): Unit {
        unsafe {
            FfiOHOSAceFrameworkNativeViewMarkStatic(this.getID())
        }
    }

    protected func isStatic(): Bool {
        unsafe {
            FfiOHOSAceFrameworkNativeViewIsStatic(this.getID())
        }
    }

    protected func destroy(): Unit {
        unsafe {
            FfiOHOSAceFrameworkNativeViewDestroy(getID())
        }
    }

    protected func syncInstanceId(): Unit {
        unsafe {
            FfiOHOSAceFrameworkNativeViewSyncInstanceId(getID())
        }
    }

    protected func restoreInstanceId(): Unit {
        unsafe {
            FfiOHOSAceFrameworkNativeViewRestoreInstanceId(getID())
        }
    }

    protected func finishUpdateFunc(elmtId: Int64): Unit {
        unsafe {
            FfiOHOSAceFrameworkNativeViewFinishUpdateFunc(getID(), elmtId)
        }
    }

    protected func getDeletedElemtIds(): ArrayList<Int64> {
        let vecFFi = unsafe { FfiOHOSAceFrameworkViewGetDeletedElemtIds(getID()) }
        let size = vecFFi.size
        var result = ArrayList<Int64>(size)
        for (idx in 0..size) {
            unsafe {
                let buf = CPointer<Int64>(vecFFi.buffer)
                result.add(buf.read(idx))
            }
        }

        unsafe { vecFFi.free(CPointer<Unit>(vecFFi.buffer)) }
        result
    }

    protected func deletedElmtIdsHaveBeenPurged(elmtIds: ArrayList<Int64>): Unit {
        let vecFFi = FFIVectorInt64(elmtIds.size)
        var index = 0
        for (id in elmtIds) {
            vecFFi.setElement(index, id)
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkViewDeletedElmtIdsHaveBeenPurged(getID(), vecFFi.getNativeHandle())
        }
        vecFFi.free()
    }

    protected func isFirstRender(): Bool {
        unsafe {
            return FfiOHOSAceFrameworkNativeViewIsFirstRender(getID())
        }
    }

    protected func resetRecycleCustomNode() {
        unsafe {
            FfiOHOSAceFrameworkNativeViewResetRecycleCustomNode(getID())
        }
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ViewAttribute <: CommonMethod<ViewAttribute> {}
