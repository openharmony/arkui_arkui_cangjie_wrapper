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
 * TC_BXXX: CustomPopupOptions Constructor builder Parameter
 * Test Scenario: Call CustomPopupOptions constructor with builder parameter and use with bindPopup
 * Expected Result: Type check passes, parameter is bound
 */
@Entry
@Component
class ViewBuilderCustomPopupOptionsBuilder {
    @State
    var showPopup: Bool = false
    
    func build(): Unit {
        Column() {
            Text("CustomPopupOptions Builder Test")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Click button to show custom popup")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            Button("Show Popup")
                .onClick({ e => this.showPopup = true })
                .id("show_button")
                .margin(top: 20)
            
            Column() {
                Text("Target Component")
                    .fontSize(16)
                    .id("target_text")
                    .padding(20)
            }
            .width(200)
            .height(100)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .bindPopup(this.showPopup, CustomPopupOptions(builder: { =>
                Column() {
                    Text("Custom Popup Content")
                        .fontSize(16)
                        .fontColor(Color.Black)
                        .id("popup_text")
                        .padding(10)
                }
                .width(150)
                .padding(10)
                .backgroundColor(Color.White)
                .borderRadius(8)
            }))
            .id("target_column")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

