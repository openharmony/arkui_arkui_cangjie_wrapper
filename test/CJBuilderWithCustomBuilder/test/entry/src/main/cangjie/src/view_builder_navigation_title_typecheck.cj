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
 * TC_B039: title Method Type Check (Only Navigation/NavDestination Component)
 * Test Scenario: Call title method on Navigation component
 * Expected Result: Type check passes, parameter is bound
 */
@Entry
@Component
class ViewBuilderNavigationTitleTypeCheck {
    func build(): Unit {
        Column() {
            Text("TC_B039: Navigation Title Method Type Check")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: title method should work on Navigation and NavDestination components")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Navigation() {
                NavDestination() {
                    Column() {
                        Text("Content")
                            .fontSize(16)
                            .id("content_text")
                    }
                    .width(100.percent)
                    .height(100.percent)
                    .justifyContent(FlexAlign.Center)
                }
                .title({ => 
                    Text("Navigation Title")
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .id("title_text")
                        .padding(5)
                })
                .id("nav_destination")
            }
            .title({ =>
                Text("Navigation Title")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("title_text")
                    .padding(5)
            })
            .id("navigation")
            .width(100.percent)
            .height(100.percent)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

