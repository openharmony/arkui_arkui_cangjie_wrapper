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
 * TC_022: @Prop Variable Used in Child Component Conditional Rendering
 * Test Scenario: Use @Prop variable to control child component conditional rendering
 * Expected Result: Conditional rendering correctly displays based on @Prop variable
 */
@Component
class ChildComponentTC022 {
    @Prop var isVisible: Bool
    @Prop var number: Int64

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            if (this.isVisible) {
                Text("This text is visible. Number: ${this.number}")
                    .fontSize(16)
                    .fontColor(Color.Green)
                    .id("visible_text")
            } else {
                Text("This text is hidden. Number: ${this.number}")
                    .fontSize(16)
                    .fontColor(Color.Gray)
                    .id("hidden_text")
            }

            if (this.number > 10) {
                Text("Number is greater than 10")
                    .fontSize(16)
                    .fontColor(Color.Blue)
                    .id("greater_text")
            } else if (this.number < 0) {
                Text("Number is negative")
                    .fontSize(16)
                    .fontColor(Color.Red)
                    .id("negative_text")
            } else {
                Text("Number is between 0 and 10")
                    .fontSize(16)
                    .id("range_text")
            }
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC022 {
    @State var parentVisible: Bool = true
    @State var parentNumber: Int64 = 5

    func build(): Unit {
        Column() {
            Text("TC_022: @Prop Variable Used in Child Component Conditional Rendering")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Toggle Visibility")
                .id("toggle_visibility_button")
                .onClick({ e => this.parentVisible = !this.parentVisible })

            Button("Increment Number")
                .id("increment_number_button")
                .onClick({ e => this.parentNumber = this.parentNumber + 1 })

            Button("Decrement Number")
                .id("decrement_number_button")
                .onClick({ e => this.parentNumber = this.parentNumber - 1 })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC022(
                    isVisible: this.parentVisible,
                    number: this.parentNumber
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

