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

import ohos.arkui.component.common.{CommonMethodComponent, SliderStyle, Axis, SliderChangeMode}
import ohos.arkui.component.util.{transAppResourceToResourceColor, transAppResourceToLength, transResourceStrToString}
import ohos.base.{ResourceStr, Length, ResourceColor, LengthProp}
import ohos.ffi.{Callback2Param}
import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException

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

    func FfiOHOSAceFrameworkSliderResetBlockColor(): Unit

    func FfiOHOSAceFrameworkSliderResetTrackColor(): Unit

    func FfiOHOSAceFrameworkSliderResetSelectedColor(): Unit
}
/**
 * A component that provides a slider for selecting values within a range.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Slider <: CommonMethodComponent<Slider> & SliderAttribute {
    /**
    * Defines Slider Component instance.
    *
    * @param { ?Float64 } min - Minimum value.
    * @param { ?Float64 } max - Maximum value.
    * @param { ?Float64 } step - Step of the slider.
    * @param { ?Float64 } value - Current value of Slider.
    * @param { ?SliderStyle } style - Style of the slider thumb and track.
    * @param { ?Axis } direction - Whether the slider moves horizontally or vertically.
    * @param { ?Bool } reverse - Whether the slider values are revers. By default, the values increase from left to right for a horizontal
    *      slider and from top to bottom for a vertical slider.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        min!: ?Float64 = None,
        max!: ?Float64 = None,
        step!: ?Float64 = None,
        value!: ?Float64 = None,
        style!: ?SliderStyle = Option.None,
        direction!: ?Axis = None,
        reverse!: ?Bool = None
    ) {
        let tmpMin = min ?? 0.0
        let tmpMax = max ?? 100.0
        let tmpStep = step ?? 1.0
        let tmpValue = value ?? tmpMin
        let tmpStyle = style ?? SliderStyle.OutSet
        let tmpDirection = direction ?? Axis.Horizontal

        unsafe {
            var minValue = tmpMin;
            var maxValue = tmpMax;
            var stepValue = tmpStep;
            var valueValue = tmpValue;
            if (tmpMin >= tmpMax) {
                minValue = 0.0
                maxValue = 100.0
            }
            if (tmpStep < 0.0 || tmpStep > (maxValue - minValue)) {
                stepValue = 1.0
            }
            if (tmpValue < minValue) {
                valueValue = minValue
            }
            if (tmpValue > maxValue) {
                valueValue = maxValue
            }
            FfiOHOSAceFrameworkSliderCreate(
                CJSliderCreate(valueValue, minValue, maxValue, stepValue, tmpStyle.getValue(), tmpDirection.getValue(),
                    reverse ?? false))
        }
    }
    /**
    * Called when the slider color of the slider bar is set.
    *
    * @param { ?ResourceColor } value
    * @returns { This }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockColor(value: ?ResourceColor): This {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkSliderBlockColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkSliderResetBlockColor()
            }
        }
        this
    }
    /**
    * Called when the track color of the slider is set.
    *
    * @param { ?ResourceColor } value
    * @returns { This }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackColor(value: ?ResourceColor): This {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkSliderTrackColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkSliderResetTrackColor()
            }
        }
        this
    }
    /**
    * Called when the slider of the slider bar is set to slide over the area color.
    *
    * @param { ?ResourceColor } value
    * @returns { This }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ?ResourceColor): This {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkSliderSelectedColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkSliderResetSelectedColor()
            }
        }
        this
    }
    /**
    * Called when setting whether to display step size.
    *
    * @param { ?Bool } value - Called when setting whether to display step size.
    * @returns { This }
    * @default false
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showSteps(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSliderShowSteps(value ?? false)
        }
        this
    }
    /**
    * Called when the percentage of bubble prompt is set when sliding.
    *
    * @param { ?Bool } value - Whether to display the bubble.
    * @param { ?ResourceStr } content - Text content in the bubble.If the content is not specified,
    *     the current percentage is displayed by default.
    * @returns { This }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showTips(value: ?Bool, content!: ?ResourceStr = None): This {
        unsafe {
            var contentValue = ""
            var contentExist = false
            if (let Some(v) <- content) {
                contentExist = true
                contentValue = transResourceStrToString(v)
            }
            try (contentCString = LibC.mallocCString(contentValue).asResource()) {
                FfiOHOSAceFrameworkSliderShowTipsNew(value ?? false, contentCString.value, contentExist)
            }
        }
        this
    }
    /**
    * Called when the thickness of track is set.
    *
    * @param { ?Length } value
    * @returns { This }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func trackThickness(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkSliderTrackThickness(value_.value, value_.unitType.getValue())
        }
        this
    }
    /**
    * Triggered when the slider is dragged or clicked.
    *
    * @param { ?(Float64, SliderChangeMode) -> Unit } callback
    * @returns { This }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(Float64, SliderChangeMode) -> Unit): This {
        let tmpCallback = callback ?? { _, _ => }
        unsafe {
            FfiOHOSAceFrameworkSliderOnChange(
                Callback2Param<Float64, Int32, Unit>(
                    {
                        value, modeID =>
                        let mode = SliderChangeMode.setValue(modeID)
                        tmpCallback(value, mode)
                    }
                ).getID())
        }
        this
    }
    /**
    * Called when the border color of block is set.
    *
    * @param { ?ResourceColor } value - The border color of block.
    * @returns { This }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blockBorderColor(value: ?ResourceColor): This {
        let tmpValue = value ?? 0x00000000
        unsafe {
            FfiOHOSAceFrameworkSliderBlockBorderColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    protected override func pop() {}
}
