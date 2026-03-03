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
 * TC_029: @Link Modification Triggers Child Component Update
 * Test Scenario: Parent component modifies @Link variable
 * Expected Result: Child component UI automatically updates
 */
@Component
class LinkChildComponentTC029 {
    @Link var linkedScore: Int64
    @Link var linkedStatus: String
    @Link var linkedEnabled: Bool

    func build(): Unit {
        Column() {
            Text("Child Component (Observes Changes)")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Child Score: ${this.linkedScore}")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .id("child_score_text")
            
            Text("Child Status: ${this.linkedStatus}")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .id("child_status_text")
            
            Text("Child Enabled: ${this.linkedEnabled}")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .id("child_enabled_text")
            
            Text("Note: Parent modifications will update this component")
                .fontSize(12)
                .fontColor(0x666666)
                .margin(top: 10)
                .id("child_note_text")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC029 {
    @State var parentScore: Int64 = 0
    @State var parentStatus: String = "Ready"
    @State var parentEnabled: Bool = true

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_029: @Link Modification Triggers Child Update")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component (Can Modify)")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Button("Parent: Set Score to 50")
                    .id("parent_set_score_50_button")
                    .onClick({ e => this.parentScore = 50 })
                
                Button("Parent: Set Score to 100")
                    .id("parent_set_score_100_button")
                    .onClick({ e => this.parentScore = 100 })
                
                Button("Parent: Set Status to 'Running'")
                    .id("parent_set_status_running_button")
                    .onClick({ e => this.parentStatus = "Running" })
                
                Button("Parent: Set Status to 'Completed'")
                    .id("parent_set_status_completed_button")
                    .onClick({ e => this.parentStatus = "Completed" })
                
                Button("Parent: Toggle Enabled")
                    .id("parent_toggle_enabled_button")
                    .onClick({ e => this.parentEnabled = !this.parentEnabled })
                
                Button("Parent: Reset All")
                    .id("parent_reset_all_button")
                    .onClick({ e =>
                        this.parentScore = 0
                        this.parentStatus = "Ready"
                        this.parentEnabled = true
                    })

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC029(
                        linkedScore: this.parentScore,
                        linkedStatus: this.parentStatus,
                        linkedEnabled: this.parentEnabled
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

