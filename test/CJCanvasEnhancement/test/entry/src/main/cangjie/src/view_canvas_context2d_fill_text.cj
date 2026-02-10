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
class ViewCanvasContext2DFillText {
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
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillTextNormal1").onReady({
                =>
                this.context.font = "20px sans-serif"
                this.context.fillText("Hello World", 20.0, 50.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillTextNormal2").onReady({
                =>
                this.context2.font = "20px sans-serif"
                this.context2.fillText("Hello World maxWidth = 50", 20.0, 50.0, maxWidth: 50.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillTextExceptionValue1").onReady({
                =>
                this.context3.font = "20px sans-serif"
                this.context3.fillText("Hello World", 20.0, 50.0, maxWidth: -50.0)
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillTextBoundaryValue1").onReady({
                =>
                this.context4.font = "20px sans-serif"
                this.context4.fillText("", 20.0, 50.0)
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillTextBoundaryValue2").onReady({
                =>
                this.context5.font = "20px sans-serif"
                this.context5.fillText("Hello World", 20.0, 50.0, maxWidth: 0.0)
            })
            Canvas(this.context6).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillTextOptionNone").onReady({
                =>
                this.context6.font = "20px sans-serif"
                this.context6.fillText("Hello World maxWidth = None", 20.0, 50.0, maxWidth: Option<Float64>.None)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
