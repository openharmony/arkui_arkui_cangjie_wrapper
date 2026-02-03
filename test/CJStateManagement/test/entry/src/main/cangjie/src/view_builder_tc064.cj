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
 * TC_064: @BuilderParam Receiving Builder from Parent Component
 * Test Scenario: Parent component passes Builder function to child component's @BuilderParam
 * Expected Result: Child component correctly receives and uses Builder function in build()
 */
@Component
class BuilderParamChildTC064 {
    @BuilderParam var receivedBuilder: () -> Unit
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            this.receivedBuilder()
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBuilderTC064 {
    @State var message: String = "Hello from Parent"
    
    @Builder
    func parentBuilder(): Unit {
        Column() {
            Text("Parent Builder")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("parent_builder_title")
            
            Text("Message: ${this.message}")
                .fontSize(16)
                .id("parent_builder_message")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xD0E8F0)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_064: @BuilderParam Receiving Builder from Parent")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Column() {
                BuilderParamChildTC064(receivedBuilder: this.parentBuilder)
            }
            .id("child_component_container")
            .margin(top: 20)
            
            Button("Update Message")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_button")
                .onClick({ e =>
                    this.message = "Updated Message"
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

