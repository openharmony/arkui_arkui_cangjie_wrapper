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
 * TC_012: Collection Operations Update @State Variable
 * Test Scenario: Perform add, remove, update operations on @State collection
 * Expected Result: After collection operations, UI automatically updates
 */
@Entry
@Component
class ViewStateTC012 {
    @State var myObservedList: ObservedArrayList<String> = ObservedArrayList<String>(["Apple", "Banana", "Cherry"])
    @State var nextFruitId: Int64 = 4

    func build(): Unit {
        Column() {
            Text("TC_012: Collection Operations Update @State Variable")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Add Fruit")
                .id("add_fruit_button")
                .onClick({ e =>
                    this.myObservedList.append("Fruit ${this.nextFruitId}")
                    this.nextFruitId = this.nextFruitId + 1
                })

            Button("Remove Last Fruit")
                .id("remove_fruit_button")
                .onClick({ e =>
                    if (this.myObservedList.size > 0) {
                        this.myObservedList.remove(Int64(this.myObservedList.size - 1))
                        this.nextFruitId = this.nextFruitId - 1
                    }
                })

            Button("Update First Fruit")
                .id("update_fruit_button")
                .onClick({ e =>
                    if (this.myObservedList.size > 0) {
                        this.myObservedList[0] = "Updated Apple"
                    }
                })

            Button("Clear All Fruits")
                .id("clear_fruits_button")
                .onClick({ e => this.myObservedList.clear() })

            ForEach(
                this.myObservedList,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("${index}: ${item}")
                        .fontSize(16)
                        .padding(5)
                        .id("fruit_item_${index}")
                }
            )
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

