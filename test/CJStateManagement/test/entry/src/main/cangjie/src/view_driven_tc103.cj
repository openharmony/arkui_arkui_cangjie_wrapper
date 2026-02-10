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
 * TC_103: onClick Event Drives @State Update
 * Test Scenario: Modify @State variable in Button's onClick event
 * Expected Result: After click, state updates and UI automatically refreshes
 */

@Entry
@Component
class ViewDrivenTC103 {
    @State var clickCount: Int64 = 0
    @State var lastClickTime: String = "None"

    func build(): Unit {
        Column() {
            Text("TC_103: onClick Event Drives @State Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Click Count: ${this.clickCount}")
                .fontSize(16)
                .id("click_count_display")

            Text("Last Click Time: ${this.lastClickTime}")
                .fontSize(16)
                .id("last_click_time_display")

            Button("Click Me")
                .id("click_button")
                .onClick({ e => 
                    this.clickCount = this.clickCount + 1
                    this.lastClickTime = "Clicked ${this.clickCount} times"
                })

            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.clickCount = 0
                    this.lastClickTime = "Reset"
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

