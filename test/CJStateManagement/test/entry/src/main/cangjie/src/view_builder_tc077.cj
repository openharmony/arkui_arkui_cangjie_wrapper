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
 * TC_077: @Builder Function with Conditional Component Rendering
 * Test Scenario: Use if condition to render different component types in @Builder
 * Expected Result: Different components render correctly based on condition
 */
@Entry
@Component
class ViewBuilderTC077 {
    @State var componentType: Int64 = 0  // 0: TextInput, 1: Slider, 2: Toggle
    
    @Builder
    func conditionalComponentBuilder(ty: Int64): Unit {
        Column() {
            Text("Conditional Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("conditional_title")
                .margin(top: 5, bottom: 10)
            
            if (ty == 0) {
                TextInput(placeholder: "TextInput Component", text: "")
                    .fontSize(16)
                    .height(50)
                    .id("textinput_component")
                    .margin(top: 5)
            } else if (ty == 1) {
                Slider(
                    min: 0.0,
                    max: 100.0,
                    step: 1.0,
                    value: 50.0,
                    style: SliderStyle.OutSet
                )
                .id("slider_component")
                .margin(top: 5)
            } else {
                Toggle(ToggleType.Switch, isOn: false)
                    .id("toggle_component")
                    .margin(top: 5)
            }
            
            Text("Current Type: ${ty}")
                .fontSize(14)
                .fontColor(Color.Gray)
                .id("type_display")
                .margin(top: 10)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_077: @Builder with Conditional Component Rendering")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.conditionalComponentBuilder(this.componentType)
            
            Button("Switch to TextInput")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("switch_textinput_button")
                .onClick({ e =>
                    this.componentType = 0
                })
            
            Button("Switch to Slider")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("switch_slider_button")
                .onClick({ e =>
                    this.componentType = 1
                })
            
            Button("Switch to Toggle")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("switch_toggle_button")
                .onClick({ e =>
                    this.componentType = 2
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

