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
 * TC_B011: Multiple CustomBuilder Parameters in Same Component
 * Test Scenario: Use multiple CustomBuilder parameters in the same @Builder function
 * Expected Result: All CustomBuilder parameters are correctly bound
 */
@Entry
@Component
class ViewBuilderMultipleCustomBuilder {
    @Builder
    func menuBuilder(): Unit {
        Menu() {
            MenuItem(startIcon: Option<ResourceStr>.None, content: "Menu Item 1", endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
            MenuItem(startIcon: Option<ResourceStr>.None, content: "Menu Item 2", endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
        }
    }
    
    @Builder
    func contentCoverBuilder(): Unit {
        Column() {
            Text("Content Cover")
                .fontSize(18)
                .id("cover_text")
                .padding(20)
        }
        .width(100.percent)
        .height(150)
        .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func componentBuilder(): Unit {
        Column() {
            Text("Main Content")
                .fontSize(18)
                .id("main_text")
                .padding(10)
        }
        .id("main_column")
        .width(100.percent)
        .height(300)
        .bindMenu(builder: this.menuBuilder)
        .bindContentCover(false, this.contentCoverBuilder)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B011: Multiple CustomBuilder Parameters in Same Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Multiple CustomBuilder parameters used together")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            this.componentBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}
