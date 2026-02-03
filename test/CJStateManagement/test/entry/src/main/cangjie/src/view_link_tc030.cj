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
 * TC_030: @Link Variable Used in Child Component
 * Test Scenario: Use @Link variable in child component build() method
 * Expected Result: Variable value displays correctly, and updates synchronously after modification
 */
@Component
class LinkChildComponentTC030 {
    @Link var linkedValue: Int64
    @Link var linkedText: String

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            // Use @Link variable in Text display
            Text("Linked Value: ${this.linkedValue}")
                .fontSize(16)
                .id("child_value_text")
            
            Text("Linked Text: ${this.linkedText}")
                .fontSize(16)
                .id("child_text_display")
            
            // Use @Link variable in conditional rendering
            if (this.linkedValue > 50) {
                Text("Value is greater than 50")
                    .fontColor(0xFF0000)
                    .fontSize(14)
                    .id("child_condition_text")
            }
            
            // Use @Link variable in Button text
            Button("Current Value: ${this.linkedValue}")
                .id("child_value_button")
                .onClick({ e => this.linkedValue = this.linkedValue + 10 })
            
            // Use @Link variable in multiple places
            Text("Double Value: ${this.linkedValue * 2}")
                .fontSize(14)
                .id("child_double_value_text")
            
            Text("Text Length: ${this.linkedText.size}")
                .fontSize(14)
                .id("child_text_length_text")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC030 {
    @State var parentValue: Int64 = 25
    @State var parentText: String = "Hello Link"

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_030: @Link Variable Used in Child Component")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Button("Parent: Increment Value")
                    .id("parent_increment_button")
                    .onClick({ e => this.parentValue = this.parentValue + 5 })
                
                Button("Parent: Change Text")
                    .id("parent_change_text_button")
                    .onClick({ e => this.parentText = "Updated Text" })
                
                Button("Parent: Reset")
                    .id("parent_reset_button")
                    .onClick({ e =>
                        this.parentValue = 25
                        this.parentText = "Hello Link"
                    })

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC030(
                        linkedValue: this.parentValue,
                        linkedText: this.parentText
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

