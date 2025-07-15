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

public type VectorNativeGaugeLinearGradientHandle = CPointer<Unit>

public type VectorColorStops = CPointer<Unit>

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
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Float64, min!: Float64 = 0.0, max!: Float64 = 100.0) {
        unsafe {
            FfiOHOSAceFrameworkGaugeCreate(value, min, max)
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
    public init(value!: Int64, min!: Int64 = 0, max!: Int64 = 100) {
        this(value: Float64(value), min: Float64(min), max: Float64(max))
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Float64, min!: Float64 = 0.0, max!: Float64 = 100.0, child!: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGaugeCreate(value, min, max)
        }
        this.child = child
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Int64, min!: Int64 = 0, max!: Int64 = 100, child!: () -> Unit) {
        this(value: Float64(value), min: Float64(min), max: Float64(max), child: child)
    }

    /**
     * Sets the value for the current profile.
     *
     * @param gaugevalue: value to be set.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func value(gaugeValue: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetValue(gaugeValue)
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
    public func value(gaugeValue: Int64): This {
        value(Float64(gaugeValue))
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func startAngle(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetStartAngle(value)
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
    public func startAngle(value: Int64): This {
        startAngle(Float64(value))
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func endAngle(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetEndAngle(value)
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
    public func endAngle(value: Int64): This {
        endAngle(Float64(value))
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
    public func colors(colorStop: Array<(Color, Float32)>): This {
        let colors = FFIVectorUInt32(colorStop.size)
        let weights = FFIVectorFloat32(colorStop.size)
        for (i in 0..colorStop.size) {
            colors.setElement(i, colorStop[i][0].toUInt32())
            if (colorStop[i][1] < 0.0) {
                weights.setElement(i, 0.0)
            } else {
                weights.setElement(i, colorStop[i][1])
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(gradientColorStops: Array<(LinearGradient, Float32)>): This {
        var maxSize = gradientColorStops.size;
        if (maxSize > 9) {
            maxSize = 9
        }
        var vecValueHandle = FFIVectorGaugeLinearGradient(maxSize)
        var weights = FFIVectorFloat32(maxSize)

        for (i in 0..maxSize) {
            var curColorStops = gradientColorStops[i][0].colorStops
            var vecColorStop = FFIVectorColorStops(curColorStops.size)
            for (j in 0..curColorStops.size) {
                if (curColorStops[j].offset.value >= 0.0) {
                    vecColorStop.setElement(j, GaugeColorStop(curColorStops[j].color, curColorStops[j].offset.value))
                } else {
                    vecColorStop.setElement(j, GaugeColorStop(curColorStops[j].color, 0.0))
                }
            }
            vecValueHandle.setElement(i, vecColorStop.getNativeHandle())
            if (gradientColorStops[i][1] < 0.0) {
                weights.setElement(i, 0.0)
            } else {
                weights.setElement(i, gradientColorStops[i][1])
            }
        }
        unsafe {
            FfiOHOSAceFrameworkGaugeSetLinearGradientColors(vecValueHandle.getNativeHandle(), weights.getNativeHandle())
            vecValueHandle.free()
            weights.free()
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
    public func colors(gradientColorStops: Array<(LinearGradient, UInt32)>): This {
        let array = Array<(LinearGradient, Float32)>(gradientColorStops.size) {
            index => (gradientColorStops[index][0], Float32(gradientColorStops[index][1]))
        }
        colors(array)
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
    public func colors(colorStop: Array<(Color, Int32)>): This {
        let array = Array<(Color, Float32)>(colorStop.size) {
            index => (colorStop[index][0], Float32(colorStop[index][1]))
        }
        colors(array)
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
    public func colors(colorStop: Array<(UInt32, Float32)>): This {
        let array = Array<(Color, Float32)>(colorStop.size) {index => (Color(colorStop[index][0]), colorStop[index][1])}
        colors(array)
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
    public func colors(colorStop: Array<(UInt32, Int32)>): This {
        let array = Array<(Color, Float32)>(colorStop.size) {
            index => (Color(colorStop[index][0]), Float32(colorStop[index][1]))
        }
        colors(array)
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
    public func colors(colorStop: Array<(AppResource, Float32)>): This {
        let array = Array<(Color, Float32)>(colorStop.size) {
            index => (getResourceColor(colorStop[index][0]), colorStop[index][1])
        }
        colors(array)
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
    public func colors(colorStop: Array<(AppResource, Int32)>): This {
        let array = Array<(Color, Float32)>(colorStop.size) {
            index => (getResourceColor(colorStop[index][0]), Float32(colorStop[index][1]))
        }
        colors(array)
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(color: Color, offset: Float32): This {
        let array: Array<(Color, Float32)> = [(color, offset)]
        colors(array)
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
    public func colors(color: AppResource, offset: Float32): This {
        let array: Array<(Color, Float32)> = [(getResourceColor(color), offset)]
        colors(array)
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
    public func colors(color: UInt32, offset: Float32): This {
        let array: Array<(Color, Float32)> = [(Color(color), offset)]
        colors(array)
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
    public func colors(color: Color, offset: Int32): This {
        let array: Array<(Color, Float32)> = [(color, Float32(offset))]
        colors(array)
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
    public func colors(color: AppResource, offset: Int32): This {
        let array: Array<(Color, Float32)> = [(getResourceColor(color), Float32(offset))]
        colors(array)
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
    public func colors(color: UInt32, offset: Int32): This {
        let array: Array<(Color, Float32)> = [(Color(color), Float32(offset))]
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(icon!: String = "default", space!: Float64 = 8.0): This {
        unsafe {
            try (iconCString = LibC.mallocCString(icon).asResource()) {
                FfiOHOSAceFrameworkGaugeSetIndicator(iconCString.value, space)
            }
        }
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(icon!: String = "default", space!: UInt64): This {
        indicator(icon: icon, space: Float64(space))
    }

    /**
     * Sets description content of the ring chart.
     *
     * @param  builder: discription content of ring chart.
     * @returns Gauge component instance.
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func description(builder: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetDescription(Callback0Param<Unit>(builder).getID())
        }
        this
    }

    /**
     * Sets if mark to privacy sensitive.
     *
     * @param  isPrivacySensitiveMode: indicates if mark to  privacy sensitive.
     * @returns Gauge component instance.
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func privacySensitive(isPrivacySensitiveMode: Option<Bool>): This {
        match (isPrivacySensitiveMode) {
            case Some(x) => unsafe { FfiOHOSAceFrameworkSetPrivacySensitive(x) }
            case None => unsafe { FfiOHOSAceFrameworkSetPrivacySensitive(false) }
        }
        this
    }
}
