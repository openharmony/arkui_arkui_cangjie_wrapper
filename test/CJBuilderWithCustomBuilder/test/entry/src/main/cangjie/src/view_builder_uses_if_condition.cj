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
 * TC_B064: @Builder Function Uses if Condition Rendering
 * Test Scenario: Use if condition in @Builder function
 * Expected Result: Conditional rendering works correctly in Builder
 */
@Entry
@Component
class ViewBuilderUsesIfCondition {
    @State
    var showContent: Bool = true
    
    func build(): Unit {
        Column() {
            Text("TC_B064: @Builder Function Uses if Condition Rendering")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Conditional rendering in Builder")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Column() {
                if (this.showContent) {
                    Text("Content is visible")
                        .fontSize(18)
                        .fontColor(Color.Blue)
                        .id("visible_text")
                        .padding(20)
                }
                
                Button("Toggle Content")
                    .onClick({ e => this.showContent = !this.showContent })
                    .id("toggle_button")
                    .margin(top: 20)
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

