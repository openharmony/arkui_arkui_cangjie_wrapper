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
internal import ohos.hilog.Hilog
internal import ohos.resource.__GenerateResource__

@Entry
@Component
class TabsExample1 {
    @State
    var fontColor: UInt32 = 0x182431
    @State
    var selectedFontColor: UInt32 = 0x007DFF
    @State
    var currentIndex: Int32 = 0
    @State
    var selectedIndex: Int32 = 0
    var controller: TabsController = TabsController()

    @State
    var edgeEffectText: String = "edgeEffect"
    @State
    var animationModeText: String = "animationMode";
    let child: () -> Unit = { => Hilog.error(1, "cangjie-test", "Tabs.child")}
    
    func getFontColor(index: Int32): UInt32 {
        if (this.selectedIndex == index) {
            return this.selectedFontColor
        }
        return this.fontColor
    }

    func getFontWeight(index: Int32): FontWeight {
        if (this.selectedIndex == index) {
            return FontWeight.W400
        }
        return FontWeight.W500
    }

    func getOpacity(index: Int32): Float64 {
        if (this.selectedIndex == index) {
            return 1.0
        }
        return 0.0
    }

    @Builder
    func tabBuilder(index: Int32, name: String) {
        Column() {
            Text(name)
                .fontColor(this.getFontColor(index))
                .fontSize(16)
                .fontWeight(this.getFontWeight(index))
                .lineHeight(22)
                .margin(top: 17, bottom: 7)
            Divider().strokeWidth(2).color(0x007DFF).opacity(this.getOpacity(index))
        }.width(100.percent)
    }

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.Start, controller: this.controller, index: this.currentIndex) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar({=> bind(this.tabBuilder, this)(0, "green")})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar({=> bind(this.tabBuilder, this)(1, "blue")})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar({=> bind(this.tabBuilder, this)(2, "yellow")})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar({=> bind(this.tabBuilder, this)(3, "pink")})
            }
                .id("TabsExample1")
                .vertical(false)
                .barMode(BarMode.Fixed)
                .barWidth(360)
                .barHeight(56)
                .animationDuration(400.0)
                .onChange({
                    index: Int32 =>
                    // currentIndex控制TabContent显示页签
                    this.currentIndex = index
                })
                .width(360)
                .height(296)
                .margin(top: 52)
                .backgroundColor(0xF1F3F5)
            Row() {
                Button('${this.edgeEffectText}')
                    .id("edgeEffect")
                    .onClick(
                        {
                            e => this.edgeEffectText = JsonValue
                                .fromStr(getInspectorByKey('TabsExample1'))
                                .asObject()
                                .get("$attrs")
                                .getOrThrow()
                                .asObject()
                                .get("edgeEffect")
                                .getOrThrow()
                                .toString()
                        })
            }

            Row() {
                Button('${this.animationModeText}')
                    .id("animationMode")
                    .onClick(
                        {
                            e => this.animationModeText = JsonValue
                                .fromStr(getInspectorByKey('TabsExample1'))
                                .asObject()
                                .get("$attrs")
                                .getOrThrow()
                                .asObject()
                                .get("animationMode")
                                .getOrThrow()
                                .toString()
                        })
            }
        }.width(100.percent)
    }
}