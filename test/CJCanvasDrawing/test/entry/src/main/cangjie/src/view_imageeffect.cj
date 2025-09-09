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

import std.unittest.testmacro.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.Size
import ohos.multimedia.image.ScaleMode
import std.collection.{ ArrayList, HashMap }
import std.convert.*
import ohos.base.{Length, Color}

@Entry
@Component
class ViewImageEffect {
    @State
    var cnt: Int64 = 0

    func build() {
        Scroll() {
            Column(space: 10) {
                Text("font blur").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Flex(alignItems: ItemAlign.Center) {
                    Text("original text").margin(10)
                    Text("blur text")
                    .blur(1.0).margin(10)
                    Text("blur text")
                    .blur(2.0).margin(10)
                    Text("blur text").id("blur")
                    .blur(3.0).margin(10)
                }.width(90.percent).height(40)
                .backgroundColor(0xF9CF93)

                // 对背景进行模糊
                Text("backdropBlur").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Text("").id("backdropBlur")
                .width(90.percent)
                .height(40)
                .fontSize(16)
                .backdropBlur(3.0)
                .backgroundImage(@r(app.media.startIcon))
                .backgroundImageSize(width: 300, height: 160)

                Text("shadow").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Image(@r(app.media.startIcon)).shadow(radius: 10.0,color:Color.Gray,offsetX:10.0,offsetY:10.0).height(40).id("shadow")

                // 灰度效果0~1，越接近1，灰度越明显
                Text("grayscale").fontSize(15).fontColor(0xCCCCCC)
                Image(@r(app.media.startIcon)).grayscale(0.3).height(40).id("grayscale")
                Image(@r(app.media.startIcon)).grayscale(0.8).height(40)

                // 高光效果，1为正常图片，<1变暗，>1亮度增大
                Text("brightness").fontSize(15).fontColor(0xCCCCCC)
                Image(@r(app.media.startIcon)).brightness(1.8).height(40).id("brightness")
                Image(@r(app.media.startIcon)).brightness(0.0).height(40)

                // 饱和度，原图为1
                Text("saturate").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Image(@r(app.media.startIcon)).saturate(2.0).height(40).id("saturate")
                Image(@r(app.media.startIcon)).saturate(0.7).height(40)

                // 对比度，1为原图，>1值越大越清晰，<1值越小越模糊
                Text("contrast").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Image(@r(app.media.startIcon)).contrast(2.0).height(40).id("contrast")
                Image(@r(app.media.startIcon)).contrast(0.8).height(40)

                // 图像反转比例
                Text("invert").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Image(@r(app.media.startIcon)).invert(0.2).height(40).id("invert")
                Image(@r(app.media.startIcon)).invert(0.8).height(40)

                // 叠色添加
                Text("colorBlend").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Image(@r(app.media.startIcon)).colorBlend(Color.Green).height(40).id("colorBlend")
                Image(@r(app.media.startIcon)).colorBlend(Color.Blue).height(40)

                // 深褐色
                Text("sepia").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Image(@r(app.media.startIcon)).sepia(0.8).height(40).id("sepia")

                // 色相旋转
                Text("hueRotate").fontSize(15).fontColor(0xCCCCCC).width(90.percent)
                Image(@r(app.media.startIcon)).hueRotate(90.0).height(40).id("hueRotate")
            }
        }
    }
}