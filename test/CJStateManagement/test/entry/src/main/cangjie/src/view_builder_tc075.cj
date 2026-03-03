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
 * TC_075: @BuilderParam Receiving Complex Component Builder
 * Test Scenario: @BuilderParam receives Builder function containing complex components
 * Expected Result: Complex components render correctly in child component
 */
@Component
class BuilderParamComplexChildTC075 {
    @BuilderParam var complexBuilder: () -> Unit
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            this.complexBuilder()
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBuilderTC075 {
    @State var sliderVal: Float64 = 50.0
    @State var toggleVal: Bool = false
    
    @Builder
    func complexComponentBuilder(): Unit {
        Column() {
            Text("Complex Components")
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .id("complex_title")
                .margin(top: 5, bottom: 10)
            
            Row() {
                Text("Slider:")
                    .fontSize(14)
                    .id("slider_label")
                    .layoutWeight(1)
                
                Slider(
                    min: 0.0,
                    max: 100.0,
                    step: 1.0,
                    value: this.sliderVal,
                    style: SliderStyle.OutSet
                )
                .id("slider_tc075")
                .onChange({ value, mode =>
                    this.sliderVal = value
                })
                .layoutWeight(2)
            }
            .width(100.percent)
            .margin(top: 5)
            
            Text("Value: ${this.sliderVal.toString()}")
                .fontSize(14)
                .id("slider_display_tc075")
                .margin(top: 5)
            
            Row() {
                Text("Toggle:")
                    .fontSize(14)
                    .id("toggle_label")
                    .layoutWeight(1)
                
                Toggle(ToggleType.Switch, isOn: this.toggleVal)
                    .id("toggle_tc075")
                    .onChange({ value: Bool =>
                        this.toggleVal = value
                    })
            }
            .width(100.percent)
            .margin(top: 15)
            
            Text("State: ${this.toggleVal}")
                .fontSize(14)
                .id("toggle_display_tc075")
                .margin(top: 5)
            
            Progress(value: this.sliderVal, total: 100.0, progressType: ProgressType.Linear)
                .width(100.percent)
                .height(8)
                .color(0xFF007DFF)
                .id("progress")
                .margin(top: 15)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xD0E8F0)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_075: @BuilderParam Receiving Complex Component Builder")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Column() {
                BuilderParamComplexChildTC075(complexBuilder: this.complexComponentBuilder)
            }
            .id("child_component_container")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

