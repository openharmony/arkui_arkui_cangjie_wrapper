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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderInteraction {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SLIDE_AND_CLICK
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SLIDE_ONLY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SLIDE_AND_CLICK_UP
    | ...

    func getValue(): Int32 {
        match (this) {
            case SLIDE_AND_CLICK => 0
            case SLIDE_ONLY => 1
            case SLIDE_AND_CLICK_UP => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderBlockType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IMAGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SHAPE
    | ...

    func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case IMAGE => 1
            case SHAPE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct CJSliderCreate {
    CJSliderCreate(
        let value: Float64,
        let min: Float64,
        let max: Float64,
        let step: Float64,
        let style: Int32,
        let direction: Int32,
        let reverse: Bool
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkSliderCreate(value: CJSliderCreate): Unit

    func FfiOHOSAceFrameworkSliderBlockColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSliderTrackColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSliderSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSliderShowSteps(isShow: Bool): Unit

    func FfiOHOSAceFrameworkSliderShowTipsNew(isShow: Bool, content: CString, contentExist: Bool): Unit

    func FfiOHOSAceFrameworkSliderTrackThickness(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSliderMaxLabel(value: Float64): Unit

    func FfiOHOSAceFrameworkSliderMinLabel(value: Float64): Unit

    func FfiOHOSAceFrameworkSliderOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkSliderBlockBorderColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSliderBlockBorderWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSliderBlockSize(widthVal: Float64, widthUnit: Int32, heightVal: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkSliderMinResponsiveDistance(value: Float32): Unit

    func FfiOHOSAceFrameworkSliderSelectedBorderRadius(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSliderInteractionMode(value: Int32): Unit

    func FfiOHOSAceFrameworkSliderSlideRange(from: Float32, to: Float32, fromExist: Bool, toExist: Bool): Unit

    func FfiOHOSAceFrameworkSliderStepColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSliderStepSize(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSliderTrackBorderRadius(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSliderContentModifier(): Unit

    func FfiOHOSAceFrameworkSliderBlockStyle(`type`: Int32, image: CString, shapeId: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Slider <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        min!: Float64 = 0.0,
        max!: Float64 = 100.0,
        step!: Float64 = 1.0,
        value!: Float64 = min,
        style!: SliderStyle = SliderStyle.OutSet,
        direction!: Axis = Axis.Horizontal,
        reverse!: Bool = false
    ) {
        unsafe {
            var minValue = min;
            var maxValue = max;
            var stepValue = step;
            var valueValue = value;
            if (min >= max) {
                minValue = 0.0
                maxValue = 100.0
            }
            if (step < 0.0 || step > (maxValue - minValue)) {
                stepValue = 1.0
            }
            if (value < minValue) {
                valueValue = minValue
            }
            if (value > maxValue) {
                valueValue = maxValue
            }
            FfiOHOSAceFrameworkSliderCreate(
                CJSliderCreate(valueValue, minValue, maxValue, stepValue, style.getValue(), direction.getValue(),
                    reverse))
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
    public func blockColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderBlockColor(transAppResourceToResourceColor(value))
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
    public func trackColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderTrackColor(transAppResourceToResourceColor(value))
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
    public func selectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderSelectedColor(transAppResourceToResourceColor(value))
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
    public func showSteps(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSliderShowSteps(value)
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
    public func showTips(value: Bool, content!: ?String = None): This {
        unsafe {
            var contentValue = ""
            var contentExist = false
            if (let Some(v) <- content) {
                contentExist = true
                contentValue = v
            }
            let contentCString = LibC.mallocCString(contentValue)
            FfiOHOSAceFrameworkSliderShowTipsNew(value, contentCString, contentExist)
            LibC.free(contentCString)
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
    public func trackThickness(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSliderTrackThickness(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLabel(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkSliderMaxLabel(value)
        }
        this
    }

    @!APILevel[
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minLabel(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkSliderMinLabel(value)
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
    public func onChange(callback: (Float64, SliderChangeMode) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkSliderOnChange(
                Callback2Param<Float64, Int32, Unit>(
                    {
                        value, modeID =>
                        let mode = SliderChangeMode.setValue(modeID)
                        callback(value, mode)
                    }
                ).getID())
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
    public func onChange(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkSliderOnChange(
                Callback2Param<Float64, Int32, Unit>(
                    {
                        _, modeID =>
                        SliderChangeMode.setValue(modeID)
                        callback()
                    }
                ).getID())
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
    public func blockBorderColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderBlockBorderColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockBorderWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSliderBlockBorderWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockSize(width!: Length = 0.vp, height!: Length = 0.vp): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkSliderBlockSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minResponsiveDistance(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkSliderMinResponsiveDistance(value)
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minResponsiveDistance(value: Int64): This {
        minResponsiveDistance(Float32(value))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedBorderRadius(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSliderSelectedBorderRadius(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sliderInteractionMode(value: SliderInteraction): This {
        unsafe {
            FfiOHOSAceFrameworkSliderInteractionMode(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func slideRange(from!: ?Float32 = None, to!: ?Float32 = None): This {
        unsafe {
            var fromExist: Bool = false
            var toExist: Bool = false
            var fromValue: Float32 = 0.0
            var toValue: Float32 = 0.0
            if (let Some(v) <- from) {
                fromExist = true
                fromValue = v
            }
            if (let Some(v) <- to) {
                toExist = true
                toValue = v
            }
            FfiOHOSAceFrameworkSliderSlideRange(fromValue, toValue, fromExist, toExist);
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func slideRange(from!: ?Int64 = None, to!: ?Int64 = None): This {
        unsafe {
            var fromExist: Bool = false
            var toExist: Bool = false
            var fromValue: Float32 = 0.0
            var toValue: Float32 = 0.0
            if (let Some(v) <- from) {
                fromExist = true
                fromValue = Float32(v)
            }
            if (let Some(v) <- to) {
                toExist = true
                toValue = Float32(v)
            }
            FfiOHOSAceFrameworkSliderSlideRange(fromValue, toValue, fromExist, toExist);
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stepColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderStepColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stepSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSliderStepSize(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackBorderRadius(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSliderTrackBorderRadius(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockStyle(`type`: SliderBlockType, image!: String = "", shape!: ?ShapeAbstract = None): This {
        unsafe {
            let imageCString = LibC.mallocCString(image)
            var shapeId: Int64 = 0
            if (let Some(v) <- shape) {
                shapeId = v.getID()
            }
            FfiOHOSAceFrameworkSliderBlockStyle(`type`.getValue(), imageCString, shapeId)
            LibC.free(imageCString)
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockStyle(`type`: SliderBlockType, image!: AppResource, shape!: ?ShapeAbstract = None): This {
        blockStyle(`type`, image: getResourceMedia(image), shape: shape)
    }

    protected override func pop() {}
}
