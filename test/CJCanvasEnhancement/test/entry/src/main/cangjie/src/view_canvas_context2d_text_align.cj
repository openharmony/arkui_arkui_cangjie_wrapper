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

@Entry
@Component
class ViewCanvasContext2DTextAlign {
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

    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DTextAlign").onReady({
                =>
                this.context.strokeStyle = Color.Red
                this.context.moveTo(140.0, 10.0)
                this.context.lineTo(140.0, 160.0)
                this.context.stroke()
                this.context.font = "50px sans-serif"
                this.context.textAlign = "center"
                this.context.fillText("textAlign = center", 140.0, 60.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DTextAlign2").onReady({
                =>
                this.context2.strokeStyle = Color.Red
                this.context2.moveTo(140.0, 10.0)
                this.context2.lineTo(140.0, 160.0)
                this.context2.stroke()
                this.context2.font = "50px sans-serif"
                this.context2.textAlign = "right"
                this.context2.fillText("textAlign = right", 140.0, 60.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DTextAlignExceptionValue1").onReady({
                =>
                this.context3.strokeStyle = Color.Red
                this.context3.moveTo(140.0, 10.0)
                this.context3.lineTo(140.0, 160.0)
                this.context3.stroke()
                this.context3.font = "50px sans-serif"
                this.context3.textAlign = "invalid"
                this.context3.fillText("textAlign = invalid", 140.0, 60.0)
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DTextAlignGet").onReady({
                =>
                this.context4.strokeStyle = Color.Red
                this.context4.moveTo(140.0, 10.0)
                this.context4.lineTo(140.0, 160.0)
                this.context4.stroke()
                this.context4.font = "50px sans-serif"
                this.context4.textAlign = "left"
                this.context4.fillText("textAlign = left", 140.0, 60.0)
                let textAlign = this.context4.textAlign
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DTextAlignOptionNone").onReady({
                =>
                this.context5.strokeStyle = Color.Red
                this.context5.moveTo(140.0, 10.0)
                this.context5.lineTo(140.0, 160.0)
                this.context5.stroke()
                this.context5.font = "50px sans-serif"
                this.context5.textAlign = Option.None
                this.context5.fillText("textAlign = OptionNone", 140.0, 60.0)
                let textAlign = this.context5.textAlign
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
