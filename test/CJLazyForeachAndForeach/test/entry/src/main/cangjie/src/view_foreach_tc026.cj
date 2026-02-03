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
 * TC_026: 多个ForEach使用不同的itemGenerator
 */
@Entry
@Component
class ViewForeachTC026 {
    let testArray1: Array<Int64> = [1, 2]
    let testArray2: Array<String> = ["a", "b"]
    
    func build(): Unit {
        Column() {
            Text("TC_026: Multiple ForEach with Different itemGenerators")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("ForEach 1 (Int64):")
                .fontSize(16)
                .id("label1")
            
            ForEach(
                this.testArray1,
                itemGenerator: { item: Int64, idx: Int64 =>
                    Text("Number: ${item}")
                        .fontSize(16)
                        .padding(5)
                        .id("foreach1_item_${idx}")
                }
            )
            
            Text("ForEach 2 (String):")
                .fontSize(16)
                .margin( top: 10 )
                .id("label2")
            
            ForEach(
                this.testArray2,
                itemGenerator: { item: String, idx: Int64 =>
                    Text("Text: ${item}")
                        .fontSize(16)
                        .padding(5)
                        .id("foreach2_item_${idx}")
                }
            )
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

