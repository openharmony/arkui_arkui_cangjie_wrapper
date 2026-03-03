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
 * TC_B021: tabBar Method Parameter Binding (TabContent Component, Position 0)
 * Test Scenario: Call tabBar method on TabContent component
 * Expected Result: Parameter at position 0 is correctly bound, literal constants and __GenerateResource__() are skipped
 */
@Entry
@Component
class ViewBuilderTabContentTabBar {
    @Builder
    func tabBarBuilder(): Unit {
        Text("Tab Bar")
            .fontSize(16)
            .id("tab_bar_text")
            .padding(10)
            .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func tabsBuilder(): Unit {
        Tabs() {
            TabContent() {
                Column() {
                    Text("Tab Content 1")
                        .fontSize(18)
                        .id("tab_content_1_text")
                        .padding(20)
                }
                .width(100.percent)
                .height(100.percent)
                .justifyContent(FlexAlign.Center)
            }
            .tabBar(this.tabBarBuilder)
            .id("tab_content_1")
        }
        .id("tabs")
        .width(100.percent)
        .height(100.percent)
    }
    
    func build(): Unit {
        Column() {
            this.tabsBuilder()
        }
    }
}

