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

package ohos.arkui.component.data_panel

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

type VectorNativeLinearGradientHandle = CPointer<Unit>

@C
struct NativeLinearGradient {
    NativeLinearGradient(
        let firstColor: UInt32,
        let firstOffset: Float64,
        let secondColor: UInt32,
        let secondOffset: Float64
    ) {}
}

@C
struct NativeDataPanelShadow {
    NativeDataPanelShadow(
        let radius: Float64,
        let offsetX: Float64,
        let offsetY: Float64,
        let colors: VectorNativeLinearGradientHandle
    ) {}
}

foreign {
    func FFICJCreateVectorNativeLinearGradient(size: Int64): VectorNativeLinearGradientHandle

    func FFICJVectorNativeLinearGradientSetElement(vec: VectorNativeLinearGradientHandle, index: Int64,
        linearGradient: NativeLinearGradient): Unit

    func FFICJVectorNativeLinearGradientDelete(vec: VectorNativeLinearGradientHandle): Unit

    func FfiOHOSAceFrameworkDataPanelCreate(values: VectorFloat64Handle, max: Float64, panelType: Int32): Unit

    func FfiOHOSAceFrameworkDataPanelSetCloseEffect(value: Bool): Unit

    func FfiOHOSAceFrameworkDataPanelSetValueColors(value: VectorNativeLinearGradientHandle): Unit

    func FfiOHOSAceFrameworkDataPanelSetTrackBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkDataPanelSetStrokeWidth(strokeWidth: Float64, widthUnit: Int32): Unit

    func FfiOHOSAceFrameworkDataPanelSetTrackShadow(value: NativeDataPanelShadow): Unit
}

/**
 * ColorStop type
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ColorStop {
    /**
     * Color property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor

    /**
     * Offset property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Length

    /**
     * ColorStop constructor
     *
     * @param { ResourceColor } color - The color value.
     * @param { Length } offset - The color offset.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(color: ResourceColor, offset: Length) {
        this.color = color
        this.offset = transAppResourceToLength(offset)
    }
}

/**
 * LinearGradient class
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LinearGradient {
    protected var colorStops: Array<ColorStop>

    /**
     * LinearGradient Constructor.
     *
     * @param { Array<ColorStop> } colorStops - the LinearGradient constructor parameter.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(colorStops: Array<ColorStop>) {
        this.colorStops = colorStops
    }

    /**
     * LinearGradient Constructor.
     *
     * @param { ResourceColor } color - the LinearGradient constructor parameter.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(color: ResourceColor) {
        var color_ = transAppResourceToResourceColor(color)
        this.colorStops = [ColorStop(color_, 0), ColorStop(color_, 1)]
    }

    func parseToNative(): NativeLinearGradient {
        return NativeLinearGradient(
            (colorStops[0].color).toUInt32(),
            (colorStops[0].offset).value,
            (colorStops[1].color).toUInt32(),
            (colorStops[1].offset).value
        )
    }
}

class FFIVectorNativeLinearGradient {
    private let vecHandle: VectorNativeLinearGradientHandle

    init(vec: VectorNativeLinearGradientHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeLinearGradient(size) }
    }

    func setElement(index: Int64, value: NativeLinearGradient): Unit {
        unsafe { FFICJVectorNativeLinearGradientSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorNativeLinearGradientDelete(vecHandle) }
    }

    func getNativeHandle(): VectorNativeLinearGradientHandle {
        vecHandle
    }
}

/**
 * Defines the options of Shadow.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataPanelShadowOptions <: MultiShadowOptions {
    /**
     * Current shadow colors.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colors: ?Array<LinearGradient>

    /**
     * DataPanelShadowOptions Constructor.
     *
     * @param { ?Length } radius - The radius of the shadow blur effect.
     * @param { ?Array<LinearGradient> } colors - The colors to use for the shadow.
     * @param { ?Length } offsetX - The horizontal offset of the shadow from the component.
     * @param { ?Length } offsetY - The vertical offset of the shadow from the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(radius!: ?Length = None, colors!: ?Array<LinearGradient> = None, offsetX!: ?Length = None, offsetY!: ?Length = None) {
        super(radius ?? 20.vp, offsetX ?? 5.vp, offsetY ?? 5.vp)
        this.colors = colors ?? []
    }
}

/**
 * Defines DataPanel Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataPanel <: CommonMethodComponent<DataPanel> & DataPanelAttribute {
    /**
     * DataPanel Constructor.
     *
     * @param { Array<Float64> } values - The data values to display.
     * @param { ?Float64 } max - The maximum value for scaling the data.
     * @param { ?DataPanelType } panelType - The type of data panel to display.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(values!: Array<Float64>, max!: ?Float64 = None, panelType!: ?DataPanelType = None) {
        let tmpPanelType = panelType ?? DataPanelType.Circle
        
        let vecValueHandle = FFIVectorFloat64(values.size)
        for (i in 0..values.size) {
            vecValueHandle.setElement(i, values[i])
        }
        unsafe {
            FfiOHOSAceFrameworkDataPanelCreate(vecValueHandle.getNativeHandle(), max ?? 100.0, tmpPanelType.getValue())
        }
        vecValueHandle.free()
    }

    /**
     * Disable the special effect of the data ratio chart.
     *
     * @param { ?Bool } value - Whether to disable the special effect.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeEffect(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetCloseEffect(value ?? true)
        }
        this
    }

    /**
     * Set the value colors of the data ratio chart.
     *
     * @param { ?Array<LinearGradient> } value - the value colors of the data ratio chart.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func valueColors(value: ?Array<LinearGradient>): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let vecValueHandle = FFIVectorNativeLinearGradient(tmpValue.size)
        for (i in 0..tmpValue.size) {
            vecValueHandle.setElement(i, tmpValue[i].parseToNative())
        }
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetValueColors(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    /**
     * Set track background color of the data ratio chart.
     *
     * @param { ?ResourceColor } value - track background color of the data ratio chart.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackBackgroundColor(value: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetTrackBackgroundColor(transAppResourceToResourceColor(value ?? 0x08182431))
        }
        this
    }

    /**
     * Set the stroke width of the data ratio chart.
     *
     * @param { ?Length } value - the stroke width of the data ratio chart.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeWidth(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 24.0.vp)
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetStrokeWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Set the shadow width of the data ratio chart.
     *
     * @param { ?DataPanelShadowOptions } value - the track shadow width of the data ratio chart.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackShadow(value: ?DataPanelShadowOptions): This {
        let tmpValue = value ?? DataPanelShadowOptions()
        let colors = tmpValue.colors ?? []
        let vecValueHandle = FFIVectorNativeLinearGradient(colors.size)
        for (i in 0..colors.size) {
            vecValueHandle.setElement(i, colors[i].parseToNative())
        }
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetTrackShadow(
                NativeDataPanelShadow(
                    transAppResourceToLength(tmpValue.radius ?? 20.vp).value,
                    transAppResourceToLength(tmpValue.offsetX ?? 5.vp).value,
                    transAppResourceToLength(tmpValue.offsetY ?? 5.vp).value,
                    vecValueHandle.getNativeHandle()
                )
            )
        }
        vecValueHandle.free()
        this
    }
}
