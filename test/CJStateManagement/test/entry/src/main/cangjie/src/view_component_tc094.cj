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
 * TC_094: @State Variable Used in Button Component
 * Test Scenario: Use @State variable as Button's text or control Button's display
 * Expected Result: Button correctly displays, automatically updates when state changes
 */

@Entry
@Component
class ViewComponentTC094 {
    @State var buttonText: String = "Click Me"
    @State var clickCount: Int64 = 0
    @State var isEnabled: Bool = true

    func build(): Unit {
        Column() {
            Text("TC_094: @State Variable Used in Button Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Click Count: ${this.clickCount}")
                .fontSize(16)
                .id("click_count_display")

            Button("${this.buttonText} (${this.clickCount})")
                .id("dynamic_button")
                .enabled(this.isEnabled)
                .onClick({ e => this.clickCount = this.clickCount + 1 })

            Button("Update Button Text")
                .id("update_text_button")
                .onClick({ e => this.buttonText = "New Text" })

            Button("Toggle Enabled")
                .id("toggle_enabled_button")
                .onClick({ e => this.isEnabled = !this.isEnabled })

            Text("Button Enabled: ${this.isEnabled}")
                .fontSize(14)
                .id("enabled_status_display")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

