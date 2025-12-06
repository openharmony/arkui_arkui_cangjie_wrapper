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

import ohos.arkui.component.common.{CommonMethod}
import ohos.arkui.component.data_panel.{LinearGradient}
import ohos.labels.APILevel
import ohos.base.{ResourceColor, Length, ResourceStr}

/**
 * Defines the Gauge attributes.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface GaugeAttribute <: CommonMethod<GaugeAttribute> {
    /**
     * Sets the value for the current profile.
     *
     * @param { ?Float32 } value - Set current data value.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func value(value: ?Float32): GaugeAttribute

    /**
     * Set the start angle. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @param { ?Float32 } angle - The start angle value.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func startAngle(angle: ?Float32): GaugeAttribute

    /**
     * Sets the end angle position. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @param { ?Float32 } angle - The end angle value.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func endAngle(angle: ?Float32): GaugeAttribute

    /**
     * Sets the end angle position. Clock 0 is 0 degrees and clockwise is positive.
     *
     * @param { ?Array<(ResourceColor, Int32)> } value - The color array with stop positions.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?Array<(ResourceColor, Int32)>): GaugeAttribute

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @param { ?Array<(LinearGradient, Int32)> } value - The linear gradient array with stop positions.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?Array<(LinearGradient, Int32)>): GaugeAttribute

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @param { ?ResourceColor } value - The solid color value.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?ResourceColor): GaugeAttribute

    /**
     * Set the color of the chart. You can set the solid color and segmented gradient color.
     *
     * @param { ?LinearGradient } value - The linear gradient value.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colors(value: ?LinearGradient): GaugeAttribute

    /**
     * Sets the thickness of the ring chart.
     *
     * @param { ?Length } length - The stroke width value.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeWidth(length: ?Length): GaugeAttribute

    /**
     * Sets track shadow of the ring chart.
     *
     * @param { ?Float32 } radius - The shadow radius.
     * @param { ?Float32 } offsetX - The shadow horizontal offset.
     * @param { ?Float32 } offsetY - The shadow vertical offset.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func trackShadow(radius!: ?Float32, offsetX!: ?Float32, offsetY!: ?Float32): GaugeAttribute

    /**
     * Sets indicator options of the ring chart.
     *
     * @param { ?ResourceStr } icon - The indicator icon.
     * @param { ?Length } space - The space between indicator and chart.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func indicator(icon!: ?ResourceStr, space!: ?Length): GaugeAttribute

    /**
     * Sets description content of the ring chart.
     *
     * @param { ?() -> Unit } builder - The custom description builder function.
     * @returns { GaugeAttribute } - The attribute of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func description(builder: ?() -> Unit): GaugeAttribute
}
