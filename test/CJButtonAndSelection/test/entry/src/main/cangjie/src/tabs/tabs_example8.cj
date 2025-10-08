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
class TabsExample8 {
    @State
    var currentIndex: Int32 = 2
    var controller: TabsController = TabsController()
    @State
    var comingIndex: Int32 = -1

    func getFontColor(targetIndex: Int32): UInt32 {
        if (this.currentIndex == targetIndex) {
            return 0x1698CE // 蓝色
        }
        return 0x6B6B6B // 灰色
    }

    @Builder
    func tabBuilder(title: String, targetIndex: Int32) {
        Column() {
            Text(title).fontColor(getFontColor(targetIndex))
        }.width(100.percent).height(50).justifyContent(FlexAlign.Center)
    }

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex) {
                TabContent() {
                    Column() {
                        Text('首页的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0x00CB87).justifyContent(FlexAlign.Center)
                }.tabBar({=> bind(this.tabBuilder, this)('首页', 0)})

                TabContent() {
                    Column() {
                        Text('发现的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0x007DFF).justifyContent(FlexAlign.Center)
                }.tabBar({=> bind(this.tabBuilder, this)('发现', 1)})

                TabContent() {
                    Column() {
                        Text('推荐的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0xFFBF00).justifyContent(FlexAlign.Center)
                }.tabBar({=> bind(this.tabBuilder, this)('推荐', 2)})

                TabContent() {
                    Column() {
                        Text('我的内容')
                    }.width(100.percent).height(100.percent).backgroundColor(0xE67C92).justifyContent(FlexAlign.Center)
                }.tabBar({=> bind(this.tabBuilder, this)('我的', 3)})
            }
                .id("TabsExample8")
                .vertical(false)
                .barMode(BarMode.Fixed)
                .barWidth(360)
                .barHeight(60)
                .animationDuration(0.0)
                .onChange({
                    index: Int32 => this.currentIndex = index
                })
                .width(360)
                .height(600)
                .backgroundColor(0xF1F3F5)
                .scrollable(true)

            Button('动态修改index')
                .width(50.percent)
                .margin(top: 20)
                .onClick({
                    e => this.currentIndex = (this.currentIndex + 1) % 4
                })

            Button('changeIndex')
                .width(50.percent)
                .margin(top: 20)
                .onClick(
                    {
                        e =>
                        this.currentIndex = (this.currentIndex + 1) % 4
                        this.controller.changeIndex(this.currentIndex)
                    }
                )

            Text("${this.currentIndex}").id("currentIndex")
            Text("${this.comingIndex}").id("comingIndex")
        }.width(100.percent)
    }
}