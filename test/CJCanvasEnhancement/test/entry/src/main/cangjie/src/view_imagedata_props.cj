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
class ViewImageDataProps {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    var img: ImageBitmap = ImageBitmap(base64Url)
    var width: String = "Default"
    var height: String = "Default"
    var data: String = "Default"
    func build() {
       Scroll() {
            Column(space: 10.0) {
                Text(width).id("ImageDataPropsWidth")
                Text(height).id("ImageDataPropsHeight")
                Text(data).id("ImageDataPropsData")
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("imageDataProps").onReady({
                    =>
                    this.context.drawImage(this.img, 0.0, 0.0, 130.0, 130.0)
                    let imageData = this.context.getImageData(50.0, 50.0, 130.0, 130.0)
                    this.context.putImageData(imageData, 150.0, 150.0)
                    this.width = imageData.width.toString()
                    this.height = imageData.height.toString()
                    this.data = imageData.data.toString()
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
