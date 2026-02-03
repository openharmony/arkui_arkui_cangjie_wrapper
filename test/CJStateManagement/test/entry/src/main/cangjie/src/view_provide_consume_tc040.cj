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
 * TC_040: @Provide/@Consume with TextInput Component
 * Test Scenario: Use TextInput component to modify @Consume variable, verify @Provide updates
 * Expected Result: TextInput changes in child component automatically sync to parent @Provide
 */
@Component
class ProvideConsumeChildTC040 {
    @Consume var textValue: String
    
    func build(): Unit {
        Column() {
            Text("Child Component with TextInput")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Consumed text: ${this.textValue}")
                .fontSize(16)
                .margin(top: 5, bottom: 10)
                .id("child_text_display")
            
            TextInput(placeholder: "Enter text here", text: this.textValue)
                .fontSize(16)
                .height(50)
                .margin(top: 10)
                .id("child_text_input")
                .onChange({ value: String =>
                    this.textValue = value
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC040 {
    @Provide var textValue: String = "Initial Text"
    
    func build(): Unit {
        Column() {
            Text("TC_040: @Provide/@Consume with TextInput Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Provide text: ${this.textValue}")
                .fontSize(16)
                .margin(top: 5, bottom: 10)
                .id("parent_text_display")
            
            TextInput(placeholder: "Enter text in parent", text: this.textValue)
                .fontSize(16)
                .height(50)
                .margin(top: 10)
                .id("parent_text_input")
                .onChange({ value: String =>
                    this.textValue = value
                })
            
            Column() {
                ProvideConsumeChildTC040()
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

