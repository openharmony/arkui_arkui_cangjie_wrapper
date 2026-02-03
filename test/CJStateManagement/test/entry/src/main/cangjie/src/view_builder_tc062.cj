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
 * TC_062: @Builder Function Using ForEach
 * Test Scenario: Use ForEach in @Builder function to render list
 * Expected Result: List is correctly rendered, automatically updates when collection changes
 */
@Entry
@Component
class ViewBuilderTC062 {
    @State var itemList: ObservedArrayList<String> = ObservedArrayList<String>(["Item1", "Item2", "Item3"])
    
    @Builder
    func listBuilder(items: ObservedArrayList<String>): Unit {
        Column() {
            Text("List Items:")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("list_title")
                .margin(top: 5, bottom: 10)
            
            ForEach(
                items,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("${index + 1}. ${item}")
                        .fontSize(16)
                        .id("item_${index}")
                        .margin(top: 5)
                        .padding(5)
                        .backgroundColor(0xD0E8F0)
                }
            )
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_062: @Builder Function Using ForEach")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.listBuilder(this.itemList)
            
            Button("Add Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("add_button")
                .onClick({ e =>
                    this.itemList.append("Item${this.itemList.size + 1}")
                })
            
            Button("Remove Last Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("remove_button")
                .onClick({ e =>
                    if (this.itemList.size > 0) {
                        this.itemList.remove(this.itemList.size - 1)
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

