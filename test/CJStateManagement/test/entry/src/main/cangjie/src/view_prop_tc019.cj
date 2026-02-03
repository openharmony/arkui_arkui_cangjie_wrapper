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
 * TC_019: @Prop Unidirectional Data Flow Verification
 * Test Scenario: Child component modifies @Prop variable, verify parent component is not affected
 * Expected Result: Child component modification does not affect parent component state
 */
@Component
class ChildComponentTC019 {
    @Prop var propValue: Int64
    @State var localValue: Int64 = 0

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            Text("@Prop Value: ${this.propValue}")
                .id("child_prop_text")
            Text("Local Value: ${this.localValue}")
                .id("child_local_text")
            Button("Try to Modify @Prop (Should Not Affect Parent)")
                .id("modify_prop_button")
                .onClick({ e =>
                    // Note: In Cangjie, @Prop is read-only in child, so we can only modify local copy
                    this.localValue = this.propValue + 100
                })
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC019 {
    @State var parentValue: Int64 = 10

    func build(): Unit {
        Column() {
            Text("TC_019: @Prop Unidirectional Data Flow Verification")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Value: ${this.parentValue}")
                .id("parent_value_text")
            Button("Increment Parent Value")
                .id("increment_parent_button")
                .onClick({ e => this.parentValue = this.parentValue + 1 })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC019(propValue: this.parentValue)
            }
            .id("child_component")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

