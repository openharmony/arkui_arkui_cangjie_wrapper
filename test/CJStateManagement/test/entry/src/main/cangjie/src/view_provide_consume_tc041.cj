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
 * TC_041: @Provide/@Consume with Slider Component
 * Test Scenario: Use Slider component to modify @Consume variable, verify @Provide updates
 * Expected Result: Slider changes in child component automatically sync to parent @Provide
 */
@Component
class ProvideConsumeChildTC041 {
    @Consume var sliderValue: Float64
    
    func build(): Unit {
        Column() {
            Text("Child Component with Slider")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Consumed value: ${this.sliderValue}")
                .fontSize(16)
                .margin(top: 5, bottom: 10)
                .id("child_value_display")
            
            Slider(
                min: 0.0,
                max: 100.0,
                step: 1.0,
                value: this.sliderValue,
                style: SliderStyle.OutSet
            )
            .width(90.percent)
            .height(40)
            .margin(top: 10)
            .id("child_slider")
            .onChange({ value, mode =>
                this.sliderValue = value
            })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewProvideConsumeTC041 {
    @Provide var sliderValue: Float64 = 50.0
    
    func build(): Unit {
        Column() {
            Text("TC_041: @Provide/@Consume with Slider Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Provide value: ${this.sliderValue}")
                .fontSize(16)
                .margin(top: 5, bottom: 10)
                .id("parent_value_display")
            
            Slider(
                min: 0.0,
                max: 100.0,
                step: 1.0,
                value: this.sliderValue,
                style: SliderStyle.OutSet
            )
            .width(90.percent)
            .height(40)
            .margin(top: 10)
            .id("parent_slider")
            .onChange({ value, mode =>
                this.sliderValue = value
            })
            
            Column() {
                ProvideConsumeChildTC041()
            }
            .id("child_component")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

