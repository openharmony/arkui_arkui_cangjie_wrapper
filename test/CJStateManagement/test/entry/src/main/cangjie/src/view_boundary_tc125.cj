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
 * TC_125: State Variable Initial Value is Empty Collection
 * Test Scenario: @State collection initialized as empty Array/ArrayList
 * Expected Result: Empty collection displays correctly, UI updates after adding elements
 */

@Entry
@Component
class ViewBoundaryTC125 {
    @State var emptyArray: Array<Int64> = []
    @State var emptyList: ObservedArrayList<String> = ObservedArrayList<String>([])

    func build(): Unit {
        Column() {
            Text("TC_125: State Variable Initial Value is Empty Collection")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Array Size: ${this.emptyArray.size}")
                .fontSize(16)
                .id("array_size_display")

            Text("List Size: ${this.emptyList.size}")
                .fontSize(16)
                .id("list_size_display")

            if (this.emptyArray.size > 0) {
                ForEach(
                    this.emptyArray,
                    itemGeneratorFunc: { item: Int64, index: Int64 =>
                        Text("Array[${index}]: ${item}")
                            .fontSize(14)
                            .padding(5)
                            .id("array_item_${index}")
                    }
                )
            } else {
                Text("Array is Empty")
                    .fontSize(14)
                    .fontColor(0xFF0000)
                    .id("array_empty_message")
            }

            if (this.emptyList.size > 0) {
                ForEach(
                    this.emptyList,
                    itemGeneratorFunc: { item: String, index: Int64 =>
                        Text("List[${index}]: ${item}")
                            .fontSize(14)
                            .padding(5)
                            .id("list_item_${index}")
                    }
                )
            } else {
                Text("List is Empty")
                    .fontSize(14)
                    .fontColor(0xFF0000)
                    .id("list_empty_message")
            }

            Button("Add to Array")
                .id("add_array_button")
                .onClick({ e => 
                    let newValue = Int64(this.emptyArray.size + 1)
                    this.emptyArray = [newValue]
                })

            Button("Add to List")
                .id("add_list_button")
                .onClick({ e => 
                    let newIndex = Int64(this.emptyList.size + 1)
                    this.emptyList.append("Item ${newIndex}")
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

