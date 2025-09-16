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

package ohos.arkui.component.button

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*

sealed interface ButtonAttribute <: CommonMethod<ButtonAttribute> {
    func fontSize(value: Length): ButtonAttribute

    func fontWeight(value: FontWeight): ButtonAttribute

    func fontColor(color: ResourceColor): ButtonAttribute

    func fontStyle(value: FontStyle): ButtonAttribute

    func fontFamily(value: ResourceStr): ButtonAttribute

    func shape(value: ButtonType): ButtonAttribute

    func stateEffect(value: Bool): ButtonAttribute

    func buttonStyle(value: ButtonStyleMode): ButtonAttribute
}
