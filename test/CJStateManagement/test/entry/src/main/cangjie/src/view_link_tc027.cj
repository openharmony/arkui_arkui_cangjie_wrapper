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
 * TC_027: @Link Two-way Binding (Custom Types)
 * Test Scenario: Parent and child components share @Observed class instance through @Link
 * Expected Result: Object property modifications are synchronized between parent and child components
 */

@Component
class LinkChildComponentTC027 {
    @Link var linkedModel: LinkCustomModel

    func build(): Unit {
        Column() {
            Text("Child Component (Can Modify Model)")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Model Name: ${this.linkedModel.name}")
                .id("child_model_name_text")
            Button("Child: Change Name")
                .id("child_change_name_button")
                .onClick({ e => this.linkedModel.name = "Child Modified Name" })
            
            Text("Model Value: ${this.linkedModel.value}")
                .id("child_model_value_text")
            Button("Child: Increment Value")
                .id("child_increment_value_button")
                .onClick({ e => this.linkedModel.value = this.linkedModel.value + 1 })
            
            Text("Model Active: ${this.linkedModel.active}")
                .id("child_model_active_text")
            Button("Child: Toggle Active")
                .id("child_toggle_active_button")
                .onClick({ e => this.linkedModel.active = !this.linkedModel.active })
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC027 {
    @State var parentModel: LinkCustomModel = LinkCustomModel(
        name: "Initial Model",
        value: 10,
        active: true
    )

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_027: @Link Two-way Binding (Custom Types)")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Text("Model Name: ${this.parentModel.name}")
                    .id("parent_model_name_text")
                Button("Parent: Change Name")
                    .id("parent_change_name_button")
                    .onClick({ e => this.parentModel.name = "Parent Modified Name" })
                
                Text("Model Value: ${this.parentModel.value}")
                    .id("parent_model_value_text")
                Button("Parent: Increment Value")
                    .id("parent_increment_value_button")
                    .onClick({ e => this.parentModel.value = this.parentModel.value + 1 })
                
                Text("Model Active: ${this.parentModel.active}")
                    .id("parent_model_active_text")
                Button("Parent: Toggle Active")
                    .id("parent_toggle_active_button")
                    .onClick({ e => this.parentModel.active = !this.parentModel.active })
                
                Button("Reset Model")
                    .id("reset_model_button")
                    .onClick({ e =>
                        this.parentModel.name = "Initial Model"
                        this.parentModel.value = 10
                        this.parentModel.active = true
                    })

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC027(linkedModel: this.parentModel)
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

