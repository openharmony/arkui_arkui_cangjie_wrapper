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

@Entry
@Component
class TabsExample3 {
    @State
    var message: String = 'Hello World'
    private var controller: TabsController = TabsController()
    private var controller1: TabsController = TabsController()
    @State
    var selfFadingFade: Bool = true

    func build() {
        Column() {
            Button('子页签设置渐隐')
                .id("fadingEdgeTrue")
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => this.selfFadingFade = true
                })

            Button('子页签设置不渐隐')
                .id("fadingEdgeFalse")
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => this.selfFadingFade = false
                })

            Button('fadingEdge:${selfFadingFade}').id("fadingEdge").width(100.percent).margin(bottom: 12.vp)
            Tabs(controller: this.controller) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar('pink')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar('yellow')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar('blue')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')
            }
                .id("TabsExample3_01")
                .vertical(false)
                .scrollable(true)
                .barMode(BarMode.Scrollable)
                .barHeight(80)
                .animationDuration(400.0)
                .onChange({
                    index: Int32 => Hilog.info(1, "1", "${index}")
                })

            Tabs(barPosition: BarPosition.Start, controller: this.controller1) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar('pink')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar('yellow')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar('blue')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar('green')
            }
                .vertical(true)
                .scrollable(true)
                .barMode(BarMode.Scrollable)
                .barHeight(200)
                .barWidth(80)
                .animationDuration(400.0)
                .onChange({
                    index: Int32 => Hilog.info(1, "1", "${index}")
                })
                .height(30.percent)
                .width(100.percent)
        }.padding(top: 24.vp, left: 24.vp, right: 24.vp)
    }
}