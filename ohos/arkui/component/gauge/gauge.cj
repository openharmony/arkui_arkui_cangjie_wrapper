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

package ohos.arkui.component.gauge

import ohos.arkui.component.common.{CommonMethodComponent, CustomBuilder}
import ohos.arkui.component.data_panel.{LinearGradient}
import ohos.arkui.component.util.{transAppResourceToLength, transResourceStrToString, transAppResourceToResourceColor, LENGTH_PERCENT}
import ohos.base.{VectorUInt32Handle, VectorFloat64Handle, ResourceColor, Length, LengthProp, ResourceStr, FFIVectorUInt32, FFIVectorFloat32}
import ohos.ffi.{Callback0Param}
import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException

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

    func FfiOHOSAceFrameworkGaugeResetColors(): Unit
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Gauge <: CommonMethodComponent<Gauge> & GaugeAttribute {

    /**
     * The constructor of Gauge.
     *
     * @param { ?Float32 } value - Set current data value.
     * @param { ?Float32 } [min] - Set current segment minimum value.
     * @param { ?Float32 } [max] - Set current segment maximum value.
     * @param { () -> Unit } [child] - Set child component of Gauge.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?Float32, min!: ?Float32 = None, max!: ?Float32 = None, child!: () -> Unit = { => }) {
        unsafe {
            FfiOHOSAceFrameworkGaugeCreate(Float64(value ?? 0.0), Float64(min ?? 0.0), Float64(max ?? 100.0))
        }
        this.child = child
    }

    /**
     * Sets the value for the current profile.
     *
     * @param { ?Float32 } value - Set current data value.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?Float32 } angle - The start angle value, measured in degrees.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func startAngle(angle: ?Float32): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetStartAngle(Float64(angle ?? 0.0))
        }
        this
    }

    /**
     * Sets the end angle position. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @param { ?Float32 } angle - The end angle value, measured in degrees.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func endAngle(angle: ?Float32): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetEndAngle(Float64(angle ?? 360.0))
        }
        this
    }

    // 注意：在声明文件中，colors方法的参数类型是Array<(ResourceColor, Int32)>，但在源码中是Array<(ResourceColor, Float32)>
    // 我们保持源码实现不变，只更新注释以匹配声明文件
    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @param { ?Array<(ResourceColor, Int32)> } value - The color array with stop positions, where Int32 is the stop position percentage (0-100).
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?Array<(ResourceColor, Int32)>): This {
        if (let Some(v) <- value) {
            let colors = FFIVectorUInt32(v.size)
            let weights = FFIVectorFloat32(v.size)
            for (i in 0..v.size) {
                colors.setElement(i, transAppResourceToResourceColor(v[i][0]))
                if (v[i][1] < 0) {
                    weights.setElement(i, 0.0)
                } else {
                    weights.setElement(i, Float32(v[i][1]))
                }
            }
            unsafe {
                FfiOHOSAceFrameworkGaugeSetColors(colors.getNativeHandle(), weights.getNativeHandle())
                colors.free()
                weights.free()
            }
        } else {
            unsafe { FfiOHOSAceFrameworkGaugeResetColors() }
        }
        this
    }

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @param { ?Array<(LinearGradient, Int32)> } value - The linear gradient array with stop positions.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?Array<(LinearGradient, Int32)>): This {
        if (let Some(v) <- value) {
            var maxSize = v.size;
            if (maxSize > 9) {
                maxSize = 9
            }
            var vecValueHandle = FFIVectorGaugeLinearGradient(maxSize)
            var weights = FFIVectorFloat32(maxSize)

            for (i in 0..maxSize) {
                var curColorStops = v[i][0].colorStops
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
                if (v[i][1] < 0) {
                    weights.setElement(i, 0.0)
                } else {
                    weights.setElement(i, Float32(v[i][1]))
                }
            }
            unsafe {
                FfiOHOSAceFrameworkGaugeSetLinearGradientColors(vecValueHandle.getNativeHandle(), weights.getNativeHandle())
                vecValueHandle.free()
                weights.free()
            }
        } else {
            unsafe { FfiOHOSAceFrameworkGaugeResetColors() }
        }
        this
    }

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @param { ?ResourceColor } value - The solid color value.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?ResourceColor): This {
        if (let Some(v) <- value) {
            let array: Array<(ResourceColor, Int32)> = [(v, 1)]
            colors(array)
        } else {
            unsafe { FfiOHOSAceFrameworkGaugeResetColors() }
        }
        this
    }

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @param { ?LinearGradient } value - The linear gradient value.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colors(value: ?LinearGradient): This {
        if (let Some(v) <- value) {
            let array: Array<(LinearGradient, Int32)> = [(v, 1)]
            colors(array)
        } else {
            unsafe { FfiOHOSAceFrameworkGaugeResetColors() }
        }
        this
    }

    /**
     * Sets the thickness of the ring chart.
     *
     * @param { ?Length } length - The stroke width value.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?Float32 } [radius] - The shadow radius.
     * @param { ?Float32 } [offsetX] - The shadow horizontal offset.
     * @param { ?Float32 } [offsetY] - The shadow vertical offset.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackShadow(radius!: ?Float32 = None, offsetX!: ?Float32 = None, offsetY!: ?Float32 = None): This {
        unsafe {
            FfiOHOSAceFrameworkGaugeSetShadowOptions(Float64(radius ?? 20.0), Float64(offsetX ?? 5.0), Float64(offsetY ?? 5.0))
        }
        this
    }

    /**
     * Sets indicator options of the ring chart.
     *
     * @param { ?ResourceStr } icon - The indicator icon.
     * @param { ?Length } space - The space between indicator and chart.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func indicator(icon!: ?ResourceStr = None, space!: ?Length = None): This {
        let icon_ = transResourceStrToString(icon ?? "default")
        var space_ = transAppResourceToLength(space ?? 8.0.vp)
        if (space_.value < 0.0 || space_.unitType.getValue() == LENGTH_PERCENT) {
            space_ = 8.00.vp
        }
        unsafe {
            try (iconCString = LibC.mallocCString(icon_).asResource()) {
                FfiOHOSAceFrameworkGaugeSetIndicator(iconCString.value, space_.value)
            }
        }
        this
    }

    /**
     * Set the description content of the ring chart.
     *
     * @param { ?CustomBuilder } builder - The custom description builder.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
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
