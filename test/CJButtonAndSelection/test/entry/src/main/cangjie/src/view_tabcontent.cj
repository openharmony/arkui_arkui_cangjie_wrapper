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
import std.collection.*
import kit.LocalizationKit.*
//import ohos.resource.*

@Entry
@Component
class View_TabContent {
    var controller: TabsController = TabsController()

    @State
    var indicatorColor: UInt32 = 0x007DFF
    @State
    var indicatorWidth: Length = 40
    @State
    var indicatorHeight: Length = 10
    @State
    var indicatorBorderRadius: Length = 5
    @State
    var indicatorSpace: Length = 10
    @State
    var subTabBorderRadius: Length = 20
    //    @State var selectedMode: SelectedMode = SelectedMode.INDICATOR

    @State
    var text: String = "2"
    @State
    var tabPadding: Int64 = 5
    @State
    var symmetricExtensible: Bool = false
    @State
    var verticalAlign: VerticalAlign = VerticalAlign.Center

    @State
    var onWillShowText: String = "onWillShow"
    @State
    var onWillHideText: String = "onWillHide"

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.End, controller: this.controller) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar("pink").padding(top: 5, right: 10, bottom: 5, left: 10).id("SubTabBarStyle1").id("TabContent0")

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }
                    .tabBar(icon: @r(app.media.startIcon), text: this.text)
                    .padding(this.tabPadding)
                    .id("BottomTabBarStyle1")

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(icon: @r(app.string.tab_content_text3)).padding(10.vp)

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(icon: @r(app.string.tab_content_text4)).padding(top: 5, right: 10, bottom: 5, left: 10)

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(icon: @r(app.media.startIcon), text: @r(app.string.tab_content_text5))

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }
                    .tabBar(icon: @r(app.media.startIcon), text: @r(app.string.tab_content_text6))
                    .padding(top: 5, right: 10, bottom: 5, left: 10)

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }
                    .tabBar(icon: @r(app.media.startIcon), text: "7")
                    .constraintSize(minWidth: 20.percent, minHeight: 50.percent, maxWidth: 20.percent,
                        maxHeight: 50.percent)
            }.animationDuration(300.0).height(60.percent).backgroundColor(0xf1f3f5).barMode(BarMode.Fixed)

            Text("${this.onWillShowText}").id("onWillShow")
            Text("${this.onWillHideText}").id("onWillHide")
        }.width(100.percent).height(500).margin(top: 5).padding(24.vp)
    }
}