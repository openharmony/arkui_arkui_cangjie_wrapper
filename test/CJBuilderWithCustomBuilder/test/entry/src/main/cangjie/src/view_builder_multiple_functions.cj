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
 * TC_B085: Multiple @Builder Functions Used Simultaneously
 * Test Scenario: Use multiple @Builder functions in the same component
 * Expected Result: Multiple @Builder functions work correctly together
 */
@Entry
@Component
class ViewBuilderMultipleFunctions {
    func build(): Unit {
        Column() {
            Text("TC_B085: Multiple @Builder Functions Used Simultaneously")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Multiple Builder functions used together")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Scroll() {
                Column() {
                    Column() {
                        Text("Header Section")
                            .fontSize(18)
                            .fontWeight(FontWeight.Bold)
                            .id("header_text")
                            .padding(15)
                    }
                    .width(100.percent)
                    .backgroundColor(0x1A0000FF)
                    .borderRadius(8)
                    .margin(bottom: 10)
                    
                    Column() {
                        Text("Content Section")
                            .fontSize(16)
                            .id("content_text")
                            .padding(15)
                    }
                    .width(100.percent)
                    .backgroundColor(0x1A00FF00)
                    .borderRadius(8)
                    .margin(bottom: 10)
                    
                    Column() {
                        Text("Footer Section")
                            .fontSize(16)
                            .fontColor(Color.Gray)
                            .id("footer_text")
                            .padding(15)
                    }
                    .width(100.percent)
                    .backgroundColor(0x1A808080)
                    .borderRadius(8)
                }
                .width(100.percent)
                .padding(10)
            }
            .width(100.percent)
            .layoutWeight(1)
            .id("scroll_view")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

