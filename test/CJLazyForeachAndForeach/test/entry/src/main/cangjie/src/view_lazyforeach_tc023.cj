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
 * TC_023: IDataSource.getData()正确返回数据
 */
@Entry
@Component
class ViewLazyforeachTC023 {
    let dataSource: SimpleDataSource<String> = SimpleDataSource<String>(
        ArrayList<String>(["item0", "item1", "item2"])
    )
    
    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_023: IDataSource.getData() Returns Data Correctly")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")
                
                Text("Data[0]: ${this.dataSource.getData(0)}")
                    .fontSize(16)
                    .id("data_display")
                
                LazyForEach(
                    this.dataSource,
                    itemGenerator: { item: String, index: Int64 =>
                        Text(item)
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

