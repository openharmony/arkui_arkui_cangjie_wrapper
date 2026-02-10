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
class ViewCanvasContext2DFill {
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

    let path1 = Path2D()
    let path2 = Path2D()
    
    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillNormal").onReady({
                =>
                this.context.rect(30.0, 30.0, 80.0, 60.0)
                this.context.fill(fillRule: CanvasFillRule.EvenOdd)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillNone").onReady({
                =>
                this.context2.rect(30.0, 30.0, 80.0, 60.0)
                this.context2.fill(fillRule: Option.None)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillPathNormal1").onReady({
                =>
                this.path1.moveTo(30.0, 90.0)
                this.path1.lineTo(110.0, 20.0)
                this.path1.lineTo(240.0, 130.0)
                this.path1.lineTo(60.0, 130.0)
                this.path1.lineTo(190.0, 20.0)
                this.path1.lineTo(270.0, 90.0)
                this.path1.closePath()
                this.context3.fillStyle = Color(0X00ff00)
                this.context3.fill(this.path1, fillRule: CanvasFillRule.EvenOdd)
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillPathNormal2").onReady({
                =>
                this.context4.fillStyle = Color(0X00ff00)
                this.context4.fill(this.path2, fillRule: CanvasFillRule.NonZero)
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFillPathNone").onReady({
                =>
                this.context5.rect(30.0, 30.0, 80.0, 60.0)
                this.context5.fill(Option.None, fillRule: Option.None)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
