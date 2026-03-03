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
 * TC_041: @Watch Listening to @Prop Variable Changes
 * Test Scenario: @Watch listens to @Prop variable changes
 * Expected Result: Callback function is correctly called
 */
@Component
class WatchChildTC041 {
    @Watch[onPropChanged]
    @Prop var propValue: Int64
    @State var watchTriggered: Bool = false
    @State var lastPropValue: Int64 = 0
    
    func onPropChanged() {
        this.watchTriggered = true
        this.lastPropValue = this.propValue
    }
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Prop value: ${this.propValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("prop_value_text")
            
            Text("Watch triggered: ${this.watchTriggered}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch_triggered_text")
            
            Text("Last prop value: ${this.lastPropValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("last_prop_value_text")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewWatchTC041 {
    @State var parentValue: Int64 = 10
    
    func build(): Unit {
        Column() {
            Text("TC_041: @Watch Listening to @Prop Variable Changes")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent value: ${this.parentValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_value_text")
            
            Button("Change Parent Value")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("change_parent_button")
                .onClick({ e =>
                    this.parentValue = this.parentValue + 5
                })
            
            Column() {
                WatchChildTC041(propValue: this.parentValue)
            }
            .id("child_component")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

