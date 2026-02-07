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
 * TC_107: Timer Drives @State Update
 * Test Scenario: Update @State variable in setTimeout/setInterval callback
 * Expected Result: After timer triggers, state updates and UI automatically refreshes
 */

@Entry
@Component
class ViewDrivenTC107 {
    @State var timerCount: Int64 = 0
    @State var isRunning: Bool = false

    func build(): Unit {
        Column() {
            Text("TC_107: Timer Drives @State Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Timer Count: ${this.timerCount}")
                .fontSize(16)
                .id("timer_count_display")

            Text("Running: ${this.isRunning}")
                .fontSize(16)
                .id("running_display")


            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.timerCount = 0
                    this.isRunning = false
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

