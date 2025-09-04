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
 * Created on 2025/1/17
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import kit.ArkUI.*
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.Size as UniqueImageSize

@Entry
@Component
class View_DragTest {
    @State
    var targetImage: String = ""
    @State
    var targetText: String = ""
    @State
    var imageWidth: Float64 = 0.0
    @State
    var imageHeight: Float64 = 0.0
    @State
    var imgState: Visibility = Visibility.Visible
    @State
    var abstractContent: String = "abstract"
    @State
    var textContent: String = ""
    @State
    var backGroundColor: Color = Color.Transparent

    var rectResult: RectResult = RectResult(1.0, 1.0, 1.0, 1.0)

//    var externalString: ExternalString = ExternalString("ExternalString")
//    var cTouchResult: CTouchResult = CTouchResult(2, externalString)
//    var touchResult4: TouchResult = TouchResult(cTouchResult)

    @Builder
    func pixelMapBuilder() {
        Column() {
            Image(@r(app.media.startIcon))
                .width(120)
                .height(120)
                .backgroundColor(Color.Green)
        }
    }

    func build() {
        Row() {
            Column() {
                if (true) {
                    Column() {}
                } else {
                }
                List() {
                    ListItem() {
                        Text("ListItem1")
                            .fontSize(18)
                            .width(100.percent)
                            .height(40)
                            .margin(10)
                    }
                        .id("listItem1")
                        .onDragStart(
                            {
                                event: DragInfo =>
//                                    PromptAction.showToast(message: event.extraParams)
                                var colors: Array<UInt8> = [80, 2, 4, 8, 40, 2, 4, 8]
                                var size: UniqueImageSize = UniqueImageSize(4, 3)
                                let opts = InitializationOptions(size)
                                let pixelMap = createPixelMap(colors, opts)
//                                return DragItemInfo(pixelMap, bind(pixelMapBuilder, this), "ListItem1")
                            }
                        )
                    ListItem() {
                        Text("ListItem2")
                            .fontSize(18)
                            .width(100.percent)
                            .height(40)
                            .margin(10)
                    }
                        .onDragStart(
                            {
                                event: DragInfo =>
                                    Hilog.info(1,"1","Cangjie-App", "### extra ${event.extraParams}")
                                    return bind(pixelMapBuilder, this)
                            })
                        .id("listItem2")
                }.onDrop(
                    {
                        event: DragInfo =>
                            Hilog.info(1,"1","Cangjie-App", "### extra ${event.extraParams}")
                    })
                Text("Start Drag")
                    .fontSize(18)
                    .width(100.percent)
                    .height(40)
                    .margin(10)
                    .backgroundColor(0x008888)
                Image(@r(app.media.startIcon))
                    .id("drag_img")
                    .width(100)
                    .height(100)
                    .margin(left: 15)
                    .visibility(imgState)
                    .onDragStart(
                        {
                            event: DragInfo =>
                            Hilog.info(1,"1","Cangjie-App", "### extra ${event.extraParams}")
                        }
                    )
                    .onDrop({
                        event: DragInfo => Hilog.info(1,"1","Cangjie-App", "### onDrop Image onDrop")
                    })
                    .onDragMove(
                        {
                            event: DragInfo =>
                        }
                    )
                Text("test drag event")
                    .width(100.percent)
                    .height(100)
                    .margin(left: 15)
                TextArea(placeholder: "please input words")
                    .width(100.percent)
                    .height(50)
                Search(placeholder: "please input words")
                    .searchButton("Search")
                    .width(100.percent)
                    .height(80)
                    .textFont(size: 20)

                Column() {
                    Text("This is abstract")
                        .fontSize(20)
                        .width(100.percent)
                }
                    .margin(left: 40, top: 20)
                    .width(100.percent)
                    .height(100)
                    .backgroundColor(this.backGroundColor)
            }
                .width(45.percent)
                .height(100.percent)
                .onDragLeave({
                    event: DragInfo => Hilog.info(1,"1","Cangjie-App", "### onDragLeave")
                })
                .onDrop({
                    dragEvent: DragInfo => ()
                })

            Column() {
                Text("Drag Target Area")
                    .fontSize(20)
                    .width(100.percent)
                    .height(100.percent)
                    .margin(10)
                    .backgroundColor(0x008888)
                    .onDrop(
                        {
                            dragEvent: DragInfo =>
                            Hilog.info(1,"1","Cangjie-App", "### onDrop")
                        }
                    )
                    .onDragEnter({
                        event: DragInfo => Hilog.info(1,"1","Cangjie-App", "### onDragEnter")
                    })
                    .onDragLeave({
                        event: DragInfo => Hilog.info(1,"1","Cangjie-App", "### onDragLeave")
                    })
            }
        }
    }
}
