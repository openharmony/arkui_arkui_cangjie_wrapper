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
 * TC_142: @State Cannot Be Used in @Entry
 * Test Scenario: Attempt to use @State in @Entry component
 * Expected Result: Compile-time error, @State is not allowed in @Entry
 * 
 * NOTE: This test case is for compile-time error verification.
 * It cannot be implemented as a UI test case because it should fail at compile time.
 * This file serves as a placeholder to document the test requirement.
 */

// This test case should cause a compile error if @State is used in @Entry
// Example of what should NOT compile:
// @Entry
// @Component
// class ViewStateTC142 {
//     @State var testValue: Int64 = 0  // This should cause compile error
//     ...
// }

@Entry
@Component
class ViewBoundaryTC142 {
    // @State cannot be used in @Entry - this is a compile-time constraint
    // This test case verifies that the compiler correctly rejects @State in @Entry
    
    func build(): Unit {
        Column() {
            Text("TC_142: @State Cannot Be Used in @Entry")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("This test case verifies compile-time error.")
                .fontSize(16)
                .id("compile_error_note")
            
            Text("@State should not be allowed in @Entry components.")
                .fontSize(14)
                .id("error_description")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

