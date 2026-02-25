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
class ViewGridColInitOptions {
    func build() {
        Column() {
            GridRow(columns: 12) {
                GridCol(span: GridColOptions(6), offset: Option<GridColOptions>.None, order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitSpanOptionsNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: GridColOptions(xs: 6, sm: 12, md: 4, lg: 3, xl: 2, xxl: 1), offset: Option<GridColOptions>.None, order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitSpanOptionsNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(span: Option<GridColOptions>.None, offset: GridColOptions(2), order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitOffsetOptionsNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: Option<GridColOptions>.None, offset: GridColOptions(xs: 0, sm: 1, md: 2, lg: 3, xl: 4, xxl: 5), order: Option<GridColOptions>.None) {
                    Text("test")
                }
                .id("testGridColInitOffsetOptionsNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(span: Option<GridColOptions>.None, offset: Option<GridColOptions>.None, order: GridColOptions(1)) {
                    Text("test")
                }
                .id("testGridColInitOrderOptionsNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: Option<GridColOptions>.None, offset: Option<GridColOptions>.None, order: GridColOptions(xs: 0, sm: 1, md: 2, lg: 3, xl: 4, xxl: 5)) {
                    Text("test")
                }
                .id("testGridColInitOrderOptionsNormalValue2")
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
