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

package ohos.arkui.component.swiper

import ohos.arkui.component.common.{CommonMethod, SwiperDisplayMode, EdgeEffect, Curve}
import ohos.labels.APILevel
import ohos.base.{Length}

/**
 * Defines the Swiper attribute functions.
 * Provides methods for configuring the appearance and behavior of the Swiper component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface SwiperAttribute <: CommonMethod<SwiperAttribute> {
    /**
     * Sets whether to enable automatic playback for child component switching.
     *
     * <p><strong>NOTE</strong>:
     * <br>If loop is set to false, the playback stops when the last page is reached.
     * <br>The playback continues when the page is not the last page after a swipe gesture.
     * <br>If the Swiper component becomes invisible, the playback stops.
     * </p>
     *
     * @param { ?Bool } value - Whether to enable automatic playback for child component switching.
     * @default false
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoPlay(value: ?Bool): SwiperAttribute

    /**
     * Sets the duration of the animation for child component switching.
     *
     * @param { ?UInt32 } value - Duration of the autoplay for child component switching in milliseconds.
     * @default 400
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func duration(value: ?UInt32): SwiperAttribute

    /**
     * Sets the index of the child component currently displayed in the container.
     *
     * @param { ?UInt32 } value - Index of the child component currently displayed in the container.
     * @default 0
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func index(value: ?UInt32): SwiperAttribute

    /**
     * Sets the interval for automatic playback.
     *
     * @param { ?UInt32 } value - Interval for automatic playback in milliseconds.
     * @default 3000
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func interval(value: ?UInt32): SwiperAttribute

    /**
     * Sets whether to enable loop playback.
     *
     * @param { ?Bool } value - Whether to enable loop playback.
     * @default true
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func loop(value: ?Bool): SwiperAttribute

    /**
     * Sets whether vertical swiping is used.
     *
     * @param { ?Bool } value - Whether vertical swiping is used.
     * @default false
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func vertical(value: ?Bool): SwiperAttribute

    /**
     * Sets the style of the navigation indicator.
     *
     * @param { ?Bool } indicator - Whether to show the navigation indicator.
     * @default true
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func indicator(indicator: ?Bool): SwiperAttribute

    /**
     * Sets the style of the navigation indicator.
     *
     * @param { ?DotIndicator } indicator - Dot-style navigation indicator.
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func indicator(indicator: ?DotIndicator): SwiperAttribute

    /**
     * Sets the style of the navigation indicator.
     *
     * @param { ?DigitIndicator } indicator - Digit-style navigation indicator.
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func indicator(indicator: ?DigitIndicator): SwiperAttribute

    /**
     * Sets the space between child components.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the type is Length, the default unit is vp.
     * if the unit is not specified, for example, '10', the default unit vp is used.
     * </p>
     *
     * @param { ?Length } value - Space between child components. Minimum value is 0. If a value less than 0 is set, the default value is used.
     * @default 0
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func itemSpace(value: ?Length): SwiperAttribute

    /**
     * Sets the mode in which elements are displayed along the main axis.
     * This API takes effect only when displayCount is not set.
     *
     * @param { ?SwiperDisplayMode } value - Mode in which elements are displayed along the main axis.
     * @default SwiperDisplayMode.Stretch
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func displayMode(value: ?SwiperDisplayMode): SwiperAttribute

    /**
     * Sets the effect used when the component is at one of the edges.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute takes effect when loop is set to false.
     * </p>
     *
     * @param { ?EdgeEffect } value - Effect used when the component is at one of the edges.
     * @default EdgeEffect.Spring
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func effectMode(value: ?EdgeEffect): SwiperAttribute

    /**
     * Sets the number of elements to display per page.
     *
     * If swipeByGroup is set to true:
     * 1. All sub-items are grouped from index 0.
     * 2. The number of sub-items in each group is the value of displayCount.
     * 3. If the number of sub-items in the last group is less than displayCount, placeholder items are added to supplement the number of last group.
     * 4. Placeholder items do not display any content and are only used as placeholders.
     * 5. When turning pages, turn pages by group.
     *
     * @param { ?Int32 } value - Number of elements to display per page. Default value is 1.
     * @param { ?Bool } swipeByGroup - Whether to turn pages by group. Default value is false.
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func displayCount(value: ?Int32, swipeByGroup!: ?Bool): SwiperAttribute

    /**
     * Sets the number of child components to be preloaded(cached).
     *
     * <p><strong>NOTE</strong>:
     * <br>Which are needed for the specific number of pages immediately before and after the current page.
     * <br>If swipeByGroup in displayCount is set to true, child components are cached by group.
     * </p>
     *
     * @param { ?Int32 } value - Number of child components to be preloaded (cached). Minimum value is 0. If a value less than 0 is set, the default value is used.
     * @default 1
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func cachedCount(value: ?Int32): SwiperAttribute

    /**
     * Sets whether to disable the swipe feature.
     *
     * @param { ?Bool } value - Whether to disable the swipe feature.
     * @default false
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func disableSwipe(value: ?Bool): SwiperAttribute

    /**
     * Sets the animation curve.
     * Curve is an enumeration type for common curves.
     *
     * @param { ?Curve } value - Animation curve.
     * @default Curve.Linear
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func curve(value: ?Curve): SwiperAttribute

    /**
     * Triggered when the index of the currently displayed child component changes.
     *
     * @param { ?(Int32) -> Unit } callback - Callback function triggered when the index changes.
     * The parameter is the index of the currently displayed child component.
     * @returns { SwiperAttribute } Returns the swiper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(Int32) -> Unit): SwiperAttribute
}
