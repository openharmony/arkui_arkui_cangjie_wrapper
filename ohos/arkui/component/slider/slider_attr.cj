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

import ohos.arkui.component.common.*
import ohos.base.*

sealed interface SliderAttribute <: CommonMethod<SliderAttribute> {

    func blockColor(value: ResourceColor): SliderAttribute

    func trackColor(value: ResourceColor): SliderAttribute

    func selectedColor(value: ResourceColor): SliderAttribute

    func showSteps(value: Bool): SliderAttribute

    func showTips(value: Bool, content!: ?ResourceStr): SliderAttribute

    func trackThickness(value: Length): SliderAttribute

    func onChange(callback: (Float64, SliderChangeMode) -> Unit): SliderAttribute

    func blockBorderColor(value: ResourceColor): SliderAttribute
}
