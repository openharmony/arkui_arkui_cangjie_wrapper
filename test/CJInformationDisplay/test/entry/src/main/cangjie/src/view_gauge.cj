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

/**
 * Created on 2024/6/28
 */

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewGauge {

    // Array<(AppResource, Float32)>
    var colorArray_3: Array<(ResourceColor, Float32)> = [(@r(app.color.colorArrayCJResource), 1.0),
        (@r(app.color.colorArrayCJResource_1), 2.0), (@r(app.color.colorArrayCJResource_2), 3.0),
        (@r(app.color.colorArrayCJResource_3), 4.0)]

    var color3_l: LinearGradient = LinearGradient(0x00FF00)
    var color4_l: LinearGradient = LinearGradient(0x20FF0000)
    var color5_l: LinearGradient = LinearGradient([ColorStop(0x00FF00, 0), ColorStop(0x20FF0000, 1)])
    var color6_l: LinearGradient = LinearGradient([ColorStop(0x00FF00, -1), ColorStop(0x20FF0000, -1)])
    var colorArray_l: Array<(LinearGradient, Float32)> = [(this.color3_l, 1.0), (this.color4_l, 2.0),
        (this.color5_l, -3.0), (this.color5_l, 2.0), (this.color6_l, 2.0), (this.color6_l, -2.0), (this.color4_l, 2.0),
        (this.color4_l, 2.0), (this.color4_l, 2.0), (this.color4_l, 2.0), (this.color4_l, 2.0)]

    @Builder
    func TextBuilder() {
        Text("I am description").fontSize(20).textAlign(TextAlign.Center).width(80.percent)
    }
    func build() {
        Column() {
            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                Text("30").fontSize(30).textAlign(TextAlign.Center).width(80.percent)
            }
                .startAngle(220.0)
                .endAngle(135.0)
                .value(30.0)
                .colors([(0x2788D9, 1.0)])
                .width(80.percent)
                .strokeWidth(28)
                .trackShadow(radius: 7.0, offsetX: 7.0, offsetY: 7.0)
                .indicator(icon: "default")
                .description(this.TextBuilder)
                .id("my_gauge")

            Gauge(value: 20.0)
                .colors(this.colorArray_l).id("my_gauge_1")

            // 覆盖率 colors
            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                Text("30").fontSize(30).textAlign(TextAlign.Center).width(80.percent)
            }
                .startAngle(220.0)
                .endAngle(135.0)
                .value(30.0)
                .colors(this.color3_l)
                .width(80.percent)
                .strokeWidth(Float64(28.0))
                .trackShadow(radius: 7.0, offsetX: 7.0, offsetY: 7.0)
                .indicator(icon: "default")
                .description(this.TextBuilder)
                .id("my_gauge5")


            // 覆盖率 colors maxSize > 9 + curColorStops[j].offset.value < 0.0 + (gradientColorStops[i][1] < 0.0
            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                Text("30").fontSize(30).textAlign(TextAlign.Center).width(80.percent)
            }
                .startAngle(220.0)
                .endAngle(135.0)
                .value(30.0)
                .colors([(0x6572B513, 2.0)])
                .colors(Color.Red)
                .colors([(@r(app.color.colorArrayCJResource), 2.0)])
                .width(80.percent)
                .strokeWidth(Float64(28.0))
                .trackShadow(radius: 7.0, offsetX: 7.0, offsetY: 7.0)
                .indicator(icon: "default")
                .description(this.TextBuilder)
                .id("my_gauge7")

            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                Text("30").fontSize(30).textAlign(TextAlign.Center).width(80.percent)
            }
                .startAngle(220.0)
                .endAngle(135.0)
                .value(30.0)
                .colors([(Color.Red, 2.0)])
                .indicator(space: 2)
        }.width(100.percent)
    }
}
