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
 * Created on 2024/11/12
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.curves.*

@Entry
@Component
class ViewCurves {
    @State
    var message1: String = ""
    @State
    var message2: String = ""
    @State
    var message3: String = ""
    @State
    var message4: String = ""
    @State
    var message5: String = ""
    @State
    var message6: String = ""
    @State
    var message7: String = ""
    @State
    var message8: String = ""
    @State
    var message9: String = ""
    @State
    var message10: String = ""
    @State
    var message11: String = ""
    @State
    var message12: String = ""
    @State
    var message13: String = ""
    @State
    var message14: String = ""
    @State
    var message15: String = ""
    @State
    var message16: String = ""
    @State
    var message17: String = ""
    @State
    var message18: String = ""
    @State
    var message19: String = ""
    @State
    var message20: String = ""
    @State
    var message21: String = ""
    // stepsCurve
    var curve1: ICurve = Curves.stepsCurve(10, false)
    // cubicBezierCurve
    var curve2: ICurve = Curves.cubicBezierCurve(0.5, 10.0, 0.5, 10.0)
    // springCurve
    var curve3: ICurve = Curves.springCurve(0.5, 10.0, 0.5, 10.0)
    // springMotion
    var curve4: ICurve = Curves.springMotion(response: 10.0, dampingFraction: 20.0, overlapDuration: 5.0)
    // responsiveSpringMotion
    var curve5: ICurve = Curves.responsiveSpringMotion(response: 10.0, dampingFraction: 15.0, overlapDuration: 5.0)
    // interpolatingSpring
    var curve6: ICurve = Curves.interpolatingSpring(0.5, 10.0, 0.5, 10.0)
    // customCurve
    var curve7: ICurve = Curves.customCurve({interpolate => interpolate * 50.0})
    // initCurve
    var curve8: ICurve = Curves.initCurve(curve: Curve.Linear);
    var curve9: ICurve = Curves.initCurve(curve: Curve.EaseInOut);
    var curve10: ICurve = Curves.initCurve(curve: Curve.Ease);
    var curve11: ICurve = Curves.initCurve(curve: Curve.EaseIn);
    var curve12: ICurve = Curves.initCurve(curve: Curve.EaseOut);
    var curve13: ICurve = Curves.initCurve(curve: Curve.ExtremeDeceleration);
    var curve14: ICurve = Curves.initCurve(curve: Curve.FastOutLinearIn);
    var curve15: ICurve = Curves.initCurve(curve: Curve.FastOutSlowIn);
    var curve16: ICurve = Curves.initCurve(curve: Curve.Friction);
    var curve17: ICurve = Curves.initCurve(curve: Curve.LinearOutSlowIn);
    var curve18: ICurve = Curves.initCurve(curve: Curve.Rhythm);
    var curve19: ICurve = Curves.initCurve(curve: Curve.Sharp);
    var curve20: ICurve = Curves.initCurve(curve: Curve.Smooth);
    var curve21: ICurve = Curves.initCurve(curve: Curve.ExtremeDeceleration);
    func build() {
        Row {
            Column {
                Text("${message1}").id("case1").fontSize(10)
                Text("${message2}").id("case2").fontSize(10)
                Text("${message3}").id("case3").fontSize(10)
                Text("${message4}").id("case4").fontSize(10)
                Text("${message5}").id("case5").fontSize(10)
                Text("${message6}").id("case6").fontSize(10)
                Text("${message7}").id("case7").fontSize(10)
                Text("${message8}").id("case8").fontSize(10)
                Text("${message9}").id("case9").fontSize(10)
                Text("${message10}").id("case10").fontSize(10)
                Text("${message11}").id("case11").fontSize(10)
                Text("${message12}").id("case12").fontSize(10)
                Text("${message13}").id("case13").fontSize(10)
                Text("${message14}").id("case14").fontSize(10)
                Text("${message15}").id("case15").fontSize(10)
                Text("${message16}").id("case16").fontSize(10)
                Text("${message17}").id("case17").fontSize(10)
                Text("${message18}").id("case18").fontSize(10)
                Text("${message19}").id("case19").fontSize(10)
                Text("${message20}").id("case20").fontSize(10)
                Button("normal_case1").onClick ({
                    _ => setMessage(0.2)
                }).fontSize(14).height(33).id("normal_case1")
                Button("normal_case2").onClick ({
                    _ => setMessage(0.5)
                }).fontSize(14).height(33).id("normal_case2")
                Button("edge_case1").onClick ({
                    _ => setMessage(0.0)
                }).fontSize(14).height(33).id("edge_case1")
                Button("edge_case2").onClick ({
                    _ => setMessage(1.0)
                }).fontSize(14).height(33).id("edge_case2")
                Button("edge_case3").onClick ({
                    _ => setMessage(-100.0)
                }).fontSize(14).height(33).id("edge_case3")
            }.width(100.percent)
        }.height(100.percent)
    }

    func setMessage(fraction: Float32) {
        this.message1 = curve1.interpolate(fraction).toString()
        this.message2 = curve2.interpolate(fraction).toString()
        this.message3 = curve3.interpolate(fraction).toString()
        this.message4 = curve4.interpolate(fraction).toString()
        this.message5 = curve5.interpolate(fraction).toString()
        this.message6 = curve6.interpolate(fraction).toString()
        this.message7 = curve7.interpolate(fraction).toString()
        this.message8 = curve8.interpolate(fraction).toString()
        this.message9 = curve9.interpolate(fraction).toString()
        this.message10 = curve10.interpolate(fraction).toString()
        this.message11 = curve11.interpolate(fraction).toString()
        this.message12 = curve12.interpolate(fraction).toString()
        this.message13 = curve13.interpolate(fraction).toString()
        this.message14 = curve14.interpolate(fraction).toString()
        this.message15 = curve15.interpolate(fraction).toString()
        this.message16 = curve16.interpolate(fraction).toString()
        this.message17 = curve17.interpolate(fraction).toString()
        this.message18 = curve18.interpolate(fraction).toString()
        this.message19 = curve19.interpolate(fraction).toString()
        this.message20 = curve20.interpolate(fraction).toString()
        this.message21 = curve21.interpolate(fraction).toString()
    }
}
