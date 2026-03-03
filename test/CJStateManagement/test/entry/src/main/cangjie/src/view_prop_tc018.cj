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
 * TC_018: @Prop Receives Data from Parent Component (Complex Nested Types)
 * Test Scenario: Parent component passes nested objects, collections containing objects, etc.
 * Expected Result: Child component correctly receives and displays nested content
 */

@Component
class ChildComponentTC018 {
    @Prop var complexData: ComplexModel

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            Text("Title: ${this.complexData.title}")
                .id("child_title_text")
            Text("Items Count: ${this.complexData.items.size}")
                .id("child_items_count_text")
            ForEach(
                this.complexData.items,
                itemGeneratorFunc: { item: NestedItem, index: Int64 =>
                    Text("Item ${index}: ${item.name} (ID: ${item.id})")
                        .fontSize(14)
                        .id("child_item_${index}")
                }
            )
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC018 {
    @State var parentComplexData: ComplexModel = ComplexModel(
        title: "Initial Title",
        items: ObservedArrayList<NestedItem>([
            NestedItem(id: 1, name: "Item1", value: 1),
            NestedItem(id: 2, name: "Item2", value: 2)
        ])
    )

    func build(): Unit {
        Column() {
            Text("TC_018: @Prop Receives Data from Parent Component (Complex Nested Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Update Title")
                .id("update_title_button")
                .onClick({ e => this.parentComplexData.title = "Updated Title" })

            Button("Add Nested Item")
                .id("add_item_button")
                .onClick({ e =>
                    let newId = Int64(this.parentComplexData.items.size + 1)
                    this.parentComplexData.items.append(NestedItem(id: newId, name: "Item${newId}", value: newId))
                })

            Button("Update First Item")
                .id("update_first_item_button")
                .onClick({ e =>
                    if (this.parentComplexData.items.size > 0) {
                        this.parentComplexData.items[0].name = "Updated Item1"
                        this.parentComplexData.items[0].id = 100
                    }
                })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC018(complexData: this.parentComplexData)
            }
            .id("child_component")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

