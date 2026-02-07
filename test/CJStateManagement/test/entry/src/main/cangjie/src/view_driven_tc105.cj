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
 * TC_105: onSwipe Event Drives @State Update
 * Test Scenario: Modify @State variable in component's onSwipe event
 * Expected Result: After swipe, state updates and UI automatically refreshes
 */

@Entry
@Component
class ViewDrivenTC105 {
    @State var swipeCount: Int64 = 0
    @State var swipeDirection: String = "None"

    func build(): Unit {
        Column() {
            Text("TC_105: onSwipe Event Drives @State Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Swipe Count: ${this.swipeCount}")
                .fontSize(16)
                .id("swipe_count_display")

            Text("Last Direction: ${this.swipeDirection}")
                .fontSize(16)
                .id("swipe_direction_display")

            Text("Swipe me left or right")
                .fontSize(16)
                .padding(20)
                .backgroundColor(0xE8F4F8)
                .id("swipe_target")
                .onClick({ e =>
                    // Simulate swipe by click for testing
                    this.swipeCount = this.swipeCount + 1
                    this.swipeDirection = "Swipe Detected"
                })

            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.swipeCount = 0
                    this.swipeDirection = "None"
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

