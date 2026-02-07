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
 * TC_088: @State Collection Contains @Observed Objects
 * Test Scenario: @State collection contains @Observed class instances
 * Expected Result: @Publish variable modifications in collection objects trigger UI updates
 */

@Entry
@Component
class ViewComplexTC088 {
    @State var observedList: ObservedArrayList<CustomModel> = ObservedArrayList<CustomModel>([
        CustomModel(name: "Item1", value: 10, count: 1),
        CustomModel(name: "Item2", value: 20, count: 2),
        CustomModel(name: "Item3", value: 30, count: 3)
    ])

    func build(): Unit {
        Column() {
            Text("TC_088: @State Collection Contains @Observed Objects")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("List Size: ${this.observedList.size}")
                .id("list_size_text")

            ForEach(
                this.observedList,
                itemGeneratorFunc: { item: CustomModel, index: Int64 =>
                    Column() {
                        Text("${index}: ${item.name}, Value: ${item.value}, Count: ${item.count}")
                            .fontSize(14)
                            .padding(5)
                            .id("item_${index}_text")
                    }
                    .id("item_${index}_container")
                }
            )

            Button("Add Item")
                .id("add_item_button")
                .onClick({ e => 
                    let newIndex = Int64(this.observedList.size + 1)
                    this.observedList.append(CustomModel(name: "Item${newIndex}", value: newIndex * 10, count: newIndex))
                })

            Button("Update First Item Name")
                .id("update_first_name_button")
                .onClick({ e => 
                    if (this.observedList.size > 0) {
                        this.observedList[0].name = "Updated Item1"
                    }
                })

            Button("Update First Item Value")
                .id("update_first_value_button")
                .onClick({ e => 
                    if (this.observedList.size > 0) {
                        this.observedList[0].value = 100
                    }
                })

            Button("Remove First Item")
                .id("remove_first_button")
                .onClick({ e => 
                    if (this.observedList.size > 0) {
                        this.observedList.remove(0)
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

