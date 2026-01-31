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
 * TC_010: 自定义类型数据
 */
@Entry
@Component
class ViewLazyforeachTC010 {
    let dataSource: SimpleDataSource<CustomItem> = SimpleDataSource<CustomItem>(
        ArrayList<CustomItem>([CustomItem(1, "item1"), CustomItem(2, "item2")])
    )
    
    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_010: Custom Type Data")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")
                
                LazyForEach(
                    this.dataSource,
                    itemGenerator: { item: CustomItem, index: Int64 =>
                        Text("${item.value}: ${item.name}")
                            .fontSize(16)
                            .padding(5)
                            .id("lazyforeach_item_${index}")
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

