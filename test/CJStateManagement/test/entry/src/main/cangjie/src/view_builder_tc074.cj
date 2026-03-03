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
import std.collection.ArrayList

/**
 * TC_074: @Builder Function Using Scroll and List
 * Test Scenario: Use Scroll and List components in @Builder function
 * Expected Result: Scroll and List work correctly, content scrolls properly
 */
@Entry
@Component
class ViewBuilderTC074 {
    @State var listData: ArrayList<String> = ArrayList<String>(["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"])
    
    @Builder
    func scrollBuilder(items: ArrayList<String>): Unit {
        Column() {
            Text("Scroll and List Section")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("scroll_title")
                .margin(top: 5, bottom: 10)
            
            Text("Scroll View:")
                .fontSize(14)
                .id("scroll_label")
                .margin(top: 5)
            
            Scroll() {
                Column() {
                    ForEach(
                        items,
                        itemGeneratorFunc: { item: String, index: Int64 =>
                            Text("${index + 1}. ${item}")
                                .fontSize(16)
                                .padding(10)
                                .width(100.percent)
                                .backgroundColor(0xFFE0E0E0)
                                .margin(top: 5)
                                .id("scroll_item_${index}")
                        }
                    )
                }
                .width(100.percent)
            }
            .width(100.percent)
            .height(200)
            .id("scroll")
            .margin(top: 5)
            
            Text("List View:")
                .fontSize(14)
                .id("list_label")
                .margin(top: 15)
            
            List() {
                ForEach(
                    items,
                    itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("${index + 1}. ${item}")
                                .fontSize(16)
                                .padding(10)
                                .width(100.percent)
                                .id("list_item_${index}")
                        }
                        .id("list_item_wrapper_${index}")
                    }
                )
            }
            .width(100.percent)
            .height(150)
            .id("list")
            .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_074: @Builder Using Scroll and List")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.scrollBuilder(this.listData)
            
            Button("Add Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("add_button")
                .onClick({ e =>
                    this.listData.add("Item ${this.listData.size + 1}")
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

