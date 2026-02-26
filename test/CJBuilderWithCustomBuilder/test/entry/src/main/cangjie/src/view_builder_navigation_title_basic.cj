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
 * TC_B008: @Builder Function with Navigation title
 * Test Scenario: @Builder function used with Navigation title method
 * Expected Result: CustomBuilder parameter is correctly bound
 */
@Entry
@Component
class ViewBuilderNavigationTitleBasic {
    @Builder
    func titleBuilder(): Unit {
        Text("Navigation Title")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("title_text")
            .padding(10)
    }
    
    func build(): Unit {
        Column() {
            Navigation() {
                NavDestination() {
                    Column() {
                        Text("Content")
                            .fontSize(16)
                            .id("content_text")
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
    }
}
