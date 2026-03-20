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
 *
 * General attribute bindSheet LLT: Button component.
 */

package ohos_app_cangjie_entry.bind_sheet

internal import ohos.base.*
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewButtonBindSheet {
    @State
    var isShow1: Bool = false

    @State
    var isShow2: Bool = false

    @State
    var isShow3: Bool = false

    @State
    var isShow4: Bool = false

    @State
    var isShow5: Bool = false

    @State
    var isShow6: Bool = false

    @State
    var isShow7: Bool = false

    @State
    var isShow8: Bool = false

    @State
    var isShow9: Bool = false

    @Builder
    func sheetLLT(): Unit {
        Column() {
            Text("sheet")
                .fontSize(14)
                .id("bind_sheet_llt_inner")
        }
            .width(100.percent)
            .height(100)
            .backgroundColor(0xE0E0E0)
    }

    func build() {
        Column() {
            Button("radius_normal")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow1 = true})
                .bindSheet(this.isShow1, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: 10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_normal")
            Button("radius_abnormal")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow2 = true})
                .bindSheet(this.isShow2, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: -10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_abnormal")
            Button("radius_boundary(0)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow3 = true})
                .bindSheet(this.isShow3, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: 0.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_boundary(0)")
            Button("radius_boundary(1)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow4 = true})
                .bindSheet(this.isShow4, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: 1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_boundary(1)")
            Button("radius_boundary(-1)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow5 = true})
                .bindSheet(this.isShow5, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: -1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_boundary(-1)")
            Button("radius_boundary(Float64.Max)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow6 = true})
                .bindSheet(this.isShow6, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: Float64.Max, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_boundary(Float64.Max)")
            Button("radius_boundary(Float64.Min)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow7 = true})
                .bindSheet(this.isShow7, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: Float64.Min, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_boundary(Float64.Min)")
            Button("shadow_no_call")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow8 = true})
                .bindSheet(this.isShow8, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true))
                .id("shadow_no_call")
            Button("radius_option_none")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .onClick({evt => this.isShow9 = true})
                .bindSheet(this.isShow9, this.sheetLLT, options: SheetOptions(height: SheetSize.Medium, width: 70.percent, showClose: true,
                        shadow: ShadowOptions(radius: Option.None, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
                .id("radius_option_none")
        }
        .width(100.percent)
        .padding(10.vp)
        .height(100.percent)
    }
}
