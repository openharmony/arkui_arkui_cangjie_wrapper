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

@Entry
@Component
class View_Grid {
    @State
    var DataSource_str_case_003: Array<String> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12",
        "13", "14", "15", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "0", "1",
        "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "0", "1", "2", "3", "4", "5", "6",
        "7", "8", "9", "10", "11", "12", "13", "14", "15", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
        "12", "13", "14", "15", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15",
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "0", "1", "2", "3", "4",
        "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        "10", "11", "12", "13", "14", "15", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13",
        "14", "15", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    var a: String = "Grid"
    @State
    var index_grid: UInt32 = 0
    @State
    var last_grid: UInt32 = 0
    @State
    var value1: Array<String> = ["GoodsTypeList1", "GoodsTypeList2", "GoodsTypeList3", "GoodsTypeList4",
        "GoodsTypeList5"]
    @State
    var value2: Array<String> = ["0", "1", "2", "3", "4", "0", "1", "2", "3", "4", "0", "1", "2", "3", "4", "0", "1",
        "2", "3", "4", "0", "1", "2", "3", "4", "0", "1", "2", "3", "4", "0", "1", "2", "3", "4", "0", "1", "2", "3",
        "4", "0", "1", "2", "3", "4", "0", "1", "2", "3", "4", "0", "1", "2", "3", "4", "0", "1", "2", "3", "4", "0",
        "1", "2", "3", "4"]
    @State
    var colors: Array<UInt32> = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
    @State
    var scroller: Scroller = Scroller()
    @State
    var scroller2: Scroller = Scroller()
    @State
    var scroller3: Scroller = Scroller()
    @State
    var gridScroller: Scroller = Scroller()
    var touchDown: Bool = false
    var listTouchDown: Bool = false
    var scrolling: Bool = false
    @State
    var message: String = "Hello Cangjie"

    @State
    var numbers: ArrayList<String> = ArrayList<String>()

    @State
    var text: String = "drag"

    @State
    var index0 = "1"
    @State
    var index5 = "6"

    @State
    var text2: String = "Hello"

    @Builder
    func pixelMapBuilder() { //拖拽过程样式
        Column() {
            Text(this.text).fontSize(16).backgroundColor(0xF9CF93).width(80).height(80).textAlign(TextAlign.Center)
        }
    }

    protected override func aboutToAppear() {
        for (i in 1..11) {
            this.numbers.add("${i}")
        }
    }

    func changeIndex(index1: Int64, index2: Int64) { //交换数组位置
        var temp = this.numbers[index1];
        //        this.numbers.add(this.numbers.get(index2).getOrThrow(), at: index1)
        //        this.numbers.add(temp, at: index2)
        this.numbers[index1] = this.numbers[index2]
        this.numbers[index2] = temp
        Hilog.info(1, "info", "onItemDrop changeIndex, this.numbers: ${this.numbers}")

        this.index0 = this.numbers[0]
        this.index5 = this.numbers[5]
        Hilog.info(1, "info", "onItemDrop changeIndex, index0: ${this.index0}, index5: ${this.index5}")
    }

    public func build() {
        Scroll() {
            Column(space: 20) {
                Grid(scroller: this.scroller) {
                    GridItem() {
                        Text(this.index0)
                            .fontSize(16)
                            .backgroundColor(0xF9CF93)
                            .width(80)
                            .height(80)
                            .textAlign(TextAlign.Center)
                    }
                    GridItem() {
                        Text(this.numbers[1])
                            .fontSize(16)
                            .backgroundColor(0xF9CF93)
                            .width(80)
                            .height(80)
                            .textAlign(TextAlign.Center)
                    }
                    GridItem() {
                        Text(this.numbers[2])
                            .fontSize(16)
                            .backgroundColor(0xF9CF93)
                            .width(80)
                            .height(80)
                            .textAlign(TextAlign.Center)
                    }
                    GridItem() {
                        Text(this.numbers[3])
                            .fontSize(16)
                            .backgroundColor(0xF9CF93)
                            .width(80)
                            .height(80)
                            .textAlign(TextAlign.Center)
                    }
                    GridItem() {
                        Text(this.numbers[4])
                            .fontSize(16)
                            .backgroundColor(0xF9CF93)
                            .width(80)
                            .height(80)
                            .textAlign(TextAlign.Center)
                    }.id("gridItem_5")
                    GridItem() {
                        Text(this.index5)
                            .fontSize(16)
                            .backgroundColor(0xF9CF93)
                            .width(80)
                            .height(80)
                            .textAlign(TextAlign.Center)
                    }
                    GridItem() {
                        Text(this.numbers[6])
                            .fontSize(16)
                            .backgroundColor(0xF9CF93)
                            .width(80)
                            .height(80)
                            .textAlign(TextAlign.Center)
                    }
                }
                    .columnsTemplate("1fr 1fr 1fr")
                    .columnsGap(10)
                    .rowsGap(10)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(300)
                /*
                 * -@TestCaseID: grid_case_01
                 * -@验证场景: 1、 Grid()；2、Grid(Scroller())；
                 * -@预期结果: 正常运行；
                 */
                Text("grid_case_01: Grid正常运行；")
                //                Grid().id("grid_case_01")
                Grid(scroller: Scroller()).id("grid_case_01")

                /*
                 * -@TestCaseID: grid_case_02
                 * -@验证场景: 包含子组件Text编译报错；
                 * -@预期结果: error: Text("test"), The component Grid can not have the child component [GridItem]；
                 */
                //                Text(
                //                    "grid_case_02: 子组件Text编译报错"
                //                )
                //                Grid(){ Text("test")}.id("grid_case_02")
                //                Grid(Scroller()){ Text("test")}.id("grid_case_02")

                /*
                 * -@TestCaseID: grid_case_04
                 * -@验证场景: 1、lazyForeach控制组件、if/else控制组件、子组件GridItem；
                 *           2、 columnsTemplate入参repeat(auto-fit, 50)；
                 *           3、 验证columnsGap、rowsGap、scrollBar等正常属性值；
                 * -@Expect: 1、 columnsTemplate设置最小列宽值为50，自动计算列数和实际列宽；
                 *           2、 scrollBar为红色10vp宽常驻，弹性动效；
                 *           2、 属性layoutDirection、maxCount、minCount、cellLength不生效；
                 *           3、 rid网格列大小按照Grid自身内容区域大小减去所有行列Gap后按各个行列所占比重分配；
                 */
                Text("grid_case_04: columnsTemplate入参repeat(auto-fit, 50)")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                if (day == "4") {
                                    Text("这一行会很6")
                                        .fontSize(12)
                                        .fontColor(Color.Green)
                                        .backgroundColor(0xF9CF93)
                                        .textAlign(TextAlign.Center)
                                } else {
                                    Text(day).fontSize(16).backgroundColor(0xF9CF93).textAlign(TextAlign.Center)
                                }
                            }
                        }
                    )
                }
                    .columnsTemplate("repeat(auto-fit, 50)")
                    .columnsGap(10.vp)
                    .rowsGap(10.vp)
                    .scrollBar(BarState.On)
                    .scrollBarColor(Color.Red)
                    .scrollBarWidth(10.0)
                    .cachedCount(2, true)
                    .enableScrollInteraction(true)
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.SELF_ONLY, NestedScrollMode.SELF_ONLY))
                    .friction(0.8)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_04")

                /*
                 * -@TestCaseID: grid_case_05
                 * -@验证场景: 1、lazyForeach控制组件、if/else控制组件、子组件GridItem；
                 *           2、 columnsTemplate入参repeat(auto-fill, 50)；
                 *           3、 验证columnsGap、rowsGap、scrollBar等正常属性值；
                 * -@Expect: 1、 columnsTemplate设置固定列宽值为50，自动计算列数和实际列宽；
                 *           2、 scrollBar为红色10vp宽按需显示，Fade；
                 *           2、 属性layoutDirection、maxCount、minCount、cellLength不生效；
                 *           3、 rid网格列大小按照Grid自身内容区域大小减去所有行列Gap后按各个行列所占比重分配；
                 */
                Text("grid_case_05: columnsTemplate入参repeat(auto-fill, 50)")
                Grid(scroller: this.scroller3) {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                if (day == "4") {
                                    Text("6在前是怕被截断")
                                        .fontSize(12)
                                        .fontColor(Color.Green)
                                        .backgroundColor(0xF9CF93)
                                        .textAlign(TextAlign.Center)
                                } else {
                                    Text(day).fontSize(16).backgroundColor(0xF9CF93).textAlign(TextAlign.Center)
                                }
                            }
                        }
                    )
                }
                    .columnsTemplate("repeat(auto-fill, 50)")
                    .columnsGap(10.0)
                    .rowsGap(10.0)
                    .scrollBar(BarState.Auto)
                    .scrollBarColor(0xFF0000)
                    .scrollBarWidth(10)
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.SELF_ONLY, NestedScrollMode.SELF_ONLY))
                    .friction(0.8)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_05")

                /*
                 * -@TestCaseID: grid_case_06
                 * -@验证场景: 1、lazyForeach控制组件、if/else控制组件、子组件GridItem；
                 *           2、 columnsTemplate入参repeat(auto-stretch, 50)；
                 *           3、 验证columnsGap、rowsGap、scrollBar等正常属性值；
                 * -@Expect: 1、 columnsTemplate设置固定列宽值为50，使用columnsGap为最小列间距，自动计算列数和实际列宽；
                 *           2、 scrollBar不显示，Fade；
                 *           2、 属性layoutDirection、maxCount、minCount、cellLength不生效；
                 *           3、 rid网格列大小按照Grid自身内容区域大小减去所有行列Gap后按各个行列所占比重分配；
                 */
                Text("grid_case_06: columnsTemplate入参repeat(auto-stretch, 50)")
                Grid(scroller: Scroller()) {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                if (day == "4") {
                                    Text("6在前是怕被截断")
                                        .fontSize(12)
                                        .fontColor(Color.Green)
                                        .backgroundColor(0xF9CF93)
                                        .textAlign(TextAlign.Center)
                                } else {
                                    Text(day)
                                        .fontSize(16)
                                        .width(30.vp)
                                        .backgroundColor(0xF9CF93)
                                        .textAlign(TextAlign.Center)
                                }
                            }
                        }
                    )
                }
                    .columnsTemplate("repeat(auto-stretch, 50)")
                    .columnsGap(10)
                    .rowsGap(10)
                    .scrollBar(BarState.Off)
                    .scrollBarColor(@r(app.color.red_color))
                    .scrollBarWidth(10.0.vp)
                    .enableScrollInteraction(true)
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.SELF_ONLY, NestedScrollMode.SELF_ONLY))
                    .friction(0.8)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_06")

                /*
                 * -@TestCaseID: grid_case_07
                 * -@验证场景: 1、rowsTemplate入参repeat(auto-fit, 30)；
                 * -@Expect: 1、 rowsTemplate设置最小行高值为30，自动计算行数和实际行高；
                 */
                Text("grid_case_07: rowsTemplate入参repeat(auto-fit, 30)")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .width(40.vp)
                                    .height(20.vp)
                                    .backgroundColor(0xF9CF93)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .rowsTemplate("repeat(auto-fit, 30)")
                    .columnsGap(10.0.vp)
                    .rowsGap(10.0.vp)
                    .scrollBarWidth(@r(app.string.len_2))
                    .width(90.percent)
                    .friction(1.0)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_07")

                /*
                 * -@TestCaseID: grid_case_08
                 * -@验证场景: 1、rowsTemplate入参repeat(auto-fill, 30)；
                 * -@Expect: 1、 rowsTemplate设置固定行高值为30，自动计算行数；
                 */
                Text("grid_case_08: rowsTemplate入参repeat(auto-fill, 30)")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .width(40.vp)
                                    .height(20.vp)
                                    .backgroundColor(0xF9CF93)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .rowsTemplate("repeat(auto-fill, 30)")
                    .columnsGap(@r(app.string.len_2))
                    .rowsGap(@r(app.string.len_2))
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_08")

                /*
                 * -@TestCaseID: grid_case_09
                 * -@验证场景: 1、rowsTemplate入参repeat(auto-stretch, 30)；
                 * -@Expect: 1、 rowsTemplate设置固定行高值为30，使用rowsGap为最小行间距，自动计算行数和实际行间距；
                 */
                Text("grid_case_09: rowsTemplate入参repeat(auto-stretch, 30)")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .width(40.vp)
                                    .height(20.vp)
                                    .backgroundColor(0xF9CF93)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .rowsTemplate("repeat(auto-stretch, 30)")
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_09")

                /*
                 * -@TestCaseID: grid_case_101
                 * -@TestCaseName: grid_case_101
                 * -@RequirementName: Grid
                 * -@Condition: no
                 * -@Brief: test event for Grid
                 * -@Expect: 改变列表显示的起始位置触发onScrollIndex事件,获取返回值绑定Text组件显示
                 * -@Priority: level1
                 */
                Text("grid_case_101: 改变列表显示的起始位置触发onScrollIndex事件,获取返回值绑定Text组件显示")
                Text("first: ${this.index_grid}; last: ${this.last_grid}").id("index_grid")
                Grid(scroller: this.scroller) {
                    ForEach(
                        DataSource_str_case_003,
                        itemGeneratorFunc: {
                            str: String, idx: Int64 => GridItem {
                                Text("testcase").height(100.vp)
                            }.height(100.vp)
                        }
                    )
                }
                    .cachedCount(1)
                    .columnsGap(10)
                    .rowsGap(10)
                    .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("basicGrid")

                /*
                 * -@TestCaseID: grid_case_301
                 * -@TestCaseName: grid_case_301
                 * -@Expect: 1、 rowsTemplate、columnsTemplate同时设置，只展示固定行列，其余不展示，且Grid不可滚动；
                 *           2、 属性layoutDirection、maxCount、minCount、cellLength不生效；
                 *           3、 rid网格列大小按照Grid自身内容区域大小减去所有行列Gap后按各个行列所占比重分配；
                 *           4、 GridItem默认填满网格大小；
                 */
                Text(
                    "grid_case_301: rowsTemplate、columnsTemplate同时设置，只展示固定行列，其余不展示；属性layoutDirection、maxCount、minCount、cellLength不生效")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .backgroundColor(0xF9CF93)
                                    .width(100.percent)
                                    .height(100.percent)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .rowsTemplate("1fr 1fr 1fr 1fr 1fr")
                    .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
                    .columnsGap(10.vp)
                    .rowsGap(10.vp)
                    .scrollBar(BarState.On)
                    .scrollBarColor(Color.Red)
                    .scrollBarWidth(10.0)
                    .cachedCount(2)
                    .enableScrollInteraction(true)
                    .friction(0.8)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_301")

                Text("grid_case_302: 行与行之间的间距: 10")
                Grid() {
                    GridItem() {
                        Text("-------行与行之间的间距: 10-------").height(100.percent)
                    }.backgroundColor(0xF9CF93)
                    GridItem() {
                        Text("-------行与行之间的间距: 10-------").height(100.percent)
                    }.backgroundColor(0xF9CF93)
                    GridItem() {
                        Text("-------行与行之间的间距: 10-------").height(100.percent)
                    }.backgroundColor(0xF9CF93)
                    GridItem() {
                        Text("-------行与行之间的间距: 10-------").height(100.percent)
                    }.backgroundColor(0xF9CF93)
                    GridItem()
                }
                    .columnsGap(10)
                    .rowsGap(10)
                    .columnsTemplate("3fr 3fr")
                    .rowsTemplate("1fr 1fr")
                    .height(30.0)
                    .id("basicGrid1")

                /*
                 * -@TestCaseID: grid_case_303
                 * -@TestCaseName: grid_case_303
                 * -@Expect: 1、 只设置rowsTemplate，Grid滚动方向为水平方向；
                 *           2、 属性layoutDirection、maxCount、minCount、cellLength不生效；
                 */
                Text(
                    "grid_case_303: 只设置rowsTemplate，Grid滚动方向为水平方向；属性layoutDirection、maxCount、minCount、cellLength不生效")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .backgroundColor(0xF9CF93)
                                    .width(100.percent)
                                    .height(100.percent)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .rowsTemplate("1fr 1fr 1fr 1fr 1fr")
                    .columnsGap(10)
                    .rowsGap(10)
                    .scrollBar(BarState.Auto)
                    .scrollBarColor(0xFF0000)
                    .scrollBarWidth(10)
                    .cachedCount(2)
                    .enableScrollInteraction(true)
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.SELF_ONLY, NestedScrollMode.SELF_ONLY))
                    .friction(0.8)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_303")

                /*
                 * -@TestCaseID: grid_case_304
                 * -@TestCaseName: grid_case_304
                 * -@Expect: 1、 只设置columnsTemplate，Grid滚动方向为水平方向；
                 *           2、 属性layoutDirection、maxCount、minCount、cellLength不生效；
                 */
                Text(
                    "grid_case_304: 只设置columnsTemplate，Grid滚动方向为水平方向；属性layoutDirection、maxCount、minCount、cellLength不生效")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .backgroundColor(0xF9CF93)
                                    .width(100.percent)
                                    .height(100.percent)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
                    .columnsGap(10)
                    .columnsGap(10.px)
                    .columnsGap(10.fp)
                    .columnsGap(10.percent)
                    .columnsGap(10.lpx)
                    .rowsGap(10)
                    .rowsGap(10.px)
                    .rowsGap(10.fp)
                    .rowsGap(10.percent)
                    .rowsGap(10.lpx)
                    .scrollBar(BarState.Off)
                    .scrollBarColor(Color.Red)
                    .scrollBarWidth(10)
                    .cachedCount(2)
                    .enableScrollInteraction(true)
                    .nestedScroll(NestedScrollOptions(NestedScrollMode.SELF_ONLY, NestedScrollMode.SELF_ONLY))
                    .friction(0.8)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_304")

                /*
                 * -@TestCaseID: grid_case_305
                 * -@TestCaseName: grid_case_305
                 * -@Expect: 1、 rowsTemplate、columnsTemplate都不设置, 主轴由layoutDirection决定，列数由Grid的宽度、首个元素的宽度、minCount、maxCount、columnsGap共同决定；
                 *           2、 行数由Grid高度、首个元素高度、cellLength、rowsGap共同决定。超出行列容纳范围的元素不显示，也不能通过滚动进行展示；
                 *           2、 此模式下仅生效以下属性：layoutDirection、maxCount、minCount、cellLength、editMode、columnsGap、rowsGap；
                 */
                Text("grid_case_305: rowsTemplate、columnsTemplate都不设置, 主轴由layoutDirection决定")
                Grid() {
                    ForEach(
                        value2,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .backgroundColor(0xF9CF93)
                                    .width(30.vp)
                                    .height(30.vp)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .columnsGap(10)
                    .rowsGap(10)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(200)
                    .id("grid_case_305")
            }
        }
    }
}
