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
 * TC_067: @Builder Combined with @State
 * Test Scenario: @Builder function uses @State variables
 * Expected Result: Builder automatically rebuilds when state changes
 */
@Entry
@Component
class ViewBuilderTC067 {
    @State var count: Int64 = 0
    @State var message: String = "Hello"
    @State var enabled: Bool = true
    
    @Builder
    func stateBuilder(): Unit {
        Column() {
            Text("State Values:")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("state_title")
            
            Text("Count: ${this.count}")
                .fontSize(16)
                .id("count_text")
                .margin(top: 5)
            
            Text("Message: ${this.message}")
                .fontSize(16)
                .id("message_text")
                .margin(top: 5)
            
            Text("Enabled: ${this.enabled}")
                .fontSize(16)
                .id("enabled_text")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_067: @Builder Combined with @State")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.stateBuilder()
            
            Button("Increment Count")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_button")
                .onClick({ e =>
                    this.count = this.count + 1
                })
            
            Button("Update Message")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_message_button")
                .onClick({ e =>
                    this.message = "Updated ${this.count}"
                })
            
            Button("Toggle Enabled")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("toggle_button")
                .onClick({ e =>
                    this.enabled = !this.enabled
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

