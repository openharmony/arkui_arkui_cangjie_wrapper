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
 * TC_124: State Variable is null/undefined Handling
 * Test Scenario: Test null/undefined value handling
 * Expected Result: UI correctly displays or handles empty values
 */

@Entry
@Component
class ViewBoundaryTC124 {
    @State var nullableString: Option<String> = Option<String>.None
    @State var nullableInt: Option<Int64> = Option<Int64>.None

    func build(): Unit {
        Column() {
            Text("TC_124: State Variable is null/undefined Handling")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            if (this.nullableString.isNone()) {
                Text("String is null")
                    .fontSize(16)
                    .fontColor(0xFF0000)
                    .id("string_null_display")
            } else {
                Text("String Value: ${this.nullableString.getOrThrow()}")
                    .fontSize(16)
                    .id("string_value_display")
            }

            if (this.nullableInt.isNone()) {
                Text("Int is null")
                    .fontSize(16)
                    .fontColor(0xFF0000)
                    .id("int_null_display")
            } else {
                Text("Int Value: ${this.nullableInt.getOrThrow()}")
                    .fontSize(16)
                    .id("int_value_display")
            }

            Button("Set String")
                .id("set_string_button")
                .onClick({ e => this.nullableString = Some("Not null") })

            Button("Set Int")
                .id("set_int_button")
                .onClick({ e => this.nullableInt = Some(42) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

