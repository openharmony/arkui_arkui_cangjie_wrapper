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
 * TC_093: @State Variable Used in Text Component
 * Test Scenario: Use @State variable as Text component's text content
 * Expected Result: Text correctly displays, automatically updates when state changes
 */

@Entry
@Component
class ViewComponentTC093 {
    @State var textValue: String = "Initial Text"
    @State var numberValue: Int64 = 42

    func build(): Unit {
        Column() {
            Text("TC_093: @State Variable Used in Text Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Text Value: ${this.textValue}")
                .fontSize(16)
                .id("text_value_display")

            Text("Number Value: ${this.numberValue}")
                .fontSize(16)
                .id("number_value_display")

            Text("Combined: ${this.textValue} - ${this.numberValue}")
                .fontSize(16)
                .id("combined_display")

            Button("Update Text")
                .id("update_text_button")
                .onClick({ e => this.textValue = "Updated Text" })

            Button("Update Number")
                .id("update_number_button")
                .onClick({ e => this.numberValue = this.numberValue + 1 })

            Button("Update Both")
                .id("update_both_button")
                .onClick({ e => 
                    this.textValue = "New Text"
                    this.numberValue = 100
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

