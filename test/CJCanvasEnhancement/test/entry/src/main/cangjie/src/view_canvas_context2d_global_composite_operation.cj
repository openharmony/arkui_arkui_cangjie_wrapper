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
class ViewCanvasContext2DGlobalCompositeOperation {
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
    var settings6: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context6: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings6)

    func build() {
       Scroll() {
            Column(space: 10.0) {
            Canvas(this.context).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalCompositeOperationNormal1").onReady({
                =>
                this.context.fillStyle = Color(39, 135, 217)
                this.context.fillRect(25.0, 25.0, 75.0, 75.0) // 原有图形
                this.context.globalCompositeOperation = 'source-over' // 默认值，可省略
                this.context.fillStyle = Color(23, 169, 141)
                this.context.fillRect(75.0, 75.0, 75.0, 75.0) // 新图形覆盖
            })
            Canvas(this.context2).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalCompositeOperationNormal2").onReady({
                =>
                // 先绘制背景
                this.context2.fillStyle = Color(39,135,217)
                this.context2.fillRect(0.0, 0.0, 200.0, 150.0)
                // 设置合成模式为擦除
                this.context2.globalCompositeOperation = 'destination-out'
                // 绘制圆形作为橡皮擦
                this.context2.beginPath()
                this.context2.arc(100.0, 150.0, 60.0, 0.0, 3.14 * 2.0)
                this.context2.fill() // 擦除圆形区域的背景
            })
            Canvas(this.context3).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalCompositeOperationNormal3").onReady({
                =>
                // 先绘制原有图形（圆形蒙版）
                this.context3.beginPath()
                this.context3.arc(this.context3.width / 2.0, this.context3.height / 2.0, 80.0, 0.0, 3.14 * 2.0)
                this.context3.fillStyle = Color.White
                this.context3.fill()
                // 设置合成模式
                this.context3.globalCompositeOperation = 'source-in'
                // 绘制新图形（渐变矩形）
                let gradient = this.context3.createLinearGradient(0.0, 0.0, this.context3.width, this.context3.height)
                gradient.addColorStop(0.0, Color(23,169,141))
                gradient.addColorStop(1.0, Color(39,135,217))
                this.context3.fillStyle = gradient
                this.context3.fillRect(0.0, 0.0, 200.0, 200.0) // 仅圆形区域显示渐变
            })
            Canvas(this.context4).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalCompositeOperationExceptionValue1").onReady({
                =>
                this.context4.fillStyle = Color(39, 135, 217)
                this.context4.fillRect(25.0, 25.0, 75.0, 75.0) // 原有图形
                this.context4.globalCompositeOperation = 'invalid' // 异常值
                this.context4.fillStyle = Color(23, 169, 141)
                this.context4.fillRect(75.0, 75.0, 75.0, 75.0) // 新图形覆盖
            })
            Canvas(this.context5).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalCompositeOperationGet").onReady({
                =>
                this.context5.fillStyle = Color(39, 135, 217)
                this.context5.fillRect(25.0, 25.0, 75.0, 75.0) // 原有图形
                this.context5.globalCompositeOperation = 'lighter'
                this.context5.fillStyle = Color(23, 169, 141)
                this.context5.fillRect(75.0, 75.0, 75.0, 75.0) // 新图形覆盖
                let globalCompositeOperation = this.context5.globalCompositeOperation
            })
            Canvas(this.context6).width(90.percent).height(150.00.vp).backgroundColor(0xf0f0f0).id("canvasContext2DGlobalCompositeOperationOptionNone").onReady({
                =>
                this.context6.fillStyle = Color(39, 135, 217)
                this.context6.fillRect(25.0, 25.0, 75.0, 75.0) // 原有图形
                this.context6.globalCompositeOperation = Option.None // None值
                this.context6.fillStyle = Color(23, 169, 141)
                this.context6.fillRect(75.0, 75.0, 75.0, 75.0) // 新图形覆盖
                })
            }.width(100.percent)
        }.width(100.percent).height(100.percent).id("scroller")
    }
}
