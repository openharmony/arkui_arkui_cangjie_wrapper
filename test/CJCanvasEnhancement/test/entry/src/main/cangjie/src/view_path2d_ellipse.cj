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
class ViewPath2DEllipse {
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
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("path2DEllipseNormal1").onReady({
                    =>
                    let path = Path2D()
                    path.ellipse(100.0, 75.0, 60.0, 40.0, 0.0, 0.0, 3.14159 * 0.5, counterclockwise: true)
                    this.context.fillStyle = 0x008000
                    this.context.fill(path)
                })
                Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("path2DEllipseNormal2").onReady({
                    =>
                    let path = Path2D()
                    path.ellipse(-10.0, -10.0, 60.0, 40.0, 0.0, 0.0, 3.14159 * 0.5, counterclockwise: false)
                    this.context2.strokeStyle = 0x0000ff
                    this.context2.stroke(path)
                })
                Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("path2DEllipseException1").onReady({
                    =>
                    let path = Path2D()
                    path.ellipse(100.0, 75.0, -60.0, -40.0, 0.0, 0.0, 3.14159 * 0.5, counterclockwise: true)
                    this.context3.fillStyle = 0xff0000
                    this.context3.fill(path)
                })
                Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("path2DEllipseBoundary1").onReady({
                    =>
                    let path = Path2D()
                    path.ellipse(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                    this.context4.strokeStyle = 0x008000
                    this.context4.stroke(path)
                })
                Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("path2DEllipseNone").onReady({
                    =>
                    let path = Path2D()
                    path.ellipse(-10.0, -10.0, 60.0, 40.0, 0.0, 0.0, 3.14159 * 0.5, counterclockwise: Option.None)
                    this.context5.strokeStyle = 0x008000
                    this.context5.stroke(path)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
