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
 * TC_092: @State Set Type
 * Test Scenario: @State Set<Int64>, Set<String> and other Set types
 * Expected Result: Set is correctly initialized, can add, delete elements
 */

@Entry
@Component
class ViewComplexTC092 {
    @State var intSet: HashSet<Int64> = HashSet<Int64>()
    @State var stringSet: HashSet<String> = HashSet<String>()

    protected override func aboutToAppear() {
        this.intSet.add(1)
        this.intSet.add(2)
        this.intSet.add(3)
        this.intSet.add(4)
        this.intSet.add(5)
        this.stringSet.add("apple")
        this.stringSet.add("banana")
        this.stringSet.add("cherry")
        ()
    }

    func build(): Unit {
        Column() {
            Text("TC_092: @State Set Type")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("IntSet Size: ${this.intSet.size}")
                .id("intset_size_text")
            
            Text("IntSet Contains 3: ${this.intSet.contains(3)}")
                .id("intset_contains_3_text")
            
            Text("IntSet Contains 10: ${this.intSet.contains(10)}")
                .id("intset_contains_10_text")

            Text("StringSet Size: ${this.stringSet.size}")
                .id("stringset_size_text")
            
            Text("StringSet Contains 'apple': ${this.stringSet.contains("apple")}")
                .id("stringset_contains_apple_text")

            Button("Add to IntSet")
                .id("add_intset_button")
                .onClick({ e => 
                    let newValue = Int64(this.intSet.size + 1)
                    this.intSet.add(newValue)
                })


            Button("Add to StringSet")
                .id("add_stringset_button")
                .onClick({ e => this.stringSet.add("date") })

            Button("Remove from StringSet")
                .id("remove_stringset_button")
                .onClick({ e => this.stringSet.remove("apple") })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

