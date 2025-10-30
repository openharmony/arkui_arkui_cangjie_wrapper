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

protected package ohos.arkui.ui_context.router

import ohos.base.{ExternalString}
import ohos.hilog.HilogChannel
import ohos.labels.APILevel
import std.deriving.Derive
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkRouterPush(url: CString, param: CString): Unit

    func FfiOHOSAceFrameworkRouterBack(url: CString, param: CString): Unit

    func FfiOHOSAceFrameworkRouterPushUrl(url: CString, param: CString, mode: Int32, callback: Int64): Unit

    func FfiOHOSAceFrameworkRouterReplaceUrl(url: CString, param: CString, mode: Int32, callback: Int64): Unit

    func FfiOHOSAceFrameworkRouterGetParams(): ExternalString

    func FfiOHOSAceFrameworkRouterBackIndex(index: Int32, param: CString): Unit

    func FfiOHOSAceFrameworkRouterClear(): Unit

    func FfiOHOSAceFrameworkRouterGetLength(): Int32

    func FfiOHOSAceFrameworkRouterSetHideAlertBeforeBackPage(): Unit

    func FfiOHOSAceFrameworkRouterSetShowAlertBeforeBackPage(cMsg: CString, callback: Int64): Unit

    func FfiOHOSAceFrameworkRouterGetState(info: CPointer<CJRouterState>): Unit

    func FfiOHOSAceFrameworkRouterGetStateByUrl(url: CString): RouterStateList

    func FfiOHOSAceFrameworkRouterGetStateByIndex(info: CPointer<CJRouterState>): Unit
}

/**
 * Router Mode.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouterMode {
    /**
     * Default route mode.
     * The page will be added to the top of the page stack.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard

    /**
     * Single route mode.
     * If the target page already has the same url page in the page stack,
     * the same url page closest to the top of the stack will be moved to the top of the stack.
     * If the target page url does not exist in the page stack, route will use default route mode.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Single
    | ...

    func getValue(): Int32 {
        match (this) {
            case Standard => 0
            case Single => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Router State.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RouterState {

    /**
     * Index of the current page in the stack.
     * NOTE: The index starts from 1 from the bottom to the top of the stack.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var index: Int32

    /**
     * Name of the current page, that is, the file name.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var name: String

    /**
     * Path of the current page.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var path: String

    /**
     * Data that passed to the destination page during navigation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var params: String

    /**
     * Router State constructor.
     *
     * @param { Int32 } index
     * @param { String } name
     * @param { String } path
     * @param { String } params
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        index!: Int32,
        name!: String,
        path!: String,
        params!: String
    ) {
        this.index = index
        this.name = name
        this.path = path
        this.params = params
    }

    init(info: CJRouterState) {
        this.index = info.index
        this.name = info.name.toString()
        this.path = info.path.toString()
        this.params = info.params.toString()
    }
}

@C
struct CJRouterState {
    CJRouterState(
        let index!: Int32,
        let name!: CString,
        let path!: CString,
        let params!: CString
    ) {}
}

@C
struct RouterStateList {
    RouterStateList(
        let array: CPointer<CJRouterState>,
        let size: Int64,
        let free_: CFunc<(Int64, CPointer<CJRouterState>) -> Unit>
    ) {}

    func free(): Unit {
        if (size > 0) {
            unsafe { free_(size, array) }
        }
    }
}

/**
 * class Router.
 *
 */
 @!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Router {
    private var instanceId_: Int64 = 0

    protected init(instanceId: Int64) {
        this.instanceId_ = instanceId
    }

    /**
     * Navigates to a specified page in the application.
     *
     * @param { String } url
     * @param { String } params
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushUrl(url!: String, params!: String = ""): Unit {
        unsafe {
            try (cUrl = LibC.mallocCString(url).asResource(),
                cParams = LibC.mallocCString(params).asResource()) {
                FfiOHOSAceFrameworkRouterPush(cUrl.value, cParams.value)
            }
        }
    }

    /**
     * Returns to the previous page or a specified page.
     *
     * @param { String } url
     * @param { String } params
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func back(url!: ?String = None, params!: String = ""): Unit {
        unsafe {
            try (cUrl = LibC.mallocCString(url ?? "").asResource(),
                cParams = LibC.mallocCString(params).asResource()) {
                FfiOHOSAceFrameworkRouterBack(cUrl.value, cParams.value)
            }
        }
    }

    /**
     * Returns to the previous page or a specified page.
     *
     * @param { Int32 } index
     * @param { String } params
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func back(index!: Int32, params!: String = ""): Unit {
        unsafe {
            try (cParams = LibC.mallocCString(params).asResource()) {
                FfiOHOSAceFrameworkRouterBackIndex(index, cParams.value)
            }
        }
    }

    /**
     * Obtains information about the current page params.
     *
     * @returns { Option<String> } Page params.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getParams(): Option<String> {
        let paramStr = unsafe { FfiOHOSAceFrameworkRouterGetParams() }
        var res: Option<String> = Option<String>.None
        if (!paramStr.isNull()) {
            res = Option<String>.Some(paramStr.toString())
            unsafe { paramStr.free() }
        }
        res
    }
}
