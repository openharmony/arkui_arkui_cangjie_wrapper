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
 * TC_076: @Builder Function with Form Components
 * Test Scenario: Use multiple form components (TextInput, Slider, Toggle, Checkbox) in @Builder
 * Expected Result: All form components work correctly, form data is collected properly
 */
@Entry
@Component
class ViewBuilderTC076 {
    @State var name: String = ""
    @State var age: Float64 = 25.0
    @State var enabled: Bool = false
    @State var agree: Bool = false
    
    @Builder
    func formBuilder(): Unit {
        Column() {
            Text("Form Section")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("form_title")
                .margin(top: 5, bottom: 10)
            
            Text("Name:")
                .fontSize(14)
                .id("name_label")
                .margin(top: 5)
            
            TextInput(placeholder: "Enter your name", text: this.name)
                .fontSize(16)
                .height(50)
                .id("name_input")
                .onChange({ value: String =>
                    this.name = value
                })
                .margin(top: 5)
            
            Text("Age: ${Int64(this.age).toString()}")
                .fontSize(14)
                .id("age_label")
                .margin(top: 15)
            
            Slider(
                min: 0.0,
                max: 100.0,
                step: 1.0,
                value: this.age,
                style: SliderStyle.OutSet
            )
            .id("age_slider")
            .onChange({ value, mode =>
                this.age = value
            })
            .margin(top: 5)
            
            Row() {
                Text("Enabled:")
                    .fontSize(14)
                    .id("enabled_label")
                    .layoutWeight(1)
                
                Toggle(ToggleType.Switch, isOn: this.enabled)
                    .id("enabled_toggle")
                    .onChange({ value: Bool =>
                        this.enabled = value
                    })
            }
            .width(100.percent)
            .margin(top: 15)
            
            Row() {
                Text("Agree to terms:")
                    .fontSize(14)
                    .id("agree_label")
                    .layoutWeight(1)
                
                Checkbox(name: "${this.agree}")
                    .id("agree_checkbox")
                    .onChange({ value: Bool =>
                        this.agree = value
                    })
            }
            .width(100.percent)
            .margin(top: 15)
            
            Text("Form Data:")
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .id("form_data_label")
                .margin(top: 20)
            
            Text("Name: ${this.name}")
                .fontSize(12)
                .id("form_name_display")
                .margin(top: 5)
            
            Text("Age: ${Int64(this.age).toString()}")
                .fontSize(12)
                .id("form_age_display")
                .margin(top: 2)
            
            Text("Enabled: ${this.enabled}")
                .fontSize(12)
                .id("form_enabled_display")
                .margin(top: 2)
            
            Text("Agree: ${this.agree}")
                .fontSize(12)
                .id("form_agree_display")
                .margin(top: 2)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_076: @Builder Function with Form Components")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.formBuilder()
            
            Button("Reset Form")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("reset_button")
                .onClick({ e =>
                    this.name = ""
                    this.age = 25.0
                    this.enabled = false
                    this.agree = false
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

