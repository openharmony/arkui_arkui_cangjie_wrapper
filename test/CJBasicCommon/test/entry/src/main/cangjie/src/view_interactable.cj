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
import std.collection.{ArrayList, HashMap}
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.Size
import ohos.multimedia.image.ScaleMode

@Entry
@Component
class View_Interactable {
    @State
    var hoverText: String = "no hover"
    @State
    var mouseText: String = "MouseText"
    @State
    var color: Color = Color.Blue

    @State
    var numbers: ObservedArrayList<String> = ObservedArrayList<String>(["one", "two"])
    @State
    var text: String = ""
    @State
    var bool: Bool = false
    @State
    var bool1: Bool = false
    @State
    var appleVisible: Visibility = Visibility.Visible
    @State
    var orangeVisible: Visibility = Visibility.Visible
    @State
    var bananaVisible: Visibility = Visibility.None
    @State
    var select: Int32 = 0

    @State
    var text2: String = ""

    @State
    var value: String = "Text"
    @State
    var sizeValue: String = ""

    let colors = Array<UInt8>(80000, repeat: 100)
    let opts = InitializationOptions(Size(200, 200))

    @Builder
    func pixelMapBuilder() {
        Column() {
            Text(this.text)
                .width(50.percent)
                .height(60)
                .fontSize(16)
                .borderRadius(10)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xFF0000)
        }
    }

    func build() {
        Column(space: 20) {
            Row() {
                Button(this.hoverText)
                    .id("hoverBtn")
                    .onHover(
                        {
                            isHover => if (isHover) {
                                this.hoverText = "hover"
                                this.color = Color.Red
                            } else {
                                this.hoverText = "no hover"
                                this.color = Color.Blue
                            }
                        })
                    .backgroundColor(this.color)

                Button("onMouse")
                    .id("onMouseBtn")
                    .onMouse(
                        {
                            event =>
                            this.mouseText = """
                        onMouse:
                        Button = ${event
                                .button
                                .toString()}
                        Action = ${event.action.toString()}
                        localXY = (${event
                                .x} , ${event.y})
                        screenXY = (${event.screenX} , ${event.screenY})
                        """
                            Hilog.info(1, "1", "Cangjie-App", this.mouseText)
                        }
                    )
            }
            Text(this.mouseText)

            Text("There are three Text elements here")
                .fontSize(12)
                .fontColor(0xCCCCCC)
                .width(90.percent)
                .textAlign(TextAlign.Start)
            Flex(direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround) {
                Button("apple")
                    .width(25.percent)
                    .height(35)
                    .fontSize(16)
                    .id("apple")
                    .backgroundColor(0xAFEEEE)
                    .visibility(this.appleVisible)
                    .onDragStart(
                        {
                            evt =>
                            this.text = "apple"
                            this.appleVisible = Visibility.Hidden
                            Hilog.info(1, "1", "Cangjie-App",
                                "onDragStart info:" + evt.extraParams + "," + evt.touchPoint.x.toString() + "," +
                                    evt.touchPoint.y.toString())
                        }
                    )

                Button("orange")
                    .width(25.percent)
                    .height(35)
                    .fontSize(16)
                    .id("orange")
                    .backgroundColor(0xAFEEEE)
                    .visibility(this.orangeVisible)
                    .onDragStart(
                        {
                            evt =>
                            this.text = "apple"
                            this.orangeVisible = Visibility.Hidden
                            pixelMapBuilder
                        }
                    )

                Button("banana")
                    .width(25.percent)
                    .height(35)
                    .fontSize(16)
                    .backgroundColor(0xAFEEEE)
                    .visibility(this.bananaVisible)
                    .onDragStart(
                        {
                            evt =>
                            this.text = "apple"
                            this.bananaVisible = Visibility.Hidden
                            var colors: Array<UInt8> = [80, 2, 4, 8, 40, 2, 4, 8]
                            var size: Size = Size(4, 3)
                            let opts = InitializationOptions(size)
                            let pixelMap = createPixelMap(colors, opts)
                            return bind(pixelMapBuilder, this)
                        }
                    )
            }.border(width: 1.px).width(90.percent).padding(top: 10, bottom: 10).margin(10)

            Text("This is a List element")
                .fontSize(12)
                .fontColor(0xCCCCCC)
                .width(90.percent)
                .textAlign(TextAlign.Start)

            List(space: 20, initialIndex: 0) {
                ForEach(
                    this.numbers,
                    itemGeneratorFunc: {
                        itemInfo: String, index: Int64 => ListItem() {
                            Text(itemInfo)
                                .fontSize(16.px)
                                .textAlign(TextAlign.Center)
                                .borderRadius(10.px)
                                .backgroundColor(0xAFEEEE)
                                .width(100.percent)
                                .height(80)
                                .id("text_${index}")
                        }.onDragStart(
                            {
                                evt =>
                                Hilog.info(1, "1", "Cangjie-App",
                                    "onDragStart info:" + evt.extraParams + "," + evt.touchPoint.x.toString() + "," +
                                        evt.touchPoint.y.toString())
                                return {=>}
                            }
                        )
                    }
                )
            }
                .height(20.percent)
                .width(90.percent)
                .border(width: 1.px)
                .divider(strokeWidth: 2.px, color: Color.Red, startMargin: 20.px, endMargin: 20.px)
                .onDragEnter(
                    {
                        evt => Hilog.info(1, "1", "Cangjie-App",
                            "onDragEnter info:" + evt.extraParams + "," + evt.touchPoint.x.toString() + "," +
                                evt.touchPoint.y.toString())
                    })
                .onDragMove(
                    {
                        evt => Hilog.info(1, "1", "Cangjie-App",
                            "onDragMove info:" + evt.extraParams + "," + evt.touchPoint.x.toString() + "," +
                                evt.touchPoint.y.toString())
                    })
                .onDragLeave(
                    {
                        evt => Hilog.info(1, "1", "Cangjie-App",
                            "onDragLeave info:" + evt.extraParams + "," + evt.touchPoint.x.toString() + "," +
                                evt.touchPoint.y.toString())
                    })
                .onDrop(
                    {
                        evt => Hilog.info(1, "1", "Cangjie-App",
                            "onDrop info:" + evt.extraParams + "," + evt.touchPoint.x.toString() + "," +
                                evt.touchPoint.y.toString())
                    })

            Button("Click")
                .backgroundColor(0x2788D9)
                .id("keyBtn")
                .onKeyEvent(
                    {
                        event =>
                        this.text2 = """
                    keyType: ${event.keyType.toString()}
                    keyCode: ${event
                            .keyCode
                            .toString()}
                    keyText: ${event.keyText}
                    deviceId: ${event
                            .deviceId
                            .toString()}
                    metaKey: ${event.metaKey.toString()}
                    timestamp: ${event
                            .timestamp
                            .toString()}
                """
                        Hilog.info(1, "1", "Cangjie-App", this.text)
                        event.stopPropagation()
                    }
                )
                .onTouch(
                    {
                        event =>
                        this.text2 = """
                    TouchType: ${event.eventType.toString()}
                    timestamp: ${event
                            .timestamp}
                    Distance between point and element:
                    x: ${event
                            .touches[0]
                            .x} y: ${event.touches[0].y}
                    Component localPos:(${event
                            .target
                            .area
                            .position
                            .x}, ${event.target.area.position.y})
                    width: ${event.target.area.width} height: ${event
                            .target
                            .area
                            .height}
                """
                        Hilog.info(1, "1", "Cangjie-App", this.text)
                        event.stopPropagation()
                    }
                )
                .width(200.px)
            Text(this.text2).padding(2).width(100.percent)

            Text(this.value)
                .id("text_areaChange")
                .backgroundColor(Color.Green)
                .margin(5)
                .fontSize(30)
                .onClick({evt => this.value = this.value + "TextTextTextTextText"})
                .onAreaChange(
                    {old, new => this.sizeValue = "from " + old.width.toString() + " to " + new.width.toString()})
                .onVisibleAreaChange([1.0], {isVisible, currentRatio => this.value = "${currentRatio}"})
            Text("Area:\n" + this.sizeValue).margin(5)
        }.width(100.percent)
    }
}
