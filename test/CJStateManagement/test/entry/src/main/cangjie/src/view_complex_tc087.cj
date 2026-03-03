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
 * TC_087: @State Collection Contains Primitive Types
 * Test Scenario: @State Array/ArrayList contains Int64, String and other primitive types
 * Expected Result: Collection is correctly initialized, can iterate and modify
 */

@Entry
@Component
class ViewComplexTC087 {
    @State var intArray: Array<Int64> = [1, 2, 3, 4, 5]
    @State var stringList: ArrayList<String> = ArrayList<String>(["apple", "banana", "cherry"])

    func build(): Unit {
        Column() {
            Text("TC_087: @State Collection Contains Primitive Types")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("IntArray Size: ${this.intArray.size}")
                .id("intarray_size_text")
            
            Text("IntArray[0]: ${this.intArray[0]}")
                .id("intarray_0_text")

            Text("StringList Size: ${this.stringList.size}")
                .id("stringlist_size_text")
            
            Text("StringList[0]: ${this.stringList[0]}")
                .id("stringlist_0_text")

            ForEach(
                this.intArray,
                itemGeneratorFunc: { item: Int64, index: Int64 =>
                    Text("Array[${index}]: ${item}")
                        .fontSize(14)
                        .padding(5)
                        .id("intarray_item_${index}")
                }
            )

            Button("Add to IntArray")
                .id("add_intarray_button")
                .onClick({ e => 
                    let newValue = Int64(this.intArray.size + 1)
                    this.intArray = [1, 2, 3, 4, 5, newValue]
                })

            Button("Update IntArray[0]")
                .id("update_intarray_0_button")
                .onClick({ e => this.intArray[0] = 100 })

            Button("Add to StringList")
                .id("add_stringlist_button")
                .onClick({ e => this.stringList.add("date") })

            Button("Update StringList[0]")
                .id("update_stringlist_0_button")
                .onClick({ e => this.stringList[0] = "updated_apple" })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

