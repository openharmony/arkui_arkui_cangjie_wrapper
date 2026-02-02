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
 * TC_001: @State Variable Initialization (Primitive Types)
 * Test Scenario: Declare @State variables with Int64, String, Bool, Float64, Char primitive types
 * Expected Result: Variables are correctly initialized, UI can correctly display initial values
 */
@Entry
@Component
class ViewStateTC001 {
    @State var intValue: Int64 = 10
    @State var stringValue: String = "Hello Cangjie"
    @State var boolValue: Bool = true
    @State var floatValue: Float64 = 123.45
    // @State var charValue: Rune = 'A'

    func build(): Unit {
        Column() {
            Text("TC_001: @State Variable Initialization (Primitive Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Int64: ${this.intValue}")
                .id("int_value_text")
            Button("Change Int64")
                .id("change_int_button")
                .onClick({ e => this.intValue = 20 })

            Text("String: ${this.stringValue}")
                .id("string_value_text")
            Button("Change String")
                .id("change_string_button")
                .onClick({ e => this.stringValue = "World Cangjie" })

            Text("Bool: ${this.boolValue}")
                .id("bool_value_text")
            Button("Toggle Bool")
                .id("toggle_bool_button")
                .onClick({ e => this.boolValue = !this.boolValue })

            Text("Float64: ${this.floatValue}")
                .id("float_value_text")
            Button("Change Float64")
                .id("change_float_button")
                .onClick({ e => this.floatValue = 543.21 })

            // Text("Char: ${this.charValue}")
            //    .id("char_value_text")
            // Button("Change Char")
            //     .id("change_char_button")
            //     .onClick({ e => this.charValue = 'B' })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

