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
class ViewCanvasContext2DCreateConicGradient {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    var settings2: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings2)
    
    var settings3: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings3)
    
    func build() {
        Scroll() {
            Column(space: 10.0) {
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DCreateConicGradientNormal1").onReady({
                    =>
                    let grad = this.context.createConicGradient(0.0, 100.0, 75.0)
                    grad.addColorStop(0.0, 0xff0000)
                    grad.addColorStop(0.5, 0x00ff00)
                    grad.addColorStop(1.0, 0x0000ff)
                    this.context.fillStyle = grad
                    this.context.arc(100.0, 75.0, 60.0, 0.0, 3.14159 * 2.0, counterclockwise: false)
                    this.context.fill()
                })
                Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DCreateConicGradientNormal2").onReady({
                    =>
                    let grad = this.context2.createConicGradient(-3.14 * 0.5, -10.0, -7.5)
                    grad.addColorStop(0.0, 0xff0000)
                    grad.addColorStop(0.5, 0x00ff00)
                    grad.addColorStop(1.0, 0x0000ff)
                    this.context2.fillStyle = grad
                    this.context2.arc(100.0, 75.0, 60.0, 0.0, 3.14159 * 2.0, counterclockwise: false)
                    this.context2.fill()
                })
                Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DCreateConicGradientNone").onReady({
                    =>
                    let grad = this.context3.createConicGradient(Option.None, Option.None, Option.None)
                    grad.addColorStop(0.0, 0xff0000)
                    grad.addColorStop(0.5, 0x00ff00)
                    grad.addColorStop(1.0, 0x0000ff)
                    this.context3.fillStyle = grad
                    this.context3.arc(100.0, 75.0, 60.0, 0.0, 3.14159 * 2.0, counterclockwise: false)
                    this.context3.fill()
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
