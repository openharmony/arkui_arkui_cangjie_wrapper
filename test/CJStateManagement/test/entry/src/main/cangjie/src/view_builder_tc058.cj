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
 * TC_058: @Builder Function Definition (No Parameters)
 * Test Scenario: Define @Builder function without parameters
 * Expected Result: Function is correctly defined and can be called in build()
 */
@Builder
func simpleBuilder(): Unit {
    Text("Hello from Builder")
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .id("builder_text")
        .margin(top: 10)
}

@Entry
@Component
class ViewBuilderTC058 {
    func build(): Unit {
        Column() {
            Text("TC_058: @Builder Function Definition (No Parameters)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            simpleBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

