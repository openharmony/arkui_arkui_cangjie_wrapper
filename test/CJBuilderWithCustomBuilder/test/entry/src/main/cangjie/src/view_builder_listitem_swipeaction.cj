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
 * TC_B025: swipeAction Method start and end Parameter Binding (ListItem Component)
 * Test Scenario: Call swipeAction method on ListItem component, pass start and end named parameters
 * Expected Result: start and end parameters are both correctly bound
 */
@Entry
@Component
class ViewBuilderListItemSwipeAction {
    @Builder
    func startActionBuilder(): Unit {
        Row() {
            Text("Start Action")
                .fontSize(14)
                .id("start_action_text")
                .padding(10)
        }
        .width(80)
        .height(100.percent)
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0x4CAF50)
    }
    
    @Builder
    func endActionBuilder(): Unit {
        Row() {
            Text("End Action")
                .fontSize(14)
                .id("end_action_text")
                .padding(10)
        }
        .width(80)
        .height(100.percent)
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xF44336)
    }
    
    @Builder
    func listBuilder(): Unit {
        List() {
            ListItem() {
                Text("Swipe left or right")
                    .fontSize(16)
                    .id("list_item_text")
                    .padding(10)
            }
            .id("list_item")
            .swipeAction(start: this.startActionBuilder, end: this.endActionBuilder)
        }
        .id("list")
        .width(100.percent)
        .height(300)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B025: swipeAction Method start and end Parameter Binding (ListItem Component)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Swipe left or right on list item")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            this.listBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

