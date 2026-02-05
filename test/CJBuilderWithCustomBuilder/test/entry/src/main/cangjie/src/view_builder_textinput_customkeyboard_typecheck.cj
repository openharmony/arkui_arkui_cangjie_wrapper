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
 * TC_B041: customKeyboard Method Type Check (Only TextInput/RichEditor Component)
 * Test Scenario: Call customKeyboard method on TextInput component
 * Expected Result: Type check passes, parameter is bound
 */
@Entry
@Component
class ViewBuilderTextInputCustomKeyboardTypeCheck {
    func build(): Unit {
        Column() {
            Text("TC_B041: TextInput CustomKeyboard Method Type Check")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Tap on TextInput or RichEditor to show custom keyboard")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Column() {
                Text("Custom Keyboard Test")
                    .fontSize(16)
                    .margin(bottom: 10)
                    .id("hint_text")
                
                TextInput(placeholder: "Tap to show custom keyboard")
                    .customKeyboard({ => 
                        Row() {
                            Button("1")
                                .width(60)
                                .height(40)
                                .id("key_1")
                            Button("2")
                                .width(60)
                                .height(40)
                                .id("key_2")
                            Button("3")
                                .width(60)
                                .height(40)
                                .id("key_3")
                        }
                        .width(100.percent)
                        .justifyContent(FlexAlign.SpaceAround)
                        .padding(10)
                    })
                    .id("text_input")
                    .width(300)
                    .height(40)
                    .margin(bottom: 10)
                
                RichEditor(RichEditorController())
                    .customKeyboard(value: { => 
                        Row() {
                            Button("1")
                                .width(60)
                                .height(40)
                                .id("key_1")
                            Button("2")
                                .width(60)
                                .height(40)
                                .id("key_2")
                            Button("3")
                                .width(60)
                                .height(40)
                                .id("key_3")
                        }
                        .width(100.percent)
                        .justifyContent(FlexAlign.SpaceAround)
                        .padding(10)
                    })
                    .id("rich_editor")
                    .width(300)
                    .height(100)
            }
            .width(100.percent)
            .padding(20)
            .justifyContent(FlexAlign.Start)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

