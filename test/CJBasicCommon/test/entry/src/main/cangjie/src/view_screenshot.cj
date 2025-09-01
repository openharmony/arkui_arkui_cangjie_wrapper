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

//import std.unittest.testmacro.*
//import ohos.base.{LengthProp, Length, AppLog, Color, nativeLog, BaseLog, LengthType}
//import ohos.arkui.component.*
//import ohos.arkui.state_management.*
//import ohos.arkui.state_macro_manage.*
//import std.collection.*
//import ohos.multimedia.image.PixelMap
//import ohos.multimedia.image.createPixelMap
//import ohos.multimedia.image.InitializationOptions
//import ohos.multimedia.image.Size as UniqueImageSize
//import ohos.multimedia.image.ScaleMode
//import ohos.screenshot
//import std.collection.*
//
//@Entry
//@Component
//class View_Screenshot {
//    @State
//    var message: String = "Hello World"
//    var rect: screenshot.Rect = screenshot.Rect(1, 1, 1, 1)
//
//    let color = Array<UInt8>(96, repeat: 100)
//    let opts = InitializationOptions(editable: true, pixelFormat: BGRA_8888, size: UniqueImageSize(4, 6))
//    var pixmap1: PixelMap = createPixelMap(color, opts)
//    var pickInfo: screenshot.PickInfo = screenshot.PickInfo(rect, pixmap1)
//
//    func build() {
//        Column() {
//            Button("capture")
//                .onClick(
//                    {
//                        =>
//                        this.capture()
//                        Hilog.info(1,"1","Cangjie-App", "click capture")
//                    }
//                )
//                .id("capture")
//            Button("pick")
//                .onClick(
//                    {
//                        =>
//                        this.pickExample()
//                        Hilog.info(1,"1","Cangjie-App", "click pick")
//                    }
//                )
//                .id("pick")
//        }
//    }
//
//    func capture() {
//        let captureOption: screenshot.CaptureOption = screenshot.CaptureOption(displayId: 0)
//        try {
//            let pixelMap: PixelMap = screenshot.capture(options: captureOption)
//            Hilog.info(1,"1","Cangjie-App", "Succeeded in saving screenshot. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}")
//            pixelMap.Release() // PixelMap使用完后及时释放内存
//        } catch (exception: Exception) {
//            Hilog.info(1,"1","Cangjie-App", "exception Failed to save screenshot. Code: ${exception.toString()}")
//        }
//    }
//
//    func pickExample() {
//        try {
//            let pickInfo: screenshot.PickInfo = screenshot.pick()
//            Hilog.info(1,"1","Cangjie-App",
//                "Succeeded in saving screenshot. Pixel bytes number: ${pickInfo.pixelMap.getPixelBytesNumber()}")
//            pickInfo
//                .pixelMap
//                .Release() // PixelMap使用完后及时释放内存
//        } catch (exception: Exception) {
//            Hilog.info(1,"1","Cangjie-App", "exception Failed to save screenshot. Code: ${exception.toString()}")
//        }
//    }
//}
