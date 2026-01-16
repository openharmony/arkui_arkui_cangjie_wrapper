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
 * Created on 2024/7/11
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class ViewListItem {
    let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @State
    var selected: Bool = false

    let listScroller: Scroller = Scroller()

    let arr1 = [0, 1, 2]

    @State
    var text: String = "drag"

    @State
    var text2: String = "Hello"

    @State
    var message: String = "Hello listScroller"

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

    @State
    var numbers: ArrayList<String> = ArrayList<String>()

    protected override func aboutToAppear() {
        for (i in 1..11) {
            this
                .numbers
                .add("${i}")
        }
    }

    @Builder
    func itemEnd() {
        Row() {
            Button("Delete").margin(4.vp)
            Button("Set").margin(4.vp)
        }
            .padding(4.vp)
            .justifyContent(FlexAlign.SpaceEvenly)
    }

    func changeIndex(index1: Int64, index2: Int64) { //交换数组位置
        var temp = this.numbers[index1];
        //        this.numbers.add(this.numbers.get(index2).getOrThrow(), at: index1)
        //        this.numbers.add(temp, at: index2)
        this.numbers[index1] = this.numbers[index2]
        this.numbers[index2] = temp
        Hilog.info(1, "info", "onItemDrop changeIndex, this.numbers: ${this.numbers}")
    }

    @Builder
    func HeaderBuilder() {
        Row {
            Text("Header").fontSize(20.vp)
        }
            .width(100.percent)
            .justifyContent(FlexAlign.Center)
            .margin(top: 10.vp)
    }

    func build() {
        Scroll() {
            Column() {
                Column() {
                    List(space: 20, initialIndex: 0, scroller: listScroller) {
                        ListItemGroup(
                            header: bind(this.HeaderBuilder, this), footer: {=> Text("Footer 1")},
                                space: 10.vp) {
                            ListItem() {
                                Text("item1")
                                    .width(100.percent)
                                    .height(100)
                                    .fontSize(16)
                                    .textAlign(TextAlign.Center)
                                    .borderRadius(10.5)
                                    .backgroundColor(0xFFFFFF)
                            }
                                .swipeAction(end: bind(this.itemEnd, this), onOffsetChange: {offset: Float64 => Hilog.info(1, "info", "swipeAction ${offset}")})
                                .selectable(true)
                                .onSelect({select: Bool => this.selected = select})

                            ListItem() {
                                Text("item2")
                                    .width(100.percent)
                                    .fontSize(16)
                                    .textAlign(TextAlign.Center)
                                    .borderRadius(10.5)
                                    .backgroundColor(0xFFFFFF)
                            }
                                .swipeAction()
                                .selectable(true)
                                .onSelect({select: Bool => this.selected = select})

                            ListItem() {
                                Text("item3")
                                    .width(100.percent)
                                    .height(100)
                                    .fontSize(16)
                                    .textAlign(TextAlign.Center)
                                    .borderRadius(10.5)
                                    .backgroundColor(0xFFFFFF)
                            }
                                .swipeAction(end: bind(this.itemEnd, this), edgeEffect: SwipeEdgeEffect.None)
                                .selectable(true)
                                .onSelect({select: Bool => this.selected = select})
                        }
                            .borderRadius(10.vp)
                            .backgroundColor(Color.White)
                            .divider(ListDividerOptions(strokeWidth: 2.vp, color: Color(0X808080), startMargin: 10.vp, endMargin: 10.vp))
                    }
                        .width(80.percent)
                        .scrollBar(BarState.Off)
                        .scrollBarColor(@r(app.color.blue_23C452))
                        .scrollBarWidth(10.vp)
                        .onScrollIndex({
                            a, b, c => Hilog.info(1, "info", "onItemDragStart ab: {${a}, ${b}}, c:${c}")
                        })

                    Row() {
                        Button("getItem")
                            .onClick(
                                {
                                   e =>
                                    this.message = "x: 0"
                                }
                            )
                            .id("getItem")
                        Button("getInfo")
                            .onClick(
                                {
                                   e =>
                                    this.message = "index: 0"
                                }
                            )
                            .id("getInfo")
                        Button("scrollItem")
                            .onClick(
                                {
                                   e =>
                                    this.message = "scrollToItemInGroup 0 1"
                                }
                            )
                            .id("scrollItem")
                        Button("closeSwipe")
                            .onClick(
                                {
                                  e =>
                                    this.message = "closeAllSwipeActions 0 1"
                                }
                            )
                            .id("closeSwipe")
                    }.width(100.percent)
                    Text("${this.message}").id("message")
                }
                    .width(100.percent)
                    .height(460.vp)
                    .backgroundColor(0xDCDCDC)
                    .padding(top: 5.px)
                Text("${this.selected}").id("text")

                Column() {
                    List(space: 20, initialIndex: 0) {
                        ForEach(
                            this.arr,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => ListItem() {
                                    Text("${item}")
                                        .width(100.percent)
                                        .height(100)
                                        .fontSize(16)
                                        .textAlign(TextAlign.Center)
                                        .borderRadius(10)
                                        .backgroundColor(0xFFFFFF)
                                }
                                    .swipeAction(end: bind(this.itemEnd, this))
                                    .selectable(true)
                                    .id("listitem")
                                    .onSelect({select: Bool => this.selected = select})
                            }
                        )
                    }
                        .scrollBar(BarState.Off)
                        .width(90.percent)
                        .nestedScroll(NestedScrollOptions(NestedScrollMode.SelfFirst, NestedScrollMode.SelfFirst))
                }
                    .width(100.percent)
                    .height(360.vp)
                    .backgroundColor(0xDCDCDC)
                    .padding(top: 5.px)
                Text("${this.selected}").id("text")

                Column() {
                    List(space: 20, initialIndex: 0) {
                        ForEach(
                            this.arr,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => ListItem() {
                                    Text("${item}")
                                        .width(100.percent)
                                        .height(100)
                                        .fontSize(16)
                                        .textAlign(TextAlign.Center)
                                        .borderRadius(10.vp)
                                        .backgroundColor(0xFFFFFF)
                                }
                                    .swipeAction(end: bind(this.itemEnd, this))
                                    .selectable(true)
                                    .id("listitem2")
                                    .onSelect({select: Bool => this.selected = select})
                            }
                        )
                    }
                        .scrollBar(BarState.Off)
                        .width(90.percent)
                        .nestedScroll(NestedScrollOptions(NestedScrollMode.SelfFirst, NestedScrollMode.SelfFirst))
                }
                    .width(100.percent)
                    .height(360.vp)
                    .backgroundColor(0xDCDCDC)
                    .padding(top: 5.px)
                Text("${this.selected}").id("text2")

                Column() {
                    List(space: 20, initialIndex: 0) {
                        ForEach(
                            this.arr,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => ListItem() {
                                    Text("${item}")
                                        .width(100.percent)
                                        .height(100)
                                        .fontSize(16)
                                        .textAlign(TextAlign.Center)
                                        .borderRadius(10.5)
                                        .backgroundColor(0xFFFFFF)
                                }
                                    .swipeAction(end: bind(this.itemEnd, this))
                                    .selectable(true)
                                    .id("listitem3")
                                    .onSelect({select: Bool => this.selected = select})
                            }
                        )
                    }
                        .scrollBar(BarState.Off)
                        .width(90.percent)
                        .nestedScroll(NestedScrollOptions(NestedScrollMode.SelfFirst, NestedScrollMode.SelfFirst))
                }
                    .width(100.percent)
                    .height(360.vp)
                    .backgroundColor(0xDCDCDC)
                    .padding(top: 5.px)
                Text("${this.selected}").id("text3")

                List() {}
                    .width(80.percent)
                    .lanes(1)
                    .lanes(minLength: 1.vp, maxLength: 1.vp)
                    .width(90.percent)
                    .friction(1.0)
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.SelfFirst, NestedScrollMode.SelfFirst))
                    .enableScrollInteraction(true)
            }
        }
    }
}
