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

import ohos.arkui.state_management.*
import ohos.arkui.component.*
import ohos.base.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_MenuItem {
    @State
    var isMenuOpen: Bool = true // 添加一个状态变量用于控制菜单显示

    @Builder
    func MyMenu() {
        Menu() {
            MenuItem(child: {=>}).id("MenuItem")
        }
        Menu() {
            MenuItem(startIcon: "", content: "cccc", endIcon: "", labelInfo: "Ctrl+V")
                .contentFont()
                .contentFont(size: 10.0, weight: W400, family: "HarmonyOS Sans", style: FontStyle.Normal)
                .labelFont()
                .labelFont(size: 10.0, weight: W400, family: "HarmonyOS Sans", style: FontStyle.Normal)
                .id("menuitemComponent")
        }
    }

    func build() {
        Row() {
            Column() {
                Text("click to show menu")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .id("text")
            }
                .bindMenu(builder: this.MyMenu)
                .width(50.percent)

            this.MyMenu()
        }.height(100.percent)
    }
}
