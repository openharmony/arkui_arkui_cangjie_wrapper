/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
class TabsExample14 {
    @State
    var message: String = 'Hello World'
    private var controller: TabsController = TabsController()
    private var controller1: TabsController = TabsController()
    @State
    var selfFadingFade: Bool = true

    func build() {
        Column() {
            Tabs(controller: this.controller)
                .id("TabsExample14_01")
                .barWidth(Option.None)
                .barHeight(Option.None)
            Tabs(controller: this.controller1) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar(Option<ResourceStr>.None)

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar(icon: Option.None, text: Option.None)

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar(Option<CustomBuilder>.None)
            }
                .onChange({
                    index: Int32 => this.controller1.changeIndex(Option.None)
                })
                .id("TabsExample14_01")
                .barWidth(Option.None)
                .barHeight(Option.None)
        }.padding(top: 24.vp, left: 24.vp, right: 24.vp)
    }
}
