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
 * TC_007: @State Variable Used in ForEach
 * Test Scenario: Use @State collection variable in ForEach to render list
 * Expected Result: List is correctly rendered, list automatically updates when collection changes
 */
@Entry
@Component
class ViewStateTC007 {
    @State var dataList: ObservedArrayList<String> = ObservedArrayList<String>(["Item 1", "Item 2", "Item 3"])
    @State var nextId: Int64 = 4

    func build(): Unit {
        Column() {
            Text("TC_007: @State Variable Used in ForEach")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Add Item")
                .id("add_item_button")
                .onClick({ e =>
                    this.dataList.append("Item ${this.nextId}")
                    this.nextId = this.nextId + 1
                })

            Button("Remove Last Item")
                .id("remove_item_button")
                .onClick({ e =>
                    if (this.dataList.size > 0) {
                        this.dataList.remove(Int64(this.dataList.size - 1))
                        this.nextId = this.nextId - 1
                    }
                })

            Button("Update First Item")
                .id("update_item_button")
                .onClick({ e =>
                    if (this.dataList.size > 0) {
                        this.dataList[0] = "Updated Item 1"
                    }
                })

            ForEach(
                this.dataList,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("${index}: ${item}")
                        .fontSize(16)
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

