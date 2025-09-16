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

package ohos.arkui.component.text_input

import ohos.arkui.component.common.*
import ohos.arkui.component.text_field.*
import ohos.base.*
import ohos.resource.*

sealed interface TextInputAttribute <: CommonMethod<TextInputAttribute> {

    func enterKeyType(value: EnterKeyType): TextInputAttribute

    func textAlign(value: TextAlign): TextInputAttribute

    func placeholderColor(value: ResourceColor): TextInputAttribute

    func caretColor(value: ResourceColor): TextInputAttribute

    func placeholderFont(size!: Length, weight!: FontWeight, family!: String,
        style!: FontStyle): TextInputAttribute

    func maxLength(value: UInt32): TextInputAttribute

    func fontSize(value: Length): TextInputAttribute

    func fontColor(value: ResourceColor): TextInputAttribute

    func fontWeight(value: FontWeight): TextInputAttribute

    func fontStyle(value: FontStyle): TextInputAttribute

    func fontFamily(value: ResourceStr): TextInputAttribute

    func inputFilter(value: ResourceStr, error!: ?(String) -> Unit): TextInputAttribute

    func onSubmit(callback: (EnterKeyType) -> Unit): TextInputAttribute

    func onCopy(callback: (String) -> Unit): TextInputAttribute

    func onCut(callback: (String) -> Unit): TextInputAttribute

    func onChange(callback: (String) -> Unit): TextInputAttribute

    func onPaste(callback: (String) -> Unit): TextInputAttribute

    func onEditChange(callback: (Bool) -> Unit): TextInputAttribute

    func customKeyboard(value: CustomBuilder, supportAvoidance!: Bool): TextInputAttribute

    func style(value: TextInputStyle): TextInputAttribute

    func enableKeyboardOnFocus(value: Bool): TextInputAttribute

    func selectionMenuHidden(value: Bool): TextInputAttribute

    func showUnderline(value: Bool): TextInputAttribute

    func maxLines(value: Int32): TextInputAttribute
}
