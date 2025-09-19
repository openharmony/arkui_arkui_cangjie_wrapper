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

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TextAreaAttribute <: CommonMethod<TextAreaAttribute> {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func caretColor(value: ?ResourceColor): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderFont(size!: ?Length, weight!: ?FontWeight, family!: ?String,
        style!: ?FontStyle): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func textAlign(value: ?TextAlign): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontColor(value: ?ResourceColor): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontWeight(value: ?FontWeight): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontStyle(value: ?FontStyle): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontFamily(value: ?ResourceStr): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enterKeyType(value: ?EnterKeyType): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func inputFilter(value!: ?ResourceStr, error!: ?(String) -> Unit): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maxLength(value: ?UInt32): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func placeholderColor(value: ?ResourceColor): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSubmit(callback: ?(EnterKeyType) -> Unit): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(String) -> Unit): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCopy(callback: ?(String) -> Unit): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onCut(callback: ?(String) -> Unit): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPaste(callback: ?(String) -> Unit): TextAreaAttribute

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onEditChange(callback: ?(Bool) -> Unit): TextAreaAttribute
}
