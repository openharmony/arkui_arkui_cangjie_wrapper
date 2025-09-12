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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
//
import ohos.resource_manager.*
import ohos.arkui.state_macro_manage.*
import ohos.multimedia.image.*

@Entry
@Component
class ViewCanvasRenderingContext2D {
    private let settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    private let context1: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context3: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context4: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context5: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context6: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context7: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context8: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context9: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context10: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context11: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context12: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context13: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context14: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context15: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context16: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context17: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context18: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context19: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context20: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context21: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context22: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context23: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context24: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context25: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context26: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context27: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context28: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context29: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context30: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context31: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context32: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context33: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context34: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context35: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context36: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context37: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context38: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context39: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context40: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context41: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context42: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context43: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context44: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context45: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context46: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context47: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context48: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context49: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context50: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context51: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context52: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context53: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let context54: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let img: ImageBitmap = ImageBitmap("resource://RAWFILE/icon.png")

    @State
    var message: String = ""
    func build() {
        Scroll() {
            Column() {
                Canvas(this.context1).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context1.fillStyle(0x0000ff)
                        this.context1.fillRect(20.0, 20.0, 150.0, 100.0)
                   })
                Canvas(this.context2).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context2.strokeRect(25.0, 25.0, 85.0, 105.0)
                   })
                Canvas(this.context3).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context3.strokeStyle(0x0000ff)
                        this.context3.strokeRect(25.0, 25.0, 155.0, 105.0)
                   })
                Canvas(this.context5).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context5.beginPath()
                        this.context5.moveTo(30.0, 30.0)
                        this.context5.lineTo(120.0, 60.0)
                        this.context5.lineTo(30.0, 110.0)
                        this.context5.stroke()
                   })
                Canvas(this.context7).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        // 切线
                        this.context7.beginPath()
                        this.context7.strokeStyle(0x808080)
                        this.context7.moveTo(360.0, 20.0)
                        this.context7.lineTo(360.0, 170.0)
                        this.context7.lineTo(110.0, 170.0)
                        this.context7.stroke()

                        // 圆弧
                        this.context7.beginPath()
                        this.context7.strokeStyle(0x000000)
                        this.context7.moveTo(360.0, 20.0)
                        this.context7.arcTo(360.0, 170.0, 110.0, 170.0, 150.0)
                        this.context7.stroke()

                        // 起始点
                        this.context7.beginPath()
                        this.context7.fillStyle(0x00ff00)
                        this.context7.arc(360.0, 20.0, 4.0, 0.0, 6.28)
                        this.context7.fill()

                        // 控制点
                        this.context7.beginPath()
                        this.context7.fillStyle(0xff0000)
                        this.context7.arc(360.0, 170.0, 4.0, 0.0, 6.28)
                        this.context7.arc(110.0, 170.0, 4.0, 0.0, 6.28)
                        this.context7.fill()
                   })
                Canvas(this.context8).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context8.beginPath()
                        this.context8.moveTo(10.0, 10.0)
                        this.context8.bezierCurveTo(20.0, 100.0, 200.0, 100.0, 200.0, 20.0)
                        this.context8.stroke()

                        this.context8.beginPath()
                        this.context8.moveTo(10.0, 20.0)
                        this.context8.quadraticCurveTo(100.0, 100.0, 200.0, 20.0)
                        this.context8.stroke()
                   })
                Canvas(this.context9).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context9.fillRect(30.0,30.0,200.0,200.0)
                        this.context9.clearRect(50.0,50.0,150.0,100.0)
                        this.context9.strokeRect(30.0, 230.0, 200.0, 150.0)
                   })
                Canvas(this.context10).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context10.rect(0.0, 0.0, 100.0, 200.0)
                        this.context10.stroke()
                        this.context10.clip(fillRule: CanvasFillRule.NonZero)
                        this.context10.clip(fillRule: CanvasFillRule.EvenOdd)
                        this.context10.fillStyle(0xff0000)
                        this.context10.fillRect(0.0, 0.0, 200.0, 200.0)
                   })
                Canvas(this.context11).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let region = Path2D()
                        region.moveTo(30.0, 90.0)
                        region.lineTo(110.0, 20.0)
                        region.lineTo(240.0, 130.0)
                        region.lineTo(60.0, 130.0)
                        region.lineTo(190.0, 20.0)
                        region.lineTo(270.0, 90.0)
                        region.closePath()
                        region.closePath()
                        this.context11.clip(region,fillRule: CanvasFillRule.EvenOdd)
                        this.context11.fillStyle(0x00ff00)
                        this.context11.fillRect(0.0, 0.0, 600.0, 600.0)
                   })
                Canvas(this.context12).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context12.beginPath()
                        this.context12.moveTo(30.0, 30.0)
                        this.context12.lineTo(110.0, 30.0)
                        this.context12.lineTo(70.0, 90.0)
                        this.context12.closePath()
                        this.context12.stroke()
                   })
                Canvas(this.context13).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let grad = this.context13.createConicGradient(0.0, 50.0, 80.0)
                        grad.addColorStop(0.0, 0xff0000)
                        grad.addColorStop(0.5, 0xffffff)
                        grad.addColorStop(1.0, 0x00ff00)
                        this.context13.fillStyle(grad)
                        this.context13.fillRect(0.0, 30.0, 100.0, 100.0)
                   })
                Canvas(this.context14).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let imageDataNum = this.context14.createImageData(100.0, 100.0)
                        let imageDataNum1 = this.context14.createImageData(imageDataNum)
                        var s = imageDataNum.data
                        for( i in 0..s.size where i % 4 == 0){
                            s[i + 0] = 255
                            s[i + 1] = 0
                            s[i + 2] = 255
                            s[i + 3] = 255
                        }
                        let data = ImageData(100.0, 100.0, data: s)
                        this.context14.putImageData(data, 10.0, 10.0)
                        this.context14.putImageData(data, 150.0, 10.0, 0.0, 0.0, 50.0, 50.0)
                   })
                Canvas(this.context15).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let grad = this.context15.createLinearGradient(50.0,0.0, 300.0,100.0)
                        grad.addColorStop(0.0, 0xff0000)
                        grad.addColorStop(0.5, 0xffffff)
                        grad.addColorStop(1.0, 0x00ff00)
                        this.context15.fillStyle(grad)
                        this.context15.fillRect(0.0, 0.0, 400.0, 400.0)
                   })
                Canvas(this.context16).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let pattern = this.context16.createPattern(this.img, Repeat)
                        this.context16.fillStyle(pattern)
                        this.context16.fillRect(0.0, 0.0, 200.0, 200.0)
                        this.context16.strokeStyle(pattern)
                        this.context16.stroke()
                   })
                Canvas(this.context17).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let grad = this.context17.createRadialGradient(200.0,200.0,50.0, 200.0,200.0,200.0)
                        grad.addColorStop(0.0, 0xff0000)
                        grad.addColorStop(0.5, 0xffffff)
                        grad.addColorStop(1.0, 0x00ff00)
                        this.context17.fillStyle(grad)
                        this.context17.fillRect(0.0, 0.0, 440.0, 440.0)
                   })

                Canvas(this.context19).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context19.drawImage(this.img, 0.0, 0.0)
                        this.context19.drawImage(this.img, 0.0, 150.0, 300.0, 100.0)
                        this.context19.drawImage(this.img, 0.0, 0.0, 500.0, 500.0, 0.0, 300.0, 400.0, 200.0)
                   })
                Canvas(this.context20).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context20.beginPath()
                        this.context20.ellipse(200.0, 200.0, 50.0, 100.0, 3.14 * 0.25, 3.14 * 0.5, 3.14 * 2.0, counterclockwise: false)
                        this.context20.stroke()
                        this.context20.beginPath()
                        this.context20.ellipse(200.0, 300.0, 50.0, 100.0, 3.14 * 0.25, 3.14 * 0.5, 3.14 * 2.0, counterclockwise: true)
                        this.context20.stroke()
                   })
                Canvas(this.context21).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context21.rect(20.0, 20.0, 100.0, 100.0) // Create a 100*100 rectangle at (20, 20)
                        this.context21.fill(fillRule: CanvasFillRule.EvenOdd)
                   })
                Canvas(this.context22).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let region = Path2D()
                        region.moveTo(30.0, 90.0)
                        region.lineTo(110.0, 20.0)
                        region.lineTo(240.0, 130.0)
                        region.lineTo(60.0, 130.0)
                        region.lineTo(190.0, 20.0)
                        region.lineTo(270.0, 90.0)
                        region.closePath()
                        // Fill path
                        this.context22.fillStyle(0x00ff00)
                        this.context22.fill(region, fillRule: CanvasFillRule.EvenOdd)
                   })
                Canvas(this.context23).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context23.font(size: 50.px, family: "sans-serif")
                        this.context23.fillText("Hello World!", 20.0, 100.0)
                        let withstr = "width:" + this.context23.measureText("Hello World!").width.toString()
                        this.context23.fillText(withstr, 20.0, 200.0)

                        this.context23.font(size: 55.px, family: "sans-serif")
                        this.context23.strokeText("Hello World!", 20.0, 300.0)
                        this.context23.strokeText("???", 20.0, 400.0)
                   })
                Canvas(this.context24).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let ctx = this.context24
                        let img = this.img
                        ctx.drawImage(img, 0.0, 0.0, 100.0, 100.0)
                        ctx.drawImage(img, 100.0, 0.0, 100.0, 100.0)
                        ctx.drawImage(img, 200.0, 0.0, 100.0, 100.0)
                        ctx.drawImage(img, 0.0, 100.0, 100.0, 100.0)
                        ctx.drawImage(img, 100.0, 100.0, 100.0, 100.0)
                        ctx.drawImage(img, 200.0, 100.0, 100.0, 100.0)
                        ctx.drawImage(img, 0.0, 200.0, 100.0, 100.0)
                        ctx.drawImage(img, 100.0, 200.0, 100.0, 100.0)
                        ctx.drawImage(img, 200.0, 200.0, 100.0, 100.0)
                        ctx.drawImage(img, 0.0, 300.0, 100.0, 100.0)
                        message = ctx.toDataURL()
                   })
                Canvas(this.context25).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context25.font(size: 30.px, family:"sans-serif")
                        this.context25.fillText("Hello px", 20.0, 60.0)
                        this.context25.font(size: 30.vp, family:"sans-serif")
                        this.context25.fillText("Hello vp", 20.0, 100.0)
                   })
                Canvas(this.context26).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context26.drawImage(this.img,0.0,0.0,130.0,130.0)
                        let imagedata = this.context26.getImageData(50.0,50.0,130.0,130.0)
                        let imagedata1 = this.context26.getImageData(50.0,50.0,130.0,130.0)
                        this.context26.putImageData(imagedata,150,150)
                   })
                Canvas(this.context28).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context28.drawImage(this.img, 100.0, 100.0, 130.0, 130.0)
                        let pixelmap = this.context28.getPixelMap(150.0, 150.0, 130.0, 130.0)
                        this.context28.setPixelMap(pixelmap)
                   })
                Canvas(this.context29).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context29.fillRect(50.0, 50.0, 50.0, 50.0)
                        this.context29.setTransform(1.2, 3.1415926/8.0, 3.1415926/6.0, 0.5, 30.0, -25.0)
                        this.context29.fillRect(50.0, 50.0, 50.0, 50.0)
                   })
                Canvas(this.context52).width(100.percent).height(600.00.vp).backgroundColor(0x0ffff0)
                   .onReady({=>
                        this.context52.fillRect(50.0, 50.0, 50.0, 50.0)
                        let storedTransform = this.context29.getTransform()
                        this.context52.setTransform(storedTransform)
                        this.context52.fillRect(50.0,50.0,50.0,50.0)
                   })
                Canvas(this.context31).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context31.fillStyle(0xff0000)
                        this.context31.fillRect(20.0, 20.0, 50.0, 50.0)
                        this.context31.fillStyle(0x0000ff)
                        this.context31.fillRect(50.0, 50.0, 50.0, 50.0)
                        this.context31.fillStyle(0xff0000)
                        this.context31.fillRect(120.0, 20.0, 50.0, 50.0)
                        this.context31.fillStyle(0x0000ff)
                        this.context31.fillRect(150.0, 50.0, 50.0, 50.0)
                   })
                Canvas(this.context34).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context34.arc(100.0, 75.0, 50.0, 0.0, 6.28)
                        this.context34.stroke()
                   })
                Canvas(this.context35).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context35.moveTo(30.0, 30.0)
                        this.context35.lineTo(60.0, 35.0)
                        this.context35.lineTo(30.0, 37.0)
                        this.context35.stroke()
                   })
                Canvas(this.context36).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context36.fillStyle(0x0000ff)
                        this.context36.fillRect(20.0, 20.0, 150.0, 100.0)
                        this.context36.reset()
                        this.context36.fillRect(20.0, 150.0, 150.0, 100.0)
                   })
                Canvas(this.context37).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context37.setTransform(1.0, -0.5, 0.5, 1.0, 10.0, 10.0)
                        this.context37.fillStyle (0x0000ff)
                        this.context37.fillRect(0.0, 0.0, 100.0, 100.0)
                        this.context37.resetTransform()
                        this.context37.fillStyle(0xff0000)
                        this.context37.fillRect(0.0, 0.0, 100.0, 100.0)
                   })
                Canvas(this.context38).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context38.save() // save the default state
                        this.context38.fillStyle(0x00ff00)
                        this.context38.fillRect(20.0, 20.0, 100.0, 100.0)
                        this.context38.restore() // restore to the default state
                        this.context38.fillRect(150.0, 75.0, 100.0, 100.0)
                   })
                Canvas(this.context39).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context39.rotate(45.0 * 3.14 / 180.0)
                        this.context39.fillRect(70.0, 20.0, 50.0, 50.0)
                   })
                Canvas(this.context40).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context40.fillStyle(0x0000ff)
                        this.context40.fillRect(50.0,100.0,300.0,100.0)
                        this.context40.fillStyle(0x00ffff)
                        this.context40.fillRect(50.0,150.0,300.0,100.0)
                        this.context40.saveLayer()
                        this.context40.fillStyle(0xff0000)
                        this.context40.fillRect(100.0,50.0,100.0,300.0)
                        this.context40.fillStyle(0x00ff00)
                        this.context40.fillRect(150.0,50.0,100.0,300.0)
                        this.context40.restoreLayer()
                   })
                Canvas(this.context41).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context41.strokeRect(30.0, 30.0, 50.0, 50.0)
                        this.context41.scale(2.0, 2.0) // Scale to 200%
                        this.context41.strokeRect(30.0, 30.0, 50.0, 50.0)
                   })
                Canvas(this.context42).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context42.fillRect(100.0, 20.0, 50.0, 50.0)
                        this.context42.setTransform(1.0, -0.5, 0.5, 1.0, 10.0, 10.0)
                        this.context42.fillRect(100.0, 20.0, 50.0, 50.0)
                   })
                Canvas(this.context43).width(100.percent).height(600.00.vp).backgroundColor((0x0ffff0))
                   .onReady({=>
                        this.context43.fillRect(100.0, 20.0, 50.0, 50.0)
                        let storedTransform = this.context42.getTransform()
                        this.context43.setTransform(storedTransform)
                        this.context43.fillRect(100.0, 20.0, 50.0, 50.0)
                   })
                Canvas(this.context44).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context44.fillStyle(0xff0000)
                        this.context44.fillRect(20.0, 20.0, 100.0, 80.0)
                   })
                Canvas(this.context45).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context45.moveTo(125.0, 25.0)
                        this.context45.lineTo(125.0, 105.0)
                        this.context45.lineTo(175.0, 105.0)
                        this.context45.lineTo(175.0, 25.0)
                        this.context45.strokeStyle(0xff0000)
                        this.context45.stroke()
                   })
                Canvas(this.context46).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        var path2Da: Path2D = Path2D()
                        path2Da.moveTo(25.0, 25.0)
                        path2Da.lineTo(25.0, 105.0)
                        path2Da.lineTo(75.0, 105.0)
                        path2Da.lineTo(75.0, 25.0)
                        this.context46.strokeStyle(0xff0000)
                        this.context46.stroke(path2Da)
                   })
                Canvas(this.context47).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context47.moveTo(140.0, 10.0)
                        this.context47.lineTo(140.0, 160.0)
                        this.context47.stroke()
                        this.context47.font(size: 18.px, family: "sans-serif")
                        this.context47.fillText('textAlign=start', 140.0, 60.0)
                        this.context47.fillText('textAlign=end', 140.0, 80.0)
                        this.context47.fillText('textAlign=left', 140.0, 100.0)
                        this.context47.fillText('textAlign=center', 140.0, 120.0)
                        this.context47.fillText('textAlign=right', 140.0, 140.0)
                   })
                Canvas(this.context48).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context48.strokeStyle(0x0000ff)
                        this.context48.moveTo(0.0, 120.0)
                        this.context48.lineTo(400.0, 120.0)
                        this.context48.stroke()
                        this.context48.font(size: 20.px, family: "sans-serif")
                        this.context48.fillText('Top', 10.0, 120.0)
                        this.context48.fillText('Bottom', 55.0, 120.0)
                        this.context48.fillText('Middle', 125.0, 120.0)
                        this.context48.fillText('Alphabetic', 195.0, 120.0)
                        this.context48.fillText('Hanging', 295.0, 120.0)
                   })
                Canvas(this.context49).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context49.fillStyle(0xff0000)
                        this.context49.fillRect(0.0,0.0,100.0,100.0)
                        let toDataUrl = this.context49.toDataURL()
                        this.context49.font(size: 48.px, family: "serif")
                        this.context49.fillText(toDataUrl, 0.0, 150.0)
                        this.context49.toDataURL(imageType: ImageType.Jpeg)
                        this.context49.toDataURL(imageType: ImageType.Webp, quality: -1.0)
                   })
                Canvas(this.context50).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context50.fillStyle(0x000000)
                        this.context50.fillRect(0.0, 0.0, 100.0, 100.0)
                        this.context50.transform(1.0, 0.5, -0.5, 1.0, 10.0, 10.0)
                        this.context50.fillStyle(0xff0000)
                        this.context50.fillRect(0.0, 0.0, 100.0, 100.0)
                        this.context50.transform(1.0, 0.5, -0.5, 1.0, 10.0, 10.0)
                        this.context50.fillStyle(0x0000ff)
                        this.context50.fillRect(0.0, 0.0, 100.0, 100.0)
                   })
                Canvas(this.context51).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context51.fillRect(10.0, 10.0, 50.0, 50.0)
                        this.context51.translate(70.0, 70.0)
                        this.context51.fillRect(10.0, 10.0, 50.0, 50.0)
                   })
               Canvas(this.context53).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        let h = this.context53.height
                        let w = this.context53.width
                        this.context53.fillRect(0.0, 0.0, w/2.0, h/2.0)
                   })
               Canvas(this.context54).width(100.percent).height(600.00.vp).backgroundColor(0xffff00)
                   .onReady({=>
                        this.context54.transferFromImageBitmap(this.img)
                   })
            }
        }.id("scroller")
    }
}
