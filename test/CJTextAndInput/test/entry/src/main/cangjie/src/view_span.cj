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

///**
// * Created on 2024/6/17
// */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.*
import std.collection.*
import kit.LocalizationKit.*

@Entry
@Component
class View_Span {
    @State
    var message: Int32 = 0
    @State
    var text1: String = "text1"
    var textShadowsArray: Array<ShadowOptions> = [
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: Color.Red),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 20.0, offsetY: 0.0, color: Color.Black),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 30.0, offsetY: 0.0, color: Color.Blue),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 40.0, offsetY: 0.0, color: Color.Green),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: 0xFFFFFF),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 40.0, offsetY: 0.0, color: @r(app.color.start_window_background))
    ]
    let textShadows = ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, offsetX: 10.0, offsetY: 0.0,
        color: Color.Red, fill: false)
    var shadowoptions: Array<ShadowOptions> = [ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0,
        offsetY: 3.0, color: @r(app.color.start_window_background), fill: true),
        ShadowOptions(radius: 20.0, shadowType: ShadowType.Color, offsetX: 20.0, offsetY: 0.0, color: 0xff000000,
        fill: true)]

    func build() {
        Column {
            Text() {
                Span("This is the Span component")
                    .fontSize(12)
                    .textCase(TextCase.Normal)
                    .decoration(decorationType: TextDecorationType.None, color: Color.Red)
                    .letterSpacing(1.vp)
                Span(@r(app.string.span_test))
                    .fontSize(12.5)
                    .fontColor(Color.Blue)
                Span(@r(app.string.span_test))
                    .fontSize(@r(app.string.span_test_font_size))
                    .fontColor(0x123456)
                    .fontFamily("Arial")
                Span("test")
                    .fontColor(0x000000)
                    .fontWeight(FontWeight.Bold)
                    .fontFamily(@r(app.string.Arial))
                    .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red)
                    .letterSpacing(@r(app.string.distance))
                Span(@r(app.plural.eat_apple, 5, 5)).fontColor(@r(app.color.blue_color))
                Span(@r(app.string.span_test))
                    .fontSize(12)
                Span("This is the Span component")
                    .fontSize(12)
                Span("Test span font")
                    .fontSize(12)
            }

            Text() {
                Span(@r(app.string.span_test))
                    .fontColor(@r(app.color.start_window_background))
                    .fontStyle(FontStyle.Italic)
                    .decoration(decorationType: TextDecorationType.LineThrough,
                        color: @r(app.color.start_window_background))
                    .onClick({event => Hilog.info(1,"1","Cangjie-Test", text1)})
            }.id("spanComponent2")
        }.height(100.percent)
    }
}
