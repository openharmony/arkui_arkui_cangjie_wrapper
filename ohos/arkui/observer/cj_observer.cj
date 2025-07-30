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

package ohos.arkui.observer

import ohos.ffi.*
import ohos.base.*
import std.sync.*
import std.collection.*
import std.collection.HashMap
import ohos.labels.APILevel

foreign {
    func FfiOHOSObserverRegisterScrollEventCallback(callbackId: Int64): Unit

    func FfiOHOSObserverUnRegisterScrollEventCallback(callbackId: Int64): Unit

    func FfiOHOSObserverRegisterScrollEventCallbackWithOptions(options: CString, callbackId: Int64): Unit

    func FfiOHOSObserverUnRegisterScrollEventCallbackWithOptions(options: CString, callbackId: Int64): Unit

    func FfiOHOSObserverRegisterTabContentUpdateCallback(callbackId: Int64): Unit

    func FfiOHOSObserverUnRegisterTabContentUpdateCallback(callbackId: Int64): Unit

    func FfiOHOSObserverRegisterTabContentUpdateCallbackWithOptions(options: CString, callbackId: Int64): Unit

    func FfiOHOSObserverUnRegisterTabContentUpdateCallbackWithOptions(options: CString, callbackId: Int64): Unit
}

const EXCEPTION_PARAMCHECK: Int32 = 401
let REGISTER_MUTEX = Mutex()
let CALLBACKMAPS = HashMap<String, ArrayList<(CallbackObject, Int64)>>(
    [
        (OBSERVER_NAV_DESTINATION_UPDATE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (OBSERVER_SCROLL_EVENT.toString(), ArrayList<(CallbackObject, Int64)>()),
        (OBSERVER_ROUTER_PAGE_UPDATE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (OBSERVER_DENSITY_UPDATE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (OBSERVER_WILL_DRAW.toString(), ArrayList<(CallbackObject, Int64)>()),
        (OBSERVER_DID_LAYOUT.toString(), ArrayList<(CallbackObject, Int64)>()),
        (OBSERVER_NAV_DESTINATION_SWITCH.toString(), ArrayList<(CallbackObject, Int64)>()),
        (OBSERVER_TAB_CONTENT_UPDATE.toString(), ArrayList<(CallbackObject, Int64)>())
    ]
)

/*
 * Find the callback among registered callbacks
 *
 * @param list: registered callbacks
 * @param callback: target callback object
 * @return index of the found callback if it exists else -1
 */
func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Int64 {
    for (idx in 0..list.size) {
        if (refEq(callback, list[idx][0])) {
            return idx
        }
    }
    return -1
}

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ObserverType <: ToString {
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_NAV_DESTINATION_UPDATE
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_SCROLL_EVENT
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_ROUTER_PAGE_UPDATE
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_DENSITY_UPDATE
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_WILL_DRAW
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_DID_LAYOUT
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_NAV_DESTINATION_SWITCH
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_TAB_CONTENT_UPDATE
    | ...

    public func toString(): String {
        return match (this) {
            case OBSERVER_NAV_DESTINATION_UPDATE => "navDestinationUpdate"
            case OBSERVER_SCROLL_EVENT => "scrollEvent"
            case OBSERVER_ROUTER_PAGE_UPDATE => "routerPageUpdate"
            case OBSERVER_DENSITY_UPDATE => "densityUpdate"
            case OBSERVER_WILL_DRAW => "willDraw"
            case OBSERVER_DID_LAYOUT => "didLayout"
            case OBSERVER_NAV_DESTINATION_SWITCH => "navDestinationSwitch"
            case OBSERVER_TAB_CONTENT_UPDATE => "tabContentUpdate"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollEventType {
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLL_START
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLL_STOP
    | ...

    func getValue(): UInt32 {
        match (this) {
            case SCROLL_START => 0
            case SCROLL_STOP => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: UInt32) {
        match (val) {
            case 0 => SCROLL_START
            case 1 => SCROLL_STOP
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TabContentState {
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_SHOW
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_HIDE
    | ...

    func getValue(): UInt32 {
        match (this) {
            case ON_SHOW => 0
            case ON_HIDE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: UInt32) {
        match (val) {
            case 0 => ON_SHOW
            case 1 => ON_HIDE
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

@C
struct CNavDesitinationInfo {
    CNavDesitinationInfo(
        let navigationId: CString,
        let name: CString,
        let state: UInt32,
        let index: Int32,
        let param: CString,
        let navDestinationId: CString
    ) {}
}


@C
struct CScrollEventInfo {
    CScrollEventInfo(
        let id: CString,
        let uniqueId: Int32,
        let scrollEvent: UInt32,
        let offset: Float32
    ) {}
}

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollEventInfo {
    public ScrollEventInfo(
        @!APILevel[
            21,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let id: String,
        @!APILevel[
            21,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let uniqueId: Int32,
        @!APILevel[
            21,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let scrollEvent: ScrollEventType,
        public let offset: Float32
    ) {}

    init(cScrollEventInfo: CScrollEventInfo) {
        this.id = cScrollEventInfo.id.toString()
        this.uniqueId = cScrollEventInfo.uniqueId
        this.scrollEvent = ScrollEventType.parse(cScrollEventInfo.scrollEvent)
        this.offset = cScrollEventInfo.offset
    }
}

@C
struct CTabContentInfo {
    CTabContentInfo(
        let tabContentId: CString,
        let tabContentUniqueId: Int32,
        let state: UInt32,
        let id: CString,
        let uniqueId: Int32
    ) {}
}

@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabContentInfo {
    public TabContentInfo(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let tabContentId: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let tabContentUniqueId: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let state: TabContentState,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let id: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let uniqueId: Int32
    ) {}

    init(cTabContentInfo: CTabContentInfo) {
        this.tabContentId = cTabContentInfo.tabContentId.toString()
        this.tabContentUniqueId = cTabContentInfo.tabContentUniqueId
        this.state = TabContentState.parse(cTabContentInfo.state)
        this.id = cTabContentInfo.id.toString()
        this.uniqueId = cTabContentInfo.uniqueId
    }
}

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ObserverOptions {
    public ObserverOptions(
        @!APILevel[
            21,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let id: String) {}
}

func onScrollEvent(callbackType: String, callback: Callback1Argument<ScrollEventInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to register callback with type ${callbackType}.")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            BaseLog.warn("Observer: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let scrollEventInfo = CPointer<CScrollEventInfo>(value).read()
                callback.invoke(ScrollEventInfo(scrollEventInfo))
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            FfiOHOSObserverRegisterScrollEventCallback(registerCall.getID())
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

func offScrollEvent(callbackType: String, callback: Callback1Argument<ScrollEventInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            BaseLog.warn("Observer: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            FfiOHOSObserverUnRegisterScrollEventCallback(callbackId)
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

func offScrollEvent(callbackType: String): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        unsafe {
            FfiOHOSObserverUnRegisterScrollEventCallback(-1)
            v.value.getOrThrow().clear()
        }
    }
}

func offTabContentUpdate(callbackType: String): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        unsafe {
            FfiOHOSObserverUnRegisterTabContentUpdateCallback(-1)
            v.value.getOrThrow().clear()
        }
    }
}

func onScrollEvent(callbackType: String, options: ObserverOptions, callback: Callback1Argument<ScrollEventInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to register callback with type ${callbackType}.")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            BaseLog.warn("Observer: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let scrollEventInfo = CPointer<CScrollEventInfo>(value).read()
                callback.invoke(ScrollEventInfo(scrollEventInfo))
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let cOptions = LibC.mallocCString(options.id)
            FfiOHOSObserverRegisterScrollEventCallbackWithOptions(cOptions, registerCall.getID())
            LibC.free(cOptions)
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}


func offScrollEvent(callbackType: String, options: ObserverOptions, callback: Callback1Argument<ScrollEventInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            BaseLog.warn("Observer: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let cOptions = LibC.mallocCString(options.id)
            FfiOHOSObserverUnRegisterScrollEventCallbackWithOptions(cOptions, callbackId)
            LibC.free(cOptions)
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

func offScrollEvent(callbackType: String, options: ObserverOptions): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        unsafe {
            let cOptions = LibC.mallocCString(options.id)
            FfiOHOSObserverUnRegisterScrollEventCallbackWithOptions(cOptions, -1)
            LibC.free(cOptions)
            v.value.getOrThrow().clear()
        }
    }
}

func offTabContentUpdate(callbackType: String, options: ObserverOptions): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        unsafe {
            let cOptions = LibC.mallocCString(options.id)
            FfiOHOSObserverUnRegisterTabContentUpdateCallbackWithOptions(cOptions, -1)
            LibC.free(cOptions)
            v.value.getOrThrow().clear()
        }
    }
}

func onTabContentUpdate(callbackType: String, callback: Callback1Argument<TabContentInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to register callback with type ${callbackType}.")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            BaseLog.warn("Observer: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let tabContentInfo = CPointer<CTabContentInfo>(value).read()
                callback.invoke(TabContentInfo(tabContentInfo))
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            FfiOHOSObserverRegisterTabContentUpdateCallback(registerCall.getID())
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

func offTabContentUpdate(callbackType: String, callback: Callback1Argument<TabContentInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            BaseLog.warn("Observer: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            FfiOHOSObserverUnRegisterTabContentUpdateCallback(callbackId)
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

func onTabContentUpdate(callbackType: String, options: ObserverOptions, callback: Callback1Argument<TabContentInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to register callback with type ${callbackType}.")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            BaseLog.warn("Observer: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let tabContentInfo = CPointer<CTabContentInfo>(value).read()
                callback.invoke(TabContentInfo(tabContentInfo))
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let cOptions = LibC.mallocCString(options.id)
            FfiOHOSObserverRegisterTabContentUpdateCallbackWithOptions(cOptions, registerCall.getID())
            LibC.free(cOptions)
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

func offTabContentUpdate(callbackType: String, options: ObserverOptions, callback: Callback1Argument<TabContentInfo>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACKMAPS.entryView(callbackType)
        if (v.value.isNone()) {
            BaseLog.error("Observer: Failed to unregister callback with type ${callbackType}.")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            BaseLog.warn("Observer: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let cOptions = LibC.mallocCString(options.id)
            FfiOHOSObserverUnRegisterTabContentUpdateCallbackWithOptions(cOptions, callbackId)
            LibC.free(cOptions)
            v.value.getOrThrow().remove(at: idx)
        }
    }
}
