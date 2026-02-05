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
 * TC_053: @Publish Variable Definition (Collection Types)
 * Test Scenario: Define @Publish collection type variables in @Observed class
 * Expected Result: Collection variables are correctly defined, can operate on collections
 */
@Observed
class PublishCollectionModelTC053 {
    @Publish var stringList: ObservedArrayList<String> = ObservedArrayList<String>(["Item1", "Item2"])
    @Publish var intArray: Array<Int64> = [1, 2, 3]
}

@Entry
@Component
class ViewObservedPublishTC053 {
    @State var myModel: PublishCollectionModelTC053 = PublishCollectionModelTC053(
        stringList: ObservedArrayList<String>(["A", "B", "C"]),
        intArray: [10, 20, 30]
    )
    
    func build(): Unit {
        Column() {
            Text("TC_053: @Publish Variable Definition (Collection Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("String List Size: ${this.myModel.stringList.size}")
                .fontSize(16)
                .margin(top: 5)
                .id("list_size_text")
            
            ForEach(
                this.myModel.stringList,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("${index}: ${item}")
                        .fontSize(14)
                        .padding(5)
                        .id("list_item_${index}")
                }
            )
            
            Text("Int Array Length: ${this.myModel.intArray.size}")
                .fontSize(16)
                .margin(top: 10)
                .id("array_length_text")
            
            Button("Add to List")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("add_list_button")
                .onClick({ e =>
                    this.myModel.stringList.append("Item ${this.myModel.stringList.size + 1}")
                })
            
            Button("Remove from List")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("remove_list_button")
                .onClick({ e =>
                    if (this.myModel.stringList.size > 0) {
                        this.myModel.stringList.remove(Int64(this.myModel.stringList.size - 1))
                    }
                })
            
            Button("Update Array")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_array_button")
                .onClick({ e =>
                    this.myModel.intArray = [100, 200, 300, 400]
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

