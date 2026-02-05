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
 * TC_071: @Builder Function Using Toggle and Checkbox
 * Test Scenario: Use Toggle and Checkbox components in @Builder function
 * Expected Result: Toggle and Checkbox work correctly, state updates trigger rebuild
 */
@Entry
@Component
class ViewBuilderTC071 {
    @State var toggleValue: Bool = false
    @State var checkboxValue: Bool = false
    
    @Builder
    func switchBuilder(): Unit {
        Column() {
            Text("Switch Section")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("switch_title")
                .margin(top: 5, bottom: 10)
            
            Row() {
                Text("Toggle:")
                    .fontSize(14)
                    .id("toggle_label")
                    .layoutWeight(1)
                
                Toggle(ToggleType.Switch, isOn: this.toggleValue)
                    .id("toggle_tc071")
                    .onChange({ value: Bool =>
                        this.toggleValue = value
                    })
            }
            .width(100.percent)
            .margin(top: 5)
            
            Text("Toggle State: ${this.toggleValue}")
                .fontSize(14)
                .fontColor(Color.Gray)
                .id("toggle_display_tc071")
                .margin(top: 5)
            
            Row() {
                Text("Checkbox:")
                    .fontSize(14)
                    .id("checkbox_label")
                    .layoutWeight(1)
                
                Checkbox(name: "${this.checkboxValue}")
                    .id("checkbox")
                    .onChange({ value: Bool =>
                        this.checkboxValue = value
                    })
            }
            .width(100.percent)
            .margin(top: 15)
            
            Text("Checkbox State: ${this.checkboxValue}")
                .fontSize(14)
                .fontColor(Color.Gray)
                .id("checkbox_display")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_071: @Builder Using Toggle and Checkbox")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.switchBuilder()
            
            Button("Toggle Both")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("toggle_both_button")
                .onClick({ e =>
                    this.toggleValue = !this.toggleValue
                    this.checkboxValue = !this.checkboxValue
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

