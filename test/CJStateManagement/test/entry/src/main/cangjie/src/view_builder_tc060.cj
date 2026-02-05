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
 * TC_060: @Builder Function Using State Variables
 * Test Scenario: Use @State variables in @Builder function
 * Expected Result: State variables are correctly accessed, Builder rebuilds when state changes
 */
@Entry
@Component
class ViewBuilderTC060 {
    @State var title: String = "Initial Title"
    @State var count: Int64 = 0
    
    @Builder
    func stateBuilder(): Unit {
        Column() {
            Text("Title: ${this.title}")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("title_text")
                .margin(top: 5)
            
            Text("Count: ${this.count}")
                .fontSize(16)
                .id("count_text")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_060: @Builder Function Using State Variables")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.stateBuilder()
            
            Button("Update Title")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_title_button")
                .onClick({ e =>
                    this.title = "Updated Title"
                })
            
            Button("Increment Count")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_button")
                .onClick({ e =>
                    this.count = this.count + 1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

