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
 * TC_046: Multiple @Watch Listening to Same Variable
 * Test Scenario: Multiple @Watch listeners on the same state variable
 * Expected Result: All listeners are triggered
 */
@Entry
@Component
class ViewWatchTC046 {
    // Note: Multiple @Watch on same variable - each @Watch decorates the same @State variable
    @Watch[onCountChanged1]
    @Watch[onCountChanged2]
    @Watch[onCountChanged3]
    @State var count: Int64 = 0
    @State var watch1Triggered: Bool = false
    @State var watch2Triggered: Bool = false
    @State var watch3Triggered: Bool = false
    @State var watch1Count: Int64 = 0
    @State var watch2Count: Int64 = 0
    @State var watch3Count: Int64 = 0
    
    func onCountChanged1() {
        this.watch1Triggered = true
        this.watch1Count = this.watch1Count + 1
    }
    
    func onCountChanged2() {
        this.watch2Triggered = true
        this.watch2Count = this.watch2Count + 1
    }
    
    func onCountChanged3() {
        this.watch3Triggered = true
        this.watch3Count = this.watch3Count + 1
    }
    
    func build(): Unit {
        Column() {
            Text("TC_046: Multiple @Watch Listening to Same Variable")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("count_text")
            
            Text("Watch 1 triggered: ${this.watch1Triggered}, count: ${this.watch1Count}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch1_text")
            
            Text("Watch 2 triggered: ${this.watch2Triggered}, count: ${this.watch2Count}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch2_text")
            
            Text("Watch 3 triggered: ${this.watch3Triggered}, count: ${this.watch3Count}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch3_text")
            
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
                    this.watch1Triggered = false
                    this.watch2Triggered = false
                    this.watch3Triggered = false
                    this.watch1Count = 0
                    this.watch2Count = 0
                    this.watch3Count = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

