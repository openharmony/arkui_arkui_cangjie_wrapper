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

package ohos.arkui.component.web

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.ui_resource.*
import ohos.resource_manager.AppResource
import ohos.labels.APILevel
import ohos.webview.*
import std.collection.ArrayList

type VectorScriptItemHandle = CPointer<Unit>

type VectorExpandedMenuItemOptionsHandle = CPointer<Unit>

type VectorHeaderHandle = CPointer<Unit>

foreign {
    func FfiOHOSAceFrameworkWebHandleCancel(result: Int64): Unit

    func FfiOHOSAceFrameworkWebHandleConfirm(result: Int64): Unit

    func FfiOHOSAceFrameworkWebHandlePromptConfirm(result: Int64, message: CString): Unit

    func FfiOHOSAceFrameworkWebReleaseResult(result: Int64): Unit

    func FfiOHOSAceFrameworkWebCreate(src: CString, controller: Int64, webType: Int32, mode: Bool): Unit

    func FfiOHOSAceFrameworkWebFileAccessEnabled(isFileAccessEnabled: Bool): Unit

    func FfiOHOSAceFrameworkWebDomStorageAccessEnabled(isOnLineImageAccessEnabled: Bool): Unit

    func FfiOHOSAceFrameworkWebImageAccessEnabled(isImageAccessEnabled: Bool): Unit

    func FfiOHOSAceFrameworkWebOnlineImageAccessEnabled(isImageAccessEnabled: Bool): Unit

    func FfiOHOSAceFrameworkWebMixedMode(MixedModeNum: Int32): Unit

    func FfiOHOSAceFrameworkWebZoomAccessEnabled(isZoomAccessEnabled: Bool): Unit

    func FfiOHOSAceFrameworkWebGeolocationAccessEnabled(isGeolocationAccessEnabled: Bool): Unit

    func FfiOHOSAceFrameworkWebVerticalScrollBarAccessEnabled(isVerticalScrollBarAccessEnabled: Bool): Unit

    func FfiOHOSAceFrameworkNestedScroll(nestedScrollNum: Int32, scrollBackwardNum: Int32): Unit

    func FfiOHOSAceFrameworkWebBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkWebOnAlert(callback: Int64): Unit

    func FfiOHOSAceFrameworkWebOnPageStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkWebOnPageFinish(callback: Int64): Unit

    func FfiOHOSAceFrameworkWebOnLoadIntercept(callback: Int64): Unit

    func FfiOHOSAbilityAccessCtrlRequestPermissionsFromUserByStdFunc(context: CPointer<Unit>,
        cPermissionList: CArrString, callbackPtr: CPointer<Unit>): Unit

    func FfiOHOSAceFrameworkWebSetCallback(cb: CFunc<(CPointer<Unit>, CArrString, CPointer<Unit>) -> Unit>): Unit

    func FfiOHOSAceFrameworkWebJavaScriptProxy(funcList: VectorInt64Handle, name: CString,
        methodList: VectorStringHandle, controller: Int64): Unit

    func FfiOHOSAceFrameworkWebDarkMode(darkMode: Int32): Unit

    func FfiOHOSAceFrameworkWebForceDarkAccess(access: Bool): Unit

    func FfiWebEnableNativemediaPlayer(enable: Bool, shouldOverlay: Bool): Unit

    func FfiWebOnControllerAttached(callback: Int64): Unit

    func FfiWebOnPermissionRequest(calllback: Int64): Unit

    func FfiWebJavaScriptAccess(javaScriptAccess: Bool): Unit

    func FfiWebOverScrollMode(mode: Int32): Unit

    func FfiWebOverviewModeAccess(overviewModeAccess: Bool): Unit

    func FfiWebDatabaseAccess(databaseAccess: Bool): Unit

    func FfiWebMediaPlayGestureAccess(access: Bool): Unit

    func FfiWebMultiWindowAccess(multiWindow: Bool): Unit

    func FfiWebHorizontalScrollBarAccess(horizontalScrollBar: Bool): Unit

    func FfiWebCacheMode(cacheMode: Int32): Unit

    func FfiWebCopyOptions(value: Int32): Unit

    func FfiWebTextZoomRatio(textZoomRatio: Int32): Unit

    func FfiWebInitialScale(percent: Float32): Unit

    func FfiWebBlockNetwork(block: Bool): Unit

    func FfiWebDefaultFixedFontSize(size: Int32): Unit

    func FfiWebDefaultFontSize(size: Int32): Unit

    func FfiWebMinFontSize(size: Int32): Unit

    func FfiWebMinLogicalFontSize(size: Int32): Unit

    func FfiWebFixedFont(family: CString): Unit

    func FfiWebSansSerifFont(family: CString): Unit

    func FfiWebSerifFont(family: CString): Unit

    func FfiWebStandardFont(family: CString): Unit

    func FfiWebFantasyFont(family: CString): Unit

    func FfiWebCursiveFont(family: CString): Unit

    func FfiVectorScriptItemCreate(size: Int64): VectorScriptItemHandle

    func FfiVectorScriptItemSetElement(vec: VectorScriptItemHandle, index: Int64, item: FfiScriptItem): Unit

    func FfiVectorScriptItemDelete(vec: VectorScriptItemHandle): Unit

    func FfiWebPinchSmooth(isEnabled: Bool): Unit

    func FfiWebAllowWindowOpenMethod(flag: Bool): Unit

    func FfiWebMediaOptions(resumeInterval: Int32, audioExclusive: Bool): Unit

    func FfiWebJavaScriptOnDocumentStart(value: VectorScriptItemHandle): Unit

    func FfiWebJavaScriptOnDocumentEnd(value: VectorScriptItemHandle): Unit

    func FfiWebLayoutMode(mode: Int32): Unit

    func FfiWebEnableNativeEmbedMode(mode: Bool): Unit

    func FfiWebRegisterNativeEmbedRule(tag: CString, ty: CString): Unit

    func FfiWebDefaultTextEncodingFormat(format: CString): Unit

    func FfiWebMetaViewport(enabled: Bool): Unit

    func FfiWebTextAutosizing(textAutosizing: Bool): Unit

    func FfiVectorExpandedMenuItemOptionsCreate(size: Int64): VectorExpandedMenuItemOptionsHandle

    func FfiVectorExpandedMenuItemOptionsSetElement(vec: VectorExpandedMenuItemOptionsHandle, index: Int64,
        item: FfiExpandedMenuItemOptions): Unit

    func FfiVectorExpandedMenuItemOptionsDelete(vec: VectorExpandedMenuItemOptionsHandle): Unit

    func FfiWebSelectionMenuOptions(value: VectorExpandedMenuItemOptionsHandle): Unit

    func FfiWebOnAdsBlocked(callback: Int64): Unit

    func FfiWebKeyboardAvoidMode(mode: Int32): Unit

    func FfiWebEditMenuOptions(callbackOnCreateMenu: Int64, callbackOnMenuItemClick: Int64): Unit

    func FfiWebOnBeforeUnload(callback: Int64): Unit

    func FfiWebOnConfirm(callback: Int64): Unit

    func FfiWebOnPrompt(callback: Int64): Unit

    func FfiWebOnConsole(callback: Int64): Unit

    func FfiWebConsoleGetLineNumber(msg: CPointer<Unit>): Int32

    func FfiWebConsoleGetMessage(msg: CPointer<Unit>): ExternalString

    func FfiWebConsoleGetMessageLevel(msg: CPointer<Unit>): Int32

    func FfiWebConsoleGetSourceId(msg: CPointer<Unit>): ExternalString

    func FfiWebFreeConsoleMessage(msg: CPointer<Unit>): Unit

    func FfiWebOnDownloadStart(callback: Int64): Unit

    func FfiWebOnErrorReceive(callback: Int64): Unit

    func FfiWebGetErrorInfo(ptr: CPointer<Unit>): ExternalString

    func FfiWebGetErrorCode(ptr: CPointer<Unit>): Int32

    func FfiWebFreeResourceError(ptr: CPointer<Unit>): Unit

    func FfiVectorHeaderCreate(size: Int64): VectorHeaderHandle

    func FfiVectorHeaderGet(index: Int64, vec: VectorHeaderHandle): FfiHeader

    func FfiVectorHeaderSize(vec: VectorHeaderHandle): Int64

    func FfiVectorHeaderDelete(vec: VectorHeaderHandle): Unit

    func FfiWebGetRequestHeader(ptr: CPointer<Unit>): VectorHeaderHandle

    func FfiWebGetRequestUrl(ptr: CPointer<Unit>): ExternalString

    func FfiWebIsMainFrame(ptr: CPointer<Unit>): Bool

    func FfiWebIsRedirect(ptr: CPointer<Unit>): Bool

    func FfiWebIsRequestGesture(ptr: CPointer<Unit>): Bool

    func FfiWebGetRequestMethod(ptr: CPointer<Unit>): ExternalString

    func FfiWebFreeResourceRequest(ptr: CPointer<Unit>): Unit

    func FfiWebGetReasonMessage(ptr: CPointer<Unit>): ExternalString

    func FfiWebGetResponseCode(ptr: CPointer<Unit>): Int32

    func FfiWebGetResponseData(ptr: CPointer<Unit>): ExternalString

    func FfiWebGetResponseEncoding(ptr: CPointer<Unit>): ExternalString

    func FfiWebGetResponseHeader(ptr: CPointer<Unit>): VectorHeaderHandle

    func FfiWebFreeResourceResponse(ptr: CPointer<Unit>): Unit
}

class FfiVectorScriptItem {
    private let vecHandle: VectorScriptItemHandle
    init(vec: VectorScriptItemHandle) {
        vecHandle = vec
    }
    init(size: Int64) {
        vecHandle = unsafe { FfiVectorScriptItemCreate(size) }
    }
    func setElement(index: Int64, value: FfiScriptItem): Unit {
        unsafe { FfiVectorScriptItemSetElement(vecHandle, index, value) }
    }
    func free(): Unit {
        unsafe { FfiVectorScriptItemDelete(vecHandle) }
    }
    func getNativeHandle(): VectorScriptItemHandle {
        vecHandle
    }
}

enum WebType {
    SURFACE
    | TEXTURE
    | ...

    func getValue(): Int32 {
        match (this) {
            case SURFACE => 0
            case TEXTURE => 1
            case _ => 0
        }
    }
}

class FfiVectorExpandedMenuItemOptions {
    private let vecHandle: VectorExpandedMenuItemOptionsHandle
    init(vec: VectorExpandedMenuItemOptionsHandle) {
        vecHandle = vec
    }
    init(size: Int64) {
        vecHandle = unsafe { FfiVectorExpandedMenuItemOptionsCreate(size) }
    }
    func setElement(index: Int64, value: FfiExpandedMenuItemOptions): Unit {
        unsafe { FfiVectorExpandedMenuItemOptionsSetElement(vecHandle, index, value) }
    }
    func free(): Unit {
        unsafe { FfiVectorExpandedMenuItemOptionsDelete(vecHandle) }
    }
    func getNativeHandle(): VectorExpandedMenuItemOptionsHandle {
        vecHandle
    }
}

@C
struct FfiAdsBlockedDetails {
    FfiAdsBlockedDetails(
        let url: CString,
        let adsBlocked: VectorStringHandle
    ) {}
}

@C
struct FfiExpandedMenuItemOptions {
    FfiExpandedMenuItemOptions(
        let content: CString,
        let startIcon: CString,
        let hasStartIcon: Bool,
        let action: Int64
    ) {}
}

@C
struct FfiScriptItem {
    FfiScriptItem(
        let script: CString,
        let scriptRules: VectorStringHandle
    ) {}
}

@C
func FfiOHOSAbilityAccessCtrlRequestPermissionsFromUserCallBack(context: CPointer<Unit>, cPermissionList: CArrString,
    callbackPtr: CPointer<Unit>): Unit {
    unsafe { FfiOHOSAbilityAccessCtrlRequestPermissionsFromUserByStdFunc(context, cPermissionList, callbackPtr) }
}

@C
struct FfiWebEvent {
    FfiWebEvent(
        let url: CString,
        let message: CString,
        let value: CString,
        let result: Int64
    ) {}
}

const RAWFILE_TYPE: Int32 = 30000

class CallbackCJWebEvent <: BaseCallBack {
    CallbackCJWebEvent(let closure: (FfiWebEvent) -> Bool) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJWebEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<FfiWebEvent>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJWebEvent")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class WebResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let result: Int64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(result: Int64) {
        this.result = result
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleCancel(): Unit {
        unsafe { FfiOHOSAceFrameworkWebHandleCancel(this.result) }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleConfirm(): Unit {
        unsafe { FfiOHOSAceFrameworkWebHandleConfirm(this.result) }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handlePromptConfirm(result: String): Unit {
        unsafe {
            let msg = LibC.mallocCString(result)
            FfiOHOSAceFrameworkWebHandlePromptConfirm(this.result, msg)
            LibC.free(msg)
        }
    }

    ~init() {
        unsafe {
            FfiOHOSAceFrameworkWebReleaseResult(result)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class WebEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var url: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var result: WebResult

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        url: String,
        message: String,
        value: String,
        result: WebResult
    ) {
        this.url = url
        this.message = message
        this.value = value
        this.result = result
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OnPageEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var url: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(url: String) {
        this.url = url
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class Header {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var headerKey: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var headerValue: String

    init(
        headerKey: String,
        headerValue: String
    ) {
        this.headerKey = headerKey
        this.headerValue = headerValue
    }
}

@C
struct FfiHeader {
    FfiHeader(
        let headerKey: ExternalString,
        let headerValue: ExternalString
    ) {}
}

struct FfiVectorHeader {
    private let vecHandle: VectorHeaderHandle
    init(vec: VectorHeaderHandle) {
        vecHandle = vec
    }
    init(size: Int64) {
        vecHandle = unsafe { FfiVectorHeaderCreate(size) }
    }
    func getElement(index: Int64): FfiHeader {
        unsafe { FfiVectorHeaderGet(index, vecHandle) }
    }
    func getSize(): Int64 {
        unsafe { FfiVectorHeaderSize(vecHandle) }
    }
    func getNativeHandle(): VectorHeaderHandle {
        vecHandle
    }
    func free(): Unit {
        unsafe { FfiVectorHeaderDelete(vecHandle) }
    }
}

@C
struct FfiOnDownloadStartEvent {
    FfiOnDownloadStartEvent(
        let url: CString,
        let userAgent: CString,
        let contentDisposition: CString,
        let mimetype: CString,
        let contentLength: Int64
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebResourceRequest {
    WebResourceRequest(
        let requestUrl_: String,
        let isMainFrame_: Bool,
        let isRedirect_: Bool,
        let isRequestGesture_: Bool,
        let requestMethod_: String,
        let headers: FfiMapToCFFIArray
    ) {}

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestHeader(): ArrayList<Header> {
        let vecFFi = this.headers
        let size = vecFFi.size
        var result = ArrayList<Header>(size)
        for (idx in 0..size) {
            unsafe {
                let key = CString(CPointer<UInt8>(vecFFi.key.read(idx)))
                let value = CString(CPointer<UInt8>(vecFFi.value.read(idx)))
                try {
                    var kstr = key.toString()
                    var vstr = value.toString()
                    result.add(Header(kstr, vstr))
                } catch (e: Exception) {
                    AppLog.debug("getRequestHeader Exception: ${e.message}")
                }
            }
        }
        result
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestUrl(): String {
        return requestUrl_
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isMainFrame(): Bool {
        return isMainFrame_
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isRedirect(): Bool {
        return isRedirect_
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isRequestGesture(): Bool {
        return isRequestGesture_
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestMethod(): String {
        return requestMethod_
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnPermissionRequestEvent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public let request: PermissionRequest

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(request: PermissionRequest) {
        this.request = request
    }
}

@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class PermissionRequest {
    let cDeny: CFunc<(CPointer<Unit>) -> Unit>
    let cGetOrigin: CFunc<(CPointer<Unit>) -> ExternalString>
    let cGetAccessibleResource: CFunc<(CPointer<Unit>) -> VectorStringHandle>
    let cGrant: CFunc<(VectorStringHandle, CPointer<Unit>) -> Unit>
    let cPermission: CPointer<Unit>
    let cFree: CFunc<(CPointer<Unit>) -> Unit>

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func deny(): Unit {
        unsafe {
            cDeny(cPermission)
        }
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getOrigin(): String {
        unsafe {
            let cstr = cGetOrigin(cPermission)
            let res = cstr.toString()
            cstr.free()
            return res
        }
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getAccessibleResource(): Array<String> {
        unsafe {
            let arrayPtr = FFIVectorString(cGetAccessibleResource(cPermission))
            let array = Array<String>(arrayPtr.getSize(), {
                i => arrayPtr.getElement(i)
            })
            arrayPtr.free()
            return array
        }
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func grant(resources: Array<String>): Unit {
        unsafe {
            let resourcesPtr = FFIVectorString(resources.size)
            for (i in 0..resources.size) {
                resourcesPtr.setElement(i, resources[i])
            }
            cGrant(resourcesPtr.getNativeHandle(), cPermission)
            resourcesPtr.free()
        }
    }

    init(
        cDeny: CFunc<(CPointer<Unit>) -> Unit>,
        cGetOrigin: CFunc<(CPointer<Unit>) -> ExternalString>,
        cGetAccessibleResource: CFunc<(CPointer<Unit>) -> VectorStringHandle>,
        cGrant: CFunc<(VectorStringHandle, CPointer<Unit>) -> Unit>,
        cPermission: CPointer<Unit>,
        cFree: CFunc<(CPointer<Unit>) -> Unit>
    ) {
        this.cDeny = cDeny
        this.cGetOrigin = cGetOrigin
        this.cGetAccessibleResource = cGetAccessibleResource
        this.cGrant = cGrant
        this.cPermission = cPermission
        this.cFree = cFree
    }

    ~init() {
        unsafe {
            cFree(cPermission)
        }
    }
}

@C
struct CPermissionRequest {
    CPermissionRequest(
        let deny: CFunc<(CPointer<Unit>) -> Unit>,
        let getOrigin: CFunc<(CPointer<Unit>) -> ExternalString>,
        let getAccessibleResource: CFunc<(CPointer<Unit>) -> VectorStringHandle>,
        let grant: CFunc<(VectorStringHandle, CPointer<Unit>) -> Unit>,
        let permissionPtr: CPointer<Unit>,
        let free: CFunc<(CPointer<Unit>) -> Unit>
    ) {}
}

@C
struct COnPermissionRequestEvent {
    COnPermissionRequestEvent(let request: CPermissionRequest) {}
}

func parsePermissionRequestEvent(event: COnPermissionRequestEvent): OnPermissionRequestEvent {
    unsafe {
        return OnPermissionRequestEvent(
            PermissionRequest(
                event.request.deny,
                event.request.getOrigin,
                event.request.getAccessibleResource,
                event.request.grant,
                event.request.permissionPtr,
                event.request.free
            )
        )
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class Web <: ViewBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(
        src!: String = "",
        controller!: WebviewController = WebviewController()
    ) {
        unsafe {
            FfiOHOSAceFrameworkWebSetCallback(FfiOHOSAbilityAccessCtrlRequestPermissionsFromUserCallBack)
            let srcStr = LibC.mallocCString(src)
            FfiOHOSAceFrameworkWebCreate(srcStr, controller.getID(), WebType.SURFACE.getValue(), false)
            LibC.free(srcStr)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(
        src!: AppResource,
        controller!: WebviewController = WebviewController()
    ) {
        unsafe {
            FfiOHOSAceFrameworkWebSetCallback(FfiOHOSAbilityAccessCtrlRequestPermissionsFromUserCallBack)
            var srcStr: CString
            if (src.resType.getOrThrow() == RAWFILE_TYPE) {
                srcStr = LibC.mallocCString(getResourceMedia(src))
            } else {
                srcStr = LibC.mallocCString(getResourceString(src))
            }
            FfiOHOSAceFrameworkWebCreate(srcStr, controller.getID(), WebType.SURFACE.getValue(), false)
            LibC.free(srcStr)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func fileAccess(fileAccess: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebFileAccessEnabled(fileAccess)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func domStorageAccess(domStorageAccess: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebDomStorageAccessEnabled(domStorageAccess)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func imageAccess(imageAccess: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebImageAccessEnabled(imageAccess)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onlineImageAccess(onlineImageAccess: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebOnlineImageAccessEnabled(onlineImageAccess)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func mixedMode(mixedMode: MixMode): This {
        unsafe {
            FfiOHOSAceFrameworkWebMixedMode(mixedMode.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func zoomAccess(zoomAccess: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebZoomAccessEnabled(zoomAccess)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func geolocationAccess(geolocationAccess: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebGeolocationAccessEnabled(geolocationAccess)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func verticalScrollBarAccess(verticalScrollBar: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebVerticalScrollBarAccessEnabled(verticalScrollBar)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func nestedScroll(
        scrollForward!: NestedScrollMode = NestedScrollMode.SELF_FIRST,
        scrollBackward!: NestedScrollMode = NestedScrollMode.SELF_FIRST
    ): This {
        unsafe {
            FfiOHOSAceFrameworkNestedScroll(scrollForward.getValue(), scrollBackward.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onLoadIntercept(callback: (WebResourceRequest) -> Bool): This {
        unsafe {
            let wrapper = {
                ffiRequest: FfiWebResourceRequest =>
                let event = WebResourceRequest(
                    ffiRequest.requestUrl.toString(),
                    ffiRequest.isMainFrame,
                    ffiRequest.isRedirect,
                    ffiRequest.isRequestGesture,
                    ffiRequest.requestMethod.toString(),
                    ffiRequest.ffiHeaders.read()
                )
                return callback(event)
            }
            let lambdaData = CallbackCJWebResourceRequest(wrapper)
            FfiOHOSAceFrameworkWebOnLoadIntercept(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onPageBegin(callback: (OnPageEvent) -> Unit): This {
        let wrapper = {
            url: CString =>
            let event = OnPageEvent(url.toString())
            callback(event)
        }

        let lambdaData = Callback1Param<CString, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkWebOnPageStart(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onPageEnd(callback: (OnPageEvent) -> Unit): This {
        let wrapper = {
            url: CString =>
            let event = OnPageEvent(url.toString())
            callback(event)
        }

        let lambdaData = Callback1Param<CString, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkWebOnPageFinish(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func javaScriptProxy(funcList!: Array<(String) -> String>, name!: String, methodList!: Array<String>,
        controller!: WebviewController): This {
        unsafe {
            let vecFfi = FFIVectorString(methodList.size)
            for (i in 0..methodList.size) {
                vecFfi.setElement(i, methodList[i])
            }
            let cname = LibC.mallocCString(name)

            let funcVec = FFIVectorInt64(funcList.size)
            for (i in 0..funcList.size) {
                let wrapper = {
                    p: CString =>
                    let data = p.toString()
                    let str = funcList[i](data)
                    LibC.free(p)
                    let cstr = LibC.mallocCString(str)
                    return cstr
                }
                let lambdaData = Callback1Param<CString, CString>(wrapper)
                funcVec.setElement(i, lambdaData.getID())
            }

            FfiOHOSAceFrameworkWebJavaScriptProxy(funcVec.getNativeHandle(), cname, vecFfi.getNativeHandle(),
                controller.getID())
            LibC.free(cname)
            vecFfi.free()
            funcVec.free()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public override func backgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkWebBackgroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func darkMode(mode: WebDarkMode): This {
        unsafe {
            FfiOHOSAceFrameworkWebDarkMode(mode.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func forceDarkAccess(access: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebForceDarkAccess(access)
        }
        this
    }
}
