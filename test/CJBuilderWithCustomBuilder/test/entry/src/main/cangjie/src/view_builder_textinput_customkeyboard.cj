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
 * TC_B020: customKeyboard Method Parameter Binding (TextInput/RichEditor Component, Position 0)
 * Test Scenario: Call customKeyboard method on TextInput/RichEditor component
 * Expected Result: Parameter at position 0 is correctly bound
 */
@Entry
@Component
class ViewBuilderTextInputCustomKeyboard {
    @Builder
    func keyboardBuilder(): Unit {
        Row() {
            Button("1").fontSize(14).width(40).height(40).id("key_1")
            Button("2").fontSize(14).width(40).height(40).id("key_2")
            Button("3").fontSize(14).width(40).height(40).id("key_3")
        }
        .width(100.percent)
        .justifyContent(FlexAlign.SpaceAround)
        .padding(10)
        .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func textInputBuilder(): Unit {
        Column() {
            TextInput(placeholder: "Enter text")
                .customKeyboard(this.keyboardBuilder)
                .id("text_input")
                .width(100.percent)
                .height(40)
        }
        .width(100.percent)
        .padding(10)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B020: customKeyboard Method Parameter Binding (TextInput Component)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.textInputBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

