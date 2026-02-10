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
class ViewCanvasContext2DDirection {
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
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DDirectionNormal1").onReady({
                =>
                this.context.font = '48px serif'
                this.context.textAlign = 'start'
                this.context.fillText("Hi default!", 200.0, 50.0)

                this.context.direction = "rtl"
                this.context.fillText("Hi rtl!", 200.0, 100.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DDirectionNormal2").onReady({
                =>
                this.context2.font = '48px serif'
                this.context2.textAlign = 'start'
                this.context2.fillText("Hi default!", 200.0, 50.0)

                this.context2.direction = "inherit"
                this.context2.fillText("Hi inherit!", 200.0, 100.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DDirectionExceptionValue1").onReady({
                =>
                this.context3.font = '48px serif'
                this.context3.textAlign = 'start'
                this.context3.fillText("Hi default!", 200.0, 50.0)

                this.context3.direction = "invalid"
                this.context3.fillText("Hi invalid!", 200.0, 100.0)
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DDirectionGet").onReady({
                =>
                this.context4.font = '48px serif'
                this.context4.textAlign = 'start'
                this.context4.fillText("Hi default!", 200.0, 50.0)

                this.context4.direction = "ltr"
                this.context4.fillText("Hi ltr!", 200.0, 100.0)
                let direction = this.context4.direction
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DDirectionOptionNone").onReady({
                =>
                this.context5.font = '48px serif'
                this.context5.textAlign = 'start'
                this.context5.fillText("Hi default!", 200.0, 50.0)

                this.context5.direction = Option.None
                this.context5.fillText("Hi none!", 200.0, 100.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
