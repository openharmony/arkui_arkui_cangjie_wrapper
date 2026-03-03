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
 * TC_118: @State + @Builder Combination
 * Test Scenario: @Builder function uses @State variable
 * Expected Result: Builder automatically rebuilds when state changes
 */

@Entry
@Component
class ViewMultiTC118 {
    @State var builderValue: Int64 = 0
    @State var builderText: String = "Initial"

    @Builder
    func stateBuilder(): Unit {
        Column() {
            Text("Builder Value: ${this.builderValue}")
                .fontSize(16)
                .id("builder_value_display")
            
            Text("Builder Text: ${this.builderText}")
                .fontSize(16)
                .id("builder_text_display")
        }
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }

    func build(): Unit {
        Column() {
            Text("TC_118: @State + @Builder Combination")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            this.stateBuilder()

            Button("Update Builder Value")
                .id("update_value_button")
                .onClick({ e => this.builderValue = this.builderValue + 1 })

            Button("Update Builder Text")
                .id("update_text_button")
                .onClick({ e => this.builderText = "Updated Text" })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

