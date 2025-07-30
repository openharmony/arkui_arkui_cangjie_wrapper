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

package ohos.display

import ohos.ffi.*
import ohos.base.*
import std.sync.*
import std.collection.*
import ohos.graphics.color_space_manager.*
import ohos.labels.*
import std.collection.HashMap

foreign {
    func FfiOHOSGetDefaultDisplaySync(): RetStruct

    func FfiOHOSGetAllDisplays(): RetStruct

    func FfiOHOSIsFoldable(): Bool

    func FfiOHOSGetFoldStatus(): UInt32

    func FfiOHOSGetFoldDisplayMode(): UInt32

    func FfiOHOSGetCurrentFoldCreaseRegion(): RetStruct

    func FfiOHOSIsCaptured(): Bool

    func FfiOHOSGetAllDisplayPhysicalResolution(): RetStruct

    func FfiOHOSUnRegisterAllDisplayManagerCallback(callbackType: CString): Int32

    func FfiOHOSRegisterDisplayManagerCallback(callbackType: CString, callbackId: Int64): Int32

    func FfiOHOSUnRegisterDisplayManagerCallback(callbackType: CString, callbackId: Int64): Int32

    func FfiOHOSDisplayGetId(id: Int64): UInt32

    func FfiOHOSGetDisplayName(id: Int64): CString

    func FfiOHOSDisplayGetAlive(id: Int64): Bool

    func FfiOHOSDisplayGetState(id: Int64): UInt32

    func FfiOHOSDisplayGetRefreshRate(id: Int64): UInt32

    func FfiOHOSDisplayGetRotation(id: Int64): UInt32

    func FfiOHOSDisplayGetOrientation(id: Int64): UInt32

    func FfiOHOSDisplayGetWidth(id: Int64): Int32

    func FfiOHOSDisplayGetHeight(id: Int64): Int32

    func FfiOHOSDisplayGetDensityDPI(id: Int64): Float32

    func FfiOHOSDisplayGetVirtualPixelRatio(id: Int64): Float32

    func FfiOHOSDisplayGetXDPI(id: Int64): Float32

    func FfiOHOSDisplayGetYDPI(id: Int64): Float32

    func FfiOHOSDisplayGetColorSpaces(id: Int64): RetStruct

    func FfiOHOSDisplayGetHdrFormats(id: Int64): RetStruct

    func FfiOHOSDisplayGetAvailableWidth(id: Int64): UInt32

    func FfiOHOSDisplayGetAvailableHeight(id: Int64): UInt32

    func FfiOHOSDisplayGetCutoutInfo(id: Int64): RetStruct

    func FfiOHOSDisplayGetAvailableArea(id: Int64): RetStruct

    func FfiOHOSDisplayUnRegisterAllDisplayManagerCallback(callbackType: CString, id: Int64): Int32

    func FfiOHOSDisplayRegisterDisplayManagerCallback(callbackType: CString, id: Int64, callbackId: Int64): Int32

    func FfiOHOSDisplayUnRegisterDisplayManagerCallback(callbackType: CString, id: Int64, callbackId: Int64): Int32
}

const EXCEPTION_PARAMCHECK: Int32 = 401
let REGISTER_MUTEX = Mutex()
let CALLBACK_MAP = HashMap<String, ArrayList<(CallbackObject, Int64)>>(
    [
        (ListnerTypeAdd.getValue(), ArrayList<(CallbackObject, Int64)>()),
        (ListnerTypeRemove.getValue(), ArrayList<(CallbackObject, Int64)>()),
        (ListnerTypeChange.getValue(), ArrayList<(CallbackObject, Int64)>()),
        (ListnerTypeFoldStatusChange.getValue(), ArrayList<(CallbackObject, Int64)>()),
        (ListnerTypeFoldAngleChange.getValue(), ArrayList<(CallbackObject, Int64)>()),
        (ListnerTypeCaptureStatusChange.getValue(), ArrayList<(CallbackObject, Int64)>()),
        (ListnerTypeFoldDisplayModeChange.getValue(), ArrayList<(CallbackObject, Int64)>()),
        (ListnerTypeAvailableAreaChange.getValue(), ArrayList<(CallbackObject, Int64)>())
    ]
)

func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Int64 {
    for (idx in 0..list.size) {
        if (refEq(callback, list[idx][0])) {
            return idx
        }
    }
    return -1
}

/**
* Obtain the default display.
*
* @returns { Display } the result of display
* @throws { BusinessException } 1400001 - Invalid display or screen.
* @throws { BusinessException } 1400003 - This display manager service works abnormally.
* @relation export function getDefaultDisplaySync(): Display
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getDefaultDisplaySync(): Display {
    unsafe {
        let ret = FfiOHOSGetDefaultDisplaySync()
        if (ret.code != 0) {
            DisplayLog.error("[display] ERROR: ${ret.code} Failed to get default display.")
            throw BusinessException(ret.code, "ERROR: Failed to get default display.")
        }
        let dataPtr = CPointer<Int64>(ret.data)
        let retVal = dataPtr.read()
        LibC.free<Int64>(dataPtr)
        return getOrCreate(Display.instanceMap, retVal, {id: Int64 => Display(id)})
    }
}

/**
* Obtain all displays.
*
* @returns { Array<Display> } the result of all displays
* @throws { BusinessException } 1400001 - Invalid display or screen.
* @throws { BusinessException } 1400003 - This display manager service works abnormally.
* @relation function getAllDisplays(): Promise<Array<Display>>
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getAllDisplays(): Array<Display> {
    unsafe {
        let ret = FfiOHOSGetAllDisplays()
        if (ret.code != 0) {
            DisplayLog.error("[display] ERROR: ${ret.code} Failed to get all displays.")
            throw BusinessException(ret.code, "ERROR: Failed to get all displays.")
        }
        let dataPtr = CPointer<Int64>(ret.data)
        let idArray = Array<Int64>(ret.len, {i => dataPtr.read(i)})
        LibC.free<Int64>(dataPtr)
        let result = Array<Display>(ret.len,
            {i => getOrCreate(Display.instanceMap, idArray[i], {id: Int64 => Display(id)})})
        return result
    }
}

/**
* Check whether the device is foldable.
*
* @returns { Bool } true means the device is foldable.
* @relation export function isFoldable(): boolean
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func isFoldable(): Bool {
    unsafe { FfiOHOSIsFoldable() }
}

/**
* Get the current fold status of the foldable device.
*
* @returns { FoldStatus } fold status of device.
* @relation export function getFoldStatus(): FoldStatus
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func getFoldStatus(): FoldStatus {
    unsafe {
        let ret = FfiOHOSGetFoldStatus()
        return FoldStatus.parse(ret)
    }
}

/**
* Get the display mode of the foldable device.
*
* @returns { FoldDisplayMode } display mode of the foldable device.
* @relation export function getFoldDisplayMode(): FoldDisplayMode
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func getFoldDisplayMode(): FoldDisplayMode {
    unsafe {
        let ret = FfiOHOSGetFoldDisplayMode()
        return FoldDisplayMode.parse(ret)
    }
}

/**
* Get the fold crease region in the current display mode.
*
* @returns { FoldCreaseRegion } fold crease region in the current display mode.
* @throws { BusinessException } 1400003 - This display manager service works abnormally.
* @relation export function getCurrentFoldCreaseRegion(): FoldCreaseRegion
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func getCurrentFoldCreaseRegion(): FoldCreaseRegion {
    let retData = unsafe {
        FfiOHOSGetCurrentFoldCreaseRegion()
    }
    if (retData.code != 0) {
        DisplayLog.error("[Display] ERROR: ${retData.code} Failed to get current fold crease region.")
        throw BusinessException(retData.code, "ERROR: Failed to get current fold crease region.")
    }
    let ptr = unsafe { CPointer<CFoldCreaseRegion>(retData.data) }
    if (ptr.isNull()) {
        unsafe { LibC.free(retData.data) }
        throw IllegalMemoryException("Failed to create target pointer type")
    }
    let foldCreaseRegion = unsafe { ptr.read() }
    let ret = FoldCreaseRegion(foldCreaseRegion)
    unsafe {
        LibC.free<CRect>(foldCreaseRegion.creaseRects)
        LibC.free<CFoldCreaseRegion>(ptr)
    }
    return ret
}

/**
* Disables all listeners for display device changes.
*
* @param {ListenerType} `type` - Type of listening event
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func off(`type`: ListenerType): Unit {
    offAllCallback(`type`.getValue())
}

func offAllCallback(callbackType: String): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        unsafe {
            v.value.getOrThrow().clear()
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterAllDisplayManagerCallback(callbackCType)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
        }
    }
}

/**
* Register the callback for fold status changes.
*
* @param {ListenerType} `type` - the event of fold status changes
* @param {Callback1Argument<FoldStatus>} callback - Callback used to return the current fold status of device
* @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 
*                                                                       2. Incorrect parameter types.
* @throws { BusinessException } 1400003 - This display manager service works abnormally.
* @relation export function on(type: 'foldStatusChange', callback: Callback<FoldStatus>): void
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func on(`type`: ListenerType, callback: Callback1Argument<FoldStatus>): Unit {
    match (`type`) {
        case ListnerTypeFoldStatusChange => onFoldStatusChange(`type`.getValue(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.getValue()} is not supported.")
    }
}

func onFoldStatusChange(callbackType: String, callback: Callback1Argument<FoldStatus>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            DisplayLog.info("[Display] INFO: The callback obj already registered!")
            return
        }
        let wrapper = {
            value: CPointer<Unit> =>
            let foldStatus = unsafe { CPointer<UInt32>(value).read() }
            callback.invoke(FoldStatus.parse(foldStatus))
        }
        let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
        let callbackCType = unsafe { LibC.mallocCString(callbackType) }
        let ret = unsafe { FfiOHOSRegisterDisplayManagerCallback(callbackCType, registerCall.getID()) }
        unsafe { LibC.free(callbackCType) }
        if (ret != 0) {
            DisplayLog.error("[display] ERROR: ${ret} Failed to register callback with type ${callbackType}")
            throw BusinessException(ret, "ERROR: Failed to register callback with type ${callbackType}")
        }
        v.value.getOrThrow().add((callback, registerCall.getID()))
    }
}

/**
* Unregister the callback for fold status changes.
*
* @param {ListenerType} `type` - the event of fold status change
* @param {Callback1Argument<FoldStatus>} callback - Callback used to return the current fold status of device
* @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 
*                                                                       2. Incorrect parameter types.
* @throws { BusinessException } 1400003 - This display manager service works abnormally.
* @relation export function off(type: 'foldStatusChange', callback?: Callback<FoldStatus>): void
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func off(`type`: ListenerType, callback: Callback1Argument<FoldStatus>): Unit {
    match (`type`) {
        case ListnerTypeFoldStatusChange => offFoldStatusChange(`type`.getValue(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.getValue()} is not supported.")
    }
}

func offFoldStatusChange(callbackType: String, callback: Callback1Argument<FoldStatus>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            DisplayLog.info("[Display] INFO: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterDisplayManagerCallback(callbackCType, callbackId)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

/**
* Register the callback for fold display mode changes.
*
* @param {ListenerType} `type` - the event of fold display mode changes
* @param {Callback1Argument<FoldStatus>} callback - Callback used to return the current fold display mode
* @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 
*                                                                       2. Incorrect parameter types.
* @throws { BusinessException } 1400003 - This display manager service works abnormally.
* @relation export function on(type: 'foldDisplayModeChange', callback: Callback<FoldDisplayMode>): void
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func on(`type`: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit {
    match (`type`) {
        case ListnerTypeFoldDisplayModeChange => onFoldDisplayModeChange(`type`.getValue(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.getValue()} is not supported.")
    }
}

func onFoldDisplayModeChange(callbackType: String, callback: Callback1Argument<FoldDisplayMode>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            DisplayLog.info("[Display] INFO: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let argv = CPointer<UInt32>(value).read()
                callback.invoke(FoldDisplayMode.parse(argv))
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSRegisterDisplayManagerCallback(callbackCType, registerCall.getID())
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to register callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to register callback with type ${callbackType}")
            }
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

/**
* Unregister the callback for fold display mode changes.
*
* @param {ListenerType} `type` - the event of fold display mode changes
* @param {Callback1Argument<FoldStatus>} callback - Callback used to return the current fold display mode
* @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 
*                                                                       2. Incorrect parameter types.
* @throws { BusinessException } 1400003 - This display manager service works abnormally.
* @relation export function off(type: 'foldDisplayModeChange', callback?: Callback<FoldDisplayMode>): void
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public func off(`type`: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit {
    match (`type`) {
        case ListnerTypeFoldDisplayModeChange => offFoldDisplayModeChange(`type`.getValue(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.getValue()} is not supported.")
    }
}

func offFoldDisplayModeChange(callbackType: String, callback: Callback1Argument<FoldDisplayMode>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            DisplayLog.info("[Display] INFO: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterDisplayManagerCallback(callbackCType, callbackId)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

/**
* Define properties of the display. They cannot be updated automatically.
*
* @relation export interface Display
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class Display <: RemoteDataLite {
    static let instanceMap = HashMap<Int64, Display>()
    static let REGISTER_MUTEX = Mutex()

    /**
    * Display ID.
    *
    * @relation id: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop id: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetId(getID()) }
        }
    }

    /**
    * Display name.
    *
    * @relation name: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop name: String {
        get() {
            let retData = unsafe { FfiOHOSGetDisplayName(getID()) }
            let ret = retData.toString()
            DisplayLog.info("[Display] name: " + ret)
            unsafe { LibC.free(retData) }
            return ret
        }
    }

    /**
    * Whether the display is alive.
    *
    * @relation alive: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop alive: Bool {
        get() {
            unsafe { FfiOHOSDisplayGetAlive(getID()) }
        }
    }

    /**
    * The state of display.
    *
    * @relation state: DisplayState
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop state: DisplayState {
        get() {
            let retData = unsafe { FfiOHOSDisplayGetState(getID()) }
            let ret = DisplayState.parse(retData)
            return ret
        }
    }

    /**
    * Refresh rate, in Hz.
    *
    * @relation refreshRate: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop refreshRate: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetRefreshRate(getID()) }
        }
    }

    /**
    * An enumeration value for rotation degrees of the display.
    * The value 0 indicates that the screen of the display rotates clockwise by 0°.
    * The value 1 indicates that the screen of the display rotates clockwise by 90°.
    * The value 2 indicates that the screen of the display rotates clockwise by 180°.
    * The value 3 indicates that the screen of the display rotates clockwise by 270°.
    *
    * @relation rotation: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop rotation: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetRotation(getID()) }
        }
    }

    /**
    * Display orientation.
    *
    * @relation orientation: Orientation
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop orientation: Orientation {
        get() {
            let retData = unsafe { FfiOHOSDisplayGetOrientation(getID()) }
            let ret = Orientation.parse(retData)
            return ret
        }
    }

    /**
    * Display width, in pixels.
    *
    * @relation width: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop width: Int32 {
        get() {
            unsafe { FfiOHOSDisplayGetWidth(getID()) }
        }
    }

    /**
    * Display height, in pixels.
    *
    * @relation height: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop height: Int32 {
        get() {
            unsafe { FfiOHOSDisplayGetHeight(getID()) }
        }
    }

    /**
    * Display density, in pixels. which is the scaling coefficient between physical pixels and logical pixels. The value for a low-resolution display is 1.0.
    *
    * @relation densityDPI: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop densityDPI: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetDensityDPI(getID()) }
        }
    }

    /**
    * Display resolution, that is, the number of pixels per inch.
    *
    * @relation densityPixels: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop densityPixels: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetVirtualPixelRatio(getID()) }
        }
    }

    /**
    * Text scale density of the display.
    *
    * @relation scaledDensity: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop scaledDensity: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetVirtualPixelRatio(getID()) }
        }
    }

    /**
    * DPI on the x-axis.
    *
    * @relation xDPI: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop xDPI: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetXDPI(getID()) }
        }
    }

    /**
    * DPI on the y-axis.
    *
    * @relation yDPI: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop yDPI: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetYDPI(getID()) }
        }
    }

    init(id: Int64) {
        super(id)
        DisplayLog.info("[Display] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
    * Obtain the cutout info of the display.
    *
    * @throws { BusinessException } 1400001 - Invalid display or screen.
    * @throws { BusinessException } 1400003 - This display manager service works abnormally.
    * @relation getCutoutInfo(): Promise<CutoutInfo>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getCutoutInfo(): CutoutInfo {
        let retData = unsafe {
            FfiOHOSDisplayGetCutoutInfo(getID())
        }
        if (retData.code != 0) {
            DisplayLog.error("[Display] ERROR: ${retData.code} Failed to get cutout info.")
            throw BusinessException(retData.code, "ERROR: Failed to get cutout info.")
        }
        let ptr = unsafe { CPointer<CCutoutInfo>(retData.data) }
        if (ptr.isNull()) {
            unsafe { LibC.free(retData.data) }
            throw IllegalMemoryException("Failed to create target pointer type")
        }
        let cutoutInfo = unsafe { ptr.read() }
        let ret = CutoutInfo(cutoutInfo)
        unsafe {
            LibC.free<CRect>(cutoutInfo.boundingRects)
            LibC.free<CCutoutInfo>(ptr)
        }
        return ret
    }
}
