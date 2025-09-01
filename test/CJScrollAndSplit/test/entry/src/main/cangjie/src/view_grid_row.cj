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
class View_Grid_Row {
    @State
    var currentBp: String = ""
    func build() {
        Column {
            GridRow() {
                GridCol() {
                    Row() {
                        Text("grid_row_1").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.id("grid_row_1")

            GridRow(
                columns: 2,
                breakpoints: BreakPoints(
                    value: [400.vp, 600.vp, 800.vp],
                    reference: BreakpointsReference.ComponentSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_2").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_2")

            GridRow(
                columns: GridRowColumnOption(xs: 5, sm: 6, md: 7, lg: 8, xl: 9, xxl: 10),
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_3").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_3")

            GridRow(
                gutter: 2.vp,
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_4").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_4")

            GridRow(
                gutter: GutterOption(x: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp),
                    y: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp)),
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_5").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_5")

            GridRow(
                gutter: 2.vp,
                columns: 2,
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_6").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_6")

            GridRow(
                gutter: 2.vp,
                columns: GridRowColumnOption(xs: 5, sm: 6, md: 7, lg: 8, xl: 9, xxl: 10),
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_7").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_7")

            GridRow(
                gutter: GutterOption(x: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp),
                    y: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp)),
                columns: 2,
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_8").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_8")

            GridRow(
                gutter: GutterOption(x: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp),
                    y: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp)),
                columns: GridRowColumnOption(xs: 5, sm: 6, md: 7, lg: 8, xl: 9, xxl: 10),
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_9").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).id("grid_row_9")

            GridRow(
                gutter: GutterOption(x: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp),
                    y: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp)),
                columns: 2,
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_attr").fontColor(Color.Gray).fontSize(12)
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }
                .width(100.percent)
                .height(200.vp)
                .alignItems(ItemAlign.Auto)
                .alignItems(ItemAlign.Stretch)
                .alignItems(ItemAlign.Baseline)
                .alignItems(ItemAlign.Center)
                .id("grid_row_attr")

            GridRow(
                gutter: GutterOption(x: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp),
                    y: GridRowSizeOption(xs: 1.vp, sm: 2.vp, md: 3.vp, lg: 2.vp, xl: 3.vp, xxl: 3.vp)),
                columns: 2,
                breakpoints: BreakPoints(
                    value: [200.vp, 300.vp, 400.vp], //设置断点位置的单调递增数组。
                    reference: BreakpointsReference.WindowSize
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text(currentBp).fontColor(Color.Gray).fontSize(12).id("currentBp")
                    }.width(100.percent).height(40.vp)
                }.borderColor(Color.Blue).borderWidth(2.vp).span(2).order(GridColColumnOption()).order(2)
            }.width(100.percent).onBreakpointChange({
                bp => currentBp = "onBreakpointChange"
            }).id("grid_row_event")

            GridRow(columns: 2, direction: GridRowDirection.Row) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }

            GridRow(columns: GridRowColumnOption(xs: 5, sm: 6, md: 7, lg: 8, xl: 9, xxl: 10),
                direction: GridRowDirection.Row) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }

            GridRow(gutter: 1.vp, direction: GridRowDirection.Row) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }

            GridRow(
                gutter: GutterOption(
                    x: GridRowSizeOption(value: 0.vp),
                    y: GridRowSizeOption(value: 0.vp)
                ),
                direction: GridRowDirection.Row
            ) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }

            GridRow(gutter: 1.vp, columns: 1, direction: GridRowDirection.Row) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }

            GridRow(gutter: 1.vp, columns: GridRowColumnOption(xs: 5, sm: 6, md: 7, lg: 8, xl: 9, xxl: 10),
                direction: GridRowDirection.Row) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }

            GridRow(gutter: GutterOption(x: 1.vp, y: 1.vp), columns: 1, direction: GridRowDirection.Row) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }

            GridRow(gutter: GutterOption(x: 1.vp, y: 1.vp),
                columns: GridRowColumnOption(xs: 5, sm: 6, md: 7, lg: 8, xl: 9, xxl: 10),
                direction: GridRowDirection.RowReverse) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }
        }
    }
}
