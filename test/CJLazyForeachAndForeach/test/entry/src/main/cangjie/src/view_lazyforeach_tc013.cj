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

/**
 * TC_013: itemGenerator生成复杂UI组件
 */
@Entry
@Component
class ViewLazyforeachTC013 {
    let dataSource: SimpleDataSource<Int64> = SimpleDataSource<Int64>(
        ArrayList<Int64>([1, 2])
    )
    
    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_013: itemGenerator Generates Complex UI Components")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")
                
                LazyForEach(
                    this.dataSource,
                    itemGenerator: { item: Int64, idx: Int64 =>
                        Column() {
                            Text("${item}")
                                .fontSize(20)
                                .backgroundColor(Color.Red)
                                .padding(10)
                                .id("lazyforeach_item_${idx}")
                        }
                        .width(100.percent)
                        .margin(bottom: 5)
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

