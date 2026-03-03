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
 * TC_B043: tabBar Method Type Check (Only TabContent Component)
 * Test Scenario: Call tabBar method on TabContent component
 * Expected Result: Type check passes, parameter is bound
 */
@Entry
@Component
class ViewBuilderTabContentTabBarTypeCheck {
    func build(): Unit {
        Column() {
            Text("TC_B043: TabContent TabBar Method Type Check")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: tabBar method should work on TabContent component")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Tabs() {
                TabContent() {
                    Column() {
                        Text("Tab Content 1")
                            .fontSize(16)
                            .id("content_text")
                    }
                    .width(100.percent)
                    .height(100.percent)
                    .justifyContent(FlexAlign.Center)
                }
                .tabBar({ => 
                    Text("Tab 1")
                        .fontSize(14)
                        .padding(10)
                        .id("tab_bar_text")
                })
                .id("tab_content")
            }
            .width(100.percent)
            .height(400)
            .id("tab")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

