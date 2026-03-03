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
 * TC_102: @State Collection Used in LazyForEach
 * Test Scenario: Use @State collection variable in LazyForEach to render list
 * Expected Result: List correctly renders, automatically updates when collection changes
 */

// Simple IDataSource implementation for testing
class SimpleDataSource <: IDataSource<String> {
    var dataList: ObservedArrayList<String>
    
    init(list: ObservedArrayList<String>) {
        this.dataList = list
    }
    
    override public func totalCount(): Int64 {
        return Int64(this.dataList.size)
    }
    
    override public func getData(index: Int64): String {
        return this.dataList[index]
    }
    
    override public func registerDataChangeListener(listener: DataChangeListener): Unit {
        // Simplified implementation
    }
    
    override public func unregisterDataChangeListener(listener: DataChangeListener): Unit {
        // Simplified implementation
    }
}

@Entry
@Component
class ViewComponentTC102 {
    @State var itemList: ObservedArrayList<String> = ObservedArrayList<String>([
        "Lazy Item 1",
        "Lazy Item 2",
        "Lazy Item 3"
    ])
    
    var dataSource: SimpleDataSource = SimpleDataSource(ObservedArrayList<String>([
        "Lazy Item 1",
        "Lazy Item 2",
        "Lazy Item 3"
    ]))

    func build(): Unit {
        Column() {
            Text("TC_102: @State Collection Used in LazyForEach")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("List Size: ${this.itemList.size}")
                .fontSize(16)
                .id("list_size_display")

            LazyForEach(
                this.dataSource,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    Text("${index}: ${item}")
                        .fontSize(14)
                        .padding(10)
                        .backgroundColor(0xE8F4F8)
                        .margin(top: 5)
                        .id("lazyforeach_item_${index}")
                }
            )

            Button("Add Item")
                .id("add_item_button")
                .onClick({ e => 
                    let newIndex = Int64(this.itemList.size + 1)
                    this.itemList.append("Lazy Item ${newIndex}")
                    this.dataSource = SimpleDataSource(this.itemList)
                })

            Button("Remove First Item")
                .id("remove_first_button")
                .onClick({ e => 
                    if (this.itemList.size > 0) {
                        this.itemList.remove(0)
                        this.dataSource = SimpleDataSource(this.itemList)
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

