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
 * TC_041: 数据源边界测试（空数组已覆盖，此用例用于验证其他边界情况）
 */
@Entry
@Component
class ViewForeachTC041 {
    // 注意：仓颉语言中，如果类型系统不允许null，此测试可能不适用
    // 这里使用空数组作为边界情况
    let testArray: Array<Int64> = []
    
    func build(): Unit {
        Column() {
            Text("TC_041: Data Source Boundary Test")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Empty Array Boundary Test")
                .fontSize(14)
                .id("hint")
            
            ForEach(
                this.testArray,
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

