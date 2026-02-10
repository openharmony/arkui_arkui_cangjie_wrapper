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
class ViewCanvasContext2DLineWidth {
    var settings1: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context1: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings1)
    
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
    
    var settings8: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context8: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings8)

    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context1).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidth").onReady({
                =>
                this.context1.lineWidth = 5.0
                this.context1.strokeRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidthNone").onReady({
                =>
                this.context2.lineWidth = Option<Float64>.None
                this.context2.strokeRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidthGet").onReady({
                =>
                this.context3.lineWidth = 5.0
                this.context3.strokeRect(10.0, 10.0, 80.0, 60.0)
                let none = this.context3.lineWidth
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidthExceptionValue1").onReady({
                =>
                this.context4.lineWidth = 0.0
                this.context4.strokeRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidthExceptionValue2").onReady({
                =>
                this.context5.lineWidth = -1.0
                this.context5.strokeRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context6).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidthBoundaryValue1").onReady({
                =>
                this.context6.lineWidth = 0.5
                this.context6.strokeRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context7).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidthBoundaryValue2").onReady({
                =>
                this.context7.lineWidth = 100.0
                this.context7.strokeRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context8).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DLineWidthNoCall").onReady({
                =>
                this.context8.strokeRect(10.0, 10.0, 80.0, 60.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
