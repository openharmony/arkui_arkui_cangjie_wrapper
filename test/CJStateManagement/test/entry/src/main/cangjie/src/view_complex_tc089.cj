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
 * TC_089: @State Collection Contains Nested Objects
 * Test Scenario: @State collection contains nested objects
 * Expected Result: Collection and nested objects both work correctly
 */

@Observed
class NestedData {
    @Publish var id: Int64 = 0
    @Publish var infoItem: NestedItem = NestedItem() // tood cannot use info as indentifier name
}

@Entry
@Component
class ViewComplexTC089 {
    @State var nestedList: ObservedArrayList<NestedData> = ObservedArrayList<NestedData>([
        NestedData(id: 1, infoItem: NestedItem(id: 1, name: "Info1", value: 10)),
        NestedData(id: 2, infoItem: NestedItem(id: 2, name: "Info2", value: 20))
    ])

    func build(): Unit {
        Column() {
            Text("TC_089: @State Collection Contains Nested Objects")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("List Size: ${this.nestedList.size}")
                .id("list_size_text")

            ForEach(
                this.nestedList,
                itemGeneratorFunc: { item: NestedData, index: Int64 =>
                    Column() {
                        Text("Item ${index}: ID=${item.id}, Info: ${item.infoItem.name}=${item.infoItem.value}")
                            .fontSize(14)
                            .padding(5)
                            .id("nested_item_${index}_text")
                    }
                    .id("nested_item_${index}_container")
                }
            )

            Button("Add Nested Item")
                .id("add_nested_item_button")
                .onClick({ e => 
                    let newId = Int64(this.nestedList.size + 1)
                    this.nestedList.append(NestedData(
                        id: newId,
                        infoItem: NestedItem(id: newId, name: "Info${newId}", value: newId * 10)
                    ))
                })

            Button("Update First Item ID")
                .id("update_first_id_button")
                .onClick({ e => 
                    if (this.nestedList.size > 0) {
                        this.nestedList[0].id = 100
                    }
                })

            Button("Update First Item Info Name")
                .id("update_first_info_name_button")
                .onClick({ e => 
                    if (this.nestedList.size > 0) {
                        this.nestedList[0].infoItem.name = "Updated Info1"
                    }
                })

            Button("Update First Item Info Value")
                .id("update_first_info_value_button")
                .onClick({ e => 
                    if (this.nestedList.size > 0) {
                        this.nestedList[0].infoItem.value = 999
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

