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

package ohos_app_cangjie_entry.tabs

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*
import kit.LocalizationKit.*

@Entry
@Component
class TabsExample4 {
    var controller: TabsController = TabsController()
    @State
    var barOverlap: Bool = true
    @State
    var barBackgroundColor: UInt32 = 0x88888888

    func getMarginTop(): Length {
        if (this.barOverlap) {
            return 56.vp
        }
        return 0.vp
    }

    func build() {
        Column() {
            Button("barOverlap变化")
                .id("barOverlapChange")
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => if (this.barOverlap) {
                        this.barOverlap = false
                    } else {
                        this.barOverlap = true
                    }
                })

            Tabs(barPosition: BarPosition.Start, controller: this.controller, index: 0) {
                TabContent() {
                    Column() {
                        Text("barOverlap ${this.barOverlap}").fontSize(16).margin(top: this.getMarginTop())
                        Text("barBackgroundColor ${this.barBackgroundColor}").fontSize(16)
                    }.width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar(icon: @r(app.media.startIcon), text: "1")

                TabContent() {
                    Column() {
                        Text("barOverlap ${this.barOverlap}").fontSize(16).margin(top: this.getMarginTop())
                        Text("barBackgroundColor ${this.barBackgroundColor}").fontSize(16)
                    }.width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar(icon: @r(app.media.startIcon), text: "2")

                TabContent() {
                    Column() {
                        Text("barOverlap ${this.barOverlap}").fontSize(16).margin(top: this.getMarginTop())
                        Text("barBackgroundColor ${this.barBackgroundColor}").fontSize(16)
                    }.width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar(icon: @r(app.media.startIcon), text: "3")
            }
                .id("TabsExample4")
                .vertical(false)
                .barMode(BarMode.Fixed)
                .height(60.percent)
                .scrollable(true)
                .animationDuration(10.0)
        }.height(500).padding(top: 24.vp, left: 24.vp, right: 24.vp)
    }
}