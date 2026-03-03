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
 * TC_013: @State Variable Initial Value is 0/null/Empty Collection
 * Test Scenario: Test boundary initial values
 * Expected Result: UI correctly displays boundary values
 */
@Entry
@Component
class ViewStateTC013 {
    @State var zeroInt: Int64 = 0
    @State var emptyString: String = ""
    @State var falseBool: Bool = false
    @State var emptyArray: Array<Int64> = []
    @State var emptyArrayList: ArrayList<String> = ArrayList<String>([])
    @State var emptyHashMap: HashMap<String, String> = HashMap<String, String>()
    @State var emptyHashSet: HashSet<Int64> = HashSet<Int64>()

    func build(): Unit {
        Column() {
            Text("TC_013: @State Variable Initial Value is 0/null/Empty Collection")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Zero Int: ${this.zeroInt}")
                .id("zero_int_text")
            Text("Empty String: '${this.emptyString}' (Length: ${this.emptyString.size})")
                .id("empty_string_text")
            Text("False Bool: ${this.falseBool}")
                .id("false_bool_text")
            Text("Empty Array Size: ${this.emptyArray.size}")
                .id("empty_array_text")
            Text("Empty ArrayList Size: ${this.emptyArrayList.size}")
                .id("empty_arraylist_text")
            Text("Empty HashMap Size: ${this.emptyHashMap.size}")
                .id("empty_hashmap_text")
            Text("Empty HashSet Size: ${this.emptyHashSet.size}")
                .id("empty_hashset_text")

            Button("Update All")
                .id("update_all_button")
                .onClick({ e =>
                    this.zeroInt = 1
                    this.emptyString = "Not Empty"
                    this.falseBool = true
                    this.emptyArray = [1]
                    this.emptyArrayList.add("Item")
                    this.emptyHashMap.add("key", "value")
                    this.emptyHashSet.add(10)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

