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
 * TC_028: @Link Modification Triggers Parent Component Update
 * Test Scenario: Child component modifies @Link variable
 * Expected Result: Parent component UI automatically updates
 */
@Component
class LinkChildComponentTC028 {
    @Link var linkedCount: Int64
    @Link var linkedMessage: String

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Child can modify linked values")
                .fontSize(14)
                .id("child_info_text")
            
            Button("Child: Set Count to 100")
                .id("child_set_count_button")
                .onClick({ e => this.linkedCount = 100 })
            
            Button("Child: Set Count to 200")
                .id("child_set_count_200_button")
                .onClick({ e => this.linkedCount = 200 })
            
            Button("Child: Set Message to 'Child Changed'")
                .id("child_set_message_button")
                .onClick({ e => this.linkedMessage = "Child Changed" })
            
            Button("Child: Set Message to 'Child Updated'")
                .id("child_set_message_updated_button")
                .onClick({ e => this.linkedMessage = "Child Updated" })
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC028 {
    @State var parentCount: Int64 = 0
    @State var parentMessage: String = "Initial Message"

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_028: @Link Modification Triggers Parent Update")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component (Observes Changes)")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Text("Parent Count: ${this.parentCount}")
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .id("parent_count_text")
                
                Text("Parent Message: ${this.parentMessage}")
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .id("parent_message_text")
                
                Text("Note: Modify values in child component to see parent update")
                    .fontSize(12)
                    .fontColor(0x666666)
                    .margin(top: 10)
                    .id("parent_note_text")
                
                Button("Parent: Reset Values")
                    .id("parent_reset_button")
                    .onClick({ e =>
                        this.parentCount = 0
                        this.parentMessage = "Initial Message"
                    })

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC028(
                        linkedCount: this.parentCount,
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

