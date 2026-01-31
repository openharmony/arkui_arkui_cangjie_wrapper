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
 * TC_041: LazyForEach与事件处理组合
 */
@Entry
@Component
class ViewLazyforeachTC041 {
    @State
    var clickedItem: String = "None"
    let dataSource: SimpleDataSource<String> = SimpleDataSource<String>(
        ArrayList<String>(["apple", "banana", "cherry"])
    )
    
    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_041: LazyForEach Combined with Event Handling")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")
                
                Text("Clicked Item: ${this.clickedItem}")
                    .fontSize(16)
                    .id("clicked_display")
                
                LazyForEach(
                    this.dataSource,
                    itemGenerator: { item: String, idx: Int64 =>
                        Button(item)
                            .onClick({ e =>
                                this.clickedItem = item
                            })
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

