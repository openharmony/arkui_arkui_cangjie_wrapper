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
 * TC_035: 多个ForEach在同一个容器中
 */
@Entry
@Component
class ViewForeachTC035 {
    let testArray1: Array<String> = ["a", "b"]
    let testArray2: Array<String> = ["c", "d"]
    let testArray3: Array<String> = ["e", "f"]
    
    func build(): Unit {
        Column() {
            Text("TC_035: Multiple ForEach in Same Container")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Column() {
                ForEach(
                    this.testArray1,
                    itemGenerator: { item: String, idx: Int64 =>
                        Text("List1: ${item}")
                            .fontSize(16)
                            .padding(5)
                            .id("foreach1_item_${idx}")
                    }
                )
                
                ForEach(
                    this.testArray2,
                    itemGenerator: { item: String, idx: Int64 =>
                        Text("List2: ${item}")
                            .fontSize(16)
                            .padding(5)
                            .id("foreach2_item_${idx}")
                    }
                )
                
                ForEach(
                    this.testArray3,
                    itemGenerator: { item: String, idx: Int64 =>
                        Text("List3: ${item}")
                            .fontSize(16)
                            .padding(5)
                            .id("foreach3_item_${idx}")
                    }
                )
            }
            .width(100.percent)
            .id("column_container")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

