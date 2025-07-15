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
    func FfiOHOSAceFrameworkCanvasImageDataCtor(width: Float64, height: Float64, handle: VectorUInt8Handle, unit: Int32): Int64

    func FfiOHOSAceFrameworkCanvasImageDataCtorWithNoData(width: Float64, height: Float64, unit: Int32): Int64

    func FfiOHOSAceFrameworkCanvasImageDataGetHeight(id: Int64): Int32

    func FfiOHOSAceFrameworkCanvasImageDataGetWidth(id: Int64): Int32

    func FfiOHOSAceFrameworkCanvasImageDataGetData(id: Int64): VectorUInt8Handle
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageData <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop width: Int32 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasImageDataGetWidth(this.getID())
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
    public prop height: Int32 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasImageDataGetHeight(this.getID())
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
    public prop data: Array<UInt8> {
        get() {
            unsafe {
                let res = FFIVectorUInt8(FfiOHOSAceFrameworkCanvasImageDataGetData(this.getID()))
                let list = Array<UInt8>(res.getSize(), {i => res.getElement(i)})
                res.free()
                list
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
    public init(width: Float64, height: Float64, data!: Array<UInt8>,
        unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT) {
        super(
            unsafe {
                var vecValueHandle = FFIVectorUInt8(data.size)
                for (i in 0..data.size) {
                    vecValueHandle.setElement(i, data[i])
                }
                let id = FfiOHOSAceFrameworkCanvasImageDataCtor(width, height, vecValueHandle.getNativeHandle(),
                    unit.getValue())
                vecValueHandle.free()
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width: Float64, height: Float64, unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT) {
        super(unsafe {
            let id = FfiOHOSAceFrameworkCanvasImageDataCtorWithNoData(width, height, unit.getValue())
            id
        })
    }

    init(selfID: Int64) {
        super(selfID)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}
