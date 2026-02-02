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
 * TC_004: @State Variable Initialization (Complex Nested Types)
 * Test Scenario: Declare @State variable with nested objects, collections containing objects, etc.
 * Expected Result: Complex types are correctly initialized, UI can correctly display nested content
 */

@Entry
@Component
class ViewStateTC004 {
    @State var complexData: ComplexModel = ComplexModel(
        title: "Initial Title",
        items: ObservedArrayList<NestedItem>([
            NestedItem(id: 1, name: "Item1", value: 1),
            NestedItem(id: 2, name: "Item2", value: 2)
        ])
    )

    func build(): Unit {
        Column() {
            Text("TC_004: @State Variable Initialization (Complex Nested Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Title: ${this.complexData.title}")
                .id("title_text")
            Button("Update Title")
                .id("update_title_button")
                .onClick({ e => this.complexData.title = "Updated Title" })

            Text("Items Count: ${this.complexData.items.size}")
                .id("items_count_text")

            ForEach(
                this.complexData.items,
                itemGeneratorFunc: { item: NestedItem, index: Int64 =>
                    Text("${index}: ${item.name} = ${item.value}")
                        .fontSize(16)
                        .padding(5)
                        .id("nested_item_${index}")
                }
            )

            Button("Add Nested Item")
                .id("add_nested_item_button")
                .onClick({ e =>
                    let newId = Int64(this.complexData.items.size + 1)
                    this.complexData.items.append(NestedItem(id: newId, name: "Item${newId}", value: newId))
                })

            Button("Update First Item")
                .id("update_first_item_button")
                .onClick({ e =>
                    if (this.complexData.items.size > 0) {
                        this.complexData.items[0].name = "Updated Item1"
                        this.complexData.items[0].value = 100
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

