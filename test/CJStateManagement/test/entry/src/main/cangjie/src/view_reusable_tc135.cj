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
 * TC_135: @Reusable Component with State Variables
 * Test Scenario: @Reusable component uses @State, @Prop and other state variables
 * Expected Result: State variables work correctly, component is reusable
 */

@Reusable
@Component
class ReusableWithStateTC135 {
    @Prop var propValue: Int64
    @Prop var componentId: String
    @State var localState: Int64 = 0

    func build(): Unit {
        Column() {
            Text("Prop: ${this.propValue}, Local: ${this.localState}")
                .fontSize(16)
                .id("reusable_display_${this.componentId}")
            
            Button("Update Local")
                .id("update_local_button_${this.componentId}")
                .onClick({ e => this.localState = this.localState + 1 })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewReusableTC135 {
    @State var parentValue: Int64 = 10

    func build(): Unit {
        Column() {
            Text("TC_135: @Reusable Component with State Variables")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Value: ${this.parentValue}")
                .fontSize(16)
                .id("parent_value_display")

            Column() {
                ReusableWithStateTC135(propValue: this.parentValue, componentId: "1")
            }
            .id("reusable_component1")
            .margin(top: 10)

            Column() {
                ReusableWithStateTC135(propValue: this.parentValue, componentId: "2")
            }
            .id("reusable_component2")
            .margin(top: 10)

            Button("Update Parent")
                .id("update_parent_button")
                .onClick({ e => this.parentValue = this.parentValue + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

