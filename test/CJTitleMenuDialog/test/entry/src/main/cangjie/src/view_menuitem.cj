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
class ViewMenuItem {
    @State
    var isMenuOpen: Bool = true // 添加一个状态变量用于控制菜单显示

    @Builder
    func myMenu() {
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

    // 覆盖 MenuItem 构造函数的 None 分支 (第 99-102 行)
    @Builder
    func myMenuItemNone() {
        Menu() {
            MenuItem(startIcon: Option<ResourceStr>.None, content: Option<ResourceStr>.None, endIcon: Option<ResourceStr>.None, labelInfo: Option<ResourceStr>.None)
                .id("menuitemNone")
        }
    }

    // 覆盖 selected/selectIcon/contentFontColor/labelFontColor/onChange 的 None 分支
    @Builder
    func myMenuItemMethodsNone() {
        Menu() {
            MenuItem(startIcon: "", content: "MethodsNone", endIcon: "", labelInfo: "")
                .selected(Option<Bool>.None)
                .selectIcon(Option<Bool>.None)
                .selectIcon(Option<ResourceStr>.None)
                .contentFontColor(Option<ResourceColor>.None)
                .labelFontColor(Option<ResourceColor>.None)
                .onChange(Option<(Bool) -> Unit>.None)
                .id("menuitemMethodsNone")
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
                .bindMenu(builder: this.myMenu)
                .width(50.percent)

            this.myMenu()
            // 覆盖 MenuItem ?? 的 None 分支
            Column() {
                this.myMenuItemNone()
                this.myMenuItemMethodsNone()
            }
        }.height(100.percent)
    }
}
