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
class ViewCanvasInitOnReady {
    var settings1: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context1: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings1)
    
    var settings2: RenderingContextSettings = RenderingContextSettings(antialias: false)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings2)
    
    var settings3: RenderingContextSettings = RenderingContextSettings()
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings3)

    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context1).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasInitTrue").onReady({
                =>
                this.context1.fillStyle = 0x0000ff
                this.context1.fillRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasInitFalse").onReady({
                =>
                this.context2.fillStyle = 0x0000ff
                this.context2.fillRect(10.0, 10.0, 80.0, 60.0)
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasInitOnReadyNone").onReady(Option.None)
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
