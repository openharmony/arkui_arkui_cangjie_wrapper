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

package ohos.observer

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ObserverType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_NAV_DESTINATION_UPDATE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_SCROLL_EVENT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_ROUTER_PAGE_UPDATE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_DENSITY_UPDATE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_WILL_DRAW
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_DID_LAYOUT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OBSERVER_NAV_DESTINATION_SWITCH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
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
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavDestinationState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_SHOWN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_HIDDEN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_APPEAR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_DISAPPEAR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_WILL_SHOW
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_WILL_HIDE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_WILL_APPEAR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_WILL_DISAPPEAR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_BACKPRESS
    | ...

    func getValue(): UInt32 {
        match (this) {
            case ON_SHOWN => 0
            case ON_HIDDEN => 1
            case ON_APPEAR => 2
            case ON_DISAPPEAR => 3
            case ON_WILL_SHOW => 4
            case ON_WILL_HIDE => 5
            case ON_WILL_APPEAR => 6
            case ON_WILL_DISAPPEAR => 7
            case ON_BACKPRESS => 100
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: UInt32) {
        match (val) {
            case 0 => ON_SHOWN
            case 1 => ON_HIDDEN
            case 2 => ON_APPEAR
            case 3 => ON_DISAPPEAR
            case 4 => ON_WILL_SHOW
            case 5 => ON_WILL_HIDE
            case 6 => ON_WILL_APPEAR
            case 7 => ON_WILL_DISAPPEAR
            case 100 => ON_BACKPRESS
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollEventType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLL_START
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouterPageState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ABOUT_TO_APPEAR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ABOUT_TO_DISAPPEAR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_PAGE_SHOW
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_PAGE_HIDE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_BACK_PRESS
    | ...

    func getValue(): UInt32 {
        match (this) {
            case ABOUT_TO_APPEAR => 0
            case ABOUT_TO_DISAPPEAR => 1
            case ON_PAGE_SHOW => 2
            case ON_PAGE_HIDE => 3
            case ON_BACK_PRESS => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: UInt32) {
        match (val) {
            case 0 => ABOUT_TO_APPEAR
            case 1 => ABOUT_TO_DISAPPEAR
            case 2 => ON_PAGE_SHOW
            case 3 => ON_PAGE_HIDE
            case 4 => ON_BACK_PRESS
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TabContentState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ON_SHOW
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavDesitinationInfo {
    public NavDesitinationInfo(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let navigationId: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let name: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let state: NavDestinationState,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let index: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let param: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let navDestinationId: String
    ) {}

    init(cNavDesitinationInfo: CNavDesitinationInfo) {
        this.navigationId = cNavDesitinationInfo.navigationId.toString()
        this.name = cNavDesitinationInfo.name.toString()
        this.state = NavDestinationState.parse(cNavDesitinationInfo.state)
        this.index = cNavDesitinationInfo.index
        this.param = cNavDesitinationInfo.param.toString()
        this.navDestinationId = cNavDesitinationInfo.navDestinationId.toString()
    }
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollEventInfo {
    public ScrollEventInfo(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let id: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let uniqueId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TabContentInfo {
    public TabContentInfo(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let tabContentId: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let tabContentUniqueId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let state: TabContentState,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let id: String,
        @!APILevel[
            19,
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ObserverOptions {
    public ObserverOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let id: String) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavDestinationSwitchObserverOptions {
    public NavDestinationSwitchObserverOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let navigationId: String) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func on(`type`: ObserverType, callback: Callback1Argument<ScrollEventInfo>): Unit {
    match (`type`) {
        case OBSERVER_SCROLL_EVENT => onScrollEvent(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func off(`type`: ObserverType, callback: Callback1Argument<ScrollEventInfo>): Unit {
    match (`type`) {
        case OBSERVER_SCROLL_EVENT => offScrollEvent(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func off(`type`: ObserverType): Unit {
    match (`type`) {
        case OBSERVER_SCROLL_EVENT => offScrollEvent(`type`.toString())
        case OBSERVER_TAB_CONTENT_UPDATE => offTabContentUpdate(`type`.toString())
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func on(`type`: ObserverType, options: ObserverOptions, callback: Callback1Argument<ScrollEventInfo>): Unit {
    match (`type`) {
        case OBSERVER_SCROLL_EVENT => onScrollEvent(`type`.toString(), options, callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func off(`type`: ObserverType, options: ObserverOptions, callback: Callback1Argument<ScrollEventInfo>): Unit {
    match (`type`) {
        case OBSERVER_SCROLL_EVENT => offScrollEvent(`type`.toString(), options, callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func off(`type`: ObserverType, options: ObserverOptions): Unit {
    match (`type`) {
        case OBSERVER_SCROLL_EVENT => offScrollEvent(`type`.toString(), options)
        case OBSERVER_TAB_CONTENT_UPDATE => offTabContentUpdate(`type`.toString(), options)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func on(`type`: ObserverType, callback: Callback1Argument<TabContentInfo>): Unit {
    match (`type`) {
        case OBSERVER_TAB_CONTENT_UPDATE => onTabContentUpdate(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func off(`type`: ObserverType, callback: Callback1Argument<TabContentInfo>): Unit {
    match (`type`) {
        case OBSERVER_TAB_CONTENT_UPDATE => offTabContentUpdate(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func on(`type`: ObserverType, options: ObserverOptions, callback: Callback1Argument<TabContentInfo>): Unit {
    match (`type`) {
        case OBSERVER_TAB_CONTENT_UPDATE => onTabContentUpdate(`type`.toString(), options, callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func off(`type`: ObserverType, options: ObserverOptions, callback: Callback1Argument<TabContentInfo>): Unit {
    match (`type`) {
        case OBSERVER_TAB_CONTENT_UPDATE => offTabContentUpdate(`type`.toString(), options, callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
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
