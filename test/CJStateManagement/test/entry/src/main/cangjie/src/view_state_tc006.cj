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
 * TC_006: @State Variable Used in Conditional Rendering
 * Test Scenario: Use @State variable to control If conditional rendering
 * Expected Result: Conditional rendering correctly displays/hides based on state variable
 */
@Entry
@Component
class ViewStateTC006 {
    @State var isVisible: Bool = true
    @State var currentNumber: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_006: @State Variable Used in Conditional Rendering")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Toggle Visibility")
                .id("toggle_visibility_button")
                .onClick({ e => this.isVisible = !this.isVisible })

            Button("Increment Number")
                .id("increment_number_button")
                .onClick({ e => this.currentNumber = this.currentNumber + 1 })

            if (this.isVisible) {
                Text("This text is visible. Number: ${this.currentNumber}")
                    .id("visible_text")
                    .fontSize(18)
                    .fontColor(Color.Green)
            } else if (this.currentNumber % 2 == 0) {
                Text("Visibility is OFF, and number is even.")
                    .id("even_number_text")
                    .fontSize(18)
            } else {
                Text("Visibility is OFF, and number is odd.")
                    .id("odd_number_text")
                    .fontSize(18)
                    .fontColor(Color.Red)
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

