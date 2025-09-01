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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_ForegroundColor {
    func build() {
        Column(space: 100) {
            Button("ColoringStrategy.INVERT")
                .width(100.percent)
                .height(80)
                .fontSize(20)
                .backgroundColor(Color.Blue)
                .foregroundColor(INVERT)
                .id("foregroundColor1")

            Button("Color.Green")
                .width(50.percent)
                .height(80)
                .fontSize(20)
                .foregroundColor(Color.Green)
                .id("foregroundColor2")

            Button("UInt32")
                .width(50.percent)
                .height(80)
                .fontSize(20)
                .foregroundColor(0xFF0000FF)
                .id("foregroundColor3")
        }.width(100.percent)
    }
}
