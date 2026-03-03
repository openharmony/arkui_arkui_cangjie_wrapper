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
 * TC_B073: @Builder Function Parameter Count Boundary (0 Parameters)
 * Test Scenario: @Builder function with 0 parameters
 * Expected Result: @Builder function with no parameters works correctly
 */
@Entry
@Component
class ViewBuilderZeroParameters {
    func build(): Unit {
        Column() {
            Text("TC_B073: @Builder Function Parameter Count Boundary (0 Parameters)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: @Builder function with no parameters")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Column() {
                Text("Content from Builder with 0 parameters")
                    .fontSize(18)
                    .id("content_text")
                    .padding(20)
            }
            .width(100.percent)
            .padding(20)
            .backgroundColor(Color.White)
            .borderRadius(8)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
        .justifyContent(FlexAlign.Center)
    }
}

