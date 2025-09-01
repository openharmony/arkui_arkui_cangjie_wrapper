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
class View_GradientColor {
    func build() {
        Column() {
            Column() {
                Text("linearGradient").fontSize(24.px).width(90.percent).fontColor(0xCCCCCC)
                Row()
                    .width(100.percent)
                    .height(100.px)
                    .linearGradient(
                        angle: 90.0,
                        colors: [(Color(0x0000ff), 0.0), (Color(0xff0000), 0.3), (Color(0xffff00), 1.0)],
                        repeating: false
                    )
                    .id("row1")

                Text("linearGradient Repeat").fontSize(24.px).width(90.percent).fontColor(0xCCCCCC)
                Row()
                    .width(100.percent)
                    .height(100.px)
                    .linearGradient(
                        colors: [(Color(0x0000ff), 0.0), (Color(0xff0000), 0.3), (Color(0xffff00), 0.5)],
                        direction: GradientDirection.Left,
                        repeating: true
                    )
                    .id("row2")
            }

            Column() {
                Text("sweepGradient").fontSize(24.px).width(30.percent).fontColor(0xCCCCCC)
                Row()
                    .width(200.px)
                    .height(200.px)
                    .sweepGradient(
                        (100.0.px, 100.0.px),
                        start: 0.0,
                        end: 359.0,
                        colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 1.0)],
                        repeating: false
                    )
                    .id("row3")

                Text("sweepGradient Reapeat").fontSize(24.px).width(30.percent).fontColor(0xCCCCCC)
                Row()
                    .width(200.px)
                    .height(200.px)
                    .sweepGradient(
                        (100.0.px, 100.0.px),
                        start: 0.0,
                        end: 359.0,
                        rotation: 45.0,
                        colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 0.5)],
                        repeating: true
                    )
                    .id("row4")
            }

            Column() {
                Text("radialGradient").fontSize(24.px).width(30.percent).fontColor(0xCCCCCC)
                Row()
                    .width(200.px)
                    .height(200.px)
                    .radialGradient(
                        (100.0.px, 100.0.px),
                        120.0,
                        [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 1.0)]
                    )
                    .id("row5")

                Text("radialGradient Repeat").fontSize(24.px).width(30.percent).fontColor(0xCCCCCC)
                Row()
                    .width(200.px)
                    .height(200.px)
                    .radialGradient(
                        (100.0.px, 100.0.px),
                        120.0,
                        [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 0.5)],
                        repeating: true
                    )
                    .id("row6")
            }
        }
    }
}
