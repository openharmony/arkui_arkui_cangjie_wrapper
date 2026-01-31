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
 * TC_029: 带keyGenerator和不带keyGenerator的ForEach混合
 */
@Entry
@Component
class ViewForeachTC029 {
    let testArray1: Array<String> = ["a", "b"]
    let testArray2: Array<String> = ["c", "d"]
    
    func build(): Unit {
        Column() {
            Text("TC_029: Mixed With/Without keyGenerator")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Without keyGenerator:")
                .fontSize(16)
                .id("label1")
            
            ForEach(
                this.testArray1,
                itemGenerator: { item: String, idx: Int64 =>
                    Text(item)
                        .fontSize(16)
                        .padding(5)
                        .id("foreach1_item_${idx}")
                }
            )
            
            Text("With keyGenerator:")
                .fontSize(16)
                .margin( top: 10 )
                .id("label2")
            
            ForEach(
                this.testArray2,
                itemGenerator: { item: String, idx: Int64 =>
                    Text(item)
                        .fontSize(16)
                        .padding(5)
                        .id("foreach2_item_${idx}")
                },
                keyGenerator: { item: String, idx: Int64 =>
                    "key_${item}"
                }
            )
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

