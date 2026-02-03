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
 * TC_037: @Consume State Modification Triggers @Provide Update
 * Test Scenario: Child component modifies @Consume variable
 * Expected Result: Parent component @Provide variable automatically updates
 */
@Component
class ProvideConsumeChildTC037 {
    @Consume var sharedValue: Int64
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Consume value: ${this.sharedValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_value_text")
            
            Button("Modify Consume")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("child_modify_button")
                .onClick({ e =>
                    this.sharedValue = this.sharedValue + 10
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC037 {
    @Provide var sharedValue: Int64 = 50
    
    func build(): Unit {
        Column() {
            Text("TC_037: @Consume Modification Triggers @Provide Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Provide value: ${this.sharedValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_value_text")
            
            Text("Note: Modify value in child component to see parent update")
                .fontSize(14)
                .fontColor(0x666666)
                .margin(top: 10)
                .id("parent_note_text")
            
            Column() {
                ProvideConsumeChildTC037()
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

