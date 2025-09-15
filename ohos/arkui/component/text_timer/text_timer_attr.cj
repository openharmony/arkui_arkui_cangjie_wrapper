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

package ohos.arkui.component.text_timer

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*

sealed interface TextTimerAttribute <: CommonMethod<TextTimerAttribute> {

    func format(value: String): TextTimerAttribute

    func onTimer(event: (Int64, Int64) -> Unit): TextTimerAttribute

    func fontSize(value: Length): TextTimerAttribute

    func fontColor(value: ResourceColor): TextTimerAttribute

    func fontStyle(value: FontStyle): TextTimerAttribute

    func fontWeight(value: FontWeight): TextTimerAttribute

    func fontFamily(value: ResourceStr): TextTimerAttribute

    func textShadow(value: Array<ShadowOptions>): TextTimerAttribute

    func textShadow(value: ShadowOptions): TextTimerAttribute
}
