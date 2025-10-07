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

package ohos.router

import ohos.base.*
import ohos.hilog.HilogChannel
import ohos.ffi.*
import std.collection.*
import ohos.labels.APILevel
import std.deriving.Derive

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
 * Router Mode
 *
 * @relation enum RouterMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouterMode {
    /**
     * Default route mode.
     * The page will be added to the top of the page stack.
     *
     * @relation Standard,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard

    /**
     * Single route mode.
     * If the target page already has the same url page in the page stack,
     * the same url page closest to the top of the stack will be moved to the top of the stack.
     * If the target page url does not exist in the page stack, route will use default route mode.
     *
     * @relation Single,
     */
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

/**
 * Router State
 *
 * @relation enum RouterState
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RouterState {

    /**
     * Index of the current page in the stack.
     * NOTE: The index starts from 1 from the bottom to the top of the stack.
     *
     * @type { Int32 }
     * @relation index: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var index: Int32

    /**
     * Name of the current page, that is, the file name.
     *
     * @type { String }
     * @relation name: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var name: String

    /**
     * Path of the current page.
     *
     * @type { String }
     * @relation name: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var path: String

    /**
     * Data that passed to the destination page during navigation.
     *
     * @type { Object }
     * @relation params: Object;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var params: String

    /**
     * Router State constructor
     *
     * @param { Int32 } index
     * @param { String } name
     * @param { String } path
     * @param { String } params
     * @returns { This }
     */
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

protected class RouterInner {
    protected static func push(url!: String, params!: String = "") {
        unsafe {
            try (cUrl = LibC.mallocCString(url).asResource(),
                cParams = LibC.mallocCString(params).asResource()) {
                FfiOHOSAceFrameworkRouterPush(cUrl.value, cParams.value)
            }
        }
    }

    protected static func back(url!: String, params!: String = "") {
        unsafe {
            try (cUrl = LibC.mallocCString(url).asResource(),
                cParams = LibC.mallocCString(params).asResource()) {
                FfiOHOSAceFrameworkRouterBack(cUrl.value, cParams.value)
            }
        }
    }

    protected static func back() {
        back(url: "")
    }

    protected static func back(index!: Int32, params!: String = "") {
        unsafe {
            try (cParams = LibC.mallocCString(params).asResource()) {
                FfiOHOSAceFrameworkRouterBackIndex(index, cParams.value)
            }
        }
    }

    protected static func getParams(): Option<String> {
        let paramStr = unsafe { FfiOHOSAceFrameworkRouterGetParams() }
        var res: Option<String> = Option<String>.None
        if (!paramStr.isNull()) {
            res = Option<String>.Some(paramStr.toString())
            unsafe { paramStr.free() }
        }
        res
    }
}
