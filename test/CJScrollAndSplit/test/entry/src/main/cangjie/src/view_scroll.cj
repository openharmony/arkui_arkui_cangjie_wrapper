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
 * Created on 2024/6/27
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.shape.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class View_Scroll {
    let scroller = Scroller()
    var arr: ArrayList<String> = ArrayList(["0", "1", "2", "3", "4", "5"])
    let array: ArrayList<Int64> = ArrayList([0, 1, 2, 3, 4])

    @State
    var listPosition: Int32 = 0
    @State
    var arr32: ArrayList<Int32> = ArrayList<Int32>([0, 1, 2])
    @State
    var scrollerForScroll: Scroller = Scroller()
    @State
    var scrollerForList: Scroller = Scroller()

    let float_offset = OffsetResult(0.0, 100.0)
    let ease: Curve = Curve.Ease
    let align1: ScrollAlign = ScrollAlign.Center
    let align2: ScrollAlign = ScrollAlign.End
    let align3: ScrollAlign = ScrollAlign.Auto
    let align4: ScrollAlign = ScrollAlign.Start

    let Forward_mode: NestedScrollMode = NestedScrollMode.SelfOnly
    let Backward_mode: NestedScrollMode = NestedScrollMode.SelfFirst
    let nest_option = NestedScrollOptions(Forward_mode, Backward_mode)

    var rectResult: RectResult = RectResult(1.0, 1.0, 1.0, 1.0)

    let scrollResult: ScrollResult = ScrollResult(offsetRemain: 1.0)

    func build() {
        Scroll() {
            Column() {
                Scroll(this.scroller) {
                    Column() {
                        ForEach(
                            this.array,
                            itemGeneratorFunc: {
                                item: Int64, idx: Int64 => Text("TEXT" + item.toString()).width(100.percent).height(50).
                                    backgroundColor(0xFFFFFF).textAlign(TextAlign.Center).id("TEXT" + item.toString())
                            }
                        )
                    }
                }.scrollable(ScrollDirection.Vertical).scrollBar(BarState.On).scrollBarColor(0x808080).scrollBarWidth(
                    50).scrollable(ScrollDirection.Vertical).scrollBar(BarState.On).scrollBarColor(Color.Gray).
                    scrollBarWidth(50.px).onScrollEdge(
                    {
                    edge => match (edge) {
                        case Edge.Top => Hilog.info(1, "info", "Top")
                        case Edge.Bottom => Hilog.info(1, "info", "Bottom")
                        case Edge.Start => Hilog.info(1, "info", "Start")
                        case Edge.End => Hilog.info(1, "info", "End")
                        case _ => Hilog.info(1, "info", "None")
                    }
                }).nestedScroll(nest_option).width(90.percent).height(100.vp)

                Button("scrollTo").onClick(
                    {
                        evt =>
                        Hilog.info(1, "info", "current offset ${this.scroller.currentOffset().yOffset}")
                        Hilog.info(1, "info", "CALCULATE offset ${this.scroller.currentOffset().yOffset + 100.0}")
                        this.scroller.scrollTo(
                            xOffset: 0.px,
                            yOffset: (this.scroller.currentOffset().yOffset + 100.0).px
                        )
                        this.scroller.scrollTo(xOffset: 10, yOffset: 20)
                        this.scroller.scrollTo(xOffset: 10.0, yOffset: 20.0)
                        this.scroller.scrollTo(xOffset: 10, yOffset: 20, animation: ScrollAnimationOptions(duration: 3.0, curve: Curve.EaseIn))
                        this.scroller.scrollTo(xOffset: 10.0, yOffset: 20.0, animation: ScrollAnimationOptions(duration: 3.0, curve: Curve.FastOutSlowIn))
                        this.scroller.scrollTo(xOffset: 10.0.vp, yOffset: 20.0.vp, animation: ScrollAnimationOptions(duration: 3.0,
                            curve: Curve.LinearOutSlowIn))
                        this.scroller.scrollTo(xOffset: 1, yOffset: 2, animation: ScrollAnimationOptions(duration: 3.0, curve: Curve.FastOutLinearIn))
                        this.scroller.scrollTo(xOffset: 1, yOffset: 2, animation: ScrollAnimationOptions(duration: 3.0, curve: Curve.Sharp))
                        this.scroller.scrollTo(xOffset: 1, yOffset: 2, animation: ScrollAnimationOptions(duration: 3.0, curve: Curve.Rhythm))
                        this.scroller.scrollTo(xOffset: 1, yOffset: 2, animation: ScrollAnimationOptions(duration: 3.0, curve: Curve.Smooth))
                        this.scroller.scrollTo(xOffset: 1, yOffset: 2, animation: ScrollAnimationOptions(duration: 3.0, curve: Curve.Friction))
                    }
                ).id("scrollTo")

                Button("scrollBy").onClick(
                    {
                        evt =>
                        this.scroller.scrollEdge(Edge.Bottom)
                        this.scroller.scrollEdge(Edge.Start)
                        this.scroller.scrollEdge(Edge.End)
                        this.scroller.scrollBy(xOffset: 10, yOffset: 20)
                        this.scroller.scrollBy(xOffset: 10.0, yOffset: 20.0)
                    }
                ).id("scrollBy")

                Button("scrollToIndex").onClick(
                    {
                        evt =>
                        this.scroller.scrollEdge(Edge.Top)
                        this.scroller.scrollToIndex(1, align: align1)
                        this.scroller.scrollToIndex(1, align: align2)
                        this.scroller.scrollToIndex(1, align: align3)
                        this.scroller.scrollToIndex(1, align: align4)
                    }
                ).id("scrollToIndex")

                Button("scrollToPage").onClick(
                    {
                        evt =>
                        this.scroller.scrollPage(true, animation: false)
                        this.scroller.currentOffset()
                    }
                ).id("scrollToPage")

                Scroll(scrollerForScroll) {
                    Column() {
                        Text("Scroll Area").width(100.percent).height(40.percent).backgroundColor(0x330000ff).fontSize(
                            16.vp).textAlign(TextAlign.Center).onClick({
                            e => this.scrollerForList.scrollToIndex(5)
                        })

                        List(space: 20, scroller: scrollerForList) {
                            ForEach(
                                arr32,
                                itemGeneratorFunc: {
                                    itemInfo: Int32, index: Int64 => ListItem() {
                                        Text("${itemInfo}").width(100.percent).height(100.percent).borderRadius(15).
                                            fontSize(16).textAlign(TextAlign.Center).backgroundColor(Color.White)
                                    }.width(100.percent).height(100)
                                }
                            )
                        }.width(100.percent).height(50.percent).edgeEffect(EdgeEffect.None).onReachStart(
                            {=> listPosition = 0}).onReachEnd({=> listPosition = 2}).onScrollFrameBegin(
                            {
                                offset, state =>
                                if ((listPosition == 0 && offset <= 0.0) || (listPosition == 2 && offset >= 0.0)) {
                                    scrollerForScroll.scrollBy(xOffset: 0.0, yOffset: offset)
                                    return onScrollFrameBeginHandleResult(offsetRemain: 0.0)
                                }
                                listPosition = 1
                                return onScrollFrameBeginHandleResult(offsetRemain: offset)
                            }
                        )

                        Text("Scroll Area").width(100.percent).height(40.percent).backgroundColor(0x330000ff).fontSize(
                            16.vp).textAlign(TextAlign.Center)
                    }
                }.width(100.percent).height(100.vp)

                Scroll() {}
                    .height(100.vp)
                    .flingSpeedLimit(1.0)
                    .fadingEdge(true)
                    .fadingEdge(true, FadingEdgeOptions())
                    .clipContent(ContentClipMode.Boundary)
                    .clipContent(ContentClipMode.SafeArea)
                    .clipContent(ContentClipMode.ContentOnly)
                    .clipContent(RectShape())
                    .onWillScroll(
                        {
                            scrollOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
                            Hilog.info(1, "info", "XXX")
                            return ScrollResult(offsetRemain: 1.0)
                        }
                    )
                    .onWillScroll(
                        {
                            xOffset: Float64, yOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
                            Hilog.info(1, "info", "XXX")
                        }
                    )
                    .onWillScroll(
                        {
                            scrollOffset: Float64, scrollState: ScrollState, scrollSource: ScrollSource =>
                                Hilog.info(1, "info", "XXX")
                        })
                    .onDidScroll(
                        {
                            scrollOffset: Float64, scrollState: ScrollState => Hilog.info(1, "info", "XXX")
                        })
                    .onReachStart({=> Hilog.info(1, "info", "XXX")})
                    .onReachEnd({=> Hilog.info(1, "info", "XXX")})
                Scroll().scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical).scrollBarWidth(52.0).height(
                    100.vp)

                ScrollBar(scroller: this.scrollerForList, direction: ScrollBarDirection.Vertical, state: BarState.Auto) {}

                Stack(alignContent: Alignment.TopStart) {

                }.width(100.percent).backgroundColor(0xAFEEEE)
            }
        }.backgroundColor(0xdcdcdc)
    }
}
