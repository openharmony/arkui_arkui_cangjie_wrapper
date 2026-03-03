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
 * TC_B047: swipeAction Method Type Check (Only ListItem Component)
 * Test Scenario: Call swipeAction method on ListItem component
 * Expected Result: Type check passes, parameter is bound
 */
@Entry
@Component
class ViewBuilderListItemSwipeActionTypeCheck {
    func build(): Unit {
        Column() {
            Text("TC_B047: ListItem SwipeAction Method Type Check")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Swipe left or right on ListItem to show actions")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            List() {
                ListItem() {
                    Text("Swipe me")
                        .fontSize(16)
                        .id("list_item_text")
                        .width(100.percent)
                        .padding(15)
                }
                .swipeAction(start: { => 
                    Button("Delete")
                        .width(80)
                        .height(100.percent)
                        .backgroundColor(Color.Red)
                        .id("delete_button")
                }, end: { => 
                    Button("Edit")
                        .width(80)
                        .height(100.percent)
                        .backgroundColor(Color.Blue)
                        .id("edit_button")
                })
                .id("list_item")
            }
            .width(100.percent)
            .height(300)
            .id("list")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

