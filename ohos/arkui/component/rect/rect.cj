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

package ohos.arkui.component.rect

import ohos.arkui.component.common.*
import ohos.arkui.component.shape.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
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

/**
 * Defines Rect Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Rect <: CommonShapeMethodComponent<Rect> & RectAttribute {
    /**
     * Create the rect component instance.
     *
     * @params { ?Length } width 
     * @params { ?Length } height
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: ?Length = None, height!: ?Length = None) {
        var width_ = transAppResourceToLength(width ?? 0.vp)
        var height_ = transAppResourceToLength(height ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRectCreate(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
        }
    }
    /**
     * Set the corner radius width.
     *
     * @params { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusWidth(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRectSetRadiusWidth(value_.value, value_.unitType.getValue())
        }
        this
    }
    /**
     * Set the corner radius height.
     *
     * @params { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radiusHeight(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRectSetRadiusHeight(value_.value, value_.unitType.getValue())
        }
        this
    }
    /**
     * Set the corner radius size.
     *
     * @params { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRectSetRadius(value_.value, value_.unitType.getValue())
        }
        this
    }
    /**
     * Set the corner radius size.
     *
     * @params { ?Array<Length> } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: ?Array<Length>): This {
        let tmpValue = value ?? []
        var radiusArray_ = Array<Length>(tmpValue.size) {index => (transAppResourceToLength(tmpValue[index]))}
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
    /**
     * Set the corner radius size.
     *
     * @params { ?Array<(Length, Length)> } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radius(value: ?Array<(Length, Length)>): This {
        let tmpValue = value ?? []
        var radiusArray_ = Array<(Length, Length)>(tmpValue.size) {
            index => (transAppResourceToLength(tmpValue[index][0]), transAppResourceToLength(tmpValue[index][1]))
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

    protected override func initial() {}
}
