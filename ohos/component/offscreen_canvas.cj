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

foreign {
    func FfiOHOSAceFrameworkOffscreenCanvasCtor(height: Float64, width: Float64, unit: Int32): Int64

    func FfiOHOSAceFrameworkOffscreenTransferToImageBitmap(selfId: Int64): ImageBitMapParams

    func FfiOHOSAceFrameworkOffscreenCanvasSetHeight(selfId: Int64, heigth: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasSetWidth(selfId: Int64, width: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasGetHeight(selfId: Int64): Float64

    func FfiOHOSAceFrameworkOffscreenCanvasGetWidth(selfId: Int64): Float64
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OffscreenCanvas <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop height: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkOffscreenCanvasGetHeight(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkOffscreenCanvasSetHeight(this.getID(), value)
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
    public mut prop width: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkOffscreenCanvasGetWidth(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkOffscreenCanvasSetWidth(this.getID(), value)
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
    public init(height: Float64, width: Float64, unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT) {
        super(unsafe {
            let id = FfiOHOSAceFrameworkOffscreenCanvasCtor(height, width, unit.getValue())
            id
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transferToImageBitmap(): ImageBitmap {
        return ImageBitmap(this.getID())
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getContext(contextType!: ContextType = ContextType.type_2d, options!: RenderingContextSettings): OffscreenCanvasRenderingContext2D {
        return OffscreenCanvasRenderingContext2D(this.getID(), contextType, options, this.width, this.height)
    }
}
