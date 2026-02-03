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
 * TC_024: Array和ArrayList混合使用
 */
@Entry
@Component
class ViewForeachTC024 {
    let testArray: Array<Int64> = [1, 2, 3]
    let testList: ArrayList<Int64> = ArrayList<Int64>([4, 5, 6])
    
    func build(): Unit {
        Column() {
            Text("TC_024: Mixed Use of Array and ArrayList")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Array Data Source:")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .id("array_label")
            
            ForEach(
                this.testArray,
                itemGenerator: { item: Int64, idx: Int64 =>
                    Text("${item}")
                        .fontSize(16)
                        .padding(5)
                        .id("array_item_${idx}")
                }
            )
            
            Text("ArrayList Data Source:")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .margin( top: 10 )
                .id("list_label")
            
            ForEach(
                this.testList,
                itemGenerator: { item: Int64, idx: Int64 =>
                    Text("${item}")
                        .fontSize(16)
                        .padding(5)
                        .id("list_item_${idx}")
                }
            )
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

