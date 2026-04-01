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
 * General attribute shadow LLT: Button component.
 */

package ohos_app_cangjie_entry.shadow

internal import ohos.base.*
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewButtonShadow {
    func build() {
        Column() {
            Button("radius_normal")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: 10.0, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_normal")
            Button("radius_abnormal")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: -10.0, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_abnormal")
            Button("radius_boundary(0)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: 0.0, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_boundary(0)")
            Button("radius_boundary(1)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: 1.0, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_boundary(1)")
            Button("radius_boundary(-1)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: -1.0, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_boundary(-1)")
            Button("radius_boundary(Float64.Max)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: Float64.Max, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_boundary(Float64.Max)")
            Button("radius_boundary(Float64.Min)")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: Float64.Min, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_boundary(Float64.Min)")
            Button("shadow_no_call")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .id("shadow_no_call")
            Button("radius_option_none")
                .width(200.vp)
                .height(40.vp)
                .margin(10)
                .shadow(radius: Option.None, color: Color.Red, offsetX: 20.0, offsetY: 10.0)
                .id("radius_option_none")
        }
        .width(100.percent)
        .padding(10.vp)
        .height(100.percent)
    }
}
