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
 * TC_021: @Prop Variable Used in Child Component build() Method
 * Test Scenario: Use @Prop variable in child component build() method
 * Expected Result: Variable value is correctly displayed in UI
 */
@Component
class ChildComponentTC021 {
    @Prop var title: String
    @Prop var value: Int64

    func build(): Unit {
        Column() {
            Text("Child Component - ${this.title}")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            Text("Value from Parent: ${this.value}")
                .fontSize(16)
                .id("child_value_text")
            Text("Double Value: ${this.value * 2}")
                .fontSize(16)
                .id("child_double_text")
            Text("Value + 10: ${this.value + 10}")
                .fontSize(16)
                .id("child_plus_text")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC021 {
    @State var parentTitle: String = "Test Title"
    @State var parentValue: Int64 = 5

    func build(): Unit {
        Column() {
            Text("TC_021: @Prop Variable Used in Child Component build() Method")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Change Title")
                .id("change_title_button")
                .onClick({ e => this.parentTitle = "New Title ${this.parentValue}" })

            Button("Increment Value")
                .id("increment_value_button")
                .onClick({ e => this.parentValue = this.parentValue + 1 })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC021(
                    title: this.parentTitle,
                    value: this.parentValue
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

