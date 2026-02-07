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
 * TC_090: @State Map Type (Primitive Type Values)
 * Test Scenario: @State Map<String, Int64> and other primitive type Maps
 * Expected Result: Map is correctly initialized, can add, delete, modify
 */

@Entry
@Component
class ViewComplexTC090 {
    @State var intMap: HashMap<String, Int64> = HashMap<String, Int64>()

    @State var stringMap: HashMap<String, String> = HashMap<String, String>()

    protected override func aboutToAppear() {
        this.intMap.add("key1", 10)
        this.intMap.add("key2", 20)
        this.intMap.add("key3", 30)
        this.stringMap.add("name", "Alice")
        this.stringMap.add("city", "Beijing")
        this.stringMap.add("country", "China")
        ()
    }

    func build(): Unit {
        Column() {
            Text("TC_090: @State Map Type (Primitive Type Values)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("IntMap Size: ${this.intMap.size}")
                .id("intmap_size_text")
            
            Text("StringMap Size: ${this.stringMap.size}")
                .id("stringmap_size_text")


            Button("Add to IntMap")
                .id("add_intmap_button")
                .onClick({ e => 
                    let newKey = "key${this.intMap.size + 1}"
                    let newValue = Int64(this.intMap.size * 10 + 10)
                    this.intMap.add(newKey, newValue)
                })

            Button("Update IntMap key1")
                .id("update_intmap_key1_button")
                .onClick({ e => this.intMap.add("key1", 100) })

            Button("Update StringMap name")
                .id("update_stringmap_name_button")
                .onClick({ e => this.stringMap.add("name", "Bob") })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

