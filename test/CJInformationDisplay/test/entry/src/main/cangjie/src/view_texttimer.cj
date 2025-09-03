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
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class View_TextTimer {
    var textTimerController: TextTimerController = TextTimerController()

    @State
    var format: String = 'mm:ss.SS'

    var textTimerController2: TextTimerController = TextTimerController()

    var textTimerController3: TextTimerController = TextTimerController()

    var textTimerController4: TextTimerController = TextTimerController()

    func build() {
        Column {
            TextTimer(isCountDown: true, count: 30000, controller: this.textTimerController).format(this.format).
                fontColor(Color.Black).fontSize(50).fontFamily("HarmonyOS Sans").onTimer({
                utc, elapsedTime => Hilog.info(1,"1","time has been changed")
            }).id("textTimer")

            Row() {
                Button("start").onClick({
                    evt => this.textTimerController.start()
                }).id("start")
                Button("pause").onClick({
                    evt => this.textTimerController.pause()
                }).id("pause")
                Button("reset").onClick({
                    evt => this.textTimerController.reset()
                }).id("reset")
            }

            TextTimer(isCountDown: true, count: 20000, controller: this.textTimerController2).format(this.format).
                fontColor(@r(app.color.blue_23C452)).fontSize(50.0).fontFamily(@r(app.string.DEFAULT_FONT)).fontWeight(FontWeight.Normal).fontStyle(FontStyle.Normal).onTimer({
                utc, elapsedTime => Hilog.info(1,"1","time has been changed")
            })

            TextTimer(isCountDown: true, count: 10000, controller: this.textTimerController3).format(this.format).
                fontColor(16777222).fontSize(16.vp).fontFamily(@r(app.string.DEFAULT_FONT)).fontWeight(FontWeight.Normal).fontStyle(FontStyle.Normal).onTimer({
                utc, elapsedTime => Hilog.info(1,"1","time has been changed")
            })

            TextTimer(isCountDown: true, count: 10000, controller: this.textTimerController4).format(this.format).
                fontColor(Color.Black).fontSize(@r(app.string.font_size)).fontFamily(@r(app.string.DEFAULT_FONT)).fontWeight(FontWeight.Normal).fontStyle(FontStyle.Normal)
        }
    }
}
