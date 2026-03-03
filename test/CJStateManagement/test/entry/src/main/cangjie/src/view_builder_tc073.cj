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
 * TC_073: @Builder Function Using Stack and Flex Layout
 * Test Scenario: Use Stack and Flex components in @Builder function for complex layouts
 * Expected Result: Stack and Flex layouts work correctly, components overlay and align properly
 */
@Entry
@Component
class ViewBuilderTC073 {
    @State var stackIndex: Int64 = 0
    
    @Builder
    func layoutBuilder(): Unit {
        Column() {
            Text("Layout Section")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("layout_title")
                .margin(top: 5, bottom: 10)
            
            Text("Stack Layout:")
                .fontSize(14)
                .id("stack_label")
                .margin(top: 5)
            
            Stack() {
                Column() {
                    Text("Background")
                        .fontSize(16)
                        .fontColor(Color.White)
                        .id("stack_background")
                }
                .width(100.percent)
                .height(100)
                .backgroundColor(0xFF007DFF)
                
                Column() {
                    Text("Foreground ${this.stackIndex}")
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .fontColor(Color.White)
                        .id("stack_foreground")
                }
                .width(100.percent)
                .height(100)
                .justifyContent(FlexAlign.Center)
            }
            .width(100.percent)
            .height(100)
            .id("stack")
            .margin(top: 5)
            
            Text("Flex Layout:")
                .fontSize(14)
                .id("flex_label")
                .margin(top: 15)
            
            Flex(wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceAround) {
                Text("Item 1")
                    .fontSize(14)
                    .padding(10)
                    .backgroundColor(0xFFE0E0E0)
                    .id("flex_item_1")
                
                Text("Item 2")
                    .fontSize(14)
                    .padding(10)
                    .backgroundColor(0xFFE0E0E0)
                    .id("flex_item_2")
                
                Text("Item 3")
                    .fontSize(14)
                    .padding(10)
                    .backgroundColor(0xFFE0E0E0)
                    .id("flex_item_3")
            }
            .width(100.percent)
            .margin(top: 5)
            .id("flex")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_073: @Builder Using Stack and Flex Layout")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.layoutBuilder()
            
            Button("Change Stack Index")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("change_button")
                .onClick({ e =>
                    this.stackIndex = this.stackIndex + 1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

