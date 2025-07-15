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

import ohos.webview.*

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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum CacheMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Default
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    None
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Online
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Only
    | ...

    func getValue(): Int32 {
        match (this) {
            case Default => 0
            case None => 1
            case Online => 2
            case Only => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum OverScrollMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NEVER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ALWAYS
    | ...

    func getValue(): Int32 {
        match (this) {
            case NEVER => 0
            case ALWAYS => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebLayoutMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FIT_CONTENT
    | ...

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case FIT_CONTENT => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebKeyboardAvoidMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    RESIZE_VISUAL
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    RESIZE_CONTENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    OVERLAYS_CONTENT
    | ...

    func getValue(): Int32 {
        match (this) {
            case RESIZE_VISUAL => 0
            case RESIZE_CONTENT => 1
            case OVERLAYS_CONTENT => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class ScriptItem {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public ScriptItem(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var script: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var scriptRules: Array<String>
    ) {}

    func parseToNative(): FfiScriptItem {
        unsafe {
            let cScript = LibC.mallocCString(script)
            let vecRules = FFIVectorString(scriptRules.size)
            for (i in 0..scriptRules.size) {
                vecRules.setElement(i, scriptRules[i])
            }
            return FfiScriptItem(cScript, vecRules.getNativeHandle())
        }
    }
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

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class ExpandedMenuItemOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var content: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var startIcon: ?String = None

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var action: (String) -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(content!: String, startIcon!: ?String = None, action!: (String) -> Unit) {
        this.content = content
        this.startIcon = startIcon
        this.action = action
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(content!: AppResource, startIcon!: ?AppResource = None, action!: (String) -> Unit) {
        this.content = getResourceString(content)
        if (let Some(v) <- startIcon) {
            this.startIcon = getResourceMedia(v)
        }
        this.action = action
    }

    func parseToNative(): FfiExpandedMenuItemOptions {
        unsafe {
            let cContent = LibC.mallocCString(content)
            var cStartIcon = LibC.mallocCString("")
            var hasStartIcon = false
            if (let Some(v) <- startIcon) {
                cStartIcon = LibC.mallocCString(v)
                hasStartIcon = true
            }
            let wrapper = {
                selectedText: CString => action(selectedText.toString())
            }
            let cAction = Callback1Param<CString, Unit>(wrapper)

            FfiExpandedMenuItemOptions(
                cContent,
                cStartIcon,
                hasStartIcon,
                cAction.getID()
            )
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

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class AdsBlockedDetails {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public AdsBlockedDetails(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let url: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let adsBlocked: Array<String>
    ) {}
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

@C
struct FfiMapToCFFIArray {
    FfiMapToCFFIArray(
        let size: Int64,
        let key: CPointer<CPointer<UInt8>>,
        let value: CPointer<CPointer<UInt8>>
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnAlertEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnAlertEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let url: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let message: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let result: WebResult
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnBeforeUnloadEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnBeforeUnloadEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let url: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let message: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let result: WebResult
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnConfirmEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnConfirmEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let url: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let message: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let result: WebResult
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnPromptEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnPromptEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let url: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let message: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let value: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let result: WebResult
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum MessageLevel {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Debug
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Error
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Info
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Log
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Warn
    | ...

    func getValue(): Int32 {
        match (this) {
            case Debug => 1
            case Error => 4
            case Info => 2
            case Log => 5
            case Warn => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): MessageLevel {
        match (value) {
            case 1 => Debug
            case 4 => Error
            case 2 => Info
            case 5 => Log
            case 3 => Warn
            case _ => Debug
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class ConsoleMessage {
    let msg: CPointer<Unit>
    init(msg: CPointer<Unit>) {
        this.msg = msg
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getLineNumber(): Int32 {
        unsafe {
            FfiWebConsoleGetLineNumber(msg)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getMessage(): String {
        unsafe {
            let cstr = FfiWebConsoleGetMessage(msg)
            let res = cstr.toString()
            cstr.free()
            res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getMessageLevel(): MessageLevel {
        unsafe {
            let level = FfiWebConsoleGetMessageLevel(msg)
            return MessageLevel.parse(level)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getSourceId(): String {
        unsafe {
            let cstr = FfiWebConsoleGetSourceId(msg)
            let res = cstr.toString()
            cstr.free()
            res
        }
    }

    ~init() {
        unsafe {
            FfiWebFreeConsoleMessage(msg)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnConsoleEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnConsoleEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let message: ConsoleMessage) {}
}

const RAWFILE_TYPE: Int32 = 30000

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class WebResult {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public WebResult(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let result: Int64) {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleCancel(): Unit {
        unsafe { FfiOHOSAceFrameworkWebHandleCancel(this.result) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleConfirm(): Unit {
        unsafe { FfiOHOSAceFrameworkWebHandleConfirm(this.result) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class WebEvent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public WebEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var url: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var message: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var value: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var result: WebResult
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OnPageEvent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public OnPageEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var url: String) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class Header {
    Header(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var headerKey: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var headerValue: String
    ) {}
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnHttpErrorReceiveEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnHttpErrorReceiveEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let request: WebResourceRequest,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let response: WebResourceResponse
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebResourceResponse {
    let webRes: CPointer<Unit>
    init(webRes: CPointer<Unit>) {
        this.webRes = webRes
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getReasonMessage(): String {
        unsafe {
            let cstr = FfiWebGetReasonMessage(webRes)
            let res = cstr.toString()
            cstr.free()
            res
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getResponseCode(): Int32 {
        unsafe {
            FfiWebGetResponseCode(webRes)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getResponseData(): String {
        unsafe {
            let cstr = FfiWebGetResponseData(webRes)
            let res = cstr.toString()
            cstr.free()
            res
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getResponseEncoding(): String {
        unsafe {
            let cstr = FfiWebGetResponseEncoding(webRes)
            let res = cstr.toString()
            cstr.free()
            res
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getResponseHeader(): Array<Header> {
        unsafe {
            let arrPtr = FfiVectorHeader(FfiWebGetResponseHeader(webRes))
            let arr = Array<Header>(arrPtr.getSize()) {
                i =>
                let cKey = arrPtr.getElement(i).headerKey
                let cValue = arrPtr.getElement(i).headerValue
                let header = Header(cKey.toString(), cValue.toString())
                cKey.free()
                cValue.free()
                header
            }
            arrPtr.free()
            arr
        }
    }
    ~init() {
        unsafe {
            FfiWebFreeResourceResponse(webRes)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebResourceError {
    let webError: CPointer<Unit>
    init(webError: CPointer<Unit>) {
        this.webError = webError
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getErrorCode(): Int32 {
        unsafe {
            FfiWebGetErrorCode(webError)
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getErrorInfo(): String {
        unsafe {
            let cstr = FfiWebGetErrorInfo(webError)
            let res = cstr.toString()
            cstr.free()
            res
        }
    }
    ~init() {
        unsafe {
            FfiWebFreeResourceError(webError)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnErrorReceiveEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnErrorReceiveEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let request: WebResourceRequest,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let error: WebResourceError
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnDownloadStartEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnDownloadStartEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let url: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let userAgent: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let contentDisposition: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let mimetype: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let contentLength: Int64
    ) {}
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
    12,
    atomicservice: true,
    crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestUrl(): String {
        return requestUrl_
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isMainFrame(): Bool {
        return isMainFrame_
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isRedirect(): Bool {
        return isRedirect_
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isRequestGesture(): Bool {
        return isRequestGesture_
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestMethod(): String {
        return requestMethod_
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OnPermissionRequestEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OnPermissionRequestEvent(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let request: PermissionRequest) {}
}

@!APILevel[
    19,
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
        19,
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
        19,
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
        19,
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
        19,
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

@C
struct FfiWebResourceRequest {
    FfiWebResourceRequest(
        let requestUrl: CString,
        let isMainFrame: Bool,
        let isRedirect: Bool,
        let isRequestGesture: Bool,
        let requestMethod: CString,
        let ffiHeaders: CPointer<FfiMapToCFFIArray>
    ) {}
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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class Web <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAlert(callback: (OnAlertEvent) -> Bool): This {
        let wrapper = {
            event: FfiWebEvent =>
            let result = WebResult(event.result)
            let evt = OnAlertEvent(
                event.url.toString(),
                event.message.toString(),
                result
            )

            callback(evt)
        }
        let lambdaData = CallbackCJWebEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkWebOnAlert(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        deprecated: 10,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func forceDarkAccess(access: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWebForceDarkAccess(access)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func enableNativeMediaPlayer(enable!: Bool = false, shouldOverlay!: Bool = false): This {
        unsafe {
            FfiWebEnableNativemediaPlayer(enable, shouldOverlay)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onControllerAttached(callback: () -> Unit): This {
        unsafe {
            FfiWebOnControllerAttached(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onPermissionRequest(callback: (OnPermissionRequestEvent) -> Unit): This {
        unsafe {
            let wrapper = {
                value: COnPermissionRequestEvent => callback(parsePermissionRequestEvent(value))
            }
            FfiWebOnPermissionRequest(Callback1Param<COnPermissionRequestEvent, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func javaScriptAccess(javaScriptAccess: Bool): This {
        unsafe {
            FfiWebJavaScriptAccess(javaScriptAccess)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func overScrollMode(mode: OverScrollMode): This {
        unsafe {
            FfiWebOverScrollMode(mode.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func overviewModeAccess(overviewModeAccess: Bool): This {
        unsafe {
            FfiWebOverviewModeAccess(overviewModeAccess)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func databaseAccess(databaseAccess: Bool): This {
        unsafe {
            FfiWebDatabaseAccess(databaseAccess)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func mediaPlayGestureAccess(access: Bool): This {
        unsafe {
            FfiWebMediaPlayGestureAccess(access)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func multiWindowAccess(multiWindow: Bool): This {
        unsafe {
            FfiWebMultiWindowAccess(multiWindow)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func horizontalScrollBarAccess(horizontalScrollBar: Bool): This {
        unsafe {
            FfiWebHorizontalScrollBarAccess(horizontalScrollBar)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func cacheMode(cacheMode: CacheMode): This {
        unsafe {
            FfiWebCacheMode(cacheMode.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func copyOptions(value: CopyOptions): This {
        unsafe {
            FfiWebCopyOptions(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func textZoomRatio(textZoomRatio: Int32): This {
        unsafe {
            FfiWebTextZoomRatio(textZoomRatio)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func initialScale(percent: Float32): This {
        unsafe {
            FfiWebInitialScale(percent)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func blockNetwork(block: Bool): This {
        unsafe {
            FfiWebBlockNetwork(block)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func defaultFixedFontSize(size: Int32): This {
        unsafe {
            FfiWebDefaultFixedFontSize(size)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func defaultFontSize(size: Int32): This {
        unsafe {
            FfiWebDefaultFontSize(size)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func minFontSize(size: Int32): This {
        unsafe {
            FfiWebMinFontSize(size)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func minLogicalFontSize(size: Int32): This {
        unsafe {
            FfiWebMinLogicalFontSize(size)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func webFixedFont(family: String): This {
        unsafe {
            let cstr = LibC.mallocCString(family)
            FfiWebFixedFont(cstr)
            LibC.free(cstr)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func webSansSerifFont(family: String): This {
        unsafe {
            let cstr = LibC.mallocCString(family)
            FfiWebSansSerifFont(cstr)
            LibC.free(cstr)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func webSerifFont(family: String): This {
        unsafe {
            let cstr = LibC.mallocCString(family)
            FfiWebSerifFont(cstr)
            LibC.free(cstr)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func webStandardFont(family: String): This {
        unsafe {
            let cstr = LibC.mallocCString(family)
            FfiWebStandardFont(cstr)
            LibC.free(cstr)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func webFantasyFont(family: String): This {
        unsafe {
            let cstr = LibC.mallocCString(family)
            FfiWebFantasyFont(cstr)
            LibC.free(cstr)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func webCursiveFont(family: String): This {
        unsafe {
            let cstr = LibC.mallocCString(family)
            FfiWebCursiveFont(cstr)
            LibC.free(cstr)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func pinchSmooth(isEnabled: Bool): This {
        unsafe {
            FfiWebPinchSmooth(isEnabled)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func allowWindowOpenMethod(flag: Bool): This {
        unsafe {
            FfiWebAllowWindowOpenMethod(flag)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func mediaOptions(resumeInterval!: Int32 = 0, audioExclusive!: Bool = true): This {
        unsafe {
            FfiWebMediaOptions(resumeInterval, audioExclusive)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func javaScriptOnDocumentStart(scripts: Array<ScriptItem>): This {
        unsafe {
            let vecScripts = FfiVectorScriptItem(scripts.size)
            let elements: Array<FfiScriptItem> = Array(scripts.size) {
                i => scripts[i].parseToNative()
            }
            for (i in 0..scripts.size) {
                vecScripts.setElement(i, elements[i])
            }
            FfiWebJavaScriptOnDocumentStart(vecScripts.getNativeHandle())
            for (i in 0..scripts.size) {
                let element = elements[i]
                LibC.free(element.script)
                LibC.free<Unit>(element.scriptRules)
            }
            vecScripts.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func javaScriptOnDocumentEnd(scripts: Array<ScriptItem>): This {
        unsafe {
            let vecScripts = FfiVectorScriptItem(scripts.size)
            let elements: Array<FfiScriptItem> = Array(scripts.size) {
                i => scripts[i].parseToNative()
            }
            for (i in 0..scripts.size) {
                vecScripts.setElement(i, elements[i])
            }
            FfiWebJavaScriptOnDocumentEnd(vecScripts.getNativeHandle())
            for (i in 0..scripts.size) {
                let element = elements[i]
                LibC.free(element.script)
                LibC.free<Unit>(element.scriptRules)
            }
            vecScripts.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func layoutMode(mode: WebLayoutMode): This {
        unsafe {
            FfiWebLayoutMode(mode.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func enableNativeEmbedMode(mode: Bool): This {
        unsafe {
            FfiWebEnableNativeEmbedMode(mode)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func registerNativeEmbedRule(tag: String, `type`: String): This {
        unsafe {
            let cTag = LibC.mallocCString(tag)
            let cType = LibC.mallocCString(`type`)
            FfiWebRegisterNativeEmbedRule(cTag, cType)
            LibC.free(cTag)
            LibC.free(cType)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func defaultTextEncodingFormat(textEncodingFormat: String): This {
        unsafe {
            let cFormat = LibC.mallocCString(textEncodingFormat)
            FfiWebDefaultTextEncodingFormat(cFormat)
            LibC.free(cFormat)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func metaViewport(enabled: Bool): This {
        unsafe {
            FfiWebMetaViewport(enabled)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func textAutosizing(textAutosizing: Bool): This {
        unsafe {
            FfiWebTextAutosizing(textAutosizing)
        }
        this
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func selectionMenuOptions(expandedMenuOptions: Array<ExpandedMenuItemOptions>): This {
        unsafe {
            let vecOptions = FfiVectorExpandedMenuItemOptions(expandedMenuOptions.size)
            let elements: Array<FfiExpandedMenuItemOptions> = Array(expandedMenuOptions.size) {
                i => expandedMenuOptions[i].parseToNative()
            }
            for (i in 0..expandedMenuOptions.size) {
                vecOptions.setElement(i, elements[i])
            }
            FfiWebSelectionMenuOptions(vecOptions.getNativeHandle())
            for (i in 0..expandedMenuOptions.size) {
                let element = elements[i]
                LibC.free(element.content)
                LibC.free(element.startIcon)
            }
            vecOptions.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onAdsBlocked(callback: (AdsBlockedDetails) -> Unit): This {
        unsafe {
            let wrapper = {
                ffiDetail: FfiAdsBlockedDetails =>
                let url = ffiDetail.url.toString()
                let adsPtr = FFIVectorString(ffiDetail.adsBlocked)
                let adsBlocked = Array(adsPtr.getSize()) {
                    i => adsPtr.getElement(i)
                }
                adsPtr.free()
                callback(AdsBlockedDetails(url, adsBlocked))
            }
            let lambdaData = Callback1Param<FfiAdsBlockedDetails, Unit>(wrapper)
            FfiWebOnAdsBlocked(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func keyboardAvoidMode(mode: WebKeyboardAvoidMode): This {
        unsafe {
            FfiWebKeyboardAvoidMode(mode.getValue())
        }
        this
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func editMenuOptions(
        onCreateMenu: (Array<TextMenuItem>) -> Array<TextMenuItem>,
        onMenuItemClick: (TextMenuItem, Int32, Int32) -> Bool
    ): This {
        let wrapperOnCreateMenu = {
            value: VectorTextMenuItemHandle =>
            let handle = FFIVectorFfiTextMenuItem(value)
            let arr: Array<TextMenuItem> = Array<TextMenuItem>(handle.getSize()) {
                i => parseTextMenuItem(handle.getElement(i))
            }
            let newItems = onCreateMenu(arr)
            let vecFfi = FFIVectorFfiTextMenuItem(newItems.size)
            for (i in 0..newItems.size) {
                vecFfi.setElement(i, newItems[i].parseToNative())
            }
            handle.free()
            return vecFfi.getNativeHandle()
        }
        let lambdaOnCreateMenu = Callback1Param<VectorTextMenuItemHandle, VectorTextMenuItemHandle>(wrapperOnCreateMenu)
        let wrapperOnMenuItemClick = {
            textMenuItem: FfiTextMenuItem, start: Int32, end: Int32 => onMenuItemClick(parseTextMenuItem(textMenuItem),
                start, end)
        }
        let lambdaOnMenuItemClick = Callback3Param<FfiTextMenuItem, Int32, Int32, Bool>(wrapperOnMenuItemClick)
        unsafe {
            FfiWebEditMenuOptions(lambdaOnCreateMenu.getID(), lambdaOnMenuItemClick.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onBeforeUnload(callback: (OnBeforeUnloadEvent) -> Bool): This {
        let wrapper = {
            event: FfiWebEvent =>
            let result = WebResult(event.result)
            let evt = OnBeforeUnloadEvent(
                event.url.toString(),
                event.message.toString(),
                result
            )
            callback(evt)
        }
        let lambdaData = CallbackCJWebEvent(wrapper)
        unsafe {
            FfiWebOnBeforeUnload(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onConfirm(callback: (OnConfirmEvent) -> Bool): This {
        let wrapper = {
            event: FfiWebEvent =>
            let result = WebResult(event.result)
            let evt = OnConfirmEvent(
                event.url.toString(),
                event.message.toString(),
                result
            )
            callback(evt)
        }
        let lambdaData = CallbackCJWebEvent(wrapper)
        unsafe {
            FfiWebOnConfirm(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onPrompt(callback: (OnPromptEvent) -> Bool): This {
        let wrapper = {
            event: FfiWebEvent =>
            let result = WebResult(event.result)
            let evt = OnPromptEvent(
                event.url.toString(),
                event.message.toString(),
                event.value.toString(),
                result
            )
            callback(evt)
        }
        let lambdaData = CallbackCJWebEvent(wrapper)
        unsafe {
            FfiWebOnPrompt(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onConsole(callback: (OnConsoleEvent) -> Bool): This {
        let wrapper = {
            event: CPointer<Unit> =>
            let evt = OnConsoleEvent(ConsoleMessage(event))
            callback(evt)
        }
        let lambdaData = Callback1Param<CPointer<Unit>, Bool>(wrapper)
        unsafe {
            FfiWebOnConsole(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onDownloadStart(callback: (OnDownloadStartEvent) -> Unit): This {
        let wrapper = {
            event: FfiOnDownloadStartEvent =>
            let evt = OnDownloadStartEvent(
                event.url.toString(),
                event.userAgent.toString(),
                event.contentDisposition.toString(),
                event.mimetype.toString(),
                event.contentLength
            )
            callback(evt)
        }
        let lambdaData = Callback1Param<FfiOnDownloadStartEvent, Unit>(wrapper)
        unsafe {
            FfiWebOnDownloadStart(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onErrorReceive(callback: (OnErrorReceiveEvent) -> Unit): This {
        unsafe {
            let wrapper = {
                request: FfiWebResourceRequest, error: CPointer<Unit> =>
                let evt = OnErrorReceiveEvent(
                    WebResourceRequest(
                        request.requestUrl.toString(),
                        request.isMainFrame,
                        request.isRedirect,
                        request.isRequestGesture,
                        request.requestMethod.toString(),
                        request.ffiHeaders.read()
                    ),
                    WebResourceError(error)
                )
                callback(evt)
            }
            let lambdaData = Callback2Param<FfiWebResourceRequest, CPointer<Unit>, Unit>(wrapper)
            FfiWebOnErrorReceive(lambdaData.getID())
        }
        this
    }
}
