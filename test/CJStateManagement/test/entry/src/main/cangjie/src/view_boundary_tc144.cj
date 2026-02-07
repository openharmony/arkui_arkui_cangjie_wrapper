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
 * TC_144: @Prop Cannot Have Initial Value
 * Test Scenario: Attempt to provide initial value for @Prop variable
 * Expected Result: Compile-time error, @Prop cannot have initial value
 * 
 * NOTE: This test case is for compile-time error verification.
 * It cannot be implemented as a UI test case because it should fail at compile time.
 * This file serves as a placeholder to document the test requirement.
 */

// This test case should cause a compile error if @Prop has initial value
// Example of what should NOT compile:
// @Component
// class ChildComponent {
//     @Prop var propValue: Int64 = 0  // This should cause compile error
// }

@Component
class PropChildTC144 {
    @Prop var propValue: Int64  // Correct: no initial value

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
class ViewBoundaryTC144 {
    @State var parentValue: Int64 = 10

    func build(): Unit {
        Column() {
            Text("TC_144: @Prop Cannot Have Initial Value")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("This test case verifies compile-time constraint.")
                .fontSize(16)
                .id("compile_error_note")
            
            Text("@Prop should not have initial values.")
                .fontSize(14)
                .id("error_description")

            Column() {
                PropChildTC144(propValue: this.parentValue)
            }
            .id("prop_child")
            .margin(top: 10)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

