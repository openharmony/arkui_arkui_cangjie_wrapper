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

package ohos.arkui.component.text_area

import ohos.arkui.component.common.*
import ohos.arkui.component.text_field.*
import ohos.base.*
import ohos.resource.*

sealed interface TextAreaAttribute <: CommonMethod<TextAreaAttribute> {

    func caretColor(value: ?ResourceColor): TextAreaAttribute

    func placeholderFont(size!: ?Length, weight!: ?FontWeight, family!: ?String,
        style!: ?FontStyle): TextAreaAttribute

    func textAlign(value: ?TextAlign): TextAreaAttribute

    func fontSize(value: ?Length): TextAreaAttribute

    func fontColor(value: ?ResourceColor): TextAreaAttribute

    func fontWeight(value: ?FontWeight): TextAreaAttribute

    func fontStyle(value: ?FontStyle): TextAreaAttribute

    func fontFamily(value: ?ResourceStr): TextAreaAttribute

    func enterKeyType(value: ?EnterKeyType): TextAreaAttribute

    func inputFilter(value!: ?ResourceStr, error!: ?(String) -> Unit): TextAreaAttribute

    func maxLength(value: ?UInt32): TextAreaAttribute

    func placeholderColor(value: ?ResourceColor): TextAreaAttribute

    func onSubmit(callback: ?(EnterKeyType) -> Unit): TextAreaAttribute

    func onChange(callback: ?(String) -> Unit): TextAreaAttribute

    func onCopy(callback: ?(String) -> Unit): TextAreaAttribute

    func onCut(callback: ?(String) -> Unit): TextAreaAttribute

    func onPaste(callback: ?(String) -> Unit): TextAreaAttribute

    func onEditChange(callback: ?(Bool) -> Unit): TextAreaAttribute
}
