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


import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.base.*
@Entry
@Component
class ViewDataPanel {
    var valueArr: Array<Float64> = [10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0]

    var values1: Array<Float64> = [20.0, 20.0, 20.0, 20.0]
    var color1: LinearGradient = LinearGradient([ColorStop(0x65EEC9A3, 0), ColorStop(0xFFEF629F, 1)])
    var color2: LinearGradient = LinearGradient([ColorStop(0xFF67F9D4, 0), ColorStop(0xFFFF9554, 1)])
    var colorShadow1: LinearGradient = LinearGradient([ColorStop(0x65EEC9A3, 0), ColorStop(0x65EF629F, 1)])
    var colorShadow2: LinearGradient = LinearGradient([ColorStop(0x65e26709, 0), ColorStop(0x65efbd08, 1)])
    var colorShadow3: LinearGradient = LinearGradient([ColorStop(0x6572B513, 0), ColorStop(0x6508efa6, 1)])
    var colorShadow4: LinearGradient = LinearGradient([ColorStop(0x65ed08f5, 0), ColorStop(0x65ef0849, 1)])

    // 覆盖率整改
    // ColorStop 构造器-2
    var colorShadow5: LinearGradient = LinearGradient([ColorStop(Color(0x65EEC9A3),0.vp),ColorStop(Color(0xFFEF629F), 1.vp)])
    // ColorStop 构造器-3
    var colorShadow6: LinearGradient = LinearGradient([ColorStop(@r(app.color.red_color),0.vp),ColorStop(@r(app.color.blue_color), 1.vp)])
    // ColorStop 构造器-4
    var colorShadow7: LinearGradient = LinearGradient([ColorStop(0x65ed08f5, Float64(0)), ColorStop(0x65ef0849, Float64(1))])
    // ColorStop 构造器-5
    var colorShadow8: LinearGradient = LinearGradient([ColorStop(Color(0x65EEC9A3), Float64(0)), ColorStop(Color(0xFFEF629F), Float64(1))])
    // ColorStop 构造器-6
    var colorShadow9: LinearGradient = LinearGradient([ColorStop(@r(sys.color.ohos_id_color_emphasize), Float64(0)), ColorStop(@r(sys.color.comp_background_gray), Float64(1))])
    // ColorStop 构造器-8
    var colorShadow10: LinearGradient = LinearGradient([ColorStop(Color(0x65EEC9A3), Int64(0)), ColorStop(Color(0xFFEF629F), Int64(1))])
    // ColorStop 构造器-9
    var colorShadow11: LinearGradient = LinearGradient([ColorStop(@r(sys.color.ohos_id_color_emphasize), Int64(0)), ColorStop(@r(sys.color.comp_background_gray), Int64(1))])

    var color3: LinearGradient = LinearGradient(0x00FF00)
    var color4: LinearGradient = LinearGradient(0x20FF0000)

    // 覆盖率
    // LinearGradient 构造器 3
    var color5: LinearGradient = LinearGradient(Color(0x00FF00))
    // LinearGradient 构造器 4
    var color6: LinearGradient = LinearGradient(@r(sys.color.ohos_id_color_emphasize))

    @State
    var bgColor: UInt32 = 0x08182431
    @State
    var offsetX: Int64 = 15
    @State
    var offsetY: Int64 = 15
    @State
    var radius: Int64 = 5

    // 覆盖率 showOptions
    @State
    var offsetX_1: Float64 = 15.0
    @State
    var offsetY_1: Float64 = 15.0
    @State
    var radius_1: Float64 = 5.0
    @State
    var colorArray: Array<LinearGradient> = [this.color1, this.color2, this.color3, this.color4]

    @State
    var shadowColorArray: Array<LinearGradient> = [this.colorShadow1, this.colorShadow2, this.colorShadow3,
    this.colorShadow4]

    func build() {
        Column {
            Row() {
                Stack() {
                    DataPanel(values: [30.0], max: 100.0, panelType: DataPanelType.Circle)
                    .width(168)
                    .height(168)
                    .closeEffect(true)
                    .id("dataPanelComponent")

                    Column() {
                        Text("30").fontSize(35).fontColor(0x182431)
                        Text("1.0.0").fontSize(9.33).lineHeight(12.83).fontWeight(FontWeight.W500).opacity(0.6)
                    }

                    Text("%").fontSize(9.33).lineHeight(12.83).fontWeight(FontWeight.W500).opacity(0.6).position(
                        x: 104.42, y: 78.17)
                }.margin(right: 44)

                Stack() {
                    DataPanel(values: [50.0, 12.0, 8.0, 5.0], max: 100.0, panelType: DataPanelType.Circle).width(
                        168).height(168)
                    Column() {
                        Text("75").fontSize(35).fontColor(0x182431)
                        Text("已使用98GB/128GB").fontSize(8.17).lineHeight(11.08).fontWeight(FontWeight.W500).opacity(
                            0.6)
                    }

                    Text("%").fontSize(9.33).lineHeight(12.83).fontWeight(FontWeight.W500).opacity(0.6).position(
                        x: 104.42, y: 78.17)
                }
            }.margin(bottom: 59)

            DataPanel(values: this.valueArr, max: 100.0, panelType: DataPanelType.Line).width(300).height(10)
            .id("dataPanelComponent1")

            Text("LinearGradient").fontSize(9).fontColor(0xCCCCCC).textAlign(TextAlign.Start).width(100.percent).margin(
                top: 20, left: 20)
            DataPanel(values: this.values1, max: 100.0, panelType: DataPanelType.Circle).width(300).height(300).
                valueColors(this.colorArray).trackShadow(

                DataPanelShadowOptions(
                    radius: this.radius.vp,
                    colors: this.shadowColorArray,
                    offsetX: this.offsetX.vp,
                    offsetY: this.offsetY.vp
                )

            ).strokeWidth(30.vp).trackBackgroundColor(this.bgColor)
            .id("dataPanelComponent2")

            // 覆盖率整改 shadowOptions 构造器3
            DataPanel(values: this.values1, max: 100.0, panelType: DataPanelType.Circle).width(300).height(300).
                valueColors(this.colorArray).trackShadow(

                DataPanelShadowOptions(
                    radius: this.radius_1.vp ,
                    colors: this.shadowColorArray,
                    offsetX: this.offsetX_1.vp,
                    offsetY: this.offsetY_1.vp
                )

            ).strokeWidth(30.vp).trackBackgroundColor(this.bgColor)
            .id("dataPanelComponent3")

            // 覆盖率整改 shadowOptions 构造器4
            DataPanel(values: this.values1, max: 100.0, panelType: DataPanelType.Circle).width(300).height(300).
                valueColors(this.colorArray).trackShadow(

                DataPanelShadowOptions(
                    radius: @r(app.string.DataPanelShadowOptionsRadius),
                    colors: this.shadowColorArray,
                    offsetX: @r(app.string.DataPanelShadowOptionsoffsetX),
                    offsetY: @r(app.string.DataPanelShadowOptionsoffsetY)
                )

            ).strokeWidth(30.vp).trackBackgroundColor(this.bgColor)
            .id("dataPanelComponent4")

            // 覆盖率整改 shadowOptions 构造器
            DataPanel(values: this.values1, max: 100.0, panelType: DataPanelType.Circle).width(300).height(300).
                valueColors(this.colorArray).trackShadow(

                DataPanelShadowOptions(
                    radius: Int64(5),
                    colors: this.shadowColorArray,
                    offsetX: Int64(15),
                    offsetY: Int64(15)
                )

            ).strokeWidth(30.vp).trackBackgroundColor(this.bgColor)
            .id("dataPanelComponent5")

            DataPanel(values: this.values1, max: 100.0, panelType: DataPanelType.Circle)
                .trackBackgroundColor(@r(app.color.blue_color)).strokeWidth(30).strokeWidth(30.0)
                .trackShadow(
                    DataPanelShadowOptions(
                        radius: 5.0,
                        colors: this.shadowColorArray,
                        offsetX: this.offsetX_1,
                        offsetY: this.offsetY_1
                    )
                )
        }.width(100.percent).margin(top: 5)
    }
}
