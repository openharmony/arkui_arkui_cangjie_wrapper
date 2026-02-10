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
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.Size

@Entry
@Component
class ViewCanvasContext2DGetPixelMap {
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

    var img: ImageBitmap = ImageBitmap(base64Url)
    
    func build() {
       Scroll() {
            Column(space: 10.0) {
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetPixelMapNormal1").onReady({
                    =>
                    this.context.drawImage(this.img, 100.0, 100.0, 130.0, 130.0)
                    let pixelmap = this.context.getPixelMap(150.0, 150.0, 130.0, 130.0)
                    this.context.setPixelMap(pixelmap)
                })
                Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetPixelMapNormal2").onReady({
                    =>
                    this.context2.drawImage(this.img, 100.0, 100.0, 130.0, 130.0)
                    let pixelmap = this.context2.getPixelMap(-10.0, -10.0, 260.0, 260.0)
                    this.context2.setPixelMap(pixelmap)
                })
                Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetPixelMapException1").onReady({
                    =>
                    this.context3.drawImage(this.img, 100.0, 100.0, 130.0, 130.0)
                    let pixelmap = this.context3.getPixelMap(150.0, 150.0, 0.0, 0.0)
                    this.context3.setPixelMap(pixelmap)
                })
                Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetPixelMapException2").onReady({
                    =>
                    this.context4.drawImage(this.img, 100.0, 100.0, 130.0, 130.0)
                    let pixelmap = this.context4.getPixelMap(150.0, 150.0, -130.0, -130.0)
                    this.context4.setPixelMap(pixelmap)
                })
                Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetPixelMapNone").onReady({
                    =>
                    this.context5.drawImage(this.img, 100.0, 100.0, 130.0, 130.0)
                    let pixelmap = this.context5.getPixelMap(Option.None, Option.None, Option.None, Option.None)
                    this.context5.setPixelMap(pixelmap)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
