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

@C
struct CSurfaceRect {
    CSurfaceRect(
        let offsetX: Float32,
        let offsetY: Float32,
        let surfaceWidth: Float32,
        let surfaceHeight: Float32
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkXComponentCreate(id: CString, xcomponentType: Int32, libraryName: CString,
        controllerId: Int64): Unit

    func FfiOHOSAceFrameworkXComponentControllerGetSurfaceId(selfID: Int64): CString

    func FfiOHOSAceFrameworkXComponentControllerSetSurfaceRotation(selfID: Int64, isLock: Bool): Unit

    func FfiOHOSAceFrameworkXComponentControllerGetSurfaceRotation(selfID: Int64): Bool

    func FfiOHOSAceFrameworkXComponentGetSurfaceRect(selfID: Int64): CSurfaceRect

    func FfiOHOSAceFrameworkXComponentControllerCtor(): Int64

    func FfiOHOSAceFrameworkXComponentSetSurfaceRect(selfID: Int64, offsetX: Float32, offsetY: Float32,
        surfaceWidth: Float32, surfaceHeight: Float32): Unit

    func FfiOHOSAceFrameworkXComponentEnableSecure(isSecure: Bool): Unit

    func FfiOHOSAceFrameworkXComponentOnLoad(callback: CString): Unit

    func FfiOHOSAceFrameworkXComponentOnDestroy(callback: CString): Unit

    func FfiOHOSAceFrameworkXComponentOnSurfaceCreated(surfaceId: CString): Unit

    func FfiOHOSAceFrameworkXComponentOnSurfaceChanged(surfaceId: CString): Unit

    func FfiOHOSAceFrameworkXComponentOnSurfaceDestroyed(surfaceId: CString): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SurfaceRect {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: Float32
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: Float32
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var surfaceWidth: Float32
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var surfaceHeight: Float32
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offsetX: Float32, offsetY: Float32, surfaceWidth: Float32, surfaceHeight: Float32) {
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.surfaceWidth = surfaceWidth
        this.surfaceHeight = surfaceHeight
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SurfaceRotationOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lock: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(lock: Bool) {
        this.lock = lock
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class XComponentController <: RemoteData {
    private var isInitial: Bool = false

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkXComponentControllerCtor()
        })
    }

    func initial(): This {
        if (!isInitial) {
            RemoteDataManager.getInstance().register(this)
            isInitial = true
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
    public func getXComponentSurfaceId(): String {
        let returnString = unsafe { FfiOHOSAceFrameworkXComponentControllerGetSurfaceId(this.getID()) }
        let res = returnString.toString()
        unsafe { LibC.free(returnString) }
        return res
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setXComponentSurfaceRect(rect: SurfaceRect): Unit {
        unsafe {
            FfiOHOSAceFrameworkXComponentSetSurfaceRect(this.getID(), rect.offsetX, rect.offsetY, rect.surfaceWidth,
                rect.surfaceHeight)
        }
    }

    /**
     * Called after the surface is first created.
     *
     * @param surfaceId: The id of the surface created by XComponent.
     * @since 14
     */
    protected open func onSurfaceCreated(_: String) {}

    /**
     * Called after the surface is first created.
     *
     * @param surfaceId: The id of the surface created by XComponent.
     * @since 14
     */
    protected open func onSurfaceChanged(_: String, _: SurfaceRect) {}

    /**
     * Called when the surface is about to be destroyed.
     *
     * @param surfaceId: The id of the surface created by XComponent.
     * @since 14
     */
    protected open func onSurfaceDestroyed(_: String) {}

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getXComponentSurfaceRect(): SurfaceRect {
        let cSurfaceRect = unsafe {
            FfiOHOSAceFrameworkXComponentGetSurfaceRect(this.getID())
        }
        let surfaceRect = SurfaceRect(cSurfaceRect.offsetX, cSurfaceRect.offsetY, cSurfaceRect.surfaceWidth,
            cSurfaceRect.surfaceHeight)
        return surfaceRect
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setXComponentSurfaceRotation(rotationOptions: SurfaceRotationOptions): Unit {
        unsafe {
            FfiOHOSAceFrameworkXComponentControllerSetSurfaceRotation(this.getID(), rotationOptions.lock)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getXComponentSurfaceRotation(): SurfaceRotationOptions {
        let surfaceRotation = unsafe {
            FfiOHOSAceFrameworkXComponentControllerGetSurfaceRotation(this.getID())
        }
        return SurfaceRotationOptions(surfaceRotation)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class XComponent <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id!: String, `type`!: XComponentType, controller!: XComponentController) {
        controller.initial()
        unsafe {
            let idCString = LibC.mallocCString(id)
            let libraryName = ""
            let libraryNameCString = LibC.mallocCString(libraryName)
            FfiOHOSAceFrameworkXComponentCreate(idCString, `type`.getValue(), libraryNameCString, controller.getID())
            LibC.free(idCString)
            LibC.free(libraryNameCString)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableSecure(isSecure: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkXComponentEnableSecure(isSecure)
        }
        this
    }
}

@C
func OHOSAceFrameworkXcomponentControllerOnSurfaceCreated(ctrId: Int64, surfaceId: Int64): Unit {
    let optXcomponenntCtr = RemoteDataManager
        .getInstance()
        .getOrCreate<XComponentController>(ctrId, {_: Int64 => XComponentController()})
    let ctr = getOrThrow(optXcomponenntCtr, msg: "no ctrId of XComponentController ${ctrId}")
    nativeLog("OHOSAceFrameworkXcomponentControllerOnSurfaceCreated surfactId: ${surfaceId}")
    ctr.onSurfaceCreated(surfaceId.toString())
}

@C
func OHOSAceFrameworkXcomponentControllerOnSurfaceChanged(ctrId: Int64, surfaceId: Int64, rect: CJRectResult): Unit {
    let optXcomponenntCtr = RemoteDataManager
        .getInstance()
        .getOrCreate<XComponentController>(ctrId, {_: Int64 => XComponentController()})
    let ctr = getOrThrow(optXcomponenntCtr, msg: "no ctrId of XComponentController ${ctrId}")
    let surfaceRect = SurfaceRect(Float32(rect.x), Float32(rect.y), Float32(rect.width), Float32(rect.height))
    ctr.onSurfaceChanged(surfaceId.toString(), surfaceRect)
}

@C
func OHOSAceFrameworkXcomponentControllerOnSurfaceDestroyed(ctrId: Int64, surfaceId: Int64): Unit {
    let optXcomponenntCtr = RemoteDataManager
        .getInstance()
        .getOrCreate<XComponentController>(ctrId, {_: Int64 => XComponentController()})
    let ctr = getOrThrow(optXcomponenntCtr, msg: "no ctrId of XComponentController ${ctrId}")
    ctr.onSurfaceDestroyed(surfaceId.toString())
}

@C
struct AtCXComponentCallback {
    let xcomponentControllerOnSurfaceCreated: CFunc<(Int64, Int64) -> Unit> = OHOSAceFrameworkXcomponentControllerOnSurfaceCreated
    let xcomponentControllerOnSurfaceChanged: CFunc<(Int64, Int64, CJRectResult) -> Unit> = OHOSAceFrameworkXcomponentControllerOnSurfaceChanged
    let xcomponentControllerOnSurfaceDestroyed: CFunc<(Int64, Int64) -> Unit> = OHOSAceFrameworkXcomponentControllerOnSurfaceDestroyed
}

foreign func FfiOHOSAceFrameworkRegisterCJXComponentCtrFuncs(cjFuncs: AtCXComponentCallback): Unit

func injectFrameworkCJXComponentCtrFuncs(): Unit {
    unsafe { FfiOHOSAceFrameworkRegisterCJXComponentCtrFuncs(AtCXComponentCallback()) }
}

let _ = injectFrameworkCJXComponentCtrFuncs()
