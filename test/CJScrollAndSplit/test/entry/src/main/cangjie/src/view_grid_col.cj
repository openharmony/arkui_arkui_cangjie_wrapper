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
class ViewGridCol {
    func build() {
        Column {
            GridRow() {
                GridCol(span: 1, offset: 0, order: 0) {
                    Row() {
                        Text("grid_col_1")
                            .fontColor(Color.Gray)
                            .fontSize(12)
                    }
                        .width(100.percent)
                        .height(40.vp)
                }
                    .borderColor(Color.Blue)
                    .borderWidth(2.vp)
                    .span(2)
                    .order(GridColOptions())
                    .order(2)
                    .id("grid_col_1")
            }

            GridRow() {
                GridCol(span: GridColOptions(md: 16), offset: GridColOptions(md: 16),
                    order: GridColOptions(md: 16)) {
                    Row() {
                        Text("grid_col_2")
                            .fontColor(Color.Gray)
                            .fontSize(12)
                    }
                        .width(100.percent)
                        .height(40.vp)
                }
                    .borderColor(Color.Blue)
                    .borderWidth(2.vp)
                    .span(2)
                    .order(GridColOptions())
                    .order(2)
                    .id("grid_col_2")
            }

            GridRow() {
                GridCol() {
                    Row() {
                        Text("grid_col_attr_1")
                            .fontColor(Color.Gray)
                            .fontSize(12)
                    }
                        .width(100.percent)
                        .height(40.vp)
                }
                    .borderColor(Color.Blue)
                    .borderWidth(2.vp)
                    .span(2)
                    .gridColOffset(1)
                    .order(0)
                    .id("grid_col_attr_1")
            }

            GridRow() {
                GridCol() {
                    Row() {
                        Text("grid_col_attr_2")
                            .fontColor(Color.Gray)
                            .fontSize(12)
                    }
                        .width(100.percent)
                        .height(40.vp)
                }
                    .borderColor(Color.Blue)
                    .borderWidth(2.vp)
                    .span(GridColOptions())
                    .gridColOffset(GridColOptions())
                    .order(GridColOptions())
                    .id("grid_col_attr_2")
            }
        }
    }
}

