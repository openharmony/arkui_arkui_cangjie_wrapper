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
 * TC_008: @State Variable Used in Event Handling
 * Test Scenario: Use @State variables in onClick and other event handling functions
 * Expected Result: Event handlers can correctly access state variables
 */
@Entry
@Component
class ViewStateTC008 {
    @State var clickCount: Int64 = 0
    @State var lastAction: String = "None"

    func build(): Unit {
        Column() {
            Text("TC_008: @State Variable Used in Event Handling")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Click Count: ${this.clickCount}")
                .id("click_count_text")
            Text("Last Action: ${this.lastAction}")
                .id("last_action_text")

            Button("Increment Count")
                .id("increment_button")
                .onClick({ e =>
                    this.clickCount = this.clickCount + 1
                    this.lastAction = "Increment"
                })

            Button("Decrement Count")
                .id("decrement_button")
                .onClick({ e =>
                    this.clickCount = this.clickCount - 1
                    this.lastAction = "Decrement"
                })

            Button("Reset Count")
                .id("reset_button")
                .onClick({ e =>
                    this.clickCount = 0
                    this.lastAction = "Reset"
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

