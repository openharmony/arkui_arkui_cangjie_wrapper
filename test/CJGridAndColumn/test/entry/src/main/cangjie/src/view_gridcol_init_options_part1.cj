/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import ohos.arkui.component.grid_row.*
import ohos.arkui.component.grid_col.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewGridColInitOptionsPart1 {
    func build() {
        Column() {
            GridRow(columns: 12) {
                GridCol() {
                    Text("Hello")
                }
                .id("testGridColInitChildOptionsNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: GridColOptions(6), offset: GridColOptions(2), order: GridColOptions(1)) {
                    Text("Test")
                }
                .id("testGridColInitOptionsNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: GridColOptions(xs: 6, sm: 12), offset: GridColOptions(0), order: GridColOptions(0)) {
                    Column() {
                        Text("Test")
                    }
                }
                .id("testGridColInitOptionsNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(span: GridColOptions(xs: -1), offset: Option<GridColOptions>.None, order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitSpanOptionsExceptionValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: Option<GridColOptions>.None, offset: GridColOptions(xs: -1), order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitOffsetOptionsExceptionValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: GridColOptions(xs: 0, sm: 0, md: 0, lg: 0, xl: 0, xxl: 0), offset: Option<GridColOptions>.None, order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitSpanOptionsBoundaryValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: GridColOptions(1), offset: Option<GridColOptions>.None, order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitSpanOptionsBoundaryValue2")
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
