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

foreign func FfiOHOSAceFrameworkPolygonCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

foreign func FfiOHOSAceFrameworkPolygonSetPoints(arrayXValue: VectorFloat64Handle, arrayYValue: VectorFloat64Handle): Unit

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Polygon <: ShapeComponent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Length, height!: Length) {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkPolygonCreate(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
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
    public init() {
        this(width: 0.vp, height: 0.vp)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func points(value: Array<(Float64, Float64)>): This {
        if (value.size < 3) {
            AceLog.error("Less than three points")
            return this
        }
        let vecXValueHandle = FFIVectorFloat64(value.size)
        let vecYValueHandle = FFIVectorFloat64(value.size)
        for (i in 0..value.size) {
            vecXValueHandle.setElement(i, Float64(value[i][0]))
            vecYValueHandle.setElement(i, Float64(value[i][1]))
        }
        unsafe {
            FfiOHOSAceFrameworkPolygonSetPoints(vecXValueHandle.getNativeHandle(), vecYValueHandle.getNativeHandle())
            vecXValueHandle.free()
            vecYValueHandle.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func points(value: Array<(Int64, Int64)>): This {
        let array = Array<(Float64, Float64)>(value.size) {index => (Float64(value[index][0]), Float64(value[index][1]))}
        points(array)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func initial() {}
}
