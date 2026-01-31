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
 * TC_036: ForEach嵌套多层
 */
class OuterItem {
    let value: Int64
    let innerArr: Array<String>
    
    public init(value: Int64, innerArr: Array<String>) {
        this.value = value
        this.innerArr = innerArr
    }
}

@Entry
@Component
class ViewForeachTC036 {
    let outerArray: Array<OuterItem> = [
        OuterItem(1, ["a", "b"]),
        OuterItem(2, ["c", "d"])
    ]
    
    func build(): Unit {
        Column() {
            Text("TC_036: Multi-level Nested ForEach")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            ForEach(
                this.outerArray,
                itemGenerator: { outerItem: OuterItem, outerIdx: Int64 =>
                    Column() {
                        Text("Outer: ${outerItem.value}")
                            .fontSize(16)
                            .fontWeight(FontWeight.Medium)
                            .id("outer_${outerIdx}")
                        
                        ForEach(
                            outerItem.innerArr,
                            itemGenerator: { innerItem: String, innerIdx: Int64 =>
                                Text("  Inner: ${innerItem}")
                                    .fontSize(14)
                                    .id("inner_${outerIdx}_${innerIdx}")
                            }
                        )
                    }
                    .width(100.percent)
                    .padding(5)
                    .id("foreach_item_${outerIdx}")
                }
            )
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

