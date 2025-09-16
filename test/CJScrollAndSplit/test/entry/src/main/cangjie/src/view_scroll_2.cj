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
import std.collection.{ ArrayList, HashMap }

extend ScrollSource {
    public func toString() {
        match (this) {
            case Drag => "DRAG"
            case Fling => "FLING"
            case EdgeEffect => "EDGE_EFFECT"
            case OtherUserInput => "OTHER_USER_INPUT"
            case ScrollBar => "SCROLL_BAR"
            case ScrollBarFling => "SCROLL_BAR_FLING"
            case Scroller => "SCROLLER"
            case ScrollerAnimation => "SCROLLER_ANIMATION"
            case _ => "SCROLLER_ANIMATION"
        }
    }
}

@Entry
@Component
class ViewScroll2 {
    @State
    var stopText: String = "is stop?"
    @State
    var startText: String = "is start?"
    @State
    var edgeText: String = "is edge?"
    @State
    var curOffset: String = "0.0"
    @State
    var curOffset_2: String = "0.0"
    @State
    var curOffset_3: String = "0.0"
    @State
    var curOffset_4: String = "0.0"
    @State
    var curOffset_5: String = "0.0"
    @State
    var curOffset_6: String = "0.0"
    @State
    var scrollState_6: String = "0.0"
    @State
    var onWillScrollMessage: String = "0.0"
    @State
    var onScrollFrameBegin_offset: String = "0.0"
    @State
    var scrollState: String = "0.0"
    @State
    var atEnd: String = "0.0"
    @State
    var onscrollMessage: String = "0.0"
    @State
    var index: String = "0.0"
    @State
    var itemRect: String = "0.0"

    var arr: ArrayList<String> = ArrayList(["0", "1", "2", "3", "4", "5", "6",
        "7", "8", "9", "10", "11" , "12", "13", "14", "15"])

    let scroller = Scroller()
    let scroller_2 = Scroller()
    let scroller_3 = Scroller()
    let scroller_4 = Scroller()
    let scroller_5 = Scroller()
    let scroller_6 = Scroller()
    let scroller_7 = Scroller()
    let scroller_8 = Scroller()
    let scroller_list = Scroller()
    let animation_1 = ScrollAnimationOptions(duration: 800.0, curve: Curve.Ease, canOverScroll: true)

    func build() {
        Scroll(){
            Column() {
                Column() {
                    //初始化用例
                    Scroll()
                    .id("scroll_1")
                    // 基础场景用例: 合法属性设置
                    Scroll(this.scroller) {
                        Column() {
                            Text("ScrollSelf").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("ScrollSelf").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("ScrollSelf").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("ScrollSelf")
                    .scrollable(ScrollDirection.Vertical)
                    .scrollBar(BarState.Auto)
                    .scrollBarColor(Color.Blue)
                    .scrollBarWidth(4.5)
                    .friction(0.8)
                    .onScrollStop( { => this.stopText = "stopped"})
                    .onScrollStart( { => this.startText = "started"})
                    .onScrollEdge( { edge =>
                        match(edge) {
                            case Edge.Top => this.edgeText = "Top"
                            case Edge.Bottom => this.edgeText = "Bottom"
                            case _ => this.edgeText = "None"
                        }
                    })
                    .onScrollFrameBegin({ s:Float64, e:ScrollState =>
                        this.onScrollFrameBegin_offset = s.toString()
                        this.scrollState = parseScrollState(e)
                        return s})
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
                            scrollOffset: Float64, scrollState: ScrollState =>  Hilog.info(1, "info", "XXX")
                        })
                }.height(20.percent)
                Row() {
                    Button("scroll 100")
                    .id("onScrollStop")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt => this.scroller.scrollTo(xOffset: 0.vp, yOffset: 20.vp)})
                    Text(this.startText)
                    .id("onScrollStartText")
                    .width(25.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    Text(this.stopText)
                    .id("onScrollStopText")
                    .width(25.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    Text(this.edgeText)
                    .id("onScrollEdgeText")
                    .width(25.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    Text(this.onScrollFrameBegin_offset)
                    .id("onScrollFrameBegin_offset")
                    .width(25.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)

                }
                Row() {
                    Text(this.scrollState)
                    .id("scrollState")
                    .width(35.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    Button("scrollToAnimation")
                    .id("scrollToAnimation")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            //scrollTo动画选项
                            this.scroller.scrollTo(xOffset:0.vp, yOffset: 200.vp, animation: this.animation_1)
                    })
                    Button("scrollToAnimation_2")
                    .id("scrollToAnimation_2")
                    .height(20.vp)
                    .width(35.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            //scrollTo动画选项—2
                            this.scroller.scrollTo(xOffset:0.vp, yOffset: 100.vp, animation: false)
                    })
                }
                Row() {
                    Button("fling_0")
                    .id("fling_0")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                        //异常值
                        this.scroller.fling(0.0)
                    })
                    Button("fling_1000")
                    .id("fling_1000")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                        //向下滚动，Int类型
                        this.scroller.fling(1000.0)
                    })
                    Button("fling_-3000.0")
                    .id("fling_-3000.0")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                        //负值，向上滚动，Float类型
                        this.scroller.fling(-3000.0)
                    })

                }
                Row() {
                    Button("scrollTop")
                    .id("scrollTop")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Gray)
                    .onClick({ evt =>
                            this.scroller.scrollEdge(Edge.Top, ScrollEdgeOptions(velocity: 1000.0))
                    })
                    Button("scrollBottom")
                    .id("scrollBottom")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Red)
                    .onClick({evt =>
                            this.scroller.scrollEdge(Edge.Bottom)
                    })
                    Button("scrollTo")
                    .id("scrollTo")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Blue)
                    .onClick({evt =>
                            this.scroller.scrollTo(xOffset:0.vp, yOffset: 10.vp)
                    })
                    Button("scrollBy")
                    .id("scrollBy")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.scroller.scrollBy(xOffset: 0.vp, yOffset: 16.25.px)
                    })
                }
                Row() {
                    Button("getCurYOffset")
                    .id("getCurYOffset")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.curOffset = this.scroller.currentOffset().yOffset.toString()
                    })
                    Text("YOFFSET: " + this.curOffset)
                    .id("yOffset")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }
                Row() {
                    Button("isAtEnd")
                    .id("isAtEnd")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                        if(this.scroller.isAtEnd()) {
                            this.atEnd = "isAtEnd"
                        }
                    })
                    Text(this.atEnd)
                    .id("isAtEndText")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                Column() {
                    // 基础场景用例：默认属性设置
                    Scroll(this.scroller_2) {
                        Column() {
                            Text("scroll2").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll2").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll2").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }.id("scroll2")

                }.height(5.percent)

                Column() {
                    // 基础场景用例：自定义属性initialOffset + 例外属性friction设置
                    Scroll(this.scroller_3) {
                        Column() {
                            Text("scroll_3").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_3").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_3").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_3")
                    .scrollable(ScrollDirection.Vertical)
                    .friction(-2.0)
                    .scrollBarWidth(6.vp)
                }.height(10.percent)

                Row() {
                    Button("getCurYOffset_2")
                    .id("getCurYOffset_2")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.curOffset_2 = this.scroller_3.currentOffset().yOffset.toString()
                    })
                    Text("initial_offset: " + this.curOffset_2)
                    .id("initial_offset")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                Column() {
                    // 基础场景用例：例外属性设置2
                    Scroll(this.scroller_4) {
                        Column() {
                            Text("scroll_4").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_4").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_4").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_4")
                    .scrollable(ScrollDirection.Vertical)
                    .scrollBarWidth(6)
                    .friction(@r(app.string.DEFAULT_FONT))
                    .friction(@r(app.string.friction_1))
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.ParentFirst, NestedScrollMode.SelfFirst))
                }.height(10.percent)

                Row() {
                    Button("scrollPage")
                    .id("scrollPage")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.scroller_4.scrollPage(true, animation: true)
                    })
                    Button("getCurYOffset_3")
                    .id("getCurYOffset_3")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.curOffset_3 = this.scroller_4.currentOffset().yOffset.toString()
                    })
                    Text("yoffset: " + this.curOffset_3)
                    .id("scrollPage_offset")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                Column() {
                    // 组合冲突场景用例
                    Scroll() {
                        Column() {
                            Text("scroll_5").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_5").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_5").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_5")
                    .scrollable(ScrollDirection.Vertical)
                }.height(10.percent)

                Column() {
                    // 基础场景用例：ScrollSnapOptions自定义属性设置
                    Scroll() {
                        Column() {
                            Text("scroll_6").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_6").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_6").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_6")
                    .scrollable(ScrollDirection.Vertical)
                }.height(10.percent).margin(top: 10.vp)

                Column() {
                    // 基础场景用例：ScrollSnapOptions只有一个入参
                    Scroll() {
                        Column() {
                            Text("scroll_7").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_7").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_7").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_7")
                    .scrollable(ScrollDirection.Vertical)
                }.height(10.percent).margin(top: 10.vp)

                Column() {
                    // 基础场景用例：scroll嵌套用例
                    Scroll() {
                        Column() {
                            Text("第一层").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Scroll() {
                                Column() {
                                    Text("第二层").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                                    Scroll() {
                                        Column() {
                                            Text("第三层").size(width: 100.percent, height: 800.px).backgroundColor(Color.Gray)
                                            Text("第三层").size(width: 100.percent, height: 800.px).backgroundColor(Color.Gray)
                                        }
                                    }
                                    .id("scroll_8_1")
                                    .height(80.percent)
                                    Text("第二层").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                                }
                            }.height(80.percent)
                            Text("第一层").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                        }
                    }
                    .id("scroll_8")
                    .height(100.percent)
                    .scrollable(ScrollDirection.Vertical)
                }.height(20.percent).margin(top: 10.vp)

                Column() {
                    // 基础场景用例：enableScrollInteraction属性
                    Scroll(this.scroller_5) {
                        Column() {
                            Text("scroll_9").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_9").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_9").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_9")
                    .enableScrollInteraction(false)
                    .scrollable(ScrollDirection.Vertical).scrollBar(BarState.On).scrollBarColor(Color.Green).scrollBarWidth(50.px)
                }.height(10.percent).margin(top: 10.vp)

                Row() {
                    Button("controller move")
                    .id("controller move")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt => 
                        this.scroller_5.scrollBy(xOffset: 0.vp, yOffset: 60.vp)
                        this.onscrollMessage = "${this.scroller_5.currentOffset().xOffset.toString()}, ${this.scroller_5.currentOffset().yOffset.toString()}"    
                    })
                    Text(this.onscrollMessage)
                    .id("onscrollMessage")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                Column() {
                    // 基础场景用例：onScrollFrameBegin属性回调函数返回值验证
                    Scroll(this.scroller_6) {
                        Column() {
                            Text("scroll_10").size(width: 100.percent, height: 800.px).backgroundColor(0x555555)
                            Text("scroll_10").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_10").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_10")
                    .scrollable(ScrollDirection.Vertical).scrollBar(BarState.On).scrollBarColor(Color.Green).scrollBarWidth(50.px)
                    .onScrollFrameBegin({ s:Float64, e:ScrollState =>
                        return 0.0})
                }.height(10.percent).margin(top: 10.vp)

                Row() {
                    Button("getCurYOffset_4")
                    .id("getCurYOffset_4")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.curOffset_4 = this.scroller_6.currentOffset().yOffset.toString()
                    })
                    Text(this.curOffset_4)
                    .id("onScrollFrameBegin_offset_1")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                Column() {
                    // 基础场景用例：onWillScroll属性回调函数返回值验证
                    Scroll(this.scroller_7) {
                        Column() {
                            Text("scroll_11").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_11").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_11").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_11")
                    .scrollable(ScrollDirection.Vertical).scrollBar(BarState.On).scrollBarColor(Color.Green).scrollBarWidth(50.px)
                    .onWillScroll({ x: Float64, y: Float64, e: ScrollState, s: ScrollSource =>
                        this.curOffset_5 = x.toString() + ", " + y.toString()
                        this.onWillScrollMessage = parseScrollState(e) + ", " +s.toString()
                        let res: OffsetResult = OffsetResult(0.0, 0.0)
                        return res})
                }.height(10.percent).margin(top: 10.vp)

                Row() {
                    Button("getCurOffset_5")
                    .id("getCurOffset_5")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.curOffset_5 = this.scroller_7.currentOffset().yOffset.toString()
                    })
                    Text(this.curOffset_5)
                    .id("curOffset_5")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                Row() {
                    Text(this.onWillScrollMessage)
                    .id("onWillScrollMessage")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                Column() {
                    // 基础场景用例：onWillScroll、onDidScroll验证
                    Scroll(this.scroller_8) {
                        Column() {
                            Text("scroll_12").size(width: 100.percent, height: 800.px).backgroundColor(0x668866)
                            Text("scroll_12").size(width: 100.percent, height: 800.px).backgroundColor(0x00ff00)
                            Text("scroll_12").size(width: 100.percent, height: 800.px).backgroundColor(0xff0000)
                        }
                    }
                    .id("scroll_12")
                    .scrollable(ScrollDirection.Vertical).scrollBar(BarState.On).scrollBarColor(Color.Green).scrollBarWidth(50.px)
                    .onWillScroll({ x: Float64, y: Float64, e: ScrollState, s: ScrollSource =>
                        return OffsetResult(x, y)
                    })
                    .onDidScroll({ x: Float64, y: Float64, e: ScrollState =>
                        this.curOffset_6 = x.toString() + ", " + y.toString()
                        this.scrollState_6 = parseScrollState(e)
                    })
                }.height(10.percent).margin(top: 10.vp)

                Row() {
                    Button("scroll50")
                    .id("scroll50")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.scroller_8.scrollBy(xOffset: 0.vp, yOffset: 50.vp)
                    })

                    Button("getOffset")
                    .id("getOffset")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                            this.curOffset_6 = this.scroller_8.currentOffset().yOffset.toString()
                    })

                    Text(this.curOffset_6)
                    .id("curOffset_6")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }
                Row() {
                    Text(this.scrollState_6)
                    .id("scrollState_6")
                    .width(80.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)
                    .textAlign(TextAlign.Center)
                }

                //scrollToIndex, getItemIndex, getItemRect
                Column() {
                    Button("getItemIndex")
                    .id("getItemIndex")
                    .onClick({evt =>
                        this.index = this.scroller_list.getItemIndex(10.0, 5.0).toString()
                    })
                    Text(this.index)
                    .id("index")

                    Button("getItemRect")
                    .id("getItemRect")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                        let res = this.scroller_list.getItemRect(4)
                        this.itemRect = res.x.toString() + " " + res.y.toString() + " " + res.width.toString() + " " + res.height.toString()
                    })
                    Text(this.itemRect)
                    .id("itemRect")
                    .width(120.percent)
                    .height(20.vp)
                    .borderColor(Color.Black)

                    Button("scrollTo4")
                    .id("scrollTo4")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                        this.scroller_list.scrollToIndex(4, options: ScrollToIndexOptions(extraOffset: 10.vp))
                    })
                    Button("scrollTo5")
                    .id("scrollTo5")
                    .height(20.vp)
                    .width(20.percent)
                    .backgroundColor(Color.Green)
                    .onClick({evt =>
                        this.scroller_list.scrollToIndex(5)
                    })
                }
                Column() {
                    List(space: 0, initialIndex: 0, scroller: this.scroller_list) {
                        ForEach(this.arr, itemGeneratorFunc: {item: String, idx: Int64 =>
                            ListItem() {
                                Text(item)
                                .width(100.percent)
                                .height(100)
                                .backgroundColor(0xFFFFFF)
                                .borderRadius(10)
                                .textAlign(TextAlign.Center)
                                .fontSize(16)
                            }
                        })
                    }
                    .listDirection(Axis.Vertical)
                    .scrollBar(BarState.Off)
                    .divider(strokeWidth: 0.vp, color: Color.Black, startMargin: 0.vp, endMargin: 0.vp)
                    .edgeEffect(EdgeEffect.Spring)
                    .width(90.percent)
                }.height(20.percent)


            }
        }.height(100.percent).id("scroll_f")

    }
}