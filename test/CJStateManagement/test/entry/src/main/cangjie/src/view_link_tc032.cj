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
 * TC_032: Multi-level Component @Link Passing
 * Test Scenario: @Link is passed through multiple component levels
 * Expected Result: State is correctly synchronized across all levels
 */
@Component
class LinkGrandChildComponentTC032 {
    @Link var linkedValue: Int64
    @Link var linkedMessage: String

    func build(): Unit {
        Column() {
            Text("Grand Child Component (Level 3)")
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .id("grandchild_title")
            
            Text("Linked Value: ${this.linkedValue}")
                .fontSize(14)
                .id("grandchild_value_text")
            
            Text("Linked Message: ${this.linkedMessage}")
                .fontSize(14)
                .id("grandchild_message_text")
            
            Button("Grand Child: Set Value to 300")
                .id("grandchild_set_value_button")
                .onClick({ e => this.linkedValue = 300 })
            
            Button("Grand Child: Set Message")
                .id("grandchild_set_message_button")
                .onClick({ e => this.linkedMessage = "Grand Child Modified" })
        }
        .padding(10)
        .backgroundColor(0xD0D0D0)
        .margin(top: 5)
    }
}

@Component
class LinkChildComponentTC032 {
    @Link var linkedValue: Int64
    @Link var linkedMessage: String

    func build(): Unit {
        Column() {
            Text("Child Component (Level 2)")
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Linked Value: ${this.linkedValue}")
                .fontSize(14)
                .id("child_value_text")
            
            Text("Linked Message: ${this.linkedMessage}")
                .fontSize(14)
                .id("child_message_text")
            
            Button("Child: Set Value to 200")
                .id("child_set_value_button")
                .onClick({ e => this.linkedValue = 200 })
            
            Button("Child: Set Message")
                .id("child_set_message_button")
                .onClick({ e => this.linkedMessage = "Child Modified" })
            
            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                LinkGrandChildComponentTC032(
                    linkedValue: this.linkedValue,
                    linkedMessage: this.linkedMessage
                )
            }
            .id("grandchild_component")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC032 {
    @State var parentValue: Int64 = 100
    @State var parentMessage: String = "Initial Message"

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_032: Multi-level Component @Link Passing")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component (Level 1)")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Text("Parent Value: ${this.parentValue}")
                    .fontSize(16)
                    .id("parent_value_text")
                
                Text("Parent Message: ${this.parentMessage}")
                    .fontSize(16)
                    .id("parent_message_text")
                
                Button("Parent: Set Value to 150")
                    .id("parent_set_value_button")
                    .onClick({ e => this.parentValue = 150 })
                
                Button("Parent: Set Message")
                    .id("parent_set_message_button")
                    .onClick({ e => this.parentMessage = "Parent Modified" })
                
                Button("Parent: Reset All")
                    .id("parent_reset_all_button")
                    .onClick({ e =>
                        this.parentValue = 100
                        this.parentMessage = "Initial Message"
                    })

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC032(
                        linkedValue: this.parentValue,
                        linkedMessage: this.parentMessage
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

