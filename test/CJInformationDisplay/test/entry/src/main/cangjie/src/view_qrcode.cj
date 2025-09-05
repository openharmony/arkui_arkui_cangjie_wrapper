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
class ViewQRCode {
    var value: String = "hello world";

    func build() {
        Scroll() {
            Column(space: 5) {
                Text("normal").fontSize(9).width(90.percent).fontColor(0xCCCCCC).fontSize(30)
                QRCode(this.value).width(140).height(140).id("QRCode0")
                    .contentOpacity(1.0)

                // 设置二维码颜色，设置二维码背景色， 不透明度
                Text("backgroundColor").fontSize(9).width(90.percent).fontColor(0xCCCCCC).fontSize(30)
                QRCode(this.value)
                    .width(140)
                    .height(140)
                    .color(0xF7CE00)
                    .backgroundColor(Color.Red)
                    .contentOpacity(0.1)
                    .id("QRCode1")

                // 设置二维码不透明度
                Text("contentOpacity resource").fontSize(9).width(90.percent).fontColor(0xCCCCCC).fontSize(30)
                QRCode(this.value)
                    .width(140)
                    .height(140)
                    .color(Color.Black)
                    .contentOpacity(@r(app.string.content_opacity))
                    .id("QRCode2")
            }.width(100.percent).margin(top: 5)
        }
    }
}
