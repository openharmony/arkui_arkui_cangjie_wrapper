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
import std.collection.*

/**
 * TC_035: @Provide/@Consume with Complex Types
 * Test Scenario: @Provide/@Consume passing collections, custom types, etc.
 * Expected Result: Complex types are correctly passed and shared
 */
@Component
class ProvideConsumeChildTC035 {
    @Consume var dataList: ObservedArrayList<String>
    @Consume var customData: CustomModel
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("List size: ${this.dataList.size}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_list_size_text")
            
            Text("Custom value: ${this.customData.value}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_custom_value_text")
            
            Button("Add Item to List")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("child_add_button")
                .onClick({ e =>
                    this.dataList.append("Child Item ${this.dataList.size}")
                })
            
            Button("Update Custom Data")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("child_update_custom_button")
                .onClick({ e =>
                    this.customData.value = this.customData.value + 10
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC035 {
    @Provide var dataList: ObservedArrayList<String> = ObservedArrayList<String>(["Item1", "Item2"])
    @Provide var customData: CustomModel = CustomModel(name: "Initial", value: 100, count: 1)
    
    func build(): Unit {
        Column() {
            Text("TC_035: @Provide/@Consume with Complex Types")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("List size: ${this.dataList.size}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_list_size_text")
            
            Text("Custom value: ${this.customData.value}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_custom_value_text")
            
            Button("Add Item in Parent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("parent_add_button")
                .onClick({ e =>
                    this.dataList.append("Parent Item ${this.dataList.size}")
                })
            
            Button("Update Custom in Parent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("parent_update_custom_button")
                .onClick({ e =>
                    this.customData.value = this.customData.value * 2
                })
            
            Column() {
                ProvideConsumeChildTC035()
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

