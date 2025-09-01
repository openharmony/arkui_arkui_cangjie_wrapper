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

let colorIndex = HashMap<UInt32, Int32>([(0x00CB87, 0), (0x007DFF, 1), (0xFFBF00, 2), (0xE67C92, 3)])

@Component
class MyComponent {
    var color: UInt32

    func build() {
        Column().width(100.percent).height(100.percent).backgroundColor(this.color)
    }
}

@Entry
@Component
class TabsExample10 {
    @State
    var currentIndex: Int32 = 1
    var tabsController: TabsController = TabsController()

    func build() {
        Column() {
            Tabs(controller: this.tabsController, index: this.currentIndex) {
                TabContent() {
                    MyComponent(color: 0x00CB87)
                }.tabBar('green')

                TabContent() {
                    MyComponent(color: 0x007DFF)
                }.tabBar('blue')

                TabContent() {
                    MyComponent(color: 0xFFBF00)
                }.tabBar('yellow')

                TabContent() {
                    MyComponent(color: 0xE67C92)
                }.tabBar('pink')
            }
                .height(60.percent)
                .width(100.percent)
                .backgroundColor(0xF1F3F5)
                .onChange({
                    index: Int32 => this.currentIndex = index
                })

            Button('preload items: [0, 2, 3]')
                .margin(5)
                .onClick({
                    e =>
                    // 预加载第0、2、3个子节点，提高滑动或点击切换至这些节点时的性能
                    Hilog.info(0, "CangjieUI-test", 'preloadItems start')
                })
        }
    }
}
