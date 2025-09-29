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

package ohos.arkui.component.gauge

import ohos.arkui.component.common.*
import ohos.arkui.component.data_panel.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

type VectorNativeGaugeLinearGradientHandle = CPointer<Unit>

type VectorColorStops = CPointer<Unit>

foreign {
    func FfiOHOSAceFrameworkGaugeCreate(gaugeValue: Float64, gaugeMin: Float64, gaugeMax: Float64): Unit

    func FfiOHOSAceFrameworkGaugeSetValue(value: Float64): Unit

    func FfiOHOSAceFrameworkGaugeSetStartAngle(startAngle: Float64): Unit

    func FfiOHOSAceFrameworkGaugeSetEndAngle(endAngle: Float64): Unit

    func FfiOHOSAceFrameworkGaugeSetColors(colors: VectorUInt32Handle, weights: VectorFloat64Handle): Unit

    func FfiOHOSAceFrameworkGaugeSetLinearGradientColors(colors: VectorUInt32Handle, weights: VectorFloat64Handle): Unit

    func FfiOHOSAceFrameworkGaugeSetStrokeWidth(strokeWidth: Float64, strokeUnit: Int32): Unit

    func FfiOHOSAceFrameworkGaugeSetShadowOptions(radius: Float64, offsetX: Float64, offsetY: Float64): Unit

    func FfiOHOSAceFrameworkGaugeSetIndicator(icon: CString, size: Float64): Unit

    func FfiOHOSAceFrameworkGaugeSetDescription(builder: Int64): Unit

    func FFICJCreateVectorColorStop(size: Int64): VectorColorStops

    func FFICJVectorColorStopSetElement(vec: VectorColorStops, index: Int64, colorStop: GaugeColorStop): Unit

    func FFICJVectorColorStopDelete(vec: VectorColorStops): Unit

    func FFICJCreateVectorGaugeLinearGradient(size: Int64): VectorNativeGaugeLinearGradientHandle

    func FFICJVectorGaugeLinearGradientSetElement(vec: VectorNativeGaugeLinearGradientHandle, index: Int64,
        value: VectorColorStops): Unit

    func FFICJVectorGaugeLinearGradientDelete(vec: VectorNativeGaugeLinearGradientHandle): Unit

    func FfiOHOSAceFrameworkSetPrivacySensitive(enable: Bool): Unit
}

@C
struct GaugeColorStop {
    GaugeColorStop(
        let color: UInt32,
        let offset: Float64
    ) {}
}

class FFIVectorGaugeLinearGradient {
    private let vecHandle: VectorNativeGaugeLinearGradientHandle

    init(vec: VectorNativeGaugeLinearGradientHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorGaugeLinearGradient(size) }
    }

    func setElement(index: Int64, value: VectorColorStops): Unit {
        unsafe { FFICJVectorGaugeLinearGradientSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorColorStopDelete(vecHandle) }
    }

    func getNativeHandle(): VectorNativeGaugeLinearGradientHandle {
        vecHandle
    }
}

class FFIVectorColorStops {
    private let vecHandle: VectorColorStops

    init(vec: VectorColorStops) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorColorStop(size) }
    }

    func setElement(index: Int64, value: GaugeColorStop): Unit {
        unsafe { FFICJVectorColorStopSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorColorStopDelete(vecHandle) }
    }

    func getNativeHandle(): VectorColorStops {
        vecHandle
    }
}

/**
 * Defines the Gauge component.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Gauge <: CommonMethodComponent<GaugeAttribute> & GaugeAttribute {

    /**
     * The constructor of Gauge.
     *
     * @params { Float64 } value
     * @params { Float64 } min
     * @params { Float64 } max
     * @params { () -> Unit } child
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?Float64, min!: ?Float64 = None, max!: ?Float64 = None, child!: () -> Unit = { => }) {
        unsafe {
            FfiOHOSAceFrameworkGaugeCreate(value ?? 0.0, min ?? 0.0, max ?? 100.0)
        }
        this.child = child
    }

    /**
     * Sets the value for the current profile.
     *
     * @params { Float32 } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func value(value: ?Float32): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetValue(Float64(value ?? 0.0))
        }
        this
    }

    /**
     * Set the start angle. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @params { Float64 } angle
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func startAngle(angle: ?Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetStartAngle(angle ?? 0.0)
        }
        this
    }

    /**
     * Sets the end angle position. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @params { Float64 } angle
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func endAngle(angle: ?Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetEndAngle(angle ?? 360.0)
        }
        this
    }

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @params { Array<(ResourceColor, Float32)> } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?Array<(ResourceColor, Float32)>): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let colors = FFIVectorUInt32(tmpValue.size)
        let weights = FFIVectorFloat32(tmpValue.size)
        for (i in 0..tmpValue.size) {
            colors.setElement(i, transAppResourceToResourceColor(tmpValue[i][0]))
            if (tmpValue[i][1] < 0.0) {
                weights.setElement(i, 0.0)
            } else {
                weights.setElement(i, tmpValue[i][1])
            }
        }
        unsafe {
            FfiOHOSAceFrameworkGaugeSetColors(colors.getNativeHandle(), weights.getNativeHandle())
            colors.free()
            weights.free()
        }
        this
    }

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @params { Array<(LinearGradient, Float32)> } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?Array<(LinearGradient, Float32)>): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var maxSize = tmpValue.size;
        if (maxSize > 9) {
            maxSize = 9
        }
        var vecValueHandle = FFIVectorGaugeLinearGradient(maxSize)
        var weights = FFIVectorFloat32(maxSize)

        for (i in 0..maxSize) {
            var curColorStops = tmpValue[i][0].colorStops
            var vecColorStop = FFIVectorColorStops(curColorStops.size)
            for (j in 0..curColorStops.size) {
                if ((curColorStops[j].offset).value >= 0.0) {
                    vecColorStop.setElement(j, GaugeColorStop((curColorStops[j].color).toUInt32(), 
                    (curColorStops[j].offset).value))
                } else {
                    vecColorStop.setElement(j, GaugeColorStop((curColorStops[j].color).toUInt32(), 0.0))
                }
            }
            vecValueHandle.setElement(i, vecColorStop.getNativeHandle())
            if (tmpValue[i][1] < 0.0) {
                weights.setElement(i, 0.0)
            } else {
                weights.setElement(i, tmpValue[i][1])
            }
        }
        unsafe {
            FfiOHOSAceFrameworkGaugeSetLinearGradientColors(vecValueHandle.getNativeHandle(), weights.getNativeHandle())
            vecValueHandle.free()
            weights.free()
        }
        this
    }

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @params { ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let array: Array<(ResourceColor, Float32)> = [(tmpValue, 1.0)]
        colors(array)
        this
    }

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @params { LinearGradient } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?LinearGradient): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let array: Array<(LinearGradient, Float32)> = [(tmpValue, 1.0)]
        colors(array)
        this
    }

    /**
     * Sets the thickness of the ring chart.
     *
     * @params { Length } length
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeWidth(length: ?Length): This {
        var value_ = transAppResourceToLength(length ?? 4.0.vp)
        unsafe {
            FfiOHOSAceFrameworkGaugeSetStrokeWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets track shadow of the ring chart.
     *
     * @params { Float64 } radius
     * @params { Float64 } offsetX
     * @params { Float64 } offsetY
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackShadow(radius!: ?Float64 = None, offsetX!: ?Float64 = None, offsetY!: ?Float64 = None): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetShadowOptions(radius ?? 20.0, offsetX ?? 5.0, offsetY ?? 5.0)
        }
        this
    }

    /**
     * Sets indicator options of the ring chart.
     *
     * @params { ResourceStr } icon
     * @params { Length } space
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(icon!: ?ResourceStr = None, space!: ?Length = None): This {
        let icon_ = transResourceStrToString(icon ?? "default")
        let space_ = transAppResourceToLength(space ?? 8.0.vp)
        unsafe {
            try (iconCString = LibC.mallocCString(icon_).asResource()) {
                FfiOHOSAceFrameworkGaugeSetIndicator(iconCString.value, space_.value)
            }
        }
        this
    }

    /**
     * Sets description content of the ring chart.
     *
     * @params { () -> Unit } builder
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func description(builder: ?CustomBuilder): This {
        let tmpBuilder = builder ?? { => }
        unsafe {
            FfiOHOSAceFrameworkGaugeSetDescription(Callback0Param<Unit>(tmpBuilder).getID())
        }
        this
    }
}
