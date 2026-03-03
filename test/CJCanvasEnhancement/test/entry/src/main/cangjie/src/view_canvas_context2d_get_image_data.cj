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
class ViewCanvasContext2DGetImageData {
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
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetImageDataNormal1").onReady({
                    =>
                    this.context.drawImage(this.img, 0.0, 0.0, 130.0, 130.0)
                    let imageData = this.context.getImageData(50.0, 50.0, 130.0, 130.0)
                    this.context.putImageData(imageData, 150.0, 150.0)
                })
                Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetImageDataNormal2").onReady({
                    =>
                    this.context2.drawImage(this.img, 0.0, 0.0, 130.0, 130.0)
                    let imageData = this.context2.getImageData(-10.0, -10.0, 130.0, 130.0)
                    this.context2.putImageData(imageData, 150.0, 150.0)
                })
                Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetImageDataException1").onReady({
                    =>
                    this.context3.drawImage(this.img, 0.0, 0.0, 130.0, 130.0)
                    let imageData = this.context3.getImageData(50.0, 50.0, -130.0, -130.0)
                    this.context3.putImageData(imageData, 150.0, 150.0)
                })
                Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetImageDataException2").onReady({
                    =>
                    this.context4.drawImage(this.img, 0.0, 0.0, 130.0, 130.0)
                    let imageData = this.context4.getImageData(50.0, 50.0, 0.0, 0.0)
                    this.context4.putImageData(imageData, 150.0, 150.0)
                })
                Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetImageDataNone").onReady({
                    =>
                    this.context5.drawImage(this.img, 0.0, 0.0, 130.0, 130.0)
                    let imageData = this.context5.getImageData(50.0, 50.0, 0.0, 0.0)
                    this.context5.putImageData(imageData, 150.0, 150.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
