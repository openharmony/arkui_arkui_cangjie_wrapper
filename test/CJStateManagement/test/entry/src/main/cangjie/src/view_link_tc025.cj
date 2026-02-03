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
 * TC_025: @Link Two-way Binding (Primitive Types)
 * Test Scenario: Parent and child components share state through @Link
 * Expected Result: When either side modifies state, the other side automatically updates
 */
@Component
class LinkChildComponentTC025 {
    @Link var linkedInt: Int64
    @Link var linkedString: String
    @Link var linkedBool: Bool
    @Link var linkedFloat: Float64

    func build(): Unit {
        Column() {
            Text("Child Component (Can Modify)")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Linked Int64: ${this.linkedInt}")
                .id("child_int_text")
            Button("Child: Increment Int64")
                .id("child_increment_int_button")
                .onClick({ e => this.linkedInt = this.linkedInt + 1 })
            
            Text("Linked String: ${this.linkedString}")
                .id("child_string_text")
            Button("Child: Change String")
                .id("child_change_string_button")
                .onClick({ e => this.linkedString = "Child Modified" })
            
            Text("Linked Bool: ${this.linkedBool}")
                .id("child_bool_text")
            Button("Child: Toggle Bool")
                .id("child_toggle_bool_button")
                .onClick({ e => this.linkedBool = !this.linkedBool })
            
            Text("Linked Float64: ${this.linkedFloat}")
                .id("child_float_text")
            Button("Child: Multiply Float64")
                .id("child_multiply_float_button")
                .onClick({ e => this.linkedFloat = this.linkedFloat * 2.0 })
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC025 {
    @State var parentInt: Int64 = 10
    @State var parentString: String = "Initial"
    @State var parentBool: Bool = true
    @State var parentFloat: Float64 = 5.5

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_025: @Link Two-way Binding (Primitive Types)")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Text("Parent Int64: ${this.parentInt}")
                    .id("parent_int_text")
                Button("Parent: Increment Int64")
                    .id("parent_increment_int_button")
                    .onClick({ e => this.parentInt = this.parentInt + 1 })
                
                Text("Parent String: ${this.parentString}")
                    .id("parent_string_text")
                Button("Parent: Change String")
                    .id("parent_change_string_button")
                    .onClick({ e => this.parentString = "Parent Modified" })
                
                Text("Parent Bool: ${this.parentBool}")
                    .id("parent_bool_text")
                Button("Parent: Toggle Bool")
                    .id("parent_toggle_bool_button")
                    .onClick({ e => this.parentBool = !this.parentBool })
                
                Text("Parent Float64: ${this.parentFloat}")
                    .id("parent_float_text")
                Button("Parent: Multiply Float64")
                    .id("parent_multiply_float_button")
                    .onClick({ e => this.parentFloat = this.parentFloat * 2.0 })
                
                Button("Reset All Values")
                    .id("reset_all_button")
                    .onClick({ e =>
                        this.parentInt = 10
                        this.parentString = "Initial"
                        this.parentBool = true
                        this.parentFloat = 5.5
                    })

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC025(
                        linkedInt: this.parentInt,
                        linkedString: this.parentString,
                        linkedBool: this.parentBool,
                        linkedFloat: this.parentFloat
                    )
                }
                .id("child_component")
            }
            .width(100.percent)
            .padding(10)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF1F3F5)
    }
}

