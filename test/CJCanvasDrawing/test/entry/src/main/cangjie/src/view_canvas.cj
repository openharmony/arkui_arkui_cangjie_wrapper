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
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.*
import ohos.bundle.bundle_manager.*
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.DecodingOptions
import ohos.multimedia.image.createImageSource
import ohos.multimedia.image.ImageInfo
//
import ohos.bundle.bundle_manager.*
internal import ohos.hilog.Hilog

@Entry
@Component
class ViewCanvas {
    @State
    var readyRes: Int64 = 0
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var context2: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    var imageBitmap: ImageBitmap = ImageBitmap("bit map")

    var path2Da: Path2D = Path2D("M250 150 L150 350 L350 350 Z")
    var path2Db: Path2D = Path2D()

    func build() {
        Scroll() {
            Column() {
                Canvas(this.context).width(500.00.vp).height(300.00.vp).backgroundColor(0xffff00).id("MyCanvas").onReady(
                    {
                        =>
                        var myGradient = this.context.createRadialGradient(75.0, 50.0, 5.0, 75.0, 50.0, 100.0)
                        myGradient.addColorStop(0.0, 0x03AAAA)
                        myGradient.addColorStop(1.0, 0xFFFFFF)
                        this.context.fillStyle(myGradient)
                        this.context.fillRect(0.0, 0.0, 300.0, 300.0)

                        this.context.fillStyle(0x0000ff)
                        this.context.fillStyle(0x0000ff)

                        this.context.lineWidth = 10.0
                        var lineWidthGet = this.context.lineWidth
                        this.context.strokeStyle(0x0000ff)
                        this.context.strokeRect(25.0, 25.0, 155.0, 105.0)
                        this.context.clearRect(30.0, 30.0, 150.0, 100.0)

                        // createLinearGradient
                        var grad = this.context.createLinearGradient(75.0, 50.0, 75.0, 50.0)
                        grad.addColorStop(0.0, 0xff0000)
                        grad.addColorStop(1.0, Color.Blue)
                        this.context.fillStyle(grad)
                        this.context.fillRect(0.0, 0.0, 400.0, 400.0)
                        this.context.strokeStyle(grad)

                        this.context.lineJoin = LineJoinStyle.Miter
                        this.context.lineJoin = LineJoinStyle.Bevel
                        var lineJoinGet = this.context.lineJoin

                        this.context.miterLimit = 2.0
                        var miterLimitGet = this.context.lineJoin

                        this.context.textAlign = CanvasTextAlign.Left
                        this.context.textAlign = CanvasTextAlign.Right
                        this.context.textAlign = CanvasTextAlign.Center
                        this.context.textAlign = CanvasTextAlign.Start
                        this.context.textAlign = CanvasTextAlign.End
                        var textAlignGet = this.context.textAlign

                        this.context.textBaseline = CanvasTextBaseline.Alphabetic
                        this.context.textBaseline = CanvasTextBaseline.Ideographic
                        this.context.textBaseline = CanvasTextBaseline.Top
                        this.context.textBaseline = CanvasTextBaseline.Bottom
                        this.context.textBaseline = CanvasTextBaseline.Middle
                        this.context.textBaseline = CanvasTextBaseline.Hanging
                        var textBaselineGet = this.context.textBaseline

                        this.context.globalAlpha = 1.0
                        var globalAlphaGet = this.context.globalAlpha

                        this.context.getLineDash()

                        this.context.lineDashOffset = 1.0
                        var lineDashOffsetGet = this.context.lineDashOffset

                        this.context.globalCompositeOperation = GlobalCompositeOperation.SourceOver
                        this.context.globalCompositeOperation = GlobalCompositeOperation.SourceAtop
                        this.context.globalCompositeOperation = GlobalCompositeOperation.SourceIn
                        this.context.globalCompositeOperation = GlobalCompositeOperation.SourceOut
                        this.context.globalCompositeOperation = GlobalCompositeOperation.DestinationOver
                        this.context.globalCompositeOperation = GlobalCompositeOperation.DestinationAtop
                        this.context.globalCompositeOperation = GlobalCompositeOperation.DestinationIn
                        this.context.globalCompositeOperation = GlobalCompositeOperation.DestinationOut
                        this.context.globalCompositeOperation = GlobalCompositeOperation.Lighter
                        this.context.globalCompositeOperation = GlobalCompositeOperation.Copy
                        this.context.globalCompositeOperation = GlobalCompositeOperation.Xor
                        var globalCompositeOperationGet = this.context.globalCompositeOperation


                        this.context.font(size: 85.px, family: "sans-serif")
                        this.context.fillText("Hello World!", 20.0, 100.0, maxWidth: 100.0)
                        this.context.font()
                        this.context.strokeText("Hello World!", 20.0, 60.0, maxWidth: 100.0)
                        this.context.setLineDash([0.0,0.0,0.0,0.0])
                        //创建一个蓝色圆形渐变效果
                        this.context.beginPath()
                        this.context.lineWidth = 6.0

                        this.context.shadowBlur = 6.0
                        var shadowBlurGet = this.context.shadowBlur

                        this.context.direction = CanvasDirection.Inherit
                        this.context.direction = CanvasDirection.Ltr
                        this.context.direction = CanvasDirection.Rtl
                        var directionGet = this.context.direction

                        this.context.filter = "filter"
                        var filterGet = this.context.filter

                        this.context.shadowOffsetX = 6.0
                        var shadowOffsetXGet = this.context.shadowOffsetX
                        this.context.shadowOffsetY = 6.0
                        var shadowOffsetYGet = this.context.shadowOffsetY

                        var heightGet = this.context.height
                        var widthGet = this.context.width

                        this.context.imageSmoothingEnabled = true
                        var imageSmoothingEnabledGet = this.context.imageSmoothingEnabled
                        this.context.imageSmoothingQuality = ImageSmoothingQuality.Low
                        this.context.imageSmoothingQuality = ImageSmoothingQuality.Medium
                        this.context.imageSmoothingQuality = ImageSmoothingQuality.High
                        var imageSmoothingQualityGet = this.context.imageSmoothingQuality
                        this.context.shadowColor = 0x0000ff
                        var shadowColorGet = this.context.shadowColor
                        this.context.strokeStyle(0x0000ff)
                        this.context.moveTo(15.0, 80.0)
                        this.context.lineTo(280.0, 160.0)
                        var measureText: TextMetrics = this.context.measureText("measureText")

                        Hilog.info(1, "Cangjie-Test", "width: ${measureText.width}, height: ${measureText.height}")

                        this.context.stroke()
                        this.context.closePath()

                        this.context.bezierCurveTo(30.0, 30.0, 150.0, 100.0, 1.0, 1.0)
                        this.context.quadraticCurveTo(30.0, 30.0, 150.0, 100.0)
                        this.context.arc(30.0, 30.0, 150.0, 100.0, 1.0)
                        this.context.arcTo(30.0, 30.0, 150.0, 100.0, 1.0)
                        this.context.ellipse(30.0, 30.0, 150.0, 100.0, 1.0, 1.0, 1.0)
                        this.context.rect(30.0, 30.0, 150.0, 100.0)
                        this.context.fill()
                        this.context.clip()

                        this.context.lineCap = LineCapStyle.Butt
                        this.context.lineCap = LineCapStyle.Round
                        this.context.lineCap = LineCapStyle.Square
                        var lineCapGet = this.context.lineCap

                        this.context.rotate(3.0)
                        this.context.scale(3.0, 3.0)
                        this.context.transform(30.0, 30.0, 150.0, 100.0, 1.0, 1.0)
                        this.context.setTransform(30.0, 30.0, 150.0, 100.0, 1.0, 1.0)
                        this.context.translate(3.0, 3.0)
                        this.context.getPixelMap(30.0, 30.0, 150.0, 100.0)
                        this.context.restore()
                        this.context.save()
                        readyRes++
                    }
                )

                Button("Btn").onClick(
                    { e =>
                        let inspector = getInspectorByKey("MyCanvas")
                        let jsonObject = JsonValue.fromStr(inspector).asObject()
                        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

                        let otherInspector = getInspectorByKey("Mytext")
                        let otherJsonObject = JsonValue.fromStr(otherInspector).asObject()
                        let otherContent = otherJsonObject.get("$attrs").getOrThrow().asObject()
                        //                    getOrThrow().asObject().get("content").
                        let finalContent = otherContent.get("content")
                        let optionContent = finalContent.getOrThrow()
                        let maxContent = optionContent.toString()
                        Hilog.info(1, "Cangjie-Test", "aaaa: " + maxContent)
                    }
                )

                Text(readyRes.toString()).key("Mytext")

                Canvas(this.context).width(50.00.vp).height(30.00.vp).backgroundColor(0xffff00).onReady(
                    {
                        =>
                        this.path2Db.addPath(this.path2Da)
                        this.path2Db.setTransform(1.0, -0.5, 0.5, 1.0, 10.0, 10.0)
                        this.context2.stroke(this.path2Db)

                        this.path2Db.moveTo(200.0, 100.0)
                        this.path2Db.lineTo(300.0, 100.0)
                        this.path2Db.lineTo(200.0, 200.0)
                        this.path2Db.closePath()
                        this.context2.stroke(this.path2Db)

                        this.path2Db.bezierCurveTo(1.0, 1.0, 1.0, 1.0, 1.0, 1.0)
                        this.path2Db.moveTo(10.0, 10.0)
                        this.path2Db.bezierCurveTo(20.0, 100.0, 200.0, 100.0, 200.0, 20.0)
                        this.context2.stroke(this.path2Db)

                        this.path2Db.quadraticCurveTo(1.0, 1.0, 1.0, 1.0)
                        this.path2Db.moveTo(10.0, 10.0)
                        this.path2Db.quadraticCurveTo(100.0, 100.0, 200.0, 20.0)
                        this.context2.stroke(this.path2Db)

                        this.path2Db.arc(100.0, 75.0, 50.0, 0.0, 6.0)
                        this.context2.stroke(this.path2Db)
                        this.path2Db.arcTo(150.0, 20.0, 150.0, 70.0, 50.0)
                        this.context2.stroke(this.path2Db)

                        this.path2Db.ellipse(200.0, 200.0, 50.0, 100.0, 0.0, 1.0, 6.0)
                        this.context2.stroke(this.path2Db)

                        this.path2Db.rect(20.0, 20.0, 100.0, 100.0)
                        this.context2.stroke(this.path2Db)
                    }
                )

                Canvas(this.context).width(50.00.vp).height(30.00.vp).backgroundColor(0xffff00).onReady(
                   {
                        =>
//                        let buffer: Array<UInt8> = loadMedia(Int32(@r(app.media.startIcon).id))
//                        let imageSource = createImageSource(buffer)
//                        let decodeOpts: DecodingOptions = DecodingOptions(
//                            sampleSize: 1,
//                            rotate: 0,
//                            editable: true
//                        )
                        let pixelmap: PixelMap = this.context.getPixelMap(150.0, 150.0, 130.0, 130.0)
                        let imageInfo: ImageInfo = pixelmap.getImageInfo()
//                        imageSource.release()

                        this.context.drawImage(pixelmap, 0.0, 200.0)
                        this.context.drawImage(pixelmap, 0.0, 0.0, 200.0, 200.0)
                        this.context.drawImage(pixelmap, 0.0, 0.0, 200.0, 200.0, 0.0, 0.0, 200.0, 200.0)

                        this.context.drawImage(imageBitmap, 0.0, 200.0)
                        this.context.drawImage(imageBitmap, 0.0, 0.0, 200.0, 200.0)
                        this.context.drawImage(imageBitmap, 0.0, 0.0, 200.0, 200.0, 0.0, 0.0, 200.0, 200.0)
                    }
                )
            }
        }.id("scroller")
    }

//    public static func loadMedia(resId: Int32): Array<UInt8> {
//        Hilog.error(1, "Cangjie-App", "[loadMedia]: ImageSource start.")
//        let stageContext = getAbilityContext()
//        let rm: ResourceManager = stageContext.resourceManager
//        try {
//            return rm.getMediaContent(UInt32(resId))
//        } catch (e: Exception) {
//            Hilog.error(1, "Cangjie-App", "[loadMedia]: getMediaContent failed, err msg=" + e.message)
//            return Array<UInt8>()
//        }
//        Hilog.error(1, "Cangjie-App", "[loadMedia]: the globalAbilityContext is None.")
//        return Array<UInt8>()
//    }
}
