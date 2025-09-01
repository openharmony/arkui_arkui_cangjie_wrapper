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
import std.collection.*
import kit.LocalizationKit.*

@Entry
@Component
class View_PixelRound {
    @State
    var curWidth: Float64 = 300.0

    func build() {
        Column() {
            Button(ButtonOptions()) {
                Text("${this.curWidth}")
            }
                .onClick({
                    e => this.curWidth += 0.1
                })
                .height(200)
                .width(200)
                .backgroundColor(0xFFD5D5D5)
                .id("pixelRoundButton")

            Blank().height(20)

            Row() {
                Row() {
                    
                }.width(100.percent).height(100.percent).backgroundColor(0xFFBF00).id("subRow")
            }.width(this.curWidth.px).height(300.6.px).backgroundColor(0xff0000).id("parentRow")
        }.id("topColumn").width(100.percent).height(100.percent).backgroundColor(0xffe5e5e5)
    }
}
