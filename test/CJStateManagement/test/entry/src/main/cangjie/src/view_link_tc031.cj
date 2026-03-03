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
import std.collection.*

/**
 * TC_031: @Link and @State Combined Usage
 * Test Scenario: Component uses both @State and @Link simultaneously
 * Expected Result: Both state variables work correctly
 */
@Component
class LinkChildComponentTC031 {
    @Link var linkedCount: Int64
    @State var localCount: Int64 = 0

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Linked Count (from parent): ${this.linkedCount}")
                .fontSize(16)
                .id("child_linked_count_text")
            
            Button("Child: Increment Linked Count")
                .id("child_increment_linked_button")
                .onClick({ e => this.linkedCount = this.linkedCount + 1 })
            
            Text("Local Count (child's own): ${this.localCount}")
                .fontSize(16)
                .id("child_local_count_text")
            
            Button("Child: Increment Local Count")
                .id("child_increment_local_button")
                .onClick({ e => this.localCount = this.localCount + 1 })
            
            Text("Total: ${this.linkedCount + this.localCount}")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .id("child_total_text")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC031 {
    @State var parentCount: Int64 = 10
    @State var parentLocal: Int64 = 5

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_031: @Link and @State Combined Usage")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Text("Parent Count (shared with child): ${this.parentCount}")
                    .fontSize(16)
                    .id("parent_count_text")
                
                Button("Parent: Increment Shared Count")
                    .id("parent_increment_shared_button")
                    .onClick({ e => this.parentCount = this.parentCount + 1 })
                
                Text("Parent Local (parent's own): ${this.parentLocal}")
                    .fontSize(16)
                    .id("parent_local_text")
                
                Button("Parent: Increment Local")
                    .id("parent_increment_local_button")
                    .onClick({ e => this.parentLocal = this.parentLocal + 1 })
                
                Button("Parent: Reset All")
                    .id("parent_reset_all_button")
                    .onClick({ e =>
                        this.parentCount = 10
                        this.parentLocal = 5
                    })

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC031(linkedCount: this.parentCount)
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

