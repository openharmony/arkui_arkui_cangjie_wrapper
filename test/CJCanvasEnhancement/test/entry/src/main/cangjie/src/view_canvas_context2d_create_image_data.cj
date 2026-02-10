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
class ViewCanvasContext2DCreateImageData {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    
    var settings2: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings2)
    
    var settings3: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings3)

    func build() {
        Scroll() {
            Column(space: 10.0) {
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DCreateImageData").onReady({
                    =>
                    let imageDataNum = this.context.createImageData(100.0, 100.0)
                    var s = imageDataNum.data
                    for (i in 0..s.size where i % 4 == 0) {
                        s[i + 0] = 255
                        s[i + 1] = 0
                        s[i + 2] = 255
                        s[i + 3] = 255
                    }
                    let data = ImageData(100.0, 100.0, data: s)
                    this.context.putImageData(data, 10, 10, 0, 0, 100, 50)
                })
                Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DCreateImageDataException").onReady({
                    =>
                    let imageDataNum = this.context2.createImageData(-100.0, -100.0)
                    var s = imageDataNum.data
                    for (i in 0..s.size where i % 4 == 0) {
                        s[i + 0] = 255
                        s[i + 1] = 0
                        s[i + 2] = 255
                        s[i + 3] = 255
                    }
                    let data = ImageData(100.0, 100.0, data: s)
                    this.context2.putImageData(data, 10, 10, 0, 0, 100, 50)
                })
                Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DCreateImageDataNone").onReady({
                    =>
                    let imageDataNum = this.context3.createImageData(Option.None, Option.None)
                    var s = imageDataNum.data
                    for (i in 0..s.size where i % 4 == 0) {
                        s[i + 0] = 255
                        s[i + 1] = 0
                        s[i + 2] = 255
                        s[i + 3] = 255
                    }
                    let data = ImageData(100.0, 100.0, data: s)
                    this.context3.putImageData(data, 10, 10, 0, 0, 100, 50)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
