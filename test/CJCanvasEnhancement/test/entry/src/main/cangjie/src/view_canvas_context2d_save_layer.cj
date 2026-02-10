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
class ViewCanvasContext2DSaveLayer {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DSaveLayer").onReady({
                =>
                this.context.fillStyle = Color(0x0000ff)
                this.context.fillRect(50.0,100.0,300.0,100.0)
                this.context.fillStyle = Color(0x00ffff)
                this.context.fillRect(50.0,150.0,300.0,100.0)
                this.context.globalCompositeOperation = 'destination-over'
                this.context.saveLayer()
                this.context.globalCompositeOperation = 'source-over'
                this.context.fillStyle = Color(0xff0000)
                this.context.fillRect(100.0,50.0,100.0,300.0)
                this.context.fillStyle = Color(0x00ff00)
                this.context.fillRect(150.0,50.0,100.0,300.0)
                this.context.restoreLayer()
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
