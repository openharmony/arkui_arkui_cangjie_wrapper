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
    func FfiOHOSAceFrameworkRectInsCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Int64

    func FfiOHOSAceFrameworkRectSetInsRadiusWidth(shapeId: Int64, radiusWidth: Float64, radiusWidthUnit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetInsRadiusHeight(shapeId: Int64, radiusHeight: Float64, radiusHeightUnit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetInsRadius(shapeId: Int64, radius: Float64, radiusUnit: Int32): Unit

    func FfiOHOSAceFrameworkRectCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetRadiusWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetRadiusHeight(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetRadius(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkRectSetRadiusArray(arrayValue: VectorFloat64Handle, arrayUnit: VectorInt32Handle): Unit

    func FfiOHOSAceFrameworkRectSetRadiusTupleArray(
        arrayWidthValue: VectorFloat64Handle,
        arrayWidthUnit: VectorInt32Handle,
        arrayHeightValue: VectorFloat64Handle,
        arrayHeightUnit: VectorInt32Handle
    ): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RectShape <: ShapeAbstract {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Length, height!: Length) {
        super(
            unsafe {
                var width_ = transAppResourceToLength(width)
                var height_ = transAppResourceToLength(height)
                FfiOHOSAceFrameworkRectInsCreate(
                    width_.value,
                    width_.unitType.getValue(),
                    height_.value,
                    height_.unitType.getValue()
                )
            })
    }

    @!APILevel[
        12,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkRectSetInsRadiusWidth(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkRectSetInsRadiusHeight(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkRectSetInsRadius(getID(), value_.value, value_.unitType.getValue())
        }
        this
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
public class Rect <: ShapeComponent {
    @!APILevel[
        12,
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
            FfiOHOSAceFrameworkRectCreate(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
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
    public init() {
        this(width: 0.vp, height: 0.vp)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkRectSetRadiusWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkRectSetRadiusHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkRectSetRadius(value_.value, value_.unitType.getValue())
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius<T>(radiusArray: Array<T>) where T <: Length {
        var radiusArray_ = Array<Length>(radiusArray.size) {index => (transAppResourceToLength(radiusArray[index]))}
        let vecValueHandle = FFIVectorFloat64(radiusArray_.size)
        let vecUnitHandle = FFIVectorInt32(radiusArray_.size)
        for (i in 0..radiusArray_.size) {
            vecValueHandle.setElement(i, radiusArray_[i].value)
            vecUnitHandle.setElement(i, radiusArray_[i].unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkRectSetRadiusArray(vecValueHandle.getNativeHandle(), vecUnitHandle.getNativeHandle())
        }
        vecValueHandle.free()
        vecUnitHandle.free()
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius<T>(radiusArray: Array<(T, T)>) where T <: Length {
        var radiusArray_ = Array<(Length, Length)>(radiusArray.size) {
            index => (transAppResourceToLength(radiusArray[index][0]), transAppResourceToLength(radiusArray[index][1]))
        }

        let vecWidthValueHandle = FFIVectorFloat64(radiusArray_.size)
        let vecWidthUnitHandle = FFIVectorInt32(radiusArray_.size)
        let vecHeightValueHandle = FFIVectorFloat64(radiusArray_.size)
        let vecHeightUnitHandle = FFIVectorInt32(radiusArray_.size)
        for (i in 0..radiusArray_.size) {
            vecWidthValueHandle.setElement(i, if (radiusArray_[i][0].value < 0.0) {
                0.0
            } else {
                radiusArray_[i][0].value
            })
            vecWidthUnitHandle.setElement(i, radiusArray_[i][0].unitType.getValue())
            vecHeightValueHandle.setElement(i, if (radiusArray_[i][1].value < 0.0) {
                0.0
            } else {
                radiusArray_[i][1].value
            })
            vecHeightUnitHandle.setElement(i, radiusArray_[i][1].unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkRectSetRadiusTupleArray(
                vecWidthValueHandle.getNativeHandle(),
                vecWidthUnitHandle.getNativeHandle(),
                vecHeightValueHandle.getNativeHandle(),
                vecHeightUnitHandle.getNativeHandle()
            )
        }
        vecWidthValueHandle.free()
        vecWidthUnitHandle.free()
        vecHeightValueHandle.free()
        vecHeightUnitHandle.free()
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func initial() {}
}
