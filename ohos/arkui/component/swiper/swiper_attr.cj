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

import ohos.arkui.component.common.*
import ohos.base.*

sealed interface SwiperAttribute <: CommonMethod<SwiperAttribute> {

    func autoPlay(value: ?Bool): SwiperAttribute

    func duration(value: ?UInt32): SwiperAttribute

    func index(value: ?UInt32): SwiperAttribute

    func interval(value: ?UInt32): SwiperAttribute

    func loop(value: ?Bool): SwiperAttribute

    func vertical(value: ?Bool): SwiperAttribute

    func indicator(indicator: ?Bool): SwiperAttribute

    func indicator(indicator: ?DotIndicator): SwiperAttribute

    func indicator(indicator: ?DigitIndicator): SwiperAttribute

    func itemSpace(value: ?Length): SwiperAttribute

    func displayMode(value: ?SwiperDisplayMode): SwiperAttribute

    func effectMode(value: ?EdgeEffect): SwiperAttribute

    func displayCount(value: ?Int32, swipeByGroup!: ?Bool): SwiperAttribute

    func cachedCount(value: ?Int32): SwiperAttribute

    func disableSwipe(value: ?Bool): SwiperAttribute

    func curve(value: ?Curve): SwiperAttribute

    func onChange(callback: ?(Int32) -> Unit): SwiperAttribute
}
