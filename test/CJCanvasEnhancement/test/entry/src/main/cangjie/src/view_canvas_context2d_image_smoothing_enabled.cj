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
class ViewCanvasContext2DImageSmoothingEnabled {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var settings2: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings2)
    var settings3: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings3)
    var settings4: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context4: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings4)
    
    var img: ImageBitmap = ImageBitmap("resource://RAWFILE/icon.png")
    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DImageSmoothingEnabledNormal1").onReady({
                =>
                this.context.imageSmoothingEnabled = true
                this.context.drawImage(this.img, 0.0, 0.0, 400.0, 200.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DImageSmoothingEnabledNormal2").onReady({
                =>
                this.context2.imageSmoothingEnabled = false
                this.context2.drawImage(this.img, 0.0, 0.0, 400.0, 200.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DImageSmoothingEnabledGet").onReady({
                =>
                this.context3.imageSmoothingEnabled = true
                this.context3.drawImage(this.img, 0.0, 0.0, 400.0, 200.0)
                let imageSmoothingEnabled = this.context3.imageSmoothingEnabled
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DImageSmoothingEnabledOptionNone").onReady({
                =>
                this.context4.imageSmoothingEnabled = Option<Bool>.None
                this.context4.drawImage(this.img, 0.0, 0.0, 400.0, 200.0)
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
