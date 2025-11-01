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
import ohos.i18n.*
import ohos.resource_manager.*

@Entry
@Component
class TabsExample11 {
    var controller: TabsController = TabsController()
    @State
    var barBackgroundColorText: String = "barBackgroundColor"
    @State
    var barBackgroundBlurStyleText: String = ""
    @State
    var barBackgroundBlurStyleOptionsText: String = ""
    @State
    var barBackgroundEffectText: String = ""
    @State
    var tabBarTranslateText: String = ""
    @State
    var tabBarOpacityText: String = ""

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.End, controller: this.controller) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar(icon: @r(app.media.startIcon), text: 'green')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(icon: @r(app.media.startIcon), text: 'blue')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar(icon: @r(app.media.startIcon), text: 'yellow')

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar(icon: @r(app.media.startIcon), text: 'pink')
            }.id("TabsExample11").width(100.percent).height(300).margin(top: 20)

            Text(this.tabBarTranslateText).id("tabBarTranslateText")
            Text(this.tabBarOpacityText).id("tabBarOpacityText")

            Button(this.barBackgroundColorText)
                .id("barBackgroundColor")
                .onClick(
                    {
                        e =>
                        this.barBackgroundColorText = JsonValue
                            .fromStr(getInspectorByKey('TabsExample11'))
                            .asObject()
                            .get("$attrs")
                            .getOrThrow()
                            .asObject()
                            .get("barBackgroundColor")
                            .getOrThrow()
                            .toString()
                        Hilog.info(1, "Cangjie-Test", "barBackgroundColor:${this.barBackgroundColorText}")
                    }
                )

            Button('barBackgroundBlurStyle')
                .id("barBackgroundBlurStyle")
                .onClick(
                    {
                        e =>
                        this.barBackgroundBlurStyleText = JsonValue
                            .fromStr(getInspectorByKey('TabsExample11'))
                            .asObject()
                            .get("$attrs")
                            .getOrThrow()
                            .asObject()
                            .get("barBackgroundBlurStyle")
                            .getOrThrow()
                            .toString()
                        Hilog.info(1, "Cangjie-Test", "barBackgroundBlurStyle:${this.barBackgroundBlurStyleText}")
                        this.barBackgroundBlurStyleOptionsText = JsonValue
                            .fromStr(getInspectorByKey('TabsExample11'))
                            .asObject()
                            .get("$attrs")
                            .getOrThrow()
                            .asObject()
                            .get("barBackgroundBlurStyleOptions")
                            .getOrThrow()
                            .toString()
                        Hilog.info(1, "Cangjie-Test", "barBackgroundBlurStyleOptions:${this.barBackgroundBlurStyleOptionsText}")
                        this.barBackgroundEffectText = JsonValue
                            .fromStr(getInspectorByKey('TabsExample11'))
                            .asObject()
                            .get("$attrs")
                            .getOrThrow()
                            .asObject()
                            .get("barBackgroundEffect")
                            .getOrThrow()
                            .toString()
                        Hilog.info(1, "Cangjie-Test", "barBackgroundEffect:${this.barBackgroundEffectText}")
                    }
                )
            Text(this.barBackgroundBlurStyleText).id("barBackgroundBlurStyleText")
            Text(this.barBackgroundBlurStyleOptionsText).id("barBackgroundBlurStyleOptionsText")
            Text(this.barBackgroundEffectText).id("barBackgroundEffectText")
        }.width(100.percent)
    }
}