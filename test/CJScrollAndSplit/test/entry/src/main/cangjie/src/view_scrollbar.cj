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
import std.collection.forEach
import std.collection.ArrayList

@Entry
@Component
class ViewScrollbar {
    var arr1: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2 , 3 , 4 ,5])
    var arr2: ArrayList<Int64> = ArrayList<Int64>([5, 6, 7, 8 , 9 ,10])
    var arr3: ArrayList<Int64> = ArrayList<Int64>([10, 11, 12 , 13 , 14, 15])
    var arr4: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    let scroller1 = Scroller()
    let scroller2 = Scroller()
    let scroller3 = Scroller()
    let scroller4 = Scroller()


    func build() {
        Column() {
            // 基础场景用例：默认属性设置
            Stack(alignContent: Alignment.End) {
                Scroll(this.scroller1) {
                    Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start) {
                        ForEach(
                            this.arr1,
                            itemGeneratorFunc: {
                                item: Int64, idx: Int64 => Row() {
                                    Text(item.toString()).width(60.percent).height(60).backgroundColor(0x3366CC).
                                        borderRadius(15).fontSize(16).textAlign(TextAlign.Center).margin(top: 5)
                                }
                            }
                        )
                    }.margin(right: 15)
                }.width(90.percent).scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
                ScrollBar(scroller: this.scroller1) {}
                   .id("test_bar_1")
                   .width(20)
                   .backgroundColor(0xededed)
            }.height(200.vp)
            .margin(bottom: 15)

            // 基础场景用例：合法属性设置
            //text2
            Stack(alignContent: Alignment.Bottom) {
                Scroll(this.scroller2) {
                    Flex(direction: FlexDirection.Row, alignItems: ItemAlign.End) {
                        ForEach(
                            this.arr2,
                            itemGeneratorFunc: {
                                item: Int64, idx: Int64 => Row() {
                                    Text(item.toString()).width(40.percent).height(90).backgroundColor(0x3366CC).
                                        borderRadius(20).fontSize(16).textAlign(TextAlign.Center).margin(top: 5)
                                }
                            }
                        )
                    }.margin(right: 5,bottom: 20,left: 5)
                }.width(90.percent).scrollBar(BarState.Off).scrollable(ScrollDirection.Horizontal)
                ScrollBar(scroller: this.scroller2, direction: ScrollBarDirection.Horizontal, state: BarState.On) {}
                   .id("test_bar_2")
                   .backgroundColor(0xededed)
            }.height(100.vp)
            .margin(bottom: 5)

            //text3
            Stack(alignContent: Alignment.Bottom) {
            Scroll(this.scroller3) {
                Flex(direction: FlexDirection.Row, alignItems: ItemAlign.Start) {
                    ForEach(
                        this.arr3,
                        itemGeneratorFunc: {
                            item: Int64, idx: Int64 => Row() {
                                Text(item.toString()).width(40.percent).height(90).backgroundColor(0x3366CC).
                                    borderRadius(20).fontSize(16).textAlign(TextAlign.Center).margin(top: 5)
                            }
                        }
                    )
                }.margin(right: 5,bottom: 20,left: 5)
            }.width(90.percent).scrollBar(BarState.On).scrollable(ScrollDirection.Vertical)
            ScrollBar(scroller: this.scroller3, direction: ScrollBarDirection.Horizontal) {
                Text("abc")
                    .id("sub_text")
                   .width(50)
                    .borderRadius(10).backgroundColor(0xC0C0C0)
            }
                .backgroundColor(0xededed).id("test_bar_3")
            }.height(200.vp)

            Stack(alignContent: Alignment.End){
                Scroll() {
                    Column(){
                        Text("Scroll Area")
                        .width(100.percent)
                        .height(40.percent)
                        .backgroundColor(0x0080DC)
                        .textAlign(TextAlign.Center)
                        List(space: 10, scroller:this.scroller4) {
                            ForEach(this.arr4,
                                itemGeneratorFunc: {
                                    item: Int64, index: Int64 => ListItem() {Text("item${item}").fontSize(16)}
                                }
                            )
                        }
                        .scrollBar(BarState.On)
                        .nestedScroll(NestedScrollOptions(NestedScrollMode.ParentFirst,NestedScrollMode.SelfFirst))
                        .height(100.percent)
                    }.width(100.percent)
                }.width(90.percent).scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
                ScrollBar(scroller: this.scroller4, state: BarState.On) {}
                    .backgroundColor(0xededed)
                    .id("test_bar_4")
            }.height(200.vp)

        }
    }
}

