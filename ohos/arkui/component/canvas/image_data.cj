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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.canvas

import ohos.arkui.component.common.{LengthMetricsUnit}
import ohos.base.{FFIVectorUInt8, VectorUInt8Handle}
import ohos.ffi.{RemoteDataLite, releaseFFIData, Callback0Param}
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkCanvasImageDataCtor(width: Float64, height: Float64, handle: VectorUInt8Handle, unit: Int32): Int64

    func FfiOHOSAceFrameworkCanvasImageDataCtorWithNoData(width: Float64, height: Float64, unit: Int32): Int64

    func FfiOHOSAceFrameworkCanvasImageDataGetHeight(id: Int64): Int32

    func FfiOHOSAceFrameworkCanvasImageDataGetWidth(id: Int64): Int32

    func FfiOHOSAceFrameworkCanvasImageDataGetData(id: Int64): VectorUInt8Handle
}

/**
 * Image data object.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageData <: RemoteDataLite {
    /**
     * Width of the image.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop width: Int32 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasImageDataGetWidth(this.getID())
            }
        }
    }

    /**
     * Height of the image.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop height: Int32 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasImageDataGetHeight(this.getID())
            }
        }
    }

    /**
     * Array containing image pixel data.
     */
    @!APILevel[
        since: "22",
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

    /**
     * Create an ImageData object based on the input parameters.
     *
     * @param { ?Float64 } width - Width of the image.
     * @param { ?Float64 } height - Height of the image.
     * @param { ?Array<UInt8> } data - Data of the image. If this parameter is not specified, the default value is a black rectangular image.
     * @param { ?LengthMetricsUnit } [unit] - the unit mode
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width: ?Float64, height: ?Float64, data!: ?Array<UInt8>,
        unit!: ?LengthMetricsUnit = None) {
        super(
            unsafe {
                let tmpWidth = width ?? 0.0
                let tmpHeight = height ?? 0.0
                let tmpData = data ?? []
                let tmpUnit = unit ?? LengthMetricsUnit.Default
                var vecValueHandle = FFIVectorUInt8(tmpData.size)
                for (i in 0..tmpData.size) {
                    vecValueHandle.setElement(i, tmpData[i])
                }
                let id = FfiOHOSAceFrameworkCanvasImageDataCtor(tmpWidth, tmpHeight, vecValueHandle.getNativeHandle(),
                    tmpUnit.getValue())
                vecValueHandle.free()
                id
            })
    }

    /**
     * Create an ImageData object based on the input parameters.
     *
     * @param { ?Float64 } width - Width of the image.
     * @param { ?Float64 } height - Height of the image.
     * @param { ?LengthMetricsUnit } [unit] - the unit mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width: ?Float64, height: ?Float64, unit!: ?LengthMetricsUnit = None) {
        super(
            unsafe {
                let id = FfiOHOSAceFrameworkCanvasImageDataCtorWithNoData(width ?? 0.0, height ?? 0.0,
                    (unit ?? LengthMetricsUnit.Default).getValue())
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
