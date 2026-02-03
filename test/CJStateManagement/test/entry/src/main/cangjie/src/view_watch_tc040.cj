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
 * TC_040: @Watch Listening to @State Variable Changes
 * Test Scenario: @Watch listens to @State variable, callback is triggered when variable changes
 * Expected Result: Callback function is correctly called
 */
@Entry
@Component
class ViewWatchTC040 {
    @Watch[onCountChanged]
    @State var count: Int64 = 0
    @State var watchTriggered: Bool = false
    @State var watchCount: Int64 = 0
    
    func onCountChanged() {
        this.watchTriggered = true
        this.watchCount = this.watchCount + 1
    }
    
    func build(): Unit {
        Column() {
            Text("TC_040: @Watch Listening to @State Variable Changes")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("count_text")
            
            Text("Watch triggered: ${this.watchTriggered}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch_triggered_text")
            
            Text("Watch call count: ${this.watchCount}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch_count_text")
            
            Button("Increment Count")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_button")
                .onClick({ e =>
                    this.count = this.count + 1
                })
            
            Button("Reset")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("reset_button")
                .onClick({ e =>
                    this.count = 0
                    this.watchTriggered = false
                    this.watchCount = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

