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
 * TC_069: @Builder Function Using TextInput and TextArea
 * Test Scenario: Use TextInput and TextArea components in @Builder function
 * Expected Result: Input components work correctly in Builder, state updates trigger rebuild
 */
@Entry
@Component
class ViewBuilderTC069 {
    @State var inputText: String = ""
    @State var areaText: String = ""
    
    @Builder
    func inputBuilder(): Unit {
        Column() {
            Text("Input Section")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("input_title")
                .margin(top: 5, bottom: 10)
            
            Text("TextInput:")
                .fontSize(14)
                .id("textinput_label")
                .margin(top: 5)
            
            TextInput(placeholder: "Enter text here", text: this.inputText)
                .fontSize(16)
                .height(50)
                .id("text_input")
                .onChange({ value: String =>
                    this.inputText = value
                })
                .margin(top: 5)
            
            Text("Current value: ${this.inputText}")
                .fontSize(14)
                .fontColor(Color.Gray)
                .id("input_display")
                .margin(top: 5)
            
            Text("TextArea:")
                .fontSize(14)
                .id("textarea_label")
                .margin(top: 15)
            
            TextArea(placeholder: "Enter multi-line text", text: this.areaText)
                .fontSize(16)
                .height(100)
                .id("text_area")
                .onChange({ value: String =>
                    this.areaText = value
                })
                .margin(top: 5)
            
            Text("Current value: ${this.areaText}")
                .fontSize(14)
                .fontColor(Color.Gray)
                .id("area_display")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_069: @Builder Using TextInput and TextArea")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.inputBuilder()
            
            Button("Clear All")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("clear_button")
                .onClick({ e =>
                    this.inputText = ""
                    this.areaText = ""
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

