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
class ViewCanvasContext2DLineJoin {
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
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineJoin").onReady({
                =>
                this.context.beginPath()
                this.context.lineWidth = 8.0
                this.context.lineJoin = "round"
                this.context.moveTo(30.0, 30.0)
                this.context.lineTo(120.0, 60.0)
                this.context.lineTo(30.0, 110.0)
                this.context.stroke()
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineJoin2").onReady({
                =>
                this.context2.beginPath()
                this.context2.lineWidth = 8.0
                this.context2.lineJoin = "bevel"
                this.context2.moveTo(30.0, 30.0)
                this.context2.lineTo(120.0, 60.0)
                this.context2.lineTo(30.0, 110.0)
                this.context2.stroke()
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineJoinExceptionValue1").onReady({
                =>
                this.context3.beginPath()
                this.context3.lineWidth = 8.0
                this.context3.lineJoin = "invalid"
                this.context3.moveTo(30.0, 30.0)
                this.context3.lineTo(120.0, 60.0)
                this.context3.lineTo(30.0, 110.0)
                this.context3.stroke()
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineJoinGet").onReady({
                =>
                this.context4.beginPath()
                this.context4.lineWidth = 8.0
                this.context4.lineJoin = "miter"
                this.context4.moveTo(30.0, 30.0)
                this.context4.lineTo(120.0, 60.0)
                this.context4.lineTo(30.0, 110.0)
                this.context4.stroke()
                let lineJoin = this.context4.lineJoin
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineJoinOptionNone").onReady({
                =>
                this.context5.beginPath()
                this.context5.lineWidth = 8.0
                this.context5.lineJoin = Option.None
                this.context5.moveTo(30.0, 30.0)
                this.context5.lineTo(120.0, 60.0)
                this.context5.lineTo(30.0, 110.0)
                this.context5.stroke()
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
