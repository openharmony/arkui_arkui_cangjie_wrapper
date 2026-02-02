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
 * TC_038: @Provide/@Consume Across Multiple Levels
 * Test Scenario: @Provide in grandparent component, @Consume in grandchild component
 * Expected Result: Cross-level state sharing works correctly
 */
@Component
class ProvideConsumeGrandChildTC038 {
    @Consume var crossLevelValue: Int64
    
    func build(): Unit {
        Column() {
            Text("Grandchild Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("grandchild_title")
            
            Text("Value from grandparent: ${this.crossLevelValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("grandchild_value_text")
            
            Button("Modify in Grandchild")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("grandchild_modify_button")
                .onClick({ e =>
                    this.crossLevelValue = this.crossLevelValue * 2
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xD4EDDA)
    }
}

@Component
class ProvideConsumeChildTC038 {
    func build(): Unit {
        Column() {
            Text("Child Component (Intermediate)")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Column() {
                ProvideConsumeGrandChildTC038()
            }
            .id("grandchild_component")
            .margin(top: 10)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC038 {
    @Provide var crossLevelValue: Int64 = 5
    
    func build(): Unit {
        Column() {
            Text("TC_038: @Provide/@Consume Across Multiple Levels")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Grandparent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("grandparent_title")
            
            Text("Provide value: ${this.crossLevelValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("grandparent_value_text")
            
            Button("Modify in Grandparent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("grandparent_modify_button")
                .onClick({ e =>
                    this.crossLevelValue = this.crossLevelValue + 1
                })
            
            Column() {
                ProvideConsumeChildTC038()
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

