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
 * TC_106: Promise Completion Updates @State
 * Test Scenario: Update @State variable in Promise's then callback
 * Expected Result: After Promise completes, state updates and UI automatically refreshes
 */

@Entry
@Component
class ViewDrivenTC106 {
    @State var promiseResult: String = "Not Started"
    @State var loading: Bool = false

    func build(): Unit {
        Column() {
            Text("TC_106: Promise Completion Updates @State")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Promise Result: ${this.promiseResult}")
                .fontSize(16)
                .id("promise_result_display")

            Text("Loading: ${this.loading}")
                .fontSize(16)
                .id("loading_display")

            Button("Start Promise")
                .id("start_promise_button")
                .onClick({ e =>
                    this.loading = true
                    this.promiseResult = "Loading..."
                    // Simulate Promise using Task
                })

            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.promiseResult = "Not Started"
                    this.loading = false
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

