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
import ohos.resource.*

@Entry
@Component
class ViewCanvasContext2DShadowColor {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var settings2: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings2)
    var settings3: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings3)
    var settings4: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context4: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings4)
    var settings5: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context5: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings5)
    var settings6: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context6: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings6)

    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DShadowColorNormal1").onReady({
                =>
                this.context.shadowBlur = 20.0
                this.context.shadowColor = Color(0X88888888)
                this.context.fillStyle = Color(255,0,0) 
                this.context.fillRect(20.0, 20.0, 100.0, 80.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DShadowColorNormal2").onReady({
                =>
                this.context2.shadowBlur = 20.0
                this.context2.shadowColor = Color.Blue
                this.context2.fillStyle = Color(255,0,0) 
                this.context2.fillRect(20.0, 20.0, 100.0, 80.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DShadowColorNormal3").onReady({
                =>
                this.context3.shadowBlur = 20.0
                this.context3.shadowColor = Color.Transparent
                this.context3.fillStyle = Color(255,0,0) 
                this.context3.fillRect(20.0, 20.0, 100.0, 80.0)
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DShadowColorNormal4").onReady({
                =>
                this.context4.shadowBlur = 20.0
                this.context4.shadowColor = @r(app.color.blue_color)
                this.context4.fillStyle = Color(255,0,0) 
                this.context4.fillRect(20.0, 20.0, 100.0, 80.0)
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DShadowColorGet").onReady({
                =>
                this.context5.shadowBlur = 20.0
                this.context5.shadowColor = Color(0XFF00FFFF)
                this.context5.fillStyle = Color(255,0,0) 
                this.context5.fillRect(20.0, 20.0, 100.0, 80.0)
            })
            Canvas(this.context6).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DShadowColorOptionNone").onReady({
                =>
                this.context6.shadowBlur = 20.0
                this.context6.shadowColor = Option.None
                this.context6.fillStyle = Color(255,0,0) 
                this.context6.fillRect(20.0, 20.0, 100.0, 80.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
