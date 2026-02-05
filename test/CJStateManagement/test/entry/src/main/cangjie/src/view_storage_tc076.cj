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

// Initialize AppStorage with complex types
let _ = AppStorage.setOrCreate<Array<Int64>>("storageArray", [1, 2, 3])
let _ = AppStorage.setOrCreate<ArrayList<String>>("storageArrayList", ArrayList<String>(["A", "B"]))
let _ = AppStorage.setOrCreate<HashMap<String, Int64>>("storageHashMap", HashMap<String, Int64>())

/**
 * TC_076: @StorageLink/@StorageProp Passing Complex Types
 * Test Scenario: Use @StorageLink/@StorageProp to pass collections, objects, etc.
 * Expected Result: Complex types correctly stored and read
 */
@Entry
@Component
class ViewStorageTC076 {
    @StorageLink["storageArray"] var myArray: Array<Int64> = [1, 2, 3]
    @StorageProp["storageArrayList"] let myArrayList: ArrayList<String> = ArrayList<String>(["A", "B"])
    @StorageLink["storageHashMap"] var myHashMap: HashMap<String, Int64> = HashMap<String, Int64>()

    protected override func aboutToAppear() {
        this.myHashMap.add("one", 1)
        this.myHashMap.add("two", 2)
        ()
    }

    func build(): Unit {
        Column() {
            Text("TC_076: @StorageLink/@StorageProp Passing Complex Types")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Array: ${this.myArray.toString()}")
                .fontSize(16)
                .margin(top: 5)
                .id("array_text")

            Button("Update Array")
                .id("update_array_button")
                .onClick({ e => this.myArray = [4, 5, 6] })

            Text("ArrayList: ${this.myArrayList.toString()}")
                .fontSize(16)
                .margin(top: 5)
                .id("arraylist_text")

            Button("Update AppStorage ArrayList")
                .id("update_storage_arraylist_button")
                .onClick({ e =>
                    let newList = ArrayList<String>(["X", "Y", "Z"])
                    AppStorage.set<ArrayList<String>>("storageArrayList", newList)
                })

            Text("HashMap: ${this.myHashMap.toString()}")
                .fontSize(16)
                .margin(top: 5)
                .id("hashmap_text")

            Button("Add to HashMap")
                .id("add_hashmap_button")
                .onClick({ e => this.myHashMap.add("three", 3) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

