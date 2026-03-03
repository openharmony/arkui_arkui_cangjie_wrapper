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
 * TC_B019: title Method Parameter Binding (Navigation/NavDestination Component, Position 0)
 * Test Scenario: Call title method on Navigation/NavDestination component
 * Expected Result: Parameter at position 0 is correctly bound, literal constants and __GenerateResource__() are skipped
 */
@Entry
@Component
class ViewBuilderNavigationTitle {
    @Builder
    func titleBuilder(): Unit {
        Text("Navigation Title")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("title_text")
            .padding(10)
    }
    
    @Builder
    func navigationBuilder(): Unit {
        Navigation() {
            NavDestination() {
                Column() {
                    Text("Nav Destination Content")
                        .fontSize(16)
                        .id("nav_content_text")
                        .padding(10)
                }
                .width(100.percent)
                .height(100.percent)
            }
            .title(this.titleBuilder)
            .id("nav_destination")
        }
        .id("navigation")
        .width(100.percent)
        .height(100.percent)
    }
    
    func build(): Unit {
        Column() {
            this.navigationBuilder()
        }
    }
}

