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
 * TC_108: Async Function Drives @State Update
 * Test Scenario: Update @State variable after await in async function
 * Expected Result: After async operation completes, state updates and UI automatically refreshes
 */

@Entry
@Component
class ViewDrivenTC108 {
    @State var asyncResult: String = "Not Started"
    @State var stepCount: Int64 = 0



    func build(): Unit {
        Column() {
            Text("TC_108: Async Function Drives @State Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Async Result: ${this.asyncResult}")
                .fontSize(16)
                .id("async_result_display")

            Text("Step Count: ${this.stepCount}")
                .fontSize(16)
                .id("step_count_display")


            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.asyncResult = "Not Started"
                    this.stepCount = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

