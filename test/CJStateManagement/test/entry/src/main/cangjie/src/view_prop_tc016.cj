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
 * TC_016: @Prop Receives Data from Parent Component (Collection Types)
 * Test Scenario: Parent component passes Array, ArrayList to child component
 * Expected Result: Child component correctly receives and renders collection data
 */
@Component
class ChildComponentTC016 {
    @Prop var myArray: Array<Int64>
    @Prop var myArrayList: ArrayList<String>

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Array Size: ${this.myArray.size}")
                .id("array_size_text")
            ForEach(
                this.myArray,
                itemGeneratorFunc: { item: Int64, index: Int64 =>
                    Text("Array[${index}]: ${item}")
                        .fontSize(14)
                        .id("array_item_${index}")
                }
            )
            
            Text("ArrayList Size: ${this.myArrayList.size}")
                .id("arraylist_size_text")
            ForEach(
                this.myArrayList,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("ArrayList[${index}]: ${item}")
                        .fontSize(14)
                        .id("arraylist_item_${index}")
                }
            )
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
    }
}

@Entry
@Component
class ViewPropTC016 {
    @State var parentArray: Array<Int64> = [1, 2, 3]
    @State var parentArrayList: ArrayList<String> = ArrayList<String>(["A", "B", "C"])

    func build(): Unit {
        Column() {
            Text("TC_016: @Prop Receives Data from Parent Component (Collection Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Update Parent Array ${this.parentArray.size}")
                .id("update_array_button")
                .onClick({ e => this.parentArray = [10, 20, 30, 40] })

            Button("Add to Parent ArrayList ${this.parentArrayList.size}")
                .id("add_arraylist_button")
                .onClick({ e => this.parentArrayList.add("D") })

            // Note: Cannot call .id() directly after custom component constructor
            // Wrap it in a container and set id on the container
            Column() {
                ChildComponentTC016(
                    myArray: this.parentArray,
                    myArrayList: this.parentArrayList
                )
            }
            .id("child_component")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

