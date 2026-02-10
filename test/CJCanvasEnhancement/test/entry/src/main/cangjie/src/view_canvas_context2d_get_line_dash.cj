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
class ViewCanvasContext2DGetLineDash {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    
    @State var lineDataString1: String = "Default"
    @State var lineDataString2: String = "Default"

    func build() {
       Scroll() {
            Column(space: 10.0) {
                Text(lineDataString1).id("getLineDashNormal1")
                Text(lineDataString2).id("getLineDashNormal2")
                Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGetLineDash")
                Button("").onClick({ evt =>
                    let dash = this.context.getLineDash()
                    lineDataString1 = dash.toString()
                }).id("getLineDashEmpty")
                Button("").onClick({ evt =>
                    this.context.setLineDash([5.0, 4.0])
                    this.context.strokeRect(10.0, 10.0, 100.0, 100.0)
                    let dash = this.context.getLineDash()
                    lineDataString2 = dash.toString()
                }).id("getLineDashLength2")
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
