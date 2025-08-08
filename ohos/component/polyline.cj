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
    func FfiOHOSAceFrameworkPolylineCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkPolylineSetPoints(xPointHandle: VectorFloat64Handle, yPointHandle: VectorFloat64Handle): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Polyline <: ShapeComponent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Length, height!: Length) {
        unsafe {
            FfiOHOSAceFrameworkPolylineCreate(
                width.value,
                width.unitType.getValue(),
                height.value,
                height.unitType.getValue()
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
    public init(width!: Int64, height!: Int64) {
        this(width: width.vp, height: height.vp)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Float64, height!: Float64) {
        this(width: width.vp, height: height.vp)
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
    public func points(pointList: Array<(Float64, Float64)>): This {
        if (pointList.size < 3) {
            AceLog.error("Less than three points")
            return this
        }
        let xPointVecFFi = FFIVectorFloat64(pointList.size)
        let yPointVecFFi = FFIVectorFloat64(pointList.size)
        var index = 0
        for (i in pointList) {
            xPointVecFFi.setElement(index, i[0])
            yPointVecFFi.setElement(index, i[1])
            index++
        }

        unsafe {
            FfiOHOSAceFrameworkPolylineSetPoints(xPointVecFFi.getNativeHandle(), yPointVecFFi.getNativeHandle())
            xPointVecFFi.free()
            yPointVecFFi.free()
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
    public func points(pointList: Array<(Int64, Int64)>): This {
        let array = Array<(Float64, Float64)>(pointList.size) {
            index => (Float64(pointList[index][0]), Float64(pointList[index][1]))
        }
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
