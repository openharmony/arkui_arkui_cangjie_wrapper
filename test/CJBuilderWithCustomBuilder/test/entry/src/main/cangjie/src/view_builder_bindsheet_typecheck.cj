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
 * TC_B036: bindSheet Type Check (All Components)
 * Test Scenario: Call bindSheet on different types of components
 * Expected Result: All component types allow using bindSheet
 */
@Entry
@Component
class ViewBuilderBindSheetTypeCheck {
    @Builder
    func sheetBuilder(): Unit {
        Column() {
            Text("Sheet Content")
                .fontSize(18)
                .id("sheet_text")
                .padding(20)
        }
        .width(100.percent)
        .height(200)
    }
    
    @Builder
    func componentBuilder(): Unit {
        Column() {
            Column() {
                Text("Column with Sheet")
                    .fontSize(16)
                    .id("column_text")
                    .padding(10)
            }
            .id("column")
            .width(100.percent)
            .height(100)
            .bindSheet(false, this.sheetBuilder)
            
            Row() {
                Text("Row with Sheet")
                    .fontSize(16)
                    .id("row_text")
                    .padding(10)
            }
            .id("row")
            .width(100.percent)
            .height(100)
            .bindSheet(false, this.sheetBuilder)
        }
        .width(100.percent)
        .padding(10)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B036: bindSheet Type Check (All Components)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.componentBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

