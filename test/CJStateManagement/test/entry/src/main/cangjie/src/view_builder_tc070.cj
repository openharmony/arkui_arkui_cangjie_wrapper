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
 * TC_070: @Builder Function Using Slider and Progress
 * Test Scenario: Use Slider and Progress components in @Builder function
 * Expected Result: Slider and Progress work correctly, state updates trigger rebuild
 */
@Entry
@Component
class ViewBuilderTC070 {
    @State var sliderValue: Float64 = 50.0
    @State var progressValue: Float64 = 0.0
    
    @Builder
    func progressBuilder(): Unit {
        Column() {
            Text("Progress Section")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("progress_title")
                .margin(top: 5, bottom: 10)
            
            Text("Slider Control:")
                .fontSize(14)
                .id("slider_label")
                .margin(top: 5)
            
            Slider(
                min: 0.0,
                max: 100.0,
                step: 1.0,
                value: this.sliderValue,
                style: SliderStyle.OutSet
            )
            .id("slider_tc070")
            .onChange({ value, mode =>
                this.sliderValue = value
                this.progressValue = value
            })
            .margin(top: 5)
            
            Text("Slider Value: ${this.sliderValue.toString()}")
                .fontSize(14)
                .id("slider_display_tc070")
                .margin(top: 5)
            
            Text("Progress Bar:")
                .fontSize(14)
                .id("progress_label")
                .margin(top: 15)
            
            Progress(value: this.progressValue, total: 100.0, progressType: ProgressType.Linear)
                .width(100.percent)
                .height(8)
                .color(0xFF007DFF)
                .id("progress_bar")
                .margin(top: 5)
            
            Text("Progress: ${this.progressValue.toString()}%")
                .fontSize(14)
                .id("progress_display")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_070: @Builder Using Slider and Progress")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.progressBuilder()
            
            Button("Reset to 0")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("reset_button")
                .onClick({ e =>
                    this.sliderValue = 0.0
                    this.progressValue = 0.0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

