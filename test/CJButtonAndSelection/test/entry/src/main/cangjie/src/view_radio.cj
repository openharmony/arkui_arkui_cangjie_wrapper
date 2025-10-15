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
class ViewRadio {
    @State
    var radioName: String = "Null"
    func build() {
        Column() {
            Radio(value: '10', group: '数字')
                .onChange ({
                    val =>
                    if (!val) {
                        return
                    }
                    Hilog.info(1,"Cangjie-App", "Radio A")
                    radioName = "AAA"
                })
                .size(width: 40, height: 40)
                .id("my_radio_1")
            Radio(value: '20', group: '数字')
                .onChange ({
                    val =>
                    if (!val) {
                        return
                    }
                    Hilog.info(1,"Cangjie-App", "Radio B")
                    radioName = "BBB"
                })
                .size(width: 40, height: 40)
                .id("my_radio_2")

            Radio(value: '30', group: '数字')
                .size(width: 40, height: 40)
                .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))
//                .responseRegionArray(
//                    [Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent),
//                    Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent)])

            Text("-------init、radioStyle、padding、hoverEffect、size属性设置测试-------").fontSize(20)

            Radio(value: '40', group: '数字')
//                .radioStyle(checkedBackgroundColor: Color.Blue, uncheckedBorderColor: Color.Red,
//                    indicatorColor: Color.Gray)
                .padding(30.vp)
                //.hoverEffect(HoverEffect.Scale)
                .size(width: 100.vp, height: 150.vp)
                .id("my_radio_4")

            Radio(value: '50', group: '数字')
                .padding(top: 10.vp, right: 30.vp, bottom: 5.vp, left: 10.vp)
//                .hoverEffect(HoverEffect.Highlight)
                .size(width: 100.vp, height: 100.vp)
                .id("my_radio_5")

            Radio(value: '60', group: '数字')
                .size(width: 80.vp, height: 80.vp)
                //.hoverEffect(HoverEffect.Auto)
                .id("my_radio_6")

            Radio(value: '70', group: '数字')
                .size(width: 80.vp, height: 80.vp)
                //.hoverEffect(HoverEffect.None)
                .id("my_radio_7")

            Radio(value: '80', group: '数字')
                .checked(true)
                //.radioStyle()
        }.margin(top: 40, left: 40)
    }
}
