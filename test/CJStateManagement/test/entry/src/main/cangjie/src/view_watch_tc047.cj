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
 * TC_047: @Watch Listening to Multiple Variables
 * Test Scenario: One @Watch listens to multiple state variables
 * Expected Result: Callback is triggered when any variable changes
 * 
 * Note: In Cangjie, @Watch can be applied to multiple variables by using multiple @Watch decorators.
 * This test demonstrates watching multiple variables with separate callbacks.
 */
@Entry
@Component
class ViewWatchTC047 {
    @Watch[onValue1Changed]
    @State var value1: Int64 = 0
    @Watch[onValue2Changed]
    @State var value2: String = "Initial"
    @Watch[onValue3Changed]
    @State var value3: Bool = false
    
    @State var watch1Triggered: Bool = false
    @State var watch2Triggered: Bool = false
    @State var watch3Triggered: Bool = false
    @State var watch1Count: Int64 = 0
    @State var watch2Count: Int64 = 0
    @State var watch3Count: Int64 = 0
    
    func onValue1Changed() {
        this.watch1Triggered = true
        this.watch1Count = this.watch1Count + 1
    }
    
    func onValue2Changed() {
        this.watch2Triggered = true
        this.watch2Count = this.watch2Count + 1
    }
    
    func onValue3Changed() {
        this.watch3Triggered = true
        this.watch3Count = this.watch3Count + 1
    }
    
    func build(): Unit {
        Column() {
            Text("TC_047: @Watch Listening to Multiple Variables")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Value1 (Int64): ${this.value1}")
                .fontSize(16)
                .margin(top: 5)
                .id("value1_text")
            
            Text("Value2 (String): ${this.value2}")
                .fontSize(16)
                .margin(top: 5)
                .id("value2_text")
            
            Text("Value3 (Bool): ${this.value3}")
                .fontSize(16)
                .margin(top: 5)
                .id("value3_text")
            
            Text("Watch1 (value1) triggered: ${this.watch1Triggered}, count: ${this.watch1Count}")
                .fontSize(14)
                .margin(top: 5)
                .id("watch1_text")
            
            Text("Watch2 (value2) triggered: ${this.watch2Triggered}, count: ${this.watch2Count}")
                .fontSize(14)
                .margin(top: 5)
                .id("watch2_text")
            
            Text("Watch3 (value3) triggered: ${this.watch3Triggered}, count: ${this.watch3Count}")
                .fontSize(14)
                .margin(top: 5)
                .id("watch3_text")
            
            Button("Change Value1")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("change_value1_button")
                .onClick({ e =>
                    this.value1 = this.value1 + 1
                })
            
            Button("Change Value2")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("change_value2_button")
                .onClick({ e =>
                    this.value2 = "Changed ${this.value1}"
                })
            
            Button("Toggle Value3")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("toggle_value3_button")
                .onClick({ e =>
                    this.value3 = !this.value3
                })
            
            Button("Reset All")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("reset_button")
                .onClick({ e =>
                    this.value1 = 0
                    this.value2 = "Initial"
                    this.value3 = false
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

