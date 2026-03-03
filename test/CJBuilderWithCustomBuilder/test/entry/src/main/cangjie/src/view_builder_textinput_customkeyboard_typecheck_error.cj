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
 * TC_B042: customKeyboard Method Type Check (Non-TextInput/RichEditor Component, Error Case)
 * Test Scenario: Call customKeyboard method on non-TextInput component (e.g., Text)
 * Expected Result: Type check fails, parameter is not bound
 * Note: This is a compile-time error test case, UI may not render correctly
 */
@Entry
@Component
class ViewBuilderTextInputCustomKeyboardTypeCheckError {
    func build(): Unit {
        Column() {
            Text("TC_B042: TextInput CustomKeyboard Method Type Check Error")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: This test case demonstrates type check failure.")
                .fontSize(14)
                .fontColor(Color.Red)
                .margin(top: 5)
                .id("note_text")
            
            Text("customKeyboard method should only work on TextInput/RichEditor components")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("description_text")
            
            // This should fail type check - customKeyboard is not available on Text component
            // Text("Test")
            //     .customKeyboard({ => Row() { Button("1") } })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

