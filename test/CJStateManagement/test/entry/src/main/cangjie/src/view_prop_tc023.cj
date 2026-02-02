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
 * TC_023: Multiple @Prop Variables Used Simultaneously
 * Test Scenario: Child component receives multiple @Prop variables simultaneously
 * Expected Result: All @Prop variables work correctly
 */
@Component
class ChildComponentTC023 {
    @Prop var prop1: Int64
    @Prop var prop2: String
    @Prop var prop3: Bool
    @Prop var prop4: Float64

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            Text("@Prop1 (Int64): ${this.prop1}")
                .id("child_prop1_text")
            Text("@Prop2 (String): ${this.prop2}")
                .id("child_prop2_text")
            Text("@Prop3 (Bool): ${this.prop3}")
                .id("child_prop3_text")
            Text("@Prop4 (Float64): ${this.prop4}")
                .id("child_prop4_text")
            Text("Combined: ${this.prop2} - ${this.prop1} - ${this.prop3} - ${this.prop4}")
                .fontSize(14)
                .id("child_combined_text")
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC023 {
    @State var parentProp1: Int64 = 10
    @State var parentProp2: String = "Hello"
    @State var parentProp3: Bool = true
    @State var parentProp4: Float64 = 99.99

    func build(): Unit {
        Column() {
            Text("TC_023: Multiple @Prop Variables Used Simultaneously")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Update All Props")
                .id("update_all_button")
                .onClick({ e =>
                    this.parentProp1 = 20
                    this.parentProp2 = "World"
                    this.parentProp3 = false
                    this.parentProp4 = 199.99
                })

            Button("Increment Prop1")
                .id("increment_prop1_button")
                .onClick({ e => this.parentProp1 = this.parentProp1 + 1 })

            Button("Toggle Prop3")
                .id("toggle_prop3_button")
                .onClick({ e => this.parentProp3 = !this.parentProp3 })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC023(
                    prop1: this.parentProp1,
                    prop2: this.parentProp2,
                    prop3: this.parentProp3,
                    prop4: this.parentProp4
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

