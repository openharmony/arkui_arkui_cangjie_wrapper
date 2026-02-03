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
 * TC_025: 动态数据源（ObservedArrayList）
 */
@Entry
@Component
class ViewForeachTC025 {
    @State
    var testList: ObservedArrayList<Int64> = ObservedArrayList<Int64>([1, 2, 3])
    
    func build(): Unit {
        Column() {
            Text("TC_025: Dynamic Data Source ObservedArrayList")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Button("Add Element")
                .onClick({ e =>
                    this.testList.append(Int64(this.testList.size + 1))
                })
                .id("add_button")
            
            ForEach(
                this.testList,
                itemGenerator: { item: Int64, idx: Int64 =>
                    Text("${item}")
                        .fontSize(16)
                        .padding(5)
                        .id("foreach_item_${idx}")
                }
            )
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

