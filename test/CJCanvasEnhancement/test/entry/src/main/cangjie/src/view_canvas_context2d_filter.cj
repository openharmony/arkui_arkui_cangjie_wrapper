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
class ViewCanvasContext2DFilter {
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

    var img: ImageBitmap = ImageBitmap("resource://RAWFILE/icon.png")
    
    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFilterNormal1").onReady({
                =>
                this.context.drawImage(this.img, 0.0, 0.0, 100.0, 100.0)

                this.context.filter = 'grayscale(50%)'
                this.context.drawImage(this.img, 100.0, 0.0, 100.0, 100.0)

                this.context.filter = 'sepia(60%)'
                this.context.drawImage(this.img, 200.0, 0.0, 100.0, 100.0)

                this.context.filter = 'saturate(30%)'
                this.context.drawImage(this.img, 0.0, 100.0, 100.0, 100.0)

                this.context.filter = 'hue-rotate(90deg)'
                this.context.drawImage(this.img, 100.0, 100.0, 100.0, 100.0)

                this.context.filter = 'invert(100%)'
                this.context.drawImage(this.img, 200.0, 100.0, 100.0, 100.0)
            })
            Canvas(this.context2).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFilterNormal2").onReady({
                =>
                this.context2.filter = 'opacity(25%)'
                this.context2.drawImage(img, 0.0, 0.0, 100.0, 100.0)

                this.context2.filter = 'brightness(0.4)'
                this.context2.drawImage(img, 100.0, 0.0, 100.0, 100.0)

                this.context2.filter = 'contrast(200%)'
                this.context2.drawImage(img, 200.0, 0.0, 100.0, 100.0)

                this.context2.filter = 'blur(5px)'
                this.context2.drawImage(img, 0.0, 100.0, 100.0, 100.0)

                // Applying multiple filters
                this.context2.filter = 'opacity(50%) contrast(200%) grayscale(50%)'
                this.context2.drawImage(img, 100.0, 100.0, 100.0, 100.0)
            })
            Canvas(this.context3).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFilterExceptionValue1").onReady({
                =>
                this.context3.drawImage(this.img, 0.0, 0.0, 100.0, 100.0)
                this.context3.filter = 'invalid'
                this.context3.drawImage(this.img, 100.0, 0.0, 100.0, 100.0)
            })
            Canvas(this.context4).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFilterGet").onReady({
                =>
                this.context4.drawImage(this.img, 0.0, 0.0, 100.0, 100.0)
                this.context4.filter = 'sepia(30%)'
                this.context4.drawImage(this.img, 100.0, 0.0, 100.0, 100.0)
                let filter = this.context4.filter
            })
            Canvas(this.context5).width(90.percent).height(200.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DFilterOptionNone").onReady({
                =>
                this.context5.drawImage(this.img, 0.0, 0.0, 100.0, 100.0)
                this.context5.filter = Option.None
                this.context5.drawImage(this.img, 100.0, 0.0, 100.0, 100.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
