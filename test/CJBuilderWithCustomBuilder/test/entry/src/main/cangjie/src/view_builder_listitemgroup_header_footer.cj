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
 * TC_B012: ListItemGroup Constructor header/footer Parameter Binding
 * Test Scenario: Use ListItemGroup in @Builder function, pass header and footer parameters
 * Expected Result: header and footer parameters are correctly bound
 */
@Entry
@Component
class ViewBuilderListItemGroupHeaderFooter {
    @Builder
    func headerBuilder(): Unit {
        Text("Header Content")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("header_text")
            .padding(10)
            .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func footerBuilder(): Unit {
        Text("Footer Content")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("footer_text")
            .padding(10)
            .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func listItemBuilder(): Unit {
        List() {
            ListItemGroup(header: this.headerBuilder, footer: this.footerBuilder) {
                ForEach(
                    [1, 2, 3, 4, 5],
                    itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            Text("Item ${item}")
                                .fontSize(16)
                                .id("item_${item}_text")
                                .padding(10)
                        }
                        .id("item_${item}")
                    }
                )
            }
            .id("list_item_group")
            .width(100.percent)
        }
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B012: ListItemGroup Constructor header/footer Parameter Binding")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.listItemBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

