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
 * TC_044: @Watch Callback Function Parameter Correctness
 * Test Scenario: Verify parameters received by @Watch callback function
 * Expected Result: Parameter values are correct (new value, old value)
 * 
 * Note: In Cangjie, @Watch callback may not receive parameters directly.
 * This test verifies that the callback is triggered and can access the current value.
 */
@Entry
@Component
class ViewWatchTC044 {
    @Watch[onValueChanged]
    @State var value: Int64 = 0
    @State var previousValue: Int64 = 0
    @State var currentValue: Int64 = 0
    @State var changeCount: Int64 = 0
    
    func onValueChanged() {
        // Store previous value before update
        this.previousValue = this.currentValue
        // Get current value after update
        this.currentValue = this.value
        this.changeCount = this.changeCount + 1
    }
    
    func build(): Unit {
        Column() {
            Text("TC_044: @Watch Callback Function Parameter Correctness")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Current value: ${this.value}")
                .fontSize(16)
                .margin(top: 5)
                .id("current_value_text")
            
            Text("Previous value (tracked): ${this.previousValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("previous_value_text")
            
            Text("Current value (tracked): ${this.currentValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("tracked_current_value_text")
            
            Text("Change count: ${this.changeCount}")
                .fontSize(16)
                .margin(top: 5)
                .id("change_count_text")
            
            Button("Increment by 1")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_1_button")
                .onClick({ e =>
                    this.value = this.value + 1
                })
            
            Button("Increment by 10")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_10_button")
                .onClick({ e =>
                    this.value = this.value + 10
                })
            
            Button("Reset")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("reset_button")
                .onClick({ e =>
                    this.value = 0
                    this.previousValue = 0
                    this.currentValue = 0
                    this.changeCount = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

