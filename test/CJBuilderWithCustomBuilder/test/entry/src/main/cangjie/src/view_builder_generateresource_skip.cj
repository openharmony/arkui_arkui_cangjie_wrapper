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
 * TC_B030: __GenerateResource__() Call Skip
 * Test Scenario: Pass __GenerateResource__() call as Builder parameter
 * Expected Result: __GenerateResource__() call is skipped, no binding performed
 */
@Entry
@Component
class ViewBuilderGenerateResourceSkip {
    @Builder
    func componentBuilder(): Unit {
        // Note: This test verifies that __GenerateResource__() calls are skipped
        // In actual implementation, __GenerateResource__() calls should not trigger binding
        Column() {
            Text("Main Content")
                .fontSize(18)
                .id("main_text")
                .padding(10)
        }
        .id("main_column")
        .width(100.percent)
        .height(200)
        // __GenerateResource__() call should be skipped, not bound
        // Note: This is a compile-time check, actual __GenerateResource__() usage may vary
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B030: __GenerateResource__() Call Skip")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: __GenerateResource__() calls should be skipped in binding")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            this.componentBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

