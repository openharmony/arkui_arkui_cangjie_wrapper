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
class ViewMatrix2DScale {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    
    var settings2: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings2)
    
    var settings3: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings3)
    
    var settings4: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context4: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings4)

    func build() {
       Scroll() {
            Column(space: 10.0) {
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).onReady({
                    =>
                    
                    this.context.fillRect(50.0, 50.0, 50.0, 50.0)
                })
                Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("matrix2DScaleNormal1").onReady({
                    =>
                    let matrix: Matrix2D = Matrix2D()
                    matrix.scaleX = 1.0
                    matrix.scaleY = 1.0
                    matrix.rotateX = 0.0
                    matrix.rotateY = 0.0
                    matrix.translateX = 0.0
                    matrix.translateY = 0.0
                    
                    matrix.scale(sx: 1.5, sy: 1.5)
                    this.context2.setTransform(matrix)
                    this.context2.fillRect(50.0, 50.0, 50.0, 50.0)
                })
                Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("matrix2DScaleNormal2").onReady({
                    =>
                    let matrix: Matrix2D = Matrix2D()
                    matrix.scaleX = 1.0
                    matrix.scaleY = 1.0
                    matrix.rotateX = 0.0
                    matrix.rotateY = 0.0
                    matrix.translateX = 0.0
                    matrix.translateY = 0.0
                    
                    matrix.scale(sx: -1.5, sy: -1.5)
                    this.context3.setTransform(matrix)
                    this.context3.fillRect(50.0, 50.0, 50.0, 50.0)
                })
                Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("matrix2DScaleNone").onReady({
                    =>
                    let matrix: Matrix2D = Matrix2D()
                    matrix.scaleX = 1.0
                    matrix.scaleY = 1.0
                    matrix.rotateX = 0.0
                    matrix.rotateY = 0.0
                    matrix.translateX = 0.0
                    matrix.translateY = 0.0
                    
                    matrix.scale(sx: Option.None, sy: Option.None)
                    this.context4.setTransform(matrix)
                    this.context4.fillRect(50.0, 50.0, 50.0, 50.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
