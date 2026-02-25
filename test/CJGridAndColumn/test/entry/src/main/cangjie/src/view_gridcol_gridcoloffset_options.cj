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
class ViewGridColGridColOffsetOptions {
    func build() {
        Column() {
            GridRow(columns: 12) {
                GridCol() {
                    Text("test")
                }.gridColOffset(GridColOptions(2)).id("testGridColGridColOffsetOptionsNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol() {
                    Text("test")
                }.gridColOffset(GridColOptions(xs: 0, sm: 1, md: 2, lg: 3, xl: 4, xxl: 5)).id("testGridColGridColOffsetOptionsNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol() {
                    Text("test")
                }.gridColOffset(GridColOptions(xs: -1)).id("testGridColGridColOffsetOptionsExceptionValue1")
            }
            
            GridRow(columns: 12) {
                GridCol() {
                    Text("test")
                }.gridColOffset(GridColOptions(xs: 0, sm: 0, md: 0, lg: 0, xl: 0, xxl: 0)).id("testGridColGridColOffsetOptionsBoundaryValue1")
            }
            
            GridRow(columns: 12) {
                GridCol() {
                    Text("test")
                }.gridColOffset(Option<GridColOptions>.None).id("testGridColGridColOffsetOptionsOptionNone")
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
