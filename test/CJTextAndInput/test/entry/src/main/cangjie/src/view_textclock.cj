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
import ohos.resource_manager.*
import std.collection.*

@Entry
@Component
class ViewTextClock {
    @State
    var controller: TextClockController = TextClockController()
    @State
    var accumulateTime: Int64 = 0
    @State
    var textShadows: Array<ShadowOptions> = [
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: Color.Red),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 20.0, offsetY: 0.0, color: Color.Black),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 30.0, offsetY: 0.0, color: Color.Blue),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 40.0, offsetY: 0.0, color: Color.Green),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: 0xFFFFFF),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 40.0, offsetY: 0.0, color: @r(app.color.start_window_background))
    ]
    let shwdowOption = ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, offsetX: 10.0, offsetY: 0.0,
        color: Color.Red, fill: false)
    let shwdowOption1 = ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0,
        color: @r(app.media.app_icon), fill: true)
    var shadowoptions: Array<ShadowOptions> = [ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0,
        offsetY: 0.0, color: 0xffff0000, fill: true),
        ShadowOptions(radius: 20.0, shadowType: ShadowType.Color, offsetX: 20.0, offsetY: 0.0, color: 0xff000000,
        fill: true)]
    let numericOption = DateTimeOptions(hour: "numeric")
    let digitOption = DateTimeOptions(hour: "2-digit")

    func build() {
        Column() {
            Text("Current milliseconds is ${this.accumulateTime}").fontSize(20)
            // 以12小时制显示东八区的系统时间，精确到秒。
            TextClock(timeZoneOffset: -8.0, controller: this.controller)
                .format("aa hh:mm:ss")
                .onDateChange({
                    value: Int64 => accumulateTime = value
                })
                .margin(20)
                .fontSize(30)
                .fontColor(@r(app.color.start_window_background))
                .textShadow(ShadowOptions(radius: 10.0))
                .textShadow(ShadowOptions(radius: 10.0, offsetX: 10.0, offsetY: 0.0, color: 0xFFFFFF))
                .fontFamily(@r(app.string.EntryAbility_label))
                .textShadow(textShadows)
                .id("Text_clock1")

            TextClock(timeZoneOffset: 14.0, controller: this.controller)
                .onDateChange({
                    value: Int64 => accumulateTime = value
                })
                .margin(20)
                .fontSize(30.0)
                .textShadow(textShadows)
                .fontColor(0xFFFFFF)
                .textShadow(ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: @r(app.color.start_window_background)))
                .fontSize(@r(app.string.size_desc))
                .id("Text_clock2")

            TextClock(timeZoneOffset: 12.0, controller: this.controller)
                .onDateChange({
                    value: Int64 => accumulateTime = value
                })
                .margin(20)
                .textShadow(ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: Color.Red))
                .id("Text_clock3")

            Button("start TextClock").margin(bottom: 10).onClick({
                e =>
                // 启动文本时钟
                controller.start()
            }).id("start")
            Button("stop TextClock").onClick({
                e =>
                // 停止文本时钟
                this.controller.stop()
            }).id("stop")
            TextClock(timeZoneOffset: 1.0).textShadow(shwdowOption).format("HH:mm:ss").fontSize(20.fp).id("Text_clock4")
            TextClock(timeZoneOffset: 1.0).textShadow(shwdowOption1).format("aa hh:mm:ss").fontSize(21).id("Text_clock5")
            TextClock(timeZoneOffset: -1.0).textShadow(shadowoptions).format("HH:mm").fontSize(25.0).id("Text_clock6")
            TextClock().fontSize(@r(app.string.size_desc)).fontColor(Color.Red).id("Text_clock7")
            TextClock().fontColor(@r(app.media.app_icon)).id("Text_clock8")
            TextClock().fontColor(0xff000000).id("Text_clock9")
            TextClock().fontStyle(FontStyle.Italic).id("Text_clock10")
            TextClock().fontStyle(FontStyle.Normal).id("Text_clock11")
            TextClock().fontWeight(FontWeight.Normal).id("Text_clock12")
            TextClock().fontWeight(FontWeight.Bold).id("Text_clock14")
            TextClock().fontWeight(FontWeight.Bolder).id("Text_clock16")
            TextClock().fontWeight(FontWeight.Lighter).id("Text_clock18")
            TextClock().fontWeight(FontWeight.Medium).id("Text_clock20")
            TextClock().fontWeight(FontWeight.Regular).id("Text_clock22")
        }.width(100.percent).padding(top: 5)
    }
}
