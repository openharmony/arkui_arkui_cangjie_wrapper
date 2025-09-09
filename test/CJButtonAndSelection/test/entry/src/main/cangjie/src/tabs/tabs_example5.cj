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
class TabsExample5 {
    var controller: TabsController = TabsController()
    @State
    var gridMargin: Int64 = 10
    @State
    var gridGutter: Int64 = 10
    @State
    var sm: Int32 = -2
    @State
    var clickedContent: String = "";

    @State
    var barGridAlign: String = "barGridAlign";
    @State
    var currentIndex: Int32 = 0;

    func build() {
        Column() {
            Row() {
                Button("gridMargin+10 ${this.gridMargin}")
                .id("gridMarginAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.gridMargin += 10
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("gridMargin-10 ${this.gridMargin}")
                .id("gridMarginSub")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.gridMargin -= 10
                })
                .margin(bottom: 12.vp)
            }
            Row() {
                Button("gridGutter+10 ${this.gridGutter}")
                .id("gridGutterAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.gridGutter += 10
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("gridGutter-10 ${this.gridGutter}")
                .id("gridGutterSub")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.gridGutter -= 10
                })
                .margin(bottom: 12.vp)
            }
            Row() {
                Button("sm+2 ${this.sm}")
                .id("smAdd")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.sm += 2
                })
                .margin(right: 6.percent, bottom: 12.vp)
                Button("sm-2 ${this.sm}")
                .id("smSub")
                .width(47.percent)
                .height(50)
                .margin(top: 5)
                .onClick({e =>
                    this.sm -= 2
                })
                .margin(bottom: 12.vp)
            }

            Text("点击内容:${this.clickedContent}").width(100.percent).height(100).margin(top: 5)

            Tabs(barPosition: BarPosition.End, controller: this.controller) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar(icon: @r(app.media.startIcon), text: "1")

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar(icon: @r(app.media.startIcon), text: "2")

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(icon: @r(app.media.startIcon), text: "3")
            }.id("TabsExample5").width(350.vp).animationDuration(300.0).height(60.percent).backgroundColor(0xf1f3f5)

            Button('${this.barGridAlign}')
                .id("barGridAlign")
                .onClick(
                    {
                        e =>
                        this.barGridAlign = JsonValue
                            .fromStr(getInspectorByKey('TabsExample5'))
                            .asObject()
                            .get("$attrs")
                            .getOrThrow()
                            .asObject()
                            .get("barGridAlign")
                            .getOrThrow()
                            .toString()
                        Hilog.info(1, "Cangjie-Test", "barGridAlign:${this.barGridAlign}")
                    }
                )

            Text("${this.currentIndex}").id("onTabBarClickText").width(100.percent)
        }.width(100.percent).height(500).margin(top: 5).padding(10.vp)
    }
}