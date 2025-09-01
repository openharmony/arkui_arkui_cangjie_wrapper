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
//import ohos.ability.*
import ohos.bundle.bundle_manager.*
internal import ohos.hilog.Hilog

@Entry
@Component
class View_Canvas {
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
                Text(readyRes.toString()).key("Mytext")

                Canvas(this.context)
                    .width(50.00.vp)
                    .height(30.00.vp)
                    .backgroundColor(0xffff00)
                    .onReady(
                        {
                            =>
                            this.path2Db.addPath(this.path2Da)
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

                //                Canvas(this.context).width(50.00.vp).height(30.00.vp).backgroundColor(0xffff00).onReady(
                //                    {
                //                        =>
                //                        let buffer: Array<UInt8> = loadMedia(Int32(@r(app.media.startIcon).id), globalAbilityContext)
                //                        let imageSource = createImageSource(buffer)
                //                        let decodeOpts: DecodingOptions = DecodingOptions(
                //                            sampleSize: 1,
                //                            rotate: 0,
                //                            editable: true
                //                        )
                //                        let pixelmap: PixelMap = imageSource.createPixelMap(options: decodeOpts)
                //                        let imageInfo: ImageInfo = pixelmap.getImageInfo()
                //                        imageSource.release()
                //
                //                        this.context.drawImage(pixelmap, 0, 200)
                //                        this.context.drawImage(pixelmap, 0, 0, 200, 200)
                //                        this.context.drawImage(pixelmap, 0, 0, 200, 200, 0, 0, 200, 200)
                //
                //                        this.context.drawImage(imageBitmap, 0, 200)
                //                        this.context.drawImage(imageBitmap, 0, 0, 200, 200)
                //                        this.context.drawImage(imageBitmap, 0, 0, 200, 200, 0, 0, 200, 200)
                //                    }
                //                )
            }
        }.id("scroller")
    }

    //    public static func loadMedia(resId: Int32, context: Option<UIAbilityContext>): Array<UInt8> {
    //        Hilog.error(1,"1","Cangjie-Test", "[loadMedia]: ImageSource start.")
    //        if (let Some(v) <- context) {
    //            let stageContext = getStageContext(v)
    //            let rm: ResourceManager = ResourceManager.getResourceManager(stageContext)
    //            try {
    //                return rm.getMediaContent(Int32(resId), 0)
    //            } catch (e: Exception) {
    //                Hilog.error(1,"1","Cangjie-Test", "[loadMedia]: getMediaContent failed, err msg=" + e.message)
    //                return Array<UInt8>()
    //            }
    //        }
    //        Hilog.error(1,"1","Cangjie-Test", "[loadMedia]: the globalAbilityContext is None.")
    //        return Array<UInt8>()
    //    }
}
