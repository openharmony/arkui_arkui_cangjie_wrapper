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
 * TC_034: @Provide/@Consume with Alias
 * Test Scenario: Use alias for state sharing between parent and child
 * Expected Result: State is correctly matched and shared through alias
 */
@Component
class ProvideConsumeChildTC034 {
    @Consume["sharedValue"] var childValue: Int64
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Value via alias: ${this.childValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_value_text")
            
            Button("Update via Alias")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("child_update_button")
                .onClick({ e =>
                    this.childValue = this.childValue * 2
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC034 {
    @Provide["sharedValue"] var parentValue: Int64 = 10
    
    func build(): Unit {
        Column() {
            Text("TC_034: @Provide/@Consume with Alias")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Value: ${this.parentValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_value_text")
            
            Button("Update in Parent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("parent_update_button")
                .onClick({ e =>
                    this.parentValue = this.parentValue + 5
                })
            
            Column() {
                ProvideConsumeChildTC034()
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

