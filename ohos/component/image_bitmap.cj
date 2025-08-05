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

import ohos.image.PixelMap

@C
struct ImageBitMapParams {
    ImageBitMapParams(
        let unit: Int32,
        let hasSrc: Bool,
        let selfId: Int64
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkImageBitMapCtor(src: CString, unit: Int32): Int64

    func FfiOHOSAceFrameworkImageBitMapCtorWithPixelMap(pixelID: Int64, unit: Int32): Int64

    func FfiOHOSAceFrameworkImageBitMapCtorByOffscreenCanvas(offscreenCanvasId: Int64): Int64

    func FfiOHOSAceFrameworkImageBitMapGetHeight(imageBitMapId: Int64): Float64

    func FfiOHOSAceFrameworkImageBitMapGetWidth(imageBitMapId: Int64): Float64
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageBitmap <: RemoteData {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop width: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkImageBitMapGetWidth(this.getID())
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop height: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkImageBitMapGetHeight(this.getID())
            }
        }
    }
    internal var src: String = ""
    var hasSrc: Bool = true
    var unit: Int32 = 0

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: String) {
        super(
            unsafe {
                this.src = src
                var srcValue = LibC.mallocCString(src)
                let id = FfiOHOSAceFrameworkImageBitMapCtor(srcValue, this.unit)
                LibC.free(srcValue)
                id
            })
        RemoteDataManager.getInstance().register(this)
    }

    @Deprecated["The function is deprecated", since: "14"]
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 14,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: String, _: Float64, _: Float64) {
        super(
            unsafe {
                this.src = src
                var srcValue = LibC.mallocCString(src)
                let id = FfiOHOSAceFrameworkImageBitMapCtor(srcValue, this.unit)
                LibC.free(srcValue)
                id
            })
        RemoteDataManager.getInstance().register(this)
    }

    /**
     * Create an ImageBitmap object based on the transferred image path.
     *
     * @param src: Path of the image object.
     * @since 11
     */
    @Deprecated["The function is deprecated", since: "14"]
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 14,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: String, _: Int64, _: Int64) {
        super(
            unsafe {
                this.src = src
                var srcValue = LibC.mallocCString(src)
                let id = FfiOHOSAceFrameworkImageBitMapCtor(srcValue, this.unit)
                LibC.free(srcValue)
                id
            })
        RemoteDataManager.getInstance().register(this)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(date: PixelMap, unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT) {
        super(
            unsafe {
                this.unit = unit.getValue()
                this.hasSrc = false
                let id = FfiOHOSAceFrameworkImageBitMapCtorWithPixelMap(date.getID(), this.unit)
                id
            })
        RemoteDataManager.getInstance().register(this)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(date: String, unit: LengthMetricsUnit) {
        super(
            unsafe {
                this.src = date
                this.unit = unit.getValue()
                var srcValue = LibC.mallocCString(date)
                let id = FfiOHOSAceFrameworkImageBitMapCtor(srcValue, this.unit)
                LibC.free(srcValue)
                id
            })
        RemoteDataManager.getInstance().register(this)
    }

    init(selfId: Int64, _: Bool) {
        super(selfId)
        RemoteDataManager.getInstance().register(this)
    }

    init(offscreenCanvasId: Int64) {
        super(unsafe {
            let id = FfiOHOSAceFrameworkImageBitMapCtorByOffscreenCanvas(offscreenCanvasId)
            id
        })
        RemoteDataManager.getInstance().register(this)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func close(): Unit {
        this.release()
    }
}
