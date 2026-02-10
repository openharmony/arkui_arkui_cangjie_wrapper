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
 * TC_113: Collection update Operation Drives Update
 * Test Scenario: Execute update operation on @State collection
 * Expected Result: After collection modifies element, UI automatically updates
 */

@Entry
@Component
class ViewDrivenTC113 {
    @State var itemList: ObservedArrayList<String> = ObservedArrayList<String>([
        "Item 1",
        "Item 2",
        "Item 3"
    ])

    func build(): Unit {
        Column() {
            Text("TC_113: Collection update Operation Drives Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("List Size: ${this.itemList.size}")
                .fontSize(16)
                .id("list_size_display")

            ForEach(
                this.itemList,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("${index}: ${item}")
                        .fontSize(14)
                        .padding(10)
                        .backgroundColor(0xE8F4F8)
                        .margin(top: 5)
                        .id("item_${index}")
                }
            )

            Button("Update First Item")
                .id("update_first_button")
                .onClick({ e => 
                    if (this.itemList.size > 0) {
                        this.itemList[0] = "Updated Item 1"
                    }
                })

            Button("Update Last Item")
                .id("update_last_button")
                .onClick({ e => 
                    if (this.itemList.size > 0) {
                        this.itemList[this.itemList.size - 1] = "Updated Last Item"
                    }
                })

            Button("Update All Items")
                .id("update_all_button")
                .onClick({ e => 
                    for (i in 0..(this.itemList.size - 1)) {
                        this.itemList[i] = "Updated Item ${i + 1}"
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

