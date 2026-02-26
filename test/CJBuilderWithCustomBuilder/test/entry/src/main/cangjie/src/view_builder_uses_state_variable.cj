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
 * TC_B058: @Builder Function Uses @State Variable
 * Test Scenario: Use @State variable in @Builder function
 * Expected Result: @State variable is correctly accessed in @Builder function
 */
@Entry
@Component
class ViewBuilderUsesStateVariable {
    @State
    var count: Int64 = 0
    
    @State
    var message: String = "Initial Message"
    
    func build(): Unit {
        Column() {
            Text("TC_B058: @Builder Function Uses @State Variable")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: @State variables used in Builder")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Column() {
                Text("Count: ${this.count}")
                    .fontSize(18)
                    .id("count_text")
                    .margin(bottom: 10)
                
                Text("Message: ${this.message}")
                    .fontSize(16)
                    .id("message_text")
                    .margin(bottom: 20)
                
                Row() {
                    Button("Increment")
                        .onClick({ e => this.count++ })
                        .id("increment_button")
                    
                    Button("Change Message")
                        .onClick({ e => this.message = "Updated Message" })
                        .id("change_message_button")
                        .margin(left: 10)
                }
                .width(100.percent)
                .justifyContent(FlexAlign.Center)
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

