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
internal import ohos_app_cangjie_entry.JsonValue

@Entry
@Component
class TabsExample2 {
    var controller1: TabsController = TabsController()
    @State
    var dividerColor: Color = Color(0xff0000)
    @State
    var strokeWidth: Length = 2.vp
    @State
    var startMargin: Length = 0.vp
    @State
    var endMargin: Length = 0.vp
    @State
    var nullFlag: Bool = false

    @State
    var dividerText: String = ""

    func getDivider(): Option<DividerStyle> {
        if (this.nullFlag) {
            return Option.None
        }
        return DividerStyle(
            strokeWidth: this.strokeWidth,
            color: this.dividerColor,
            startMargin: this.startMargin,
            endMargin: this.endMargin
        )
    }

    func build() {
        Column() {
            Tabs(controller: this.controller1) {
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
                    Column().width(100.percent).height(100.percent).backgroundColor(0xff0000)
                }.tabBar('red')
            }
                .id("TabsExample2")
                .vertical(true)
                .scrollable(true)
                .barMode(BarMode.Fixed)
                .barWidth(70)
                .barHeight(200)
                .animationDuration(400.0)
                .onChange({
                    index: Int32 => Hilog.info(1, "1", "${index}")
                })
                .height(200.vp)
                .margin(bottom: 12.vp)

            Button('常规Divider')
                .id("normalDivider")
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick(
                    {
                        e =>
                        this.nullFlag = false
                        this.strokeWidth = 2.vp
                        this.dividerColor = Color(0xff0000)
                        this.startMargin = 0.vp
                        this.endMargin = 0.vp
                    }
                )
            Button('空Divider')
                .id("nullDivider")
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => this.nullFlag = true
                })
            Button('颜色变为蓝色')
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => this.dividerColor = Color(0x007DFF)
                })
            Button('宽度增加')
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => this.strokeWidth = (this.strokeWidth.value + 2.0)
                })
            Button('宽度减小')
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => if (this.strokeWidth.value > 2.0) {
                        this.strokeWidth = (this.strokeWidth.value - 2.0)
                    }
                })
            Button('上边距增加')
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => this.startMargin = (this.startMargin.value + 2.0)
                })
            Button('上边距减少')
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => if (this.startMargin.value > 2.0) {
                        this.startMargin = (this.startMargin.value - 2.0)
                    }
                })
            Button('下边距增加')
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => this.endMargin = (this.endMargin.value + 2.0)
                })
            Button('下边距减少')
                .width(100.percent)
                .margin(bottom: 12.vp)
                .onClick({
                    e => if (this.endMargin.value > 2.0) {
                        this.endMargin = (this.endMargin.value - 2.0)
                    }
                })

            Button('divider')
                .id("dividerButton")
                .onClick(
                    {
                        e =>
                        this.dividerText = JsonValue
                            .fromStr(getInspectorByKey('TabsExample2'))
                            .asObject()
                            .get("$attrs")
                            .getOrThrow()
                            .asObject()
                            .get("divider")
                            .getOrThrow()
                            .toString()
                        Hilog.info(1, "1", "divider:${this.dividerText}")
                    }
                )
            Text(this.dividerText).id("dividerText")
        }.padding(top: 24.vp, left: 24.vp, right: 24.vp)
    }
}