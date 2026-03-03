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
 * TC_099: @State Variable Controls If Conditional Rendering
 * Test Scenario: Use @State Bool variable to control If conditional rendering
 * Expected Result: Conditional rendering correctly displays/hides based on state
 */

@Entry
@Component
class ViewComponentTC099 {
    @State var showContent: Bool = true
    @State var showAlternative: Bool = false

    func build(): Unit {
        Column() {
            Text("TC_099: @State Variable Controls If Conditional Rendering")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("showContent: ${this.showContent}")
                .fontSize(14)
                .id("show_content_status")

            if (this.showContent) {
                Text("Main Content is Visible")
                    .fontSize(16)
                    .padding(10)
                    .backgroundColor(0xE8F4F8)
                    .id("main_content")
            }

            if (!this.showContent) {
                Text("Alternative Content is Visible")
                    .fontSize(16)
                    .padding(10)
                    .backgroundColor(0xFFE8E8)
                    .id("alternative_content")
            }

            Button("Toggle Content")
                .id("toggle_content_button")
                .onClick({ e => this.showContent = !this.showContent })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

