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
import std.convert.*

/**
 * TC_039: Multiple @Consume Sharing Same @Provide
 * Test Scenario: Multiple child components @Consume the same @Provide variable
 * Expected Result: All child components' states are synchronized
 */
@Component
class ProvideConsumeChildTC039 {
    @Prop var childId: String
    @Consume var sharedData: Int64
    
    func build(): Unit {
        Column() {
            Text("Child Component ${this.childId}")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title_${this.childId}")
            
            Text("Consumed data: ${this.sharedData}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_data_text_${this.childId}")
            
            Button("Modify in Child ${this.childId}")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("child_modify_button_${this.childId}")
                .onClick({ e =>
                    // Convert childId string to Int64 for addition
                    let idValue = Int64.parse(this.childId)
                    this.sharedData = this.sharedData + idValue
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC039 {
    @Provide var sharedData: Int64 = 100
    
    func build(): Unit {
        Column() {
            Text("TC_039: Multiple @Consume Sharing Same @Provide")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Provide data: ${this.sharedData}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_data_text")
            
            Button("Modify in Parent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("parent_modify_button")
                .onClick({ e =>
                    this.sharedData = this.sharedData * 2
                })
            
            Column() {
                ProvideConsumeChildTC039(childId: "1")
            }
            .id("child_component_1")
            .margin(top: 20)
            
            Column() {
                ProvideConsumeChildTC039(childId: "2")
            }
            .id("child_component_2")
            .margin(top: 10)
            
            Column() {
                ProvideConsumeChildTC039(childId: "3")
            }
            .id("child_component_3")
            .margin(top: 10)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

