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
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines the Gauge attributes.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface GaugeAttribute <: CommonMethod<GaugeAttribute> {
    /**
     * Sets the value for the current profile.
     *
     * @params { ?Float32 } value
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func value(value: ?Float32): GaugeAttribute

    /**
     * Set the start angle. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @params { ?Float64 } angle
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func startAngle(angle: ?Float64): GaugeAttribute

    /**
     * Sets the end angle position. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @params { ?Float64 } angle
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func endAngle(angle: ?Float64): GaugeAttribute

    /**
     * Sets the end angle position. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @params { ?Array<(ResourceColor, Float32)> } angle
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?Array<(ResourceColor, Float32)>): GaugeAttribute

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @params { ?Array<(LinearGradient, Float32)> } value
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?Array<(LinearGradient, Float32)>): GaugeAttribute

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @params { ?ResourceColor } value
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?ResourceColor): GaugeAttribute

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @params { ?LinearGradient } value
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?LinearGradient): GaugeAttribute

    /**
     * Sets the thickness of the ring chart.
     *
     * @params { ?Length } length
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeWidth(length: ?Length): GaugeAttribute

    /**
     * Sets track shadow of the ring chart.
     *
     * @params { ?Float64 } radius
     * @params { ?Float64 } offsetX
     * @params { ?Float64 } offsetY
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func trackShadow(radius!: ?Float64, offsetX!: ?Float64, offsetY!: ?Float64): GaugeAttribute

    /**
     * Sets indicator options of the ring chart.
     *
     * @params { ?ResourceStr } icon
     * @params { ?Length } space
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func indicator(icon!: ?ResourceStr, space!: ?Length): GaugeAttribute

    /**
     * Sets description content of the ring chart.
     *
     * @params { ?() -> Unit } builder
     * @returns { GaugeAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func description(builder: ?() -> Unit): GaugeAttribute
}
