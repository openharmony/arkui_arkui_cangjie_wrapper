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
class TabsExample13 {
    @State
    var fontColor: Color = Color(0x182431)
    @State
    var selectedFontColor: Color = Color(0x007DFF)
    @State
    var currentIndex: Int32 = 0
    var list: ArrayList<String> = ArrayList<String>()
    var tabsController: TabsController = TabsController()
    var swiperController: SwiperController = SwiperController()
    var swiperData: MyDataSource = MyDataSource(ArrayList<String>())

    protected override func aboutToAppear() {
        for (i in 0..5) {
            this.list.add("${i}");
        }
        this.swiperData = MyDataSource(this.list)
    }

    @Builder
    func tabBuilder(index: Int32, name: String) {
        Column() {
            Text(name)
                .fontColor(if (this.currentIndex == index) {
                    this.selectedFontColor
                } else {
                    this.fontColor
                })
                .fontSize(16)
                .fontWeight(if (this.currentIndex == index) {
                    FontWeight.W500
                } else {
                    FontWeight.W400
                })
                .lineHeight(22)
                .margin(top: 17, bottom: 7)

            Divider().strokeWidth(2).color(0x007DFF).opacity(if (this.currentIndex == index) {
                1.0
            } else {
                0.0
            })
        }.width(20.percent)
    }

    func build() {
        Column() {
            Button("buttonTabsExample13")
                .onClick({
                    event => this.tabsController.changeIndex(2)
                })
                .id("buttonTabsExample13")
            Tabs(barPosition: BarPosition.Start, index: 1) {
                ForEach(
                    this.list,
                    itemGeneratorFunc: {
                        item: String, index: Int64 => TabContent() {}.tabBar(
                            {=> bind(this.tabBuilder, this)(Int32(index), '页签 ${this.list[index]}')})
                    }
                )
            }.id("TabsExample13").barMode(BarMode.Scrollable).backgroundColor(0xF1F3F5).height(156).width(100.percent)

            Tabs(controller: tabsController, index: 1) {
                ForEach(
                    this.list,
                    itemGeneratorFunc: {
                        item: String, index: Int64 => TabContent() {}.tabBar(
                            {=> bind(this.tabBuilder, this)(Int32(index), 'tabs2 ${this.list[index]}')})
                    }
                )
            }

            Tabs(index: 1) {
                TabContent().tabBar(@r(app.string.app_name)).size(width: 5.vp, height: 5.vp)
                TabContent().tabBar(icon: "", text: @r(app.string.Font_name)).width(5.vp).height(5.vp)
                TabContent()
                    .tabBar(icon: @r(app.media.app_icon), text: @r(app.string.Font_name))
                    .width(5.vp)
                    .height(5.vp)
            }.height(156).width(100.percent)
        }
    }
}
