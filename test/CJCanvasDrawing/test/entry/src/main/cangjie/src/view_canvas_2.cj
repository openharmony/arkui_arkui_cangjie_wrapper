/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import ohos.arkui.state_management.*
import ohos.arkui.component.*
import ohos.base.*
import ohos.arkui.state_macro_manage.*

extend Matrix2D {
    func toString() : String {
        return this.scaleX.toString() + " " +
        this.scaleY.toString() + " " +
        this.rotateX.toString() + " " +
        this.rotateY.toString() + " " +
        this.translateX.toString() + " " +
        this.translateY.toString()
    }
}

@Entry
@Component
class View_Canvas_2 {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context4: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context5: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context6: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context7: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context8: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private var img: ImageBitmap = ImageBitmap("resource://RAWFILE/icon.png")
    private var img2: ImageBitmap = ImageBitmap("resource://RAWFILE/icon.png")
    private var img3: ImageBitmap = ImageBitmap("resource://RAWFILE/icon.png")
    var matrix: Matrix2D = Matrix2D()
    var matrix2: Matrix2D = Matrix2D()
    var matrix3: Matrix2D = Matrix2D()
    var path: Path2D = Path2D("M250 150 L150 350 L350 350 Z")
    var path2: Path2D = Path2D()
    var pattern: CanvasPattern = this.context.createPattern(this.img3, Repetition.NoRepeat)

    @State
    var height_width1: String = ""
    @State
    var height_width2: String = ""
    @State
    var height_color: String = ""
    @State
    var size: String = ""
    @State
    var size1: String = ""
    @State
    var size2: String = ""
    @State
    var size3: String = ""
    @State
    var size4: String = ""
    @State
    var size5: String = ""
    @State
    var offscreenSize: String = ""

    func build() {
        Scroll() {
            Column() {
                Text(this.height_width1).id("height_width1")

                Canvas(this.context)
                    .width(100.percent)
                    .height(20.percent)
                    .backgroundColor(0xffff00)
                    .onReady(
                        {
                            =>
                            this.height_width1 = img.height.toString() + " " + img.width.toString()
                            this.context.drawImage(this.img, 10.0, 10.0)
                        }
                    )

                Canvas(this.context2)
                    .width(100.percent)
                    .height(20.percent)
                    .backgroundColor(0xffff00)
                    .onReady(
                        {
                            =>
                            this.context2.drawImage(this.img2, 10.0, 10.0)
                        }
                    )

                Text(this.height_width2).id("height_width2")

                Canvas(this.context3)
                    .width(100.percent)
                    .height(25.percent)
                    .backgroundColor(0xffff00)
                    .onReady(
                        {
                            =>
                            this.context3.fillStyle(0x00fff00)
                            this.context3.fillRect(0.0, 0.0, 100.0, 100.0)
                        }
                    )

                Text(this.height_color).id("height_color")

                Canvas(this.context4)
                    .height(20.percent)
                    .width(100.percent)
                    .backgroundColor(0xffff00)
                    .onReady({ =>
                          let imageDataNum = this.context.createImageData(100.0, 100.0)
                          var s = imageDataNum.data
                          for( i in 0..s.size where i % 4 == 0){
                              s[i + 0] = 255
                              s[i + 1] = 0
                              s[i + 2] = 255
                              s[i + 3] = 255
                          }
                          let data = ImageData(100.0, 100.0, data: s)
                          this.height_color = data.width.toString() + " " +data.data[0].toString()
                          let heig = data.height.toString()
                          this.context4.putImageData(data, 10.0, 10.0)
                          let data_white = ImageData(100.0, 100.0)
                          this.context4.putImageData(data_white, 150.0, 10.0, 0.0, 0.0, 50.0, 50.0)
                     })

                Text(this.size).id("size")
                Text(this.size1).id("size1")
                Text(this.size2).id("size2")
                Text(this.size3).id("size3")
                Text(this.size4).id("size4")
                Text(this.size5).id("size5")

                Canvas(this.context5)
                    .height(240.vp)
                    .width(240.vp)
                    .backgroundColor(0xffff00)
                    .onReady({ =>
                        this.context5.fillRect(100.0, 20.0, 50.0, 50.0)
                        this.matrix.scaleX = 1.0
                        this.matrix.scaleY = 1.0
                        this.matrix.rotateX = -0.5
                        this.matrix.rotateY = 0.5
                        this.matrix.translateX = 10.0
                        this.matrix.translateY = 10.0
                        this.context5.setTransform(this.matrix)
                        this.context5.fillRect(100.0, 20.0, 50.0, 50.0)
                        this.size = this.matrix.toString()

                        this.matrix.invert()
                        this.size1 = this.matrix.toString()

                        this.matrix.identity()
                        this.size2 = this.matrix.toString()

                        this.matrix.translate(tx:100.0, ty:100.0)
                        this.size3 = this.matrix.toString()

                        this.matrix.scale(sx: 0.5, sy: 0.5)
                        this.size4 = this.matrix.toString()

                        this.matrix.rotate(-60.0 * 3.14 / 180.0, rx:5.0, ry:5.0)
                        this.size5 = this.matrix.toString()
                     })

                Canvas(this.context6)
                    .width(100.percent)
                    .height(25.percent)
                    .backgroundColor(0xffff00)
                    .onReady(
                        {=>
                        this.matrix2.scaleX = 1.0
                        this.matrix2.scaleY = 1.0
                        this.matrix2.rotateX = -0.5
                        this.matrix2.rotateY = 0.5
                        this.matrix2.translateX = 10.0
                        this.matrix2.translateY = 10.0
                        this.path2.addPath(this.path)
                        this.context6.stroke(this.path2)
                        }
                    )
                Button("Click to set transform")
                .width(45.percent)
                .margin(5.px)
                .onClick(
                    {
                        _ =>
                        this.matrix3.scaleY = 1.0
                        this.matrix3.scaleX = 1.0
                        this.matrix3.translateX = 50.0
                        this.matrix3.translateY = 200.0
                        this.pattern.setTransform(this.matrix3)
                        this.context7.fillRect(0.0, 0.0, 480.0, 720.0)
                    }
                )
                Canvas(this.context7)
                .width(100.percent)
                .height(60.percent)
                .backgroundColor(0xffffff)
                .onReady(
                    {
                        =>
                        this.pattern = this.context.createPattern(this.img3, Repetition.NoRepeat)
                        this.matrix3.scaleY = 0.5
                        this.matrix3.scaleX = 0.5
                        this.matrix3.translateX = 50.0
                        this.matrix3.translateY = 50.0
                        this.context7.fillStyle(pattern)
                        this.pattern.setTransform(this.matrix3)
                        this.context7.fillRect(0.0, 0.0, 480.0, 720.0)
                    }
                )

            }
        }
    }
}
