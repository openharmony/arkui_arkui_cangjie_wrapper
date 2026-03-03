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
class ViewCanvasContext2DMeasureText {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    @State var measureTextNormal1Width = "Default"
    @State var measureTextNormal1Height = "Default"
    
    @State var measureTextBoundary1Width = "Default"
    @State var measureTextBoundary1Height = "Default"
    
    @State var measureTextNone1Width = "Default"
    @State var measureTextNone1Height = "Default"
    func build() {
       Scroll() {
            Column(space: 10.0) {
            Text(measureTextNormal1Width).id("measureTextNormal1Width")
            Text(measureTextNormal1Height).id("measureTextNormal1Height")
            Text(measureTextBoundary1Width).id("measureTextBoundary1Width")
            Text(measureTextBoundary1Height).id("measureTextBoundary1Height")
            Text(measureTextNone1Width).id("measureTextNone1Width")
            Text(measureTextNone1Height).id("measureTextNone1Height")
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DMeasureText").onReady({
                =>
                this.context.fillText("Hello", 20.0, 50.0)
            })
            Button().onClick({ evt
                =>
                var textMetrics: TextMetrics = this.context.measureText("Hello")
                this.measureTextNormal1Width = textMetrics.width.toString()
                this.measureTextNormal1Height = textMetrics.height.toString()
            }).id("canvasContext2DMeasureTextNormal1")
            
            Button().onClick({ evt
                =>
                var textMetrics: TextMetrics = this.context.measureText("")
                this.measureTextBoundary1Width = textMetrics.width.toString()
                this.measureTextBoundary1Height = textMetrics.height.toString()
            }).id("canvasContext2DMeasureTextBoundaryValue1")
            
            Button().onClick({ evt
                =>
                var textMetrics: TextMetrics = this.context.measureText(Option.None)
                this.measureTextNone1Width = textMetrics.width.toString()
                this.measureTextNone1Height = textMetrics.height.toString()
            }).id("canvasContext2DMeasureTextOptionNone")
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
