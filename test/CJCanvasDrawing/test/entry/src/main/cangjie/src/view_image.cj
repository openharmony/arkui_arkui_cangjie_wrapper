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

/**
 * Created on 2024/7/12
 */

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.PixelMapFormat
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.Size as UniqueImageSize

@Entry
@Component
class View_Image {
    let color = Array<UInt8>(96, { i => UInt8(i+1) })
    let opts = InitializationOptions(UniqueImageSize(4, 6), editable: true, pixelFormat: Rgba8888)
    let pixelMap = createPixelMap(color, opts)

    let colorFilter = ColorFilter([
        1.5,  0.0,  0.0, 0.0, 0.0,
        0.0,  0.5,  0.0, 0.0, 0.0,
        0.0,  0.0,  0.5, 0.0, 0.0,
        0.0,  0.0,  0.0, 1.0, 0.0
        ])

    let colorFilter2 = ColorFilter([
        1.5,  0.0,  0.0, 0.0, 0.0,
        0.0,  0.5,  0.0, 0.0, 0.0,
        0.0,  0.0,  0.5, 0.0, 0.0,
        0.0,  0.0,  0.0, 1.0
        ])

    @State var image_1_onComplete: ?ImageLoadResult = Option<ImageLoadResult>.None
    @State var image_1_onError: ?ImageError = Option<ImageError>.None
    @State var image_1_onClick: String = ""
    @State var image_2_onFinish: String = "Not finished."

//    let modelist:Array<DynamicRangeMode> = [DynamicRangeMode.HIGH, DynamicRangeMode.CONSTRAINT, DynamicRangeMode.STANDARD]
//    @State var mode: DynamicRangeMode = DynamicRangeMode.HIGH
//    @State var mode1:DynamicRangeMode = DynamicRangeMode.CONSTRAINT
//    @State var mode2:DynamicRangeMode = DynamicRangeMode.STANDARD
    @State var idx: Int64 = 0

    func build() {
        Scroll() {
            Column {
                ///////////// 自定义属性设置：非默认值 /////////////
                Text("${image_1_onComplete?.width ?? 0.0}, ${image_1_onComplete?.height ?? 0.0}, ${image_1_onComplete?.componentWidth ?? 0.0}, ${image_1_onComplete?.componentHeight ?? 0.0}, ${image_1_onComplete?.loadingStatus ?? 0}, ${image_1_onComplete?.contentWidth ?? 0.0}, ${image_1_onComplete?.contentHeight ?? 0.0}, ${image_1_onComplete?.contentOffsetX ?? 0.0}, ${image_1_onComplete?.contentOffsetY ?? 0.0}")
                .id("image_1_onComplete")
                .width(100.percent)
                .textAlign(TextAlign.Start)
                Text(image_1_onClick)
                .id("image_1_onClick")
                .width(100.percent)
                .textAlign(TextAlign.Start)

                //输入资源
                Image(@r(app.media.startIcon))
                .alt(@r(app.media.foreground))
                .objectFit(ImageFit.None)
                .objectRepeat(ImageRepeat.XY)
                .sourceSize(80, 80)
                .interpolation(ImageInterpolation.High)
                .renderMode(ImageRenderMode.Original)
                .renderMode(ImageRenderMode.Template)
                .syncLoad(true)
                .autoResize(true)
                .matchTextDirection(true)
                .fitOriginalSize(true)
                .width(200)
                .height(100)
                .borderRadius(4)
                .id("Image_1")
                .onComplete({ imageComplete =>
                    this.image_1_onComplete = imageComplete
                })
                .onError({ imageError =>
                    this.image_1_onError = imageError
                })
                .onClick({ event =>
                        this.image_1_onClick = "image1"
                })

                //输入路径
                Image("file:////fake/path/src")
                .alt("file:////fake/path/alt")
                .width(10)
                .height(10)
                .id("Image_3")

                //输入pixelmap
                Image(this.pixelMap)
                .border(width: 1.vp)
                .height(80)
                .width(80)
                .borderRadius(topLeft: 3, topRight: 5, bottomLeft: 7, bottomRight: 5)
                .id("Image_4")

                Text(this.image_2_onFinish)
                .id("image_2_onFinish")
                Row() {
                    //test fillColor Color
                    //test sourceSize Length
                    Image(@r(app.media.image_test_icon))
                    .alt(@r(app.media.image_test_fore_icon))
                    .fillColor(Color.Blue)
                    .sourceSize(80.vp, 80.vp)
                    .width(80)
                    .height(80)
                    .id("Image_2")
                    .onFinish({ => this.image_2_onFinish = "Finished."})


                    //test fillColor UInt32
                    //test sourceSize Float64
                    Image(@r(app.media.image_test_icon))
                    .alt(@r(app.media.image_test_fore_icon))
                    .fillColor(0xFFFF00FF)
                    .sourceSize(80.0, 80.0)
                    .width(80)
                    .height(80)
                    .id("Image_6")

                    //test fillColor AppResource
                    //test sourceSize Int64
                    Image(@r(app.media.image_test_icon))
                    .alt(@r(app.media.image_test_fore_icon))
                    .fillColor(@r(app.color.image_test_color))
                    .sourceSize(80, 80)
                    .width(80)
                    .height(80)
                    .id("Image_7")
                }.width(100.percent)


                /////////////////// 默认值 ////////////////////////


                /////////////////// 组合场景验证 ////////////////////
                //test interpolation
                Image(@r(app.media.startIcon))
//                .dynamicRangeMode(mode2)
                .sourceSize(80, 80)
                .fillColor(@r(app.color.image_test_color))
                .objectFit(ImageFit.Fill)
                .interpolation(ImageInterpolation.High)
                .width(160)
                .height(160)
                .id("Image_10")


                Image(@r(app.media.startIcon))
                .width(30)
                .height(30)
                .interpolation(ImageInterpolation.None)
                .id("Image_None")
                Image(@r(app.media.startIcon))
                .width(30)
                .height(30)
                .interpolation(ImageInterpolation.Medium)
                .id("Image_Medium")
                Image(@r(app.media.startIcon))
                .width(30)
                .height(30)
                .interpolation(ImageInterpolation.Low)
                .id("Image_Low")
            }.width(100.percent)
        }.id("image_scroller")
    }
}