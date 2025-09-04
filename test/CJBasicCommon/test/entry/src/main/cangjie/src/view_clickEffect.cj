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
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*

@Entry
@Component
class  View_ClickEffect{
    @State
    var toggle: Bool = true

    func build() {
        Scroll() {
            Column {
                // 正常值 ，测试Text和Radio组件

                Text("无回弹")
                Radio(value: '20', group: '数字')
                    .height(50)
                    .width(50)

                Radio(value: '20', group: '数字')
                    .height(50)
                    .width(50)

                Radio(value: '10', group: '数字')
                    .height(50)
                    .width(50)

                Radio(value: '10', group: '数字')
                    .height(50)
                    .width(50)

                Radio(value: '10', group: '数字')
                    .height(50)
                    .width(50)
                    .id("clickEffectId01")

                Radio(value: '10', group: '数字')
                    .height(50)
                    .width(50)

                // 异常值
                Radio(value: '10', group: '数字')
                    .height(50)
                    .width(50)
                    .id("clickEffectId02")

                // 异常值
                Radio(value: '10', group: '数字')
                    .height(50)
                    .width(50)

                Text("测试容器组件的回弹")

                Column {
                    Text("LIGHT 0.1")
                }.backgroundColor(Color.Blue)
            }
                .width(100.percent)
                .padding(24.vp)
        }
    }
}
