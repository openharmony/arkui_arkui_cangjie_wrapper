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
 * Created on 2024/6/14
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap, HashSet}

@Entry
@Component
class View_Grid_Item {
    let scroller = Scroller()
    @State
    var numbers: ArrayList<String> = ArrayList(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13",
        "14", "15"])

    @State
    var numbers2: ArrayList<String> = ArrayList(["0", "1", "2"])

    var select_event: String = "select_event"

    @State
    var numbers3: Array<String> = ['0', '1', '2', '3', '4']
    var scroller3: Scroller = Scroller()
    @State
    var gridPosition: Int64 = 0 //0代表滚动到grid顶部，1代表中间值，2代表滚动到grid底部。

    @State
    var message: String = "Hello Cangjie"

    @State
    var numbers4: ArrayList<String> = ArrayList<String>()

    var scroller4: Scroller = Scroller()
    @State
    var text: String = "drag"

    @Builder
    func pixelMapBuilder() { //拖拽过程样式
        Column() {
            Text(this.text)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width(80)
                .height(80)
                .textAlign(TextAlign.Center)
        }
    }

    protected override func aboutToAppear() {
        for (i in 1..16) {
            this
                .numbers
                .add("${i}")
        }
    }

    func changeIndex(index1: Int64, index2: Int64) { //交换数组位置
        var temp = this
            .numbers
            .get(index1)
            .getOrThrow();
        this
            .numbers
            .add(
                this
                    .numbers
                    .get(index2)
                    .getOrThrow(),
                at: index1
            )
        this
            .numbers
            .add(temp, at: index2)
    }

    func build() {
        Column() {
            Text(this.select_event).id("select_event")

            Grid(child: { =>
                //指定当前GridItem组件的起始行号为1，终点行号为4
                GridItem() {
                    Text("4")
                        .fontSize(16)
                        .backgroundColor(0xFAEEE0)
                        .width(100.percent)
                        .height(100.percent)
                        .textAlign(TextAlign.Center)
                        .id("text1")
                }
                    .rowStart(1)
                    .rowEnd(4)
                    .id("gridItem1")

                //循环渲染Griditem，标记为0-15
                ForEach(
                    this.numbers,
                    itemGeneratorFunc: {
                        num: String, idx: Int64 => GridItem {
                            Text(num)
                                .fontSize(16)
                                .backgroundColor(0xF9CF93)
                                .width(100.percent)
                                .height(100.percent)
                                .textAlign(TextAlign.Center)
                        }
                    }
                )
                //指定当前GridItem组件的起始列号为1，终点列号为5
                GridItem {
                    Text("5")
                        .fontSize(16)
                        .backgroundColor(0xDBD0C0)
                        .width(100.percent)
                        .height(100.percent)
                        .textAlign(TextAlign.Center)
                        .id("text2")
                }
                    .columnStart(1)
                    .columnEnd(5)
                    .id("gridItem2")

                GridItem()
            })
                .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
                .rowsTemplate("1fr 1fr 1fr 1fr 1fr")
                .width(90.percent)
                .backgroundColor(0xFAEEE0)
                .height(300)

            Grid(child: { =>
                //循环渲染Griditem，标记为0-15
                ForEach(
                    this.numbers2,
                    itemGeneratorFunc: {
                        num: String, idx: Int64 => ForEach(
                            this.numbers2,
                            itemGeneratorFunc: {
                                num: String, idx: Int64 => GridItem() {
                                    Text(num)
                                        .fontSize(16)
                                        .width(100.percent)
                                        .height(100.percent)
                                        .textAlign(TextAlign.Center)
                                        .focusable(true)
                                }.backgroundColor(0xF9CF93)
                            }
                        )
                    }
                )
            })
                .columnsTemplate("1fr 1fr 1fr")
                .rowsTemplate("1fr 1fr")
                .columnsGap(4)
                .rowsGap(4)
                .width(60.percent)
                .backgroundColor(0xFAEEE0)
                .height(150)
                .padding(4.vp)

            Grid(child: { =>
                //循环渲染Griditem，标记为0-15
                ForEach(
                    this.numbers2,
                    itemGeneratorFunc: {
                        num: String, idx: Int64 => ForEach(
                            this.numbers2,
                            itemGeneratorFunc: {
                                num: String, idx: Int64 => GridItem() {
                                    Text(num)
                                        .fontSize(16)
                                        .width(100.percent)
                                        .height(100.percent)
                                        .textAlign(TextAlign.Center)
                                        .focusable(true)
                                }.backgroundColor(0xF9CF93)
                            }
                        )
                    }
                )
            })
                .columnsTemplate("1fr 1fr 1fr")
                .rowsTemplate("1fr 1fr")
                .columnsGap(4)
                .rowsGap(4)
                .width(60.percent)
                .backgroundColor(0xFAEEE0)
                .height(150)
                .padding(4.vp)

            Text(this.message)
                .id("scroll_text")
                .fontColor(0xCCCCCC)
                .fontSize(9)
                .width(90.percent)
            Grid(scroller: this.scroller3, child: { =>
                ForEach(
                    this.numbers3,
                    itemGeneratorFunc: {
                        day: String, idx: Int64 => ForEach(
                            this.numbers3,
                            itemGeneratorFunc: {
                                day: String, idx: Int64 => GridItem() {
                                    Text(day)
                                        .fontSize(16)
                                        .backgroundColor(0xF9CF93)
                                        .width(100.percent)
                                        .height(80)
                                        .textAlign(TextAlign.Center)
                                }
                            }
                        )
                    }
                )
            })
                .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
                .columnsGap(10)
                .rowsGap(10)
                .friction(0.6)
                .enableScrollInteraction(true)
                .scrollBar(BarState.On)
                .scrollBarColor(Color.Gray)
                .scrollBarWidth(4)
                .width(90.percent)
                .backgroundColor(0xFAEEE0)
                .height(300)
                .onScrollStart({
                    => Hilog.info(1, "info", "XXX" + "Grid onScrollStart")
                })
                .onScrollStop({
                    => Hilog.info(1, "info", "XXX" + "Grid onScrollStop")
                })
                .onReachStart(
                    {
                        =>
                        this.gridPosition = 0
                        Hilog.info(1, "info", "XXX" + "Grid onReachStart")
                    }
                )
                .onReachEnd(
                    {
                        =>
                        this.gridPosition = 2
                        Hilog.info(1, "info", "XXX" + "Grid onReachEnd")
                    }
                )

            Button('next page').onClick({
                e => // 点击后滑到下一页
                this
                    .scroller
                    .scrollPage(true, animation: false)
            })

            Grid(scroller: this.scroller4, child: { =>
                ForEach(
                    this.numbers4,
                    itemGeneratorFunc: {
                        day: String, idx: Int64 => GridItem() {
                            Text(day)
                                .fontSize(16)
                                .backgroundColor(0xF9CF93)
                                .width(80)
                                .height(80)
                                .textAlign(TextAlign.Center)
                        }
                    }
                )
            })
                .columnsTemplate("1fr 1fr 1fr")
                .columnsGap(10)
                .rowsGap(10)
                .width(90.percent)
                .backgroundColor(0xFAEEE0)
                .height(300)
        }
            .width(100.percent)
            .margin(top: 5)
    }
}
