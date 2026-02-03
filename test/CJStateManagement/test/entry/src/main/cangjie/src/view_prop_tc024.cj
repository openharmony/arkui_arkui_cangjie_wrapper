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
 * TC_024: @Prop Combined with @State
 * Test Scenario: Component uses both @State and @Prop simultaneously
 * Expected Result: Both state variables work correctly without interference
 */
@Component
class ChildComponentTC024 {
    @Prop var propValue: String
    @State var localState: Int64 = 0

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            Text("@Prop from Parent: ${this.propValue}")
                .id("child_prop_text")
            Text("@State Local: ${this.localState}")
                .id("child_state_text")
            Button("Increment Local State")
                .id("increment_local_button")
                .onClick({ e => this.localState = this.localState + 1 })
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC024 {
    @State var parentState: Int64 = 0
    @State var parentPropValue: String = "Initial Prop Value"

    func build(): Unit {
        Column() {
            Text("TC_024: @Prop Combined with @State")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent @State: ${this.parentState}")
                .id("parent_state_text")
            Text("Parent Prop Value: ${this.parentPropValue}")
                .id("parent_prop_text")

            Button("Increment Parent State")
                .id("increment_parent_state_button")
                .onClick({ e => this.parentState = this.parentState + 1 })

            Button("Update Prop Value")
                .id("update_prop_button")
                .onClick({ e => this.parentPropValue = "Updated Prop Value ${this.parentState}" })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC024(propValue: this.parentPropValue)
            }
            .id("child_component")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

