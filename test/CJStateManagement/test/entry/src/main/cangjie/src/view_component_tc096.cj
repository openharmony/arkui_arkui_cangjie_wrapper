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

/**
 * TC_096: @State Variable Used in Column/Row
 * Test Scenario: Use @State variable to control Column/Row's child component display
 * Expected Result: Layout correctly displays, automatically updates when state changes
 */

@Entry
@Component
class ViewComponentTC096 {
    @State var showItem1: Bool = true
    @State var showItem2: Bool = true
    @State var itemCount: Int64 = 2

    func build(): Unit {
        Column() {
            Text("TC_096: @State Variable Used in Column/Row")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Item Count: ${this.itemCount}")
                .fontSize(16)
                .id("item_count_display")

            Column() {
                if (this.showItem1) {
                    Text("Item 1")
                        .fontSize(16)
                        .padding(10)
                        .backgroundColor(0xE8F4F8)
                        .id("item1")
                }

                if (this.showItem2) {
                    Text("Item 2")
                        .fontSize(16)
                        .padding(10)
                        .backgroundColor(0xE8F4F8)
                        .id("item2")
                }
            }
            .width(100.percent)
            .padding(10)
            .id("dynamic_column")

            Row() {
                Text("Row Item 1")
                    .fontSize(14)
                    .id("row_item1")
                
                Text("Row Item 2")
                    .fontSize(14)
                    .id("row_item2")
            }
            .width(100.percent)
            .justifyContent(FlexAlign.SpaceAround)
            .id("dynamic_row")

            Button("Toggle Item 1")
                .id("toggle_item1_button")
                .onClick({ e => 
                    this.showItem1 = !this.showItem1
                    var count1: Int64 = 0
                    var count2: Int64 = 0
                    if (this.showItem1) {
                        count1 = 1
                    } else {
                        count1 = 0
                    }
                    if (this.showItem2) {
                        count2 = 1
                    } else {
                        count2 = 0
                    }
                    this.itemCount = count1 + count2
                })

            Button("Toggle Item 2")
                .id("toggle_item2_button")
                .onClick({ e => 
                    this.showItem2 = !this.showItem2
                    var count1: Int64 = 0
                    var count2: Int64 = 0
                    if (this.showItem1) {
                        count1 = 1
                    } else {
                        count1 = 0
                    }
                    if (this.showItem2) {
                        count2 = 1
                    } else {
                        count2 = 0
                    }
                    this.itemCount = count1 + count2
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

