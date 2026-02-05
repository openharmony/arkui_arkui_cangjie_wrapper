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
 * TC_B001: @Builder Function Basic Usage with bindMenu
 * Test Scenario: Basic @Builder function definition and usage with bindMenu
 * Expected Result: @Builder function works correctly, CustomBuilder parameter is bound
 */
@Entry
@Component
class ViewBuilderBindMenuBasic {
    @Builder
    func menuBuilder(): Unit {
        Menu() {
            MenuItem(startIcon: Option<ResourceStr>.None, content: "Item 1", endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
            MenuItem(startIcon: Option<ResourceStr>.None, content: "Item 2", endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
        }
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B001: @Builder Function Basic Usage with bindMenu")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Long press to show menu")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Column() {
                Text("Long press here")
                    .fontSize(18)
                    .id("hint_text")
                    .padding(20)
            }
            .width(100.percent)
            .height(200)
            .bindMenu(builder: this.menuBuilder)
            .id("content_column")
            .backgroundColor(Color.White)
            .borderRadius(8)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}
