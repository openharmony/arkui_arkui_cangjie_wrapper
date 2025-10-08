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
class ViewTextTimer2 {
    var textTimerController: TextTimerController = TextTimerController()
    var shadowoption_arr: Array<ShadowOptions> = [ShadowOptions(radius: 10.0, offsetX: 10.0, offsetY: 0.0, color: Color.Red)]

    @State
    var format: String = "mm:ss.SS"
    @State
    var onTimerText: String = ""
    func build() {
        Column {
            Text(onTimerText)
                .size(width: 50.percent, height: 25.vp)
                .borderWidth(1)
                .borderColor(Color.Black)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .textAlign(TextAlign.Center)
                .fontSize(15)
                .margin(top: 20.vp)
                .id("onTimerText")

            TextTimer(isCountDown: true, count: 30000, controller: this.textTimerController)
                .format(this.format)
                .fontColor(0xFFFFFF)
                .fontSize(50)
                .fontStyle(FontStyle.Italic)
                .fontWeight(FontWeight.Bold)
                .fontFamily("HarmonyOS Sans")
                .textShadow(ShadowOptions(radius: 10.0, offsetX: 10.0, offsetY: 0.0, color: @r(app.color.start_window_background)))
                .onTimer({
                    utc, elapsedTime => onTimerText = "Time Change"
                })
                .id("TextTimer_1")

            TextTimer()
                .textShadow(ShadowOptions(radius: 10.0, offsetX: 10.0, offsetY: 0.0, color: Color.Red))
                .id("TextTimer_2")

            TextTimer()
                .textShadow(shadowoption_arr)
                .id("TextTimer_3")

            TextTimer()
                .textShadow(ShadowOptions(radius: 10.0, offsetX: 10.0, offsetY: 0.0, color: 0xa52a2a))
                .id("TextTimer_4")

            Row() {
                Button("start").onClick({
                    evt => this
                        .textTimerController
                        .start()
                }).id("start")
                Button("pause").onClick({
                    evt => this
                        .textTimerController
                        .pause()
                })
                Button("reset").onClick({
                    evt => this
                        .textTimerController
                        .reset()
                })
            }
        }
    }
}
