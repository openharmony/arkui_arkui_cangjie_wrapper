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
class ViewGridRowInitInt32Part2 {
    func build() {
        Column() {
            GridRow(columns: 12, direction: GridRowDirection.Row) {
                GridCol() {
                    Text("test")
                }
            }
            .id("testGridRowInitDirectionNormalValue1")
            
            GridRow(columns: 12, direction: GridRowDirection.RowReverse) {
                GridCol() {
                    Text("test")
                }
            }
            .id("testGridRowInitDirectionNormalValue2")
            
            GridRow(columns: 12) {
                GridCol() {
                    Text("Hello")
                }
            }
            .id("testGridRowInitChildNormalValue1")
            
            GridRow(columns: 12, gutter: 10.vp, breakpoints: BreakPoints(), direction: GridRowDirection.Row) {
                GridCol() {
                    Text("Hello")
                }
            }
            .id("testGridRowInitNormalValue1")
            
            GridRow(columns: 6, gutter: 5.px, breakpoints: BreakPoints(value: [200.vp, 400.vp]), direction: GridRowDirection.RowReverse) {
                GridCol() {
                    Text("World")
                }
            }
            .id("testGridRowInitNormalValue2")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
