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
 * TC_100: @State Variable Controls Multiple If Conditional Rendering
 * Test Scenario: Use multiple @State variables to control multiple If conditional rendering
 * Expected Result: All conditional rendering work correctly
 */

@Entry
@Component
class ViewComponentTC100 {
    @State var showItem1: Bool = true
    @State var showItem2: Bool = true
    @State var showItem3: Bool = false

    func build(): Unit {
        Column() {
            Text("TC_100: @State Variable Controls Multiple If Conditional Rendering")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Item1: ${this.showItem1}, Item2: ${this.showItem2}, Item3: ${this.showItem3}")
                .fontSize(14)
                .id("items_status")

            if (this.showItem1) {
                Text("Item 1")
                    .fontSize(16)
                    .padding(10)
                    .backgroundColor(0xE8F4F8)
                    .id("item1")
            }

            if (this.showItem2) {
                Text("Item 2")
                    .fontSize(16)
                    .padding(10)
                    .backgroundColor(0xE8F4F8)
                    .id("item2")
            }

            if (this.showItem3) {
                Text("Item 3")
                    .fontSize(16)
                    .padding(10)
                    .backgroundColor(0xE8F4F8)
                    .id("item3")
            }

            Button("Toggle Item 1")
                .id("toggle_item1_button")
                .onClick({ e => this.showItem1 = !this.showItem1 })

            Button("Toggle Item 2")
                .id("toggle_item2_button")
                .onClick({ e => this.showItem2 = !this.showItem2 })

            Button("Toggle Item 3")
                .id("toggle_item3_button")
                .onClick({ e => this.showItem3 = !this.showItem3 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

