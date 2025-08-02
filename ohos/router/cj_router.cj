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

protected package ohos.router

import ohos.base.*
import ohos.hilog.HilogChannel
import ohos.ffi.*
import ohos.arkui.component.*
import std.collection.*
import ohos.labels.APILevel

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouterMode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Single
    | ...

    func getValue(): Int32 {
        match (this) {
            case Standard => 0
            case Single => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RouterState {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var index: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var path: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var params: String

    @!APILevel[
        21,
        stagemodelonly: true,
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Router {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func push(url!: String, params!: String = "") {
        unsafe {
            var cUrl = LibC.mallocCString(url)
            let cParams = LibC.mallocCString(params)
            FfiOHOSAceFrameworkRouterPush(cUrl, cParams)
            LibC.free(cUrl)
            LibC.free(cParams)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func back(url!: String, params!: String = "") {
        unsafe {
            var cUrl = LibC.mallocCString(url)
            let cParams = LibC.mallocCString(params)
            FfiOHOSAceFrameworkRouterBack(cUrl, cParams)
            LibC.free(cUrl)
            LibC.free(cParams)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func back() {
        back(url: "")
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func back(index!: Int32, params!: String = "") {
        unsafe {
            let cParams = LibC.mallocCString(params)
            FfiOHOSAceFrameworkRouterBackIndex(index, cParams)
            LibC.free(cParams)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getParams(): Option<String> {
        let paramStr = unsafe { FfiOHOSAceFrameworkRouterGetParams() }
        var res: Option<String> = Option<String>.None
        if (!paramStr.isNull()) {
            res = Option<String>.Some(paramStr.toString())
            unsafe { paramStr.free() }
        }
        res
    }
}
