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
 * TC_015: @Prop Receives Data from Parent Component (Primitive Types)
 * Test Scenario: Parent component passes Int64, String primitive types to child component
 * Expected Result: Child component correctly receives and displays data
 */
@Component
class ChildComponentTC015 {
    @Prop var intValue: Int64
    @Prop var stringValue: String
    @Prop var boolValue: Bool
    @Prop var floatValue: Float64

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            Text("Int64: ${this.intValue}")
                .id("child_int_text")
            Text("String: ${this.stringValue}")
                .id("child_string_text")
            Text("Bool: ${this.boolValue}")
                .id("child_bool_text")
            Text("Float64: ${this.floatValue}")
                .id("child_float_text")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC015 {
    @State var parentInt: Int64 = 10
    @State var parentString: String = "Hello"
    @State var parentBool: Bool = true
    @State var parentFloat: Float64 = 99.99

    func build(): Unit {
        Column() {
            Text("TC_015: @Prop Receives Data from Parent Component (Primitive Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("parent_title")
            Text("Int64: ${this.parentInt}")
                .id("parent_int_text")
            Text("String: ${this.parentString}")
                .id("parent_string_text")
            Text("Bool: ${this.parentBool}")
                .id("parent_bool_text")
            Text("Float64: ${this.parentFloat}")
                .id("parent_float_text")

            Button("Update Parent Values")
                .id("update_parent_button")
                .onClick({ e =>
                    this.parentInt = 20
                    this.parentString = "World"
                    this.parentBool = false
                    this.parentFloat = 199.99
                })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC015(
                    intValue: this.parentInt,
                    stringValue: this.parentString,
                    boolValue: this.parentBool,
                    floatValue: this.parentFloat
                )
            }
            .id("child_component")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

