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
import std.convert.*

/**
 * TC_014: @State Variable Type Conversion
 * Test Scenario: Test conversion between different types
 * Expected Result: Type conversion is correct, UI displays correctly
 */
@Entry
@Component
class ViewStateTC014 {
    @State var intValue: Int64 = 100
    @State var stringValue: String = "100"
    @State var floatValue: Float64 = 100.0

    func build(): Unit {
        Column() {
            Text("TC_014: @State Variable Type Conversion")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Int64 Value: ${this.intValue}")
                .id("int_value_text")
            Text("String Value: ${this.stringValue}")
                .id("string_value_text")
            Text("Float64 Value: ${this.floatValue}")
                .id("float_value_text")

            Text("Int64 to String: ${this.intValue.toString()}")
                .id("int_to_string_text")
            Text("String to Int64: ${Int64.parse(this.stringValue)}")
                .id("string_to_int_text")
            Text("Int64 to Float64: ${Float64(this.intValue)}")
                .id("int_to_float_text")

            Button("Increment Int64")
                .id("increment_int_button")
                .onClick({ e => this.intValue = this.intValue + 1 })

            Button("Update String")
                .id("update_string_button")
                .onClick({ e => this.stringValue = this.intValue.toString() })

            Button("Update Float64")
                .id("update_float_button")
                .onClick({ e => this.floatValue = Float64(this.intValue) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

