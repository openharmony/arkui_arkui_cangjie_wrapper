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
 * TC_009: Direct Assignment to Update @State Variable
 * Test Scenario: Modify @State variable value through direct assignment
 * Expected Result: UI automatically updates to display new value
 */
@Entry
@Component
class ViewStateTC009 {
    @State var counter: Int64 = 0
    @State var message: String = "Initial Message"

    func build(): Unit {
        Column() {
            Text("TC_009: Direct Assignment to Update @State Variable")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Counter: ${this.counter}")
                .id("counter_text")
            Button("Increment Counter")
                .id("increment_button")
                .onClick({ e => this.counter = this.counter + 1 })

            Text("Message: ${this.message}")
                .id("message_text")
            Button("Update Message")
                .id("update_message_button")
                .onClick({ e => this.message = "Message changed to ${this.counter}" })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

