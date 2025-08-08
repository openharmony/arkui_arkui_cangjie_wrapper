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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class RemoteView <: FFIData {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func build(): Unit // abstract

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rerender(): Unit {} // abstract

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func purgeVariableDependenciesOnElmtId(_: Int64): Unit {} // abstract
    protected open func aboutToAppear(): Unit {}
    protected open func onPageShow(): Unit {}
    protected open func onPageHide(): Unit {}
    protected open func onBackPress(): Bool {
        false
    }
    protected open func updateWithJson(_: String): Unit {}
    protected open func onTransition(): Unit {}
    protected open func onAboutToRender(): Unit {}
    protected open func onAfterRender(): Unit {}
    protected open func aboutToDisappear(): Unit {}
    protected open func onAboutToBeDeleted(): Unit {}
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func forceCompleteRerender(deep: Bool): Unit {}
    protected open func onDidBuild(): Unit {}
    protected open func aboutToReuseInternal(_: ReuseParams): Unit {}
    protected open func aboutToRecycleInternal(): Unit {}
    protected open func recycleSelf(_: String): Unit {}
}

@C
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func OHOSAceFrameworkRemoteViewForceCompleteRerender(id: Int64, deep: Bool): Unit {
    getRemoteViewOrThrow(id).forceCompleteRerender(deep)
}

@C
struct OHOSAceFrameworkRemoteViewUpdateWithJsonParams {
    OHOSAceFrameworkRemoteViewUpdateWithJsonParams(
        let self: Int64,
        let json: CString
    ) {}
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

@C
func OHOSAceFrameworkRemoteViewRender(id: Int64): Int64 {
    getRemoteViewOrThrow(id).build()
    0
}

@C
func OHOSAceFrameworkRemoteViewRerender(id: Int64): Unit {
    getRemoteViewOrThrow(id).rerender()
}

/**
 * @deprecated
 */
@C
func OHOSAceFrameworkRemoteViewRelease(_: Int64): Int64 {
    0
}

@C
func OHOSAceFrameworkRemoteViewOnAppear(id: Int64): Int64 {
    getRemoteViewOrThrow(id).aboutToAppear()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnShow(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onPageShow()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnHide(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onPageHide()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnBackPress(id: Int64): Bool {
    getRemoteViewOrThrow(id).onBackPress()
}

@C
func OHOSAceFrameworkRemoteViewUpdateWithJson(id: Int64, json: CString): Unit {
    getRemoteViewOrThrow(id).updateWithJson(json.toString())
}

@C
func OHOSAceFrameworkRemoteViewOnTransition(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onTransition()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnAboutToRender(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onAboutToRender()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnAfterRender(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onAfterRender()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnDisappear(id: Int64): Int64 {
    getRemoteViewOrThrow(id).aboutToDisappear()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnAboutToBeDeleted(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onAboutToBeDeleted()
    0
}

@C
func OHOSAceFrameworkRemoteViewOnDidBuild(id: Int64): Int64 {
    getRemoteViewOrThrow(id).onDidBuild()
    0
}

@C
func OHOSAceFrameworkRemoteViewAboutToReuse(id: Int64, params: CString): Int64 {
    // 用于node buider，临时版本仅支持String，后期优化为FFIData。
    let reuseParams = ReuseParams([("${id}", params.toString())])
    getRemoteViewOrThrow(id).aboutToReuseInternal(reuseParams)
    0
}

@C
func OHOSAceFrameworkRemoteViewAboutToRecycle(id: Int64): Int64 {
    getRemoteViewOrThrow(id).aboutToRecycleInternal()
    0
}

@C
func OHOSAceFrameworkRemoteViewRecycleSelf(id: Int64, params: CString): Int64 {
    getRemoteViewOrThrow(id).recycleSelf(params.toString())
    0
}
