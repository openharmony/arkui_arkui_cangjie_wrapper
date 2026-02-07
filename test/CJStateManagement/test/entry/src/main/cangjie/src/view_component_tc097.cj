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
 * TC_097: @State Variable Used in Stack
 * Test Scenario: Use @State variable to control Stack's child component display
 * Expected Result: Stack correctly displays, automatically updates when state changes
 */

@Entry
@Component
class ViewComponentTC097 {
    @State var showBackground: Bool = true
    @State var showForeground: Bool = true
    @State var zIndex: Int64 = 1

    func build(): Unit {
        Column() {
            Text("TC_097: @State Variable Used in Stack")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Z-Index: ${this.zIndex}")
                .fontSize(16)
                .id("zindex_display")

            Stack() {
                if (this.showBackground) {
                    Column() {
                        Text("Background Layer")
                            .fontSize(16)
                            .fontColor(0xFFFFFF)
                    }
                    .width(200)
                    .height(100)
                    .backgroundColor(0x4A90E2)
                    .id("background_layer")
                }

                if (this.showForeground) {
                    Column() {
                        Text("Foreground Layer")
                            .fontSize(16)
                            .fontColor(0x000000)
                    }
                    .width(150)
                    .height(80)
                    .backgroundColor(0xFFD700)
                    .id("foreground_layer")
                }
            }
            .width(100.percent)
            .height(150)
            .id("dynamic_stack")

            Button("Toggle Background")
                .id("toggle_background_button")
                .onClick({ e => this.showBackground = !this.showBackground })

            Button("Toggle Foreground")
                .id("toggle_foreground_button")
                .onClick({ e => this.showForeground = !this.showForeground })

            Button("Change Z-Index")
                .id("change_zindex_button")
                .onClick({ e => this.zIndex = this.zIndex + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

