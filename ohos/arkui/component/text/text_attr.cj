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

package ohos.arkui.component.text

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*

sealed interface TextAttribute <: CommonMethod<TextAttribute> {

    func lineSpacing(value: ?Length): TextAttribute

    func fontSize(value: ?Length): TextAttribute

    func maxFontSize(value: ?Length): TextAttribute

    func minFontSize(value: ?Length): TextAttribute

    func fontColor(value: ?ResourceColor): TextAttribute

    func fontStyle(value: ?FontStyle): TextAttribute

    func fontWeight(value: ?FontWeight): TextAttribute

    func fontFamily(value: ?ResourceStr): TextAttribute

    func textAlign(value: ?TextAlign): TextAttribute

    func textOverflow(value: ?TextOverflow): TextAttribute

    func maxLines(value: ?Int32): TextAttribute

    func lineHeight(value: ?Length): TextAttribute

    func decoration(decorationType!: ?TextDecorationType, color!: ?ResourceColor,
        decorationStyle!: ?TextDecorationStyle): TextAttribute

    func baselineOffset(value: ?Length): TextAttribute

    func textCase(value: ?TextCase): TextAttribute
}
