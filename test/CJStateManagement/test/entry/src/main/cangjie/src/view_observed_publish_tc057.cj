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
 * TC_057: @Observed Class in Collection
 * Test Scenario: @State collection contains @Observed class instances
 * Expected Result: Modifications to @Publish variables of objects in collection trigger UI updates
 */
@Observed
class CollectionItemModelTC057 {
    @Publish var id: Int64 = 0
    @Publish var name: String = ""
    @Publish var value: Int64 = 0
}

@Entry
@Component
class ViewObservedPublishTC057 {
    @State var itemList: ObservedArrayList<CollectionItemModelTC057> = ObservedArrayList<CollectionItemModelTC057>([
        CollectionItemModelTC057(id: 1, name: "Item1", value: 10),
        CollectionItemModelTC057(id: 2, name: "Item2", value: 20),
        CollectionItemModelTC057(id: 3, name: "Item3", value: 30)
    ])
    @State var nextId: Int64 = 4
    
    func build(): Unit {
        Column() {
            Text("TC_057: @Observed Class in Collection")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("List size: ${this.itemList.size}")
                .fontSize(16)
                .margin(top: 5)
                .id("list_size_text")
            
            ForEach(
                this.itemList,
                itemGeneratorFunc: { item: CollectionItemModelTC057, index: Int64 =>
                    Row() {
                        Text("ID: ${item.id}, Name: ${item.name}, Value: ${item.value}")
                            .fontSize(14)
                            .layoutWeight(1)
                            .id("item_text_${index}")
                        
                        Button("Update")
                            .fontSize(12)
                            .height(30)
                            .id("update_item_button_${index}")
                            .onClick({ e =>
                                item.value = item.value + 10
                                item.name = "Updated ${item.name}"
                            })
                    }
                    .width(100.percent)
                    .padding(5)
                    .id("item_row_${index}")
                }
            )
            
            Button("Add New Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("add_item_button")
                .onClick({ e =>
                    this.itemList.append(CollectionItemModelTC057(
                        id: this.nextId,
                        name: "Item${this.nextId}",
                        value: Int64(this.nextId * 10)
                    ))
                    this.nextId = this.nextId + 1
                })
            
            Button("Remove Last Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("remove_item_button")
                .onClick({ e =>
                    if (this.itemList.size > 0) {
                        this.itemList.remove(Int64(this.itemList.size - 1))
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

