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
import ohos.arkui.component.lazy_for_each.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*



@Entry
@Component
class ViewLazyforeachTC037 {
    let nestedList: ArrayList<NestedItem> = ArrayList<NestedItem>()
    let dataSource: SimpleDataSource<NestedItem> = SimpleDataSource<NestedItem>(this.nestedList)

    protected override func aboutToAppear() {
        nestedList.add(NestedItem(1, ArrayList<String>(["a", "b"])))
        nestedList.add(NestedItem(2, ArrayList<String>(["c", "d"])))
    }
    
    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_037: Nested LazyForEach in itemGenerator")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")
                
                LazyForEach(
                    this.dataSource,
                    itemGenerator: { item: NestedItem, idx: Int64 =>
                        Column() {
                            Text("Parent: ${item.value}")
                                .fontSize(16)
                                .fontWeight(FontWeight.Medium)
                                .id("parent_${idx}")
                            
                            LazyForEach(
                                SimpleDataSource<String>(item.children),
                                itemGenerator: { child: String, childIdx: Int64 =>
                                    Text("  Child: ${child}")
                                        .fontSize(14)
                                        .id("child_${idx}_${childIdx}")
                                }
                            )
                        }
                        .width(100.percent)
                        .padding(5)
                        .id("lazyforeach_item_${idx}")
                    }
                )
            }
            .width(100.percent)
            .padding(10)
            .backgroundColor(0xF1F3F5)
        }
        .width(100.percent)
        .height(100.percent)
    }
}

