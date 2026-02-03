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
 * TC_045: @Watch Combined with @State
 * Test Scenario: @Watch listens to @State, modifies other @State in callback
 * Expected Result: State chain updates correctly
 */
@Entry
@Component
class ViewWatchTC045 {
    @Watch[onCountChanged]
    @State var count: Int64 = 0
    @State var doubledCount: Int64 = 0
    @State var squaredCount: Int64 = 0
    @State var watchTriggered: Bool = false
    
    func onCountChanged() {
        this.watchTriggered = true
        // Modify other @State variables in callback
        this.doubledCount = this.count * 2
        this.squaredCount = this.count * this.count
    }
    
    func build(): Unit {
        Column() {
            Text("TC_045: @Watch Combined with @State")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("count_text")
            
            Text("Doubled count: ${this.doubledCount}")
                .fontSize(16)
                .margin(top: 5)
                .id("doubled_count_text")
            
            Text("Squared count: ${this.squaredCount}")
                .fontSize(16)
                .margin(top: 5)
                .id("squared_count_text")
            
            Text("Watch triggered: ${this.watchTriggered}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch_triggered_text")
            
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
                    this.doubledCount = 0
                    this.squaredCount = 0
                    this.watchTriggered = false
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

