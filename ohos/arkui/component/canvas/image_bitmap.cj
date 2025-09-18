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

package ohos.arkui.component.canvas

import ohos.arkui.component.common.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap

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

/**
 * Bitmap image object that can be drawn onto the current Canvas
 *
 * @relation declare class ImageBitmap
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageBitmap <: RemoteData {
    /**
     * Indicates the width of the CSS pixel unit of ImageData.
     *
     * @relation readonly width: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop width: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkImageBitMapGetWidth(this.getID())
            }
        }
    }

    /**
     * Indicates the height of the CSS pixel unit of ImageData.
     *
     * @relation readonly height: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop height: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkImageBitMapGetHeight(this.getID())
            }
        }
    }

    var src: String = ""
    var hasSrc: Bool = true
    var unit: Int32 = 0

    /**
     * Create an ImageBitmap object based on the transferred image path.
     *
     * @param { String } src - Path of the image object.
     * @returns { This }
     * @relation constructor(src: string)
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: ?String) {
        super(
            unsafe {
                let tmpSrc = src ?? throw IllegalArgumentException("The type now is not supported.")
                var id = 0
                this.src = tmpSrc
                try (srcResouce = LibC.mallocCString(tmpSrc).asResource()) {
                    id = FfiOHOSAceFrameworkImageBitMapCtor(srcResouce.value, this.unit)
                }
                id
            }
        )
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
}
