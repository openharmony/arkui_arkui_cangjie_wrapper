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
 * TC_010: Update @State Variable Through Event Trigger
 * Test Scenario: Modify @State variable in onClick and other event handlers
 * Expected Result: After event is triggered, state updates and UI automatically refreshes
 */
@Entry
@Component
class ViewStateTC010 {
    @State var value: Int64 = 0
    @State var status: String = "Ready"

    func build(): Unit {
        Column() {
            Text("TC_010: Update @State Variable Through Event Trigger")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Value: ${this.value}")
                .id("value_text")
            Text("Status: ${this.status}")
                .id("status_text")

            Button("Add 10")
                .id("add_10_button")
                .onClick({ e =>
                    this.value = this.value + 10
                    this.status = "Added 10"
                })

            Button("Multiply by 2")
                .id("multiply_button")
                .onClick({ e =>
                    this.value = this.value * 2
                    this.status = "Multiplied by 2"
                })

            Button("Set to 100")
                .id("set_100_button")
                .onClick({ e =>
                    this.value = 100
                    this.status = "Set to 100"
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

