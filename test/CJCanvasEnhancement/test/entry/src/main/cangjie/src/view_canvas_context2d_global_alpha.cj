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
class ViewCanvasContext2DGlobalAlpha {
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
    var settings7: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context7: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings7)

    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalAlpha").onReady({
                =>
                this.context.fillStyle = Color.Blue
                this.context.fillRect(0.0, 0.0, 50.0, 50.0)
                this.context.globalAlpha = 0.5
                this.context.fillStyle = Color.Blue
                this.context.fillRect(50.0, 50.0, 50.0, 50.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalAlphaExceptionValue1").onReady({
                =>
                this.context2.fillStyle = Color.Blue
                this.context2.fillRect(0.0, 0.0, 50.0, 50.0)
                this.context2.globalAlpha = -1.0
                this.context2.fillStyle = Color.Blue
                this.context2.fillRect(50.0, 50.0, 50.0, 50.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalAlphaExceptionValue2").onReady({
                =>
                this.context3.fillStyle = Color.Blue
                this.context3.fillRect(0.0, 0.0, 50.0, 50.0)
                this.context3.globalAlpha = 3.0
                this.context3.fillStyle = Color.Blue
                this.context3.fillRect(50.0, 50.0, 50.0, 50.0)
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalAlphaGet").onReady({
                =>
                this.context4.fillStyle = Color.Blue
                this.context4.fillRect(0.0, 0.0, 50.0, 50.0)
                this.context4.globalAlpha = 1.0
                this.context4.fillStyle = Color.Blue
                this.context4.fillRect(50.0, 50.0, 50.0, 50.0)
                let globalAlpha = this.context4.globalAlpha
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalAlphaOptionNone").onReady({
                =>
                this.context5.fillStyle = Color.Blue
                this.context5.fillRect(0.0, 0.0, 50.0, 50.0)
                this.context5.globalAlpha = Option.None
                this.context5.fillStyle = Color.Blue
                this.context5.fillRect(50.0, 50.0, 50.0, 50.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
