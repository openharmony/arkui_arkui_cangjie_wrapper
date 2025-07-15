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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ColorStop {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: UInt32

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Length

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(color: ResourceColor, offset: Length) {
        this.color = transAppResourceToResourceColor(color)
        this.offset = transAppResourceToLength(offset)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LinearGradient {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colorStops: Array<ColorStop>

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(colorStops: Array<ColorStop>) {
        this.colorStops = colorStops
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(color: ResourceColor) {
        var color_ = transAppResourceToResourceColor(color)
        this.colorStops = [ColorStop(color_, 0), ColorStop(color_, 1)]
    }

    func parseToNative(): NativeLinearGradient {
        return NativeLinearGradient(
            colorStops[0].color,
            colorStops[0].offset.value,
            colorStops[1].color,
            colorStops[1].offset.value
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DataPanelShadowOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colors: Array<LinearGradient>

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(radius!: Length, colors!: Array<LinearGradient>, offsetX!: Length, offsetY!: Length) {
        this.radius = transAppResourceToLength(radius)
        this.colors = colors
        this.offsetX = transAppResourceToLength(offsetX)
        this.offsetY = transAppResourceToLength(offsetY)
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
public class DataPanel <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(values!: Array<Float64>, max!: Float64 = 100.0, panelType!: DataPanelType = DataPanelType.CircleType) {
        let vecValueHandle = FFIVectorFloat64(values.size)
        for (i in 0..values.size) {
            vecValueHandle.setElement(i, values[i])
        }
        unsafe {
            FfiOHOSAceFrameworkDataPanelCreate(vecValueHandle.getNativeHandle(), max, panelType.getValue())
        }
        vecValueHandle.free()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeEffect(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetCloseEffect(value)
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
    public func valueColors(values: Array<LinearGradient>): This {
        let vecValueHandle = FFIVectorNativeLinearGradient(values.size)
        for (i in 0..values.size) {
            vecValueHandle.setElement(i, values[i].parseToNative())
        }
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetValueColors(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackBackgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetTrackBackgroundColor(transAppResourceToResourceColor(color))
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
    public func strokeWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetStrokeWidth(value_.value, value_.unitType.getValue())
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
    public func trackShadow(value: DataPanelShadowOptions): This {
        let colors = value.colors
        let vecValueHandle = FFIVectorNativeLinearGradient(colors.size)
        for (i in 0..colors.size) {
            vecValueHandle.setElement(i, colors[i].parseToNative())
        }
        unsafe {
            FfiOHOSAceFrameworkDataPanelSetTrackShadow(
                NativeDataPanelShadow(
                    value.radius.value,
                    value.offsetX.value,
                    value.offsetY.value,
                    vecValueHandle.getNativeHandle()
                )
            )
        }
        vecValueHandle.free()
        this
    }
}
