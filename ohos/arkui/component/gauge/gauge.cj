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
 * @brief presents data as a dount chart.
 * @since 11
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Gauge <: ContainerBase {
    /**
     * The constructor of Gauge.
     *
     * @param value: the data value to be shown.
     * @param min: minimum of chart data segment.
     * @param max: maximum of chart data segment.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Float64, min!: Float64 = 0.0, max!: Float64 = 100.0, child!: () -> Unit = { => }) {
        unsafe {
            FfiOHOSAceFrameworkGaugeCreate(value, min, max)
        }
        this.child = child
    }

    /**
     * Sets the value for the current profile.
     *
     * @param gaugevalue: value to be set.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func value(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetValue(Float64(value))
        }
        this
    }

    /**
     * Set the start angle. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @param value: start angle of the data segment.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func startAngle(angle: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetStartAngle(angle)
        }
        this
    }

    /**
     * Sets the end angle position. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @param value: end angle of the data segment.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func endAngle(angle: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetEndAngle(angle)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: Array<(ResourceColor, Float32)>): This {
        let colors = FFIVectorUInt32(value.size)
        let weights = FFIVectorFloat32(value.size)
        for (i in 0..value.size) {
            colors.setElement(i, value[i][0].toUInt32())
            if (value[i][1] < 0.0) {
                weights.setElement(i, 0.0)
            } else {
                weights.setElement(i, value[i][1])
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
     * @param gradientColorStops: gradient colors of the gauge chart.
     * @returns Gauge component instance.
     * @brief a maximum of nine groups of colors can be set.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: Array<(LinearGradient, Float32)>): This {
        var maxSize = value.size;
        if (maxSize > 9) {
            maxSize = 9
        }
        var vecValueHandle = FFIVectorGaugeLinearGradient(maxSize)
        var weights = FFIVectorFloat32(maxSize)

        for (i in 0..maxSize) {
            var curColorStops = value[i][0].colorStops
            var vecColorStop = FFIVectorColorStops(curColorStops.size)
            for (j in 0..curColorStops.size) {
                if (curColorStops[j].offset.value >= 0.0) {
                    vecColorStop.setElement(j, GaugeColorStop(curColorStops[j].color.toUInt32(), curColorStops[j].offset.value))
                } else {
                    vecColorStop.setElement(j, GaugeColorStop(curColorStops[j].color.toUInt32(), 0.0))
                }
            }
            vecValueHandle.setElement(i, vecColorStop.getNativeHandle())
            if (value[i][1] < 0.0) {
                weights.setElement(i, 0.0)
            } else {
                weights.setElement(i, value[i][1])
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
     * @param color: the color to be set.
     * @param offset: gradient color breakpoint.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ResourceColor): This {
        let array: Array<(ResourceColor, Float32)> = [(value, 1.0)]
        colors(array)
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: LinearGradient): This {
        let array: Array<(LinearGradient, Float32)> = [(value, 1.0)]
        colors(array)
        this
    }

    /**
     * Sets the thickness of the ring chart.
     *
     * @param value: thickness of the ring chart.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeWidth(length: Length): This {
        var value_ = transAppResourceToLength(length)
        unsafe {
            FfiOHOSAceFrameworkGaugeSetStrokeWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets track shadow of the ring chart.
     *
     * @param radius: shadow blur radius.
     * @param offsetX: offset of X asix.
     * @param offsetY: offset of Y asix.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackShadow(radius!: Float64 = 20.0, offsetX!: Float64 = 5.0, offsetY!: Float64 = 5.0): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetShadowOptions(radius, offsetX, offsetY)
        }
        this
    }

    /**
     * Sets indicator options of the ring chart.
     *
     * @param icon: style of pointer.
     * @param space: distance between the pointer and the outer edge of the ring.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(icon!: ResourceStr = "default", space!: Length = 8.0.vp): This {
        let icon_ = transResourceStrToString(icon)
        let space_ = transAppResourceToLength(space)
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
     * @param  builder: discription content of ring chart.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func description(builder: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetDescription(Callback0Param<Unit>(builder).getID())
        }
        this
    }
}
