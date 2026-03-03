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
import std.collection.ArrayList

/**
 * TC_072: @Builder Function Using Grid Layout
 * Test Scenario: Use Grid component in @Builder function to create grid layout
 * Expected Result: Grid layout works correctly, items render properly
 */
@Entry
@Component
class ViewBuilderTC072 {
    @State var gridData: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3, 4, 5, 6, 7, 8, 9])
    
    @Builder
    func gridBuilder(items: ArrayList<Int64>): Unit {
        Column() {
            Text("Grid Layout")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("grid_title")
                .margin(top: 5, bottom: 10)
            
            Grid() {
                ForEach(
                    items,
                    itemGeneratorFunc: { item: Int64, index: Int64 =>
                        GridItem() {
                            Column() {
                                Text("${item}")
                                    .fontSize(20)
                                    .fontWeight(FontWeight.Bold)
                                    .fontColor(Color.White)
                                    .id("grid_item_text_${index}")
                            }
                            .width(100.percent)
                            .height(100.percent)
                            .justifyContent(FlexAlign.Center)
                            .backgroundColor(0xFF007DFF)
                        }
                        .id("grid_item_${index}")
                    }
                )
            }
            .columnsTemplate("1fr 1fr 1fr")
            .rowsTemplate("1fr 1fr 1fr")
            .columnsGap(10)
            .rowsGap(10)
            .width(100.percent)
            .height(300)
            .id("grid")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_072: @Builder Using Grid Layout")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.gridBuilder(this.gridData)
            
            Button("Add Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("add_button")
                .onClick({ e =>
                    this.gridData.add(Int64(this.gridData.size + 1))
                })
            
            Button("Remove Item")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("remove_button")
                .onClick({ e =>
                    if (this.gridData.size > 0) {
                        this.gridData.remove(at: this.gridData.size - 1)
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

