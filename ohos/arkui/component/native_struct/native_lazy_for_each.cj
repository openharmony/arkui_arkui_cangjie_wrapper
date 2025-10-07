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

protected package ohos.arkui.component.native_struct

import ohos.base.*
import ohos.ffi.*

protected abstract class BaseLazyForEachFuncs <: FFIData {
    protected func generateKey(index: Int64): String
    protected func generateItem(index: Int64): Unit
    protected func getTotalCount(): Int64
    protected func dataChangeListenerRegister(listenerId: Int64): Unit
    protected func dataChangeListenerUnregister(listenerId: Int64): Unit
    protected func startMarkLazy(id: String): Unit
    protected func endMarkLazy(): Unit
    protected func removeChildGroup(id: String): Unit
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsGenerateKey(funcsID: Int64, idx: Int64): ExternalString {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let resStr = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").generateKey(idx)
    return ExternalString(resStr)
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsGenerateItem(funcsID: Int64, idx: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").generateItem(idx)
    0
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsGetTotalCount(funcsID: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let resStr = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").getTotalCount()
    return resStr
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsDataChangeListenerRegister(funcsID: Int64, idx: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").dataChangeListenerRegister(idx)
    0
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsDataChangeListenerUnregister(funcsID: Int64, idx: Int64): Int64 {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}").dataChangeListenerUnregister(idx)
    0
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsMarkLazy(funcsID: Int64, key: CString): Unit {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let funcs = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}")
    funcs.startMarkLazy(key.toString())
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsResetLazy(funcsID: Int64): Unit {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let funcs = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}")
    funcs.endMarkLazy()
}

@C
protected func OHOSAceFrameworkLazyForEachFuncsRemoveChildGroup(funcsID: Int64, composedId: CString): Unit {
    let optData = FFIDataManager.getInstance().getData<BaseLazyForEachFuncs>(funcsID)
    let funcs = getOrThrow(optData, msg: "no funcsID of BaseLazyForEachFuncs ${funcsID}")
    funcs.removeChildGroup(composedId.toString())
}
