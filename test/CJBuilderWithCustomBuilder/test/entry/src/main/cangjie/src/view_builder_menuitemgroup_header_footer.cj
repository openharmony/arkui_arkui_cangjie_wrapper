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
 * TC_B013: MenuItemGroup Constructor header/footer Parameter Binding
 * Test Scenario: Use MenuItemGroup in @Builder function, pass header and footer parameters
 * Expected Result: header and footer parameters are correctly bound, literal constants are skipped
 */
@Entry
@Component
class ViewBuilderMenuItemGroupHeaderFooter {
    @Builder
    func menuHeaderBuilder(): Unit {
        Text("Menu Header")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("menu_header_text")
            .padding(10)
            .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func menuFooterBuilder(): Unit {
        Text("Menu Footer")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("menu_footer_text")
            .padding(10)
            .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func menuBuilder(): Unit {
        Menu() {
            MenuItemGroup(header: this.menuHeaderBuilder, footer: this.menuFooterBuilder) {
                MenuItem(startIcon: Option<ResourceStr>.None, content: "Item 1", endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
                MenuItem(startIcon: Option<ResourceStr>.None, content: "Item 2", endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
                MenuItem(startIcon: Option<ResourceStr>.None, content: "Item 3", endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
            }
        }
        .id("menu")
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B013: MenuItemGroup Constructor header/footer Parameter Binding")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Menu requires specific context to display")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            this.menuBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

