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
class ViewGridRowInitGutterOptionOptionsPart1 {
    func noneBreakPoints(): BreakPoints {
        let bp = BreakPoints()
        bp.value = Option<Array<Length>>.None
        bp.reference = Option<BreakpointsReference>.None
        return bp
    }

    func build() {
        Column() {
            GridRow(columns: GridRowOptions(), gutter: GutterOption(x: 10.vp, y: 5.vp)) {
                GridCol() {
                    Text("test")
                }
            }
            .id("testGridRowInitGutterOptionNormalValue1")

            GridRow(columns: 12)
            .id("testGridRowChildDefault1")

            GridRow(columns: GridRowOptions(12), gutter: 10.vp, breakpoints: noneBreakPoints())
            .id("testGridRowChildDefault2NoneBP")

            GridRow(columns: 12, gutter: GutterOption(x: 10.vp, y: 5.vp), breakpoints: noneBreakPoints())
            .id("testGridRowChildDefault3NoneBP")

            GridRow(columns: GridRowOptions(12), gutter: GutterOption(x: 10.vp, y: 5.vp), breakpoints: noneBreakPoints())
            .id("testGridRowChildDefault4NoneBPLen")

            GridRow(columns: GridRowOptions(12), gutter: GutterOption(x: GridRowSizeOption(sm: 5.vp), y: GridRowSizeOption(sm: 3.vp)), breakpoints: noneBreakPoints()) {
                GridCol() { Text("test") }
            }
            .id("testGridRowGutterOptionNoneBP")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
