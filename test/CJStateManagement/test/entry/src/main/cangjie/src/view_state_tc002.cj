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
 * TC_002: @State Variable Initialization (Collection Types)
 * Test Scenario: Declare @State variables with Array, ArrayList, ObservedArrayList, Map, Set collection types
 * Expected Result: Collection types are correctly initialized, UI can correctly render collection content
 */
@Entry
@Component
class ViewStateTC002 {
    @State var myArray: Array<Int64> = [1, 2, 3]
    @State var myArrayList: ArrayList<String> = ArrayList<String>(["A", "B", "C"])
    @State var myObservedArrayList: ObservedArrayList<Bool> = ObservedArrayList<Bool>([true, false])
    @State var myHashMap: HashMap<String, Int64> = HashMap<String, Int64>()
    @State var myHashSet: HashSet<Float64> = HashSet<Float64>()

    protected override func aboutToAppear() {
        this.myHashMap.add("one", 1)
        this.myHashMap.add("two", 2)
        this.myHashSet.add(1.1)
        this.myHashSet.add(2.2)
        ()
    }

    func build(): Unit {
        Column() {
            Text("TC_002: @State Variable Initialization (Collection Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Array: ${this.myArray.toString()}")
                .id("array_text")
            Button("Change Array")
                .id("change_array_button")
                .onClick({ e => this.myArray = [4, 5, 6] })

            Text("ArrayList: ${this.myArrayList.toString()}")
                .id("arraylist_text")
            Button("Add to ArrayList")
                .id("add_arraylist_button")
                .onClick({ e => this.myArrayList.add("D") })  // no change

            Text("ObservedArrayList")
                .id("observedarraylist_text")
            Button("Toggle ObservedArrayList")
                .id("toggle_observedarraylist_button")
                .onClick({ e =>
                    if (this.myObservedArrayList.size > 0) {
                        this.myObservedArrayList.insert(0, !this.myObservedArrayList[0])
                    }
                })

            Text("HashMap: ${this.myHashMap.toString()}")
                .id("hashmap_text")
            Button("Update HashMap")
                .id("update_hashmap_button")
                .onClick({ e => this.myHashMap.add("one", 100) }) // no change

            Text("HashSet: ${this.myHashSet.toString()}")
                .id("hashset_text")
            Button("Add to HashSet")
                .id("add_hashset_button")
                .onClick({ e => this.myHashSet.add(3.3) })  // no change
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

