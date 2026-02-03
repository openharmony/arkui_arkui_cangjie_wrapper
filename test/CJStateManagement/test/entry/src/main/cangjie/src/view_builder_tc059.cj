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
 * TC_059: @Builder Function Definition (With Parameters)
 * Test Scenario: Define @Builder function with parameters
 * Expected Result: Function is correctly defined and can be called with parameters
 */
@Builder
func parameterizedBuilder(message: String, count: Int64): Unit {
    Column() {
        Text("Message: ${message}")
            .fontSize(16)
            .id("message_text")
            .margin(top: 5)
        
        Text("Count: ${count}")
            .fontSize(16)
            .id("count_text")
            .margin(top: 5)
    }
    .width(100.percent)
    .padding(10)
    .backgroundColor(0xE8F4F8)
}

@Entry
@Component
class ViewBuilderTC059 {
    func build(): Unit {
        Column() {
            Text("TC_059: @Builder Function Definition (With Parameters)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            parameterizedBuilder("Hello Builder", 42)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

