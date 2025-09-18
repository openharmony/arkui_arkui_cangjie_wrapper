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

protected package ohos.arkui.component.native_struct

import ohos.arkui.component.custom_view.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
protected func OHOSAceFrameworkRemoteViewForceCompleteRerender(id: Int64, deep: Bool): Unit {
    getRemoteViewOrThrow(id).forceCompleteRerender(deep)
}

@C
protected struct OHOSAceFrameworkRemoteViewUpdateWithJsonParams {
    OHOSAceFrameworkRemoteViewUpdateWithJsonParams(
        let self: Int64,
        let json: CString
    ) {}
}

@C
protected func OHOSAceFrameworkRemoteViewRender(id: Int64): Int64 {
    getRemoteViewOrThrow(id).build()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewRerender(id: Int64): Unit {
    getRemoteViewOrThrow(id).rerender()
}

/**
 * @deprecated
 */
@C
protected func OHOSAceFrameworkRemoteViewRelease(_: Int64): Int64 {
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnAppear(id: Int64): Int64 {
    getRemoteViewOrThrow(id).aboutToAppear()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnShow(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onPageShow()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnHide(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onPageHide()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnBackPress(id: Int64): Bool {
    getRemoteViewOrThrow(id).onBackPress()
}

@C
protected func OHOSAceFrameworkRemoteViewUpdateWithJson(id: Int64, json: CString): Unit {
    getRemoteViewOrThrow(id).updateWithJson(json.toString())
}

@C
protected func OHOSAceFrameworkRemoteViewOnTransition(id: Int64): Int64 {
    getRemoteViewOrThrow(id).pageTransition()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnAboutToRender(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onAboutToRender()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnAfterRender(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onAfterRender()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnDisappear(id: Int64): Int64 {
    getRemoteViewOrThrow(id).aboutToDisappear()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnAboutToBeDeleted(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onAboutToBeDeleted()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewOnDidBuild(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onDidBuild()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewAboutToReuse(id: Int64, params: CString): Int64 {
    // 用于node buider，临时版本仅支持String，后期优化为FFIData。
    let reuseParams = ReuseParams([("${id}", params.toString())])
    getRemoteViewOrThrow(id).aboutToReuseInternal(reuseParams)
    0
}

@C
protected func OHOSAceFrameworkRemoteViewAboutToRecycle(id: Int64): Int64 {
    getRemoteViewOrThrow(id).aboutToRecycleInternal()
    0
}

@C
protected func OHOSAceFrameworkRemoteViewRecycleSelf(id: Int64, params: CString): Int64 {
    getRemoteViewOrThrow(id).recycleSelf(params.toString())
    0
}

func getRemoteViewOrThrow(id: Int64): RemoteView {
    let optHost = FFIDataManager.getInstance().getData<RemoteView>(id)
    match (optHost) {
        case None =>
            throwNativeError("RemoteView of " + id.toString() + " does not exist!\n")
            throw NoneValueException("RemoteView of " + id.toString() + " does not exist!")
        case Some(host) => host
    }
}
