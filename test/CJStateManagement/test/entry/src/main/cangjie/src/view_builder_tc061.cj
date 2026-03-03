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
 * TC_061: @Builder Function Using Conditional Rendering
 * Test Scenario: Use If conditional rendering in @Builder function
 * Expected Result: Conditional rendering works correctly based on parameters or state
 */
@Entry
@Component
class ViewBuilderTC061 {
    @State var showContent: Bool = true
    @State var value: Int64 = 10
    
    @Builder
    func conditionalBuilder(show: Bool, val: Int64): Unit {
        Column() {
            if (show) {
                Text("Content is visible")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("visible_text")
                    .margin(top: 5)
            } else {
                Text("Content is hidden")
                    .fontSize(18)
                    .fontColor(Color.Gray)
                    .id("hidden_text")
                    .margin(top: 5)
            }
            
            if (val > 5) {
                Text("Value is greater than 5: ${val}")
                    .fontSize(16)
                    .id("value_text")
                    .margin(top: 5)
            }
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_061: @Builder Function Using Conditional Rendering")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            // the state variable is used in the conditionalBuilder function
            // when the state variable changes, the conditionalBuilder function will not be called again
            this.conditionalBuilder(this.showContent, this.value)
            
            Button("Toggle Visibility")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("toggle_button")
                .onClick({ e =>
                    this.showContent = !this.showContent
                })
            
            Button("Increase Value")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increase_button")
                .onClick({ e =>
                    this.value = this.value + 1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

