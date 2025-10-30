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

package ohos.arkui.component.slider

import ohos.arkui.component.common.{CommonMethod, SliderChangeMode}
import ohos.labels.APILevel
import ohos.base.{ResourceStr, Length, ResourceColor}

/**
 * Provides methods for configuring the appearance and behavior of the Slider component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SliderAttribute <: CommonMethod<SliderAttribute> {
    /**
    * Called when the slider color of the slider bar is set.
    *
    * @param { ?ResourceColor } value
    * @returns { SliderAttribute }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func blockColor(value: ?ResourceColor): SliderAttribute

    /**
    * Called when the track color of the slider is set.
    *
    * @param { ?ResourceColor } value
    * @returns { SliderAttribute }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func trackColor(value: ?ResourceColor): SliderAttribute

    /**
    * Called when the slider of the slider bar is set to slide over the area color.
    *
    * @param { ?ResourceColor } value
    * @returns { SliderAttribute }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectedColor(value: ?ResourceColor): SliderAttribute

    /**
    * Called when setting whether to display step size.
    *
    * @param { ?Bool } value - Called when setting whether to display step size.
    * @returns { SliderAttribute }
    * @default false
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showSteps(value: ?Bool): SliderAttribute

    /**
    * Called when the percentage of bubble prompt is set when sliding.
    *
    * @param { ?Bool } value - Whether to display the bubble.
    * @param { ?ResourceStr } content - Text content in the bubble. If the content is not specified,
    *     the current percentage is displayed by default.
    * @returns { SliderAttribute }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func showTips(value: ?Bool, content!: ?ResourceStr): SliderAttribute

    /**
    * Called when the thickness of track is set.
    *
    * @param { ?Length } value
    * @returns { SliderAttribute }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func trackThickness(value: ?Length): SliderAttribute

    /**
    * Triggered when the slider is dragged or clicked.
    *
    * @param { ?(Float64, SliderChangeMode) -> Unit } callback
    * @returns { SliderAttribute }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Float64, SliderChangeMode) -> Unit): SliderAttribute

    /**
    * Called when the border color of block is set.
    *
    * @param { ?ResourceColor } value - The border color of block.
    * @returns { SliderAttribute }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func blockBorderColor(value: ?ResourceColor): SliderAttribute
}
