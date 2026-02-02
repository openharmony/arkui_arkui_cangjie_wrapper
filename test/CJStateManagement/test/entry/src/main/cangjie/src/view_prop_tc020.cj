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
 * TC_020: @Prop Data Update Triggers Child Component Rebuild
 * Test Scenario: Parent component modifies @Prop data passed to child component
 * Expected Result: Child component UI automatically updates
 */
@Component
class ChildComponentTC020 {
    @Prop var message: String
    @Prop var count: Int64

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            Text("Message: ${this.message}")
                .id("child_message_text")
            Text("Count: ${this.count}")
                .id("child_count_text")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC020 {
    @State var parentMessage: String = "Initial Message"
    @State var parentCount: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_020: @Prop Data Update Triggers Child Component Rebuild")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Message: ${this.parentMessage}")
                .id("parent_message_text")
            Text("Parent Count: ${this.parentCount}")
                .id("parent_count_text")

            Button("Update Message")
                .id("update_message_button")
                .onClick({ e => this.parentMessage = "Updated Message ${this.parentCount}" })

            Button("Increment Count")
                .id("increment_count_button")
                .onClick({ e => this.parentCount = this.parentCount + 1 })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC020(
                    message: this.parentMessage,
                    count: this.parentCount
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

