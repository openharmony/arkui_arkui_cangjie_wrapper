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
 * Created on 2024/7/4
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

func parseScrollState(state: ScrollState) {
        match (state) {
            case Idle => "Idle"
            case Scrolling => "Scrolling"
            case Fling => "Fling"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
}

@Entry
@Component
class ViewList {
    let arr = [0, 1, 2, 3, 4, 5, 6] //, 7, 8, 9,10,11,12,13,14,15,16,17,18
    let arr2 = [0, 1]
    let arr3 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
    @State
    var deleteFlag: String = "no"
    @State
    var firstIndex: Int32 = 0
    @State
    var lastIndex: Int32 = 0
    @State
    var reachstart: Bool = false
    @State
    var end: Bool = false
    @State
    var stop: Bool = false
    @State
    var scrollstart: Bool = false
    @State
    var offset: Float64 = 0.0
    @State
    var state: ScrollState = ScrollState.Idle
    let stateValue = 0
    // ScrollState.Idle.getValue()
    let stateValue2 = 1
    // ScrollState.Scrolling.getValue()
    let stateValue3 = 2
    // ScrollState.Fling.getValue()

    func build() {
        Column() {
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
                        }
                    )
                }
                    .id("list")
                    .listDirection(Axis.Vertical) // 排列方向
                    .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
                    .chainAnimation(false)
                    .scrollBar(BarState.Auto)
                    .cachedCount(0)
                    .divider(strokeWidth: 2.px) // 每行之间的分界线
                    .multiSelectable(true)
                    .lanes(1)
                    .alignListItem(ListItemAlign.Start)
                    .alignListItem(ListItemAlign.End)
                    .alignListItem(ListItemAlign.Center)
                    .sticky(StickyStyle.Footer)
                    .sticky(StickyStyle.None)
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.SelfOnly, NestedScrollMode.SelfOnly))
                    .onScrollIndex(
                        {
                            start: Int32, end: Int32, center: Int32 =>
                            this.firstIndex = firstIndex
                            this.lastIndex = lastIndex
                            this.reachstart = false
                            this.end = false
                        }
                    )
                    .onReachEnd({=> this.end = true})
                    .onReachStart({=> this.reachstart = true})
                    .onScrollStart(
                        {
                            =>
                            this.scrollstart = true
                            this.stop = false
                        }
                    )
                    .onScrollStop(
                        {
                            =>
                            this.stop = true
                            this.scrollstart = false
                        }
                    )
            }
                .width(100.percent)
                .height(40.percent)
                .backgroundColor(0xDCDCDC)
                .padding(top: 5.px)

            Text("${firstIndex}" + "${lastIndex}")
                .textAlign(TextAlign.Center)
                .width(100.percent)
                .id("text")
                .backgroundColor(Color.Green)

            Text("${this.end}" + "${this.reachstart}")
                .textAlign(TextAlign.Center)
                .width(100.percent)
                .id("text2")
                .backgroundColor(Color.Blue)

            Text("${this.stop}" + "${this.scrollstart}")
                .textAlign(TextAlign.Center)
                .width(100.percent)
                .id("text3")
                .backgroundColor(Color.Green)

            Text("${this.offset}" + parseScrollState(this
                .state))
                .textAlign(TextAlign.Center)
                .width(100.percent)
                .id("text4")
                .backgroundColor(Color.Blue)

            Column() {
                List(space: 20, initialIndex: 0) {
                    ForEach(
                        this.arr2,
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
                        }
                    )
                }
                    .id("list2")
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.ParentFirst, NestedScrollMode.Parallel))
                    .divider(strokeWidth: 3.px, color: @r(app.color.blue_23C452), startMargin: 2.vp, endMargin: 2.vp)
            }
                .width(100.percent)
                .height(20.percent)
                .backgroundColor(0xDCDCDC)
                .padding(top: 5.px)

            Column() {
                List(space: 20, initialIndex: 0) {
                    ForEach(
                        this.arr3,
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
                        }
                    )
                }
                    .id("list3")
                    .sticky(StickyStyle.Header)
                    .divider(strokeWidth: @r(app.string.control_Width), color: Color.Blue,
                        startMargin: @r(app.string.control_Width), endMargin: @r(app.string.control_Width))
                    .lanes(minLength: 30.vp, maxLength: 30.vp)
            }
                .width(100.percent)
                .height(20.percent)
                .backgroundColor(0xDCDCDC)
                .padding(top: 5.px)

            Column() {
                List(space: 20, initialIndex: 0) {
                    ForEach(
                        this.arr2,
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
                        }
                    )
                }
                    .id("list4")
                    .edgeEffect(EdgeEffect.None)
                    .sticky(StickyStyle.Header)
                    .divider(strokeWidth: @r(app.string.control_Width), color: @r(app.color.blue_23C452),
                        startMargin: @r(app.string.control_Width), endMargin: @r(app.string.control_Width))
            }
                .width(100.percent)
                .height(20.percent)
                .backgroundColor(0xDCDCDC)
                .padding(top: 5.px)
        }
    }
}
