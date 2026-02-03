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
 * TC_033: @Provide/@Consume Basic Usage (No Alias)
 * Test Scenario: Parent component uses @Provide, child component uses @Consume with same variable name
 * Expected Result: Child component can access parent's provided state
 */
@Component
class ProvideConsumeChildTC033 {
    @Consume var count: Int64
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Count from parent: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_count_text")
            
            Button("Increment in Child")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("child_increment_button")
                .onClick({ e =>
                    this.count = this.count + 1
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC033 {
    @Provide var count: Int64 = 0
    
    func build(): Unit {
        Column() {
            Text("TC_033: @Provide/@Consume Basic Usage (No Alias)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_count_text")
            
            Button("Increment in Parent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("parent_increment_button")
                .onClick({ e =>
                    this.count = this.count + 1
                })
            
            Column() {
                ProvideConsumeChildTC033()
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

