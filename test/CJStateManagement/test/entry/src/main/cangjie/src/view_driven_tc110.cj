/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * TC_110: Multiple @Watch Chain Updates
 * Test Scenario: Multiple @Watch form update chain (A -> B -> C)
 * Expected Result: Update chain executes correctly, UI refreshes sequentially
 */

@Entry
@Component
class ViewDrivenTC110 {
    @Watch[onAChanged] @State var valueA: Int64 = 0
    @Watch[onBChanged] @State var valueB: Int64 = 0
    @State var valueC: Int64 = 0

    func onAChanged(): Unit {
        this.valueB = this.valueB * 2
    }

    func onBChanged(): Unit {
        this.valueC = this.valueC * 3
    }

    func build(): Unit {
        Column() {
            Text("TC_110: Multiple @Watch Chain Updates")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Value A: ${this.valueA}")
                .fontSize(16)
                .id("value_a_display")

            Text("Value B: ${this.valueB}")
                .fontSize(16)
                .id("value_b_display")

            Text("Value C: ${this.valueC}")
                .fontSize(16)
                .id("value_c_display")

            Button("Update A")
                .id("update_a_button")
                .onClick({ e => 
                    this.valueA = this.valueA + 1
                })

            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.valueA = 0
                    this.valueB = 0
                    this.valueC = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

