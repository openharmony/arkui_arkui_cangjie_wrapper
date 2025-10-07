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

package ohos.arkui.component.slider

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

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
/**
 * Defines Slider Component.
 *
 * @relation const Slider: SliderInterface;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Slider <: ViewBase {
    /**
    * Defines Slider Component instance.
    *
    * @param { Float64 } min
    * @param { Float64 } max
    * @param { Float64 } step
    * @param { Float64 } value
    * @param { SliderStyle } style
    * @param { Axis } direction
    * @param { Bool } reverse
    * @returns { This }
    * @relation (options?: SliderOptions): SliderAttribute;
    */
    @!APILevel[
        21,
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
    /**
    * Called when the slider color of the slider bar is set.
    *
    * @param { ResourceColor } value
    * @returns { This }
    * @relation blockColor(value: ResourceColor): SliderAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderBlockColor(transAppResourceToResourceColor(value))
        }
        this
    }
    /**
    * Called when the track color of the slider is set.
    *
    * @param { ResourceColor } value
    * @returns { This }
    * @relation trackColor(value: ResourceColor | LinearGradient): SliderAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderTrackColor(transAppResourceToResourceColor(value))
        }
        this
    }
    /**
    * Called when the slider of the slider bar is set to slide over the area color.
    *
    * @param { ResourceColor } value
    * @returns { This }
    * @relation selectedColor(value: ResourceColor): SliderAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderSelectedColor(transAppResourceToResourceColor(value))
        }
        this
    }
    /**
    * Called when setting whether to display step size.
    *
    * @param { boolean } value
    * @returns { This }
    * @relation showSteps(value: boolean): SliderAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showSteps(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSliderShowSteps(value)
        }
        this
    }
    /**
    * Called when the percentage of bubble prompt is set when sliding.
    *
    * @param { Bool } value
    * @param { ResourceStr } content
    * @returns { This }
    * @relation showTips(value: boolean, content?: ResourceStr): SliderAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showTips(value: Bool, content!: ?ResourceStr = None): This {
        unsafe {
            var contentValue = ""
            var contentExist = false
            if (let Some(v) <- content) {
                contentExist = true
                contentValue = transResourceStrToString(v)
            }
            try (contentCString = LibC.mallocCString(contentValue).asResource()) {
                FfiOHOSAceFrameworkSliderShowTipsNew(value, contentCString.value, contentExist)
            }
        }
        this
    }
    /**
    * Called when the thickness of track is set.
    *
    * @param { Length } value
    * @returns { This }
    * @relation trackThickness(value: Length): SliderAttribute;
    */
    @!APILevel[
        21,
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
    /**
    * Triggered when the slider is dragged or clicked.
    *
    * @param { (Float64, SliderChangeMode) -> Unit } callback
    * @returns { This }
    * @relation onChange(callback: (value: number, mode: SliderChangeMode) => void): SliderAttribute;
    */
    @!APILevel[
        21,
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
    /**
    * Called when the border color of block is set.
    *
    * @param { ResourceColor } value
    * @returns { This }
    * @relation blockBorderColor(value: ResourceColor): SliderAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockBorderColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSliderBlockBorderColor(transAppResourceToResourceColor(value))
        }
        this
    }

    protected override func pop() {}
}
