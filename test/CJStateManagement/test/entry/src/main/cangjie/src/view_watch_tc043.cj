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
 * TC_043: @Watch Listening to Collection Variable Changes
 * Test Scenario: @Watch listens to Array, ArrayList and other collection variable changes
 * Expected Result: Callback function is correctly called when collection is modified
 */
@Entry
@Component
class ViewWatchTC043 {
    // @Watch[onListChanged] TODO: bugfix
    @State var dataList: ObservedArrayList<String> = ObservedArrayList<String>(["Item1", "Item2", "Item3"])
    @State var watchTriggered: Bool = false
    @State var watchCount: Int64 = 0
    @State var listSize: Int64 = 3
    
    func onListChanged() {
        this.watchTriggered = true
        this.watchCount = this.watchCount + 1
        this.listSize = this.dataList.size
    }
    
    func build(): Unit {
        Column() {
            Text("TC_043: @Watch Listening to Collection Variable Changes")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("List size: ${this.dataList.size}")
                .fontSize(16)
                .margin(top: 5)
                .id("list_size_text")
            
            Text("Watch triggered: ${this.watchTriggered}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch_triggered_text")
            
            Text("Watch call count: ${this.watchCount}")
                .fontSize(16)
                .margin(top: 5)
                .id("watch_count_text")
            
            Text("List size when watch triggered: ${this.listSize}")
                .fontSize(16)
                .margin(top: 5)
                .id("list_size_when_triggered_text")
            
            Button("Add Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("add_item_button")
                .onClick({ e =>
                    this.dataList.append("Item ${this.dataList.size + 1}")
                })
            
            Button("Remove Last Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("remove_item_button")
                .onClick({ e =>
                    if (this.dataList.size > 0) {
                        this.dataList.remove(Int64(this.dataList.size - 1))
                    }
                })
            
            Button("Clear List")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("clear_list_button")
                .onClick({ e =>
                    this.dataList.clear()
                })
            
            ForEach(
                this.dataList,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("${index}: ${item}")
                        .fontSize(14)
                        .padding(5)
                        .id("list_item_${index}")
                }
            )
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

