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
 * TC_127: Parent-Child Component Type Compatibility (@Prop)
 * Test Scenario: Test @Prop type compatibility
 * Expected Result: Type compatible works correctly, incompatible reports error
 */

@Component
class PropChildTC127 {
    @Prop var propValue: Int64

    func build(): Unit {
        Column() {
            Text("Prop Value: ${this.propValue}")
                .fontSize(16)
                .id("prop_display")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBoundaryTC127 {
    @State var intValue: Int64 = 10
    @State var stringValue: String = "10"

    func build(): Unit {
        Column() {
            Text("TC_127: Parent-Child Component Type Compatibility (@Prop)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Int Value: ${this.intValue}")
                .fontSize(16)
                .id("parent_int_display")

            Column() {
                PropChildTC127(propValue: this.intValue)
            }
            .id("prop_child")
            .margin(top: 10)

            Button("Update Int Value")
                .id("update_int_button")
                .onClick({ e => this.intValue = this.intValue + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

