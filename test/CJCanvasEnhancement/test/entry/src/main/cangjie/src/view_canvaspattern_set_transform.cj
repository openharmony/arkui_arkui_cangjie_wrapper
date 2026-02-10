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
class ViewCanvasPatternSetTransform {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    
    var settings2: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings2)
    
    var settings3: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings3)
    
    var img: ImageBitmap = ImageBitmap("resource://RAWFILE/icon.png")
    var matrix: Matrix2D = Matrix2D()

    func build() {
       Scroll() {
            Column(space: 10.0) {
                Canvas(this.context).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasPatternSetTransformNormal1").onReady({
                    =>
                    match (this.context.createPattern(this.img, Repetition.Repeat)) {
                        case Some(pattern) =>
                            this.matrix.scale(sx: 0.5, sy: 0.5)
                            this.matrix.translate(tx: 100.0, ty: 100.0)
                            pattern.setTransform(this.matrix)
                            this.context.fillStyle = pattern
                            this.context.fillRect(0.0, 0.0, 100.0, 100.0)
                        case None => ()
                    }
                })
                Canvas(this.context2).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasPatternSetTransformNormal2").onReady({
                    =>
                    match (this.context2.createPattern(this.img, Repetition.Repeat)) {
                        case Some(pattern) =>
                            pattern.setTransform(Matrix2D())
                            this.context2.fillStyle = pattern
                            this.context2.fillRect(0.0, 0.0, 100.0, 100.0)
                        case None => ()
                    }
                })
                Canvas(this.context3).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasPatternSetTransformNone").onReady({
                    =>
                    match (this.context3.createPattern(this.img, Repetition.Repeat)) {
                        case Some(pattern) =>
                            pattern.setTransform(Option.None)
                            this.context3.fillStyle = pattern
                            this.context3.fillRect(0.0, 0.0, 100.0, 100.0)
                        case None => ()
                    }
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
