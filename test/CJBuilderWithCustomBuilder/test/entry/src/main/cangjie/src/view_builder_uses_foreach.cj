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
 * TC_B066: @Builder Function Uses ForEach
 * Test Scenario: Use ForEach in @Builder function
 * Expected Result: ForEach works correctly in Builder
 */
@Entry
@Component
class ViewBuilderUsesForEach {
    @State
    var items: ArrayList<String> = ArrayList(["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"])
    
    func build(): Unit {
        Column() {
            Text("TC_B066: @Builder Function Uses ForEach")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: ForEach used in Builder")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            List() {
                ForEach(
                    this.items,
                    itemGeneratorFunc: { item: String, index: Int64 =>
                        ListItem() {
                            Text("${index + 1}. ${item}")
                                .fontSize(16)
                                .id("item_text")
                                .width(100.percent)
                                .padding(15)
                        }
                        .id("list_item_${index}")
                    }
                )
            }
            .width(100.percent)
            .layoutWeight(1)
            .id("list")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

