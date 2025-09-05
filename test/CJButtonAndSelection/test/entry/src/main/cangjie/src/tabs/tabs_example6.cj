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
class TabsExample6 {
    var controller: TabsController = TabsController()
    @State
    var scrollMargin: Int64 = 0
    @State
    var text: String = "文本"

    @State
    var barModeText: String = ""

    func build() {
        Column() {
            Row() {
                Button("scrollMargin+10 ${this.scrollMargin}")
                .id("scrollMarginAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.scrollMargin += 10
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("scrollMargin-10 ${this.scrollMargin}")
                .id("scrollMarginSub")
                .width(47.percent)
                .height(50)
                .onClick({e =>
                    this.scrollMargin -= 10
                })
                .margin(bottom: 12.vp)
            }

            Row() {
                Button("文本增加")
                .id("textAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.text += '文本增加'
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("文本重置")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.text = "文本"
                })
                .margin(bottom: 12.vp)
            }

            Row() {
                Button("layoutStyle.ALWAYS_CENTER")
                    .id("alwaysCenter")
                    .width(100.percent)
                    .height(50)
                    .margin(top: 5)
                    .fontSize(15)
                    .margin(bottom: 12.vp)
            }

            Row() {
                Button("layoutStyle.ALWAYS_AVERAGE_SPLIT").id("alwaysAverageSplit").margin(bottom: 12.vp)
            }

            Row() {
                Button("layoutStyle.SPACE_BETWEEN_OR_CENTER")
                    .id("spaceBetweenOrCenter")
                    .width(100.percent)
                    .height(50)
                    .margin(top: 5)
                    .fontSize(15)
                    .margin(bottom: 12.vp)
            }

            Tabs(barPosition: BarPosition.End, controller: this.controller) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar(this.text)

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar(this.text)

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(this.text)
            }
                .id("TabsExample6")
                .animationDuration(300.0)
                .height(60.percent)
                .backgroundColor(0xf1f3f5)
                .barMode(BarMode.Scrollable)

            Button("barMode:")
                .id("barMode")
                .onClick(
                    {
                        e => this.barModeText = JsonValue
                            .fromStr(getInspectorByKey('TabsExample6'))
                            .asObject()
                            .get("$attrs")
                            .getOrThrow()
                            .asObject()
                            .get("barMode")
                            .getOrThrow()
                            .toString()
                    })
            Text(this.barModeText).id("barModeText")
        }.width(100.percent).height(500).margin(top: 5).padding(24.vp)
    }
}