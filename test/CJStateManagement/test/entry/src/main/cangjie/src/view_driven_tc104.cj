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
 * TC_104: onInput Event Drives @State Update
 * Test Scenario: Modify @State variable in TextInput's onInput event
 * Expected Result: During input, state updates and UI automatically refreshes
 */

@Entry
@Component
class ViewDrivenTC104 {
    @State var inputValue: String = ""
    @State var inputLength: Int64 = 0
    @State var uppercaseValue: String = ""

    func build(): Unit {
        Column() {
            Text("TC_104: onInput Event Drives @State Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Input Value: ${this.inputValue}")
                .fontSize(16)
                .id("input_value_display")

            Text("Input Length: ${this.inputLength}")
                .fontSize(16)
                .id("input_length_display")

            Text("Uppercase: ${this.uppercaseValue}")
                .fontSize(16)
                .id("uppercase_display")
            Button("Clear")
                .id("clear_button")
                .onClick({ e => 
                    this.inputValue = ""
                    this.inputLength = 0
                    this.uppercaseValue = ""
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

