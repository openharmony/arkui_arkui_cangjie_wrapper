/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

@Entry
@Component
class View_Slider {
    @State
    var outSetValue: Float64 = 50.0

    func build() {
        Column {
            Row {
                Slider(
                    value: this.outSetValue,
                    min: 0.0,
                    max: 100.0,
                    step: 2.0,
                    style: SliderStyle.OutSet,
                    direction: Axis.Horizontal,
                    reverse: false
                )
                    .blockColor(Color.Blue)
                    .trackColor(Color.Gray)
                    .selectedColor(Color.Blue)
                    .showSteps(true)
                    .showTips(true)
                    .trackThickness(4)
//                    .minLabel(0.0)
//                    .maxLabel(100.0)
                    .blockBorderColor(Color.Green)
//                    .blockBorderWidth(4)
//                    .blockSize(width: 10, height: 10)
//                    .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK)
//                    .minResponsiveDistance(3.0)
//                    .selectedBorderRadius(0)
//                    .slideRange(from: 20, to: 80)
//                    .stepSize(2)
//                    .stepColor(0xFFFFFF00)
//                    .trackBorderRadius(0)
                    .onChange({
                        value: Float64, mode: SliderChangeMode => this.outSetValue = value
                    })
//                    .onChange({
//                         =>
//                    })
                    .id("my_slider")
                Text("${this.outSetValue}").fontSize(16).id("my_text")
            }.width(80.percent)

            Slider()
                .blockColor(0xCCCCCC)
                .trackColor(0xC0C0C0)
                .selectedColor(0xCCCC00)
                .trackThickness(4.0)
                .id("my_slider2")

            Slider()
                .blockColor(@r(app.color.start_window_background))
                .trackColor(@r(app.color.start_window_background))
                .selectedColor(@r(app.color.start_window_background))
                // 暂时不测试，需要增添资源文件，容易冲突
                //            .trackThickness(@r())
                .id("my_slider3")
                .trackThickness(@r(app.string.font_size))

            //默认值
            Slider().id("my_slider4")

            //边界值
            Slider(min: 50.0, max: 0.0, step: 1.0, value: 50.0)
//                .minResponsiveDistance(-1.0)
//                .slideRange(from: -10.0, to: 50.0)
//                .stepSize(-10.0)
                .trackThickness(0.0)
                .id("my_slider5")

            //异常值 minResponsiveDistance(Int64) -> (Floate32)
            Slider(min: 50.0, max: 0.0, step: 1.0, value: 50.0)
//                .minResponsiveDistance(5)
//                .slideRange(from: -20.0, to: 50.0)
//                .stepSize(-10.0)
                .trackThickness(2.0)
                .id("my_slider6")



            //各类枚举
            Row() {
                Column(){
                    Slider(style: SliderStyle.InSet, direction: Axis.Vertical, reverse: true)
                }.width(20.percent).height(300)

                Column() {
                    Slider(style: SliderStyle.OutSet, direction: Axis.Horizontal, reverse: true)
                    Slider()
//                        .sliderInteractionMode(SliderInteraction.SLIDE_ONLY)
//                        .blockStyle(SliderBlockType.IMAGE, image: @r(app.media.startIcon))
                    Slider()
//                        .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK_UP)
                        .blockColor(Color.Red)
//                        .blockStyle(SliderBlockType.SHAPE, shape: PathShape(commands: 'M60 60 M30 30 L15 56 L45 56 Z'))
                    Slider(value: 101.0)
//                        .blockStyle(SliderBlockType.SHAPE, shape: PathShape(width:600.vp, height:600.vp, commands: 'M60 60 M30 30 L15 56 L45 56 Z'))
                    Slider(step: -1.0, value: -1.0)
//                        .blockStyle(SliderBlockType.DEFAULT, shape: PathShape())
                    .showTips(true, content: "content")
                }.width(80.percent).height(300)
            }
        }
    }
}
