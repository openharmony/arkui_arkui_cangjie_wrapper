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
class ViewMenu {
    @State
    var select: Bool = true
    @State
    var isMenuOpen: Bool = true // 添加一个状态变量用于控制菜单显示
    let float_offset = OffsetResult(0.0, 100.0)
    @Builder
    func myMenu() {
        Menu() {
            MenuItem(startIcon: "", content: "CCCCCC", endIcon: "", labelInfo: "Ctrl+C")
            MenuItem(startIcon: "", content: "DDDDDD", endIcon: "", labelInfo: "Ctrl+C")
        }.fontColor(0xFF7F50).width(140).font(size: 1.0, weight: W400, style: FontStyle.Normal).id("menuComponent").radius(3.vp)
    }

    @Builder
    func subMenu() {
        Menu() {
            MenuItem(startIcon: "", content: "copy", endIcon: "", labelInfo: "Ctrl+C")
            MenuItem(startIcon: "", content: "paste", endIcon: "", labelInfo: "Ctrl+C")
        }.radius(BorderRadiuses())
        //        .subMenuExpandingMode(subMenuExpandingMode.SIDE_EXPAND)
    }

    @Builder
    func myMenu1() {
        Menu() {
            MenuItem(startIcon: "", content: "CCCCCC", endIcon: "", labelInfo: "Ctrl+C")
            MenuItem(startIcon: "", content: "DDDDDD", endIcon: "", labelInfo: "Ctrl+C")
            MenuItemGroup(header: "subMenu", footer: "") {
                => MenuItem(startIcon: "", content: "copy", endIcon: "", labelInfo: "Ctrl+C",
                    builder: {=> bind(this.subMenu, this)()})
            }
        }.radius(3.vp)
            //        .menuItemDivider(Option.None)
            //        .menuItemGroupDivider(Option.None)
            //        .subMenuExpandingMode(subMenuExpandingMode.STACK_EXPAND)
            .id("testDefault")
    }

    @Builder
    func myMenu2() {
        Menu() {
            MenuItem(startIcon: "", content: "CCCCCC", endIcon: "", labelInfo: "Ctrl+C")
            MenuItem(startIcon: "", content: "DDDDDD", endIcon: "", labelInfo: "Ctrl+C")
            MenuItemGroup(header: "sunMenu", footer: "") {
                => MenuItem(startIcon: "", content: "copy", endIcon: "", labelInfo: "Ctrl+C",
                    builder: {=> bind(this.subMenu, this)()})
            }
        }.radius(BorderRadiuses())
            //        .menuItemDivider(DividerStyleOptions(5.px, Color.Blue, 10.vp, 10.vp))
            //        .menuItemGroupDivider(DividerStyleOptions(5.px, Color.Green, 10.vp, 10.vp))
            //        .subMenuExpandingMode(subMenuExpandingMode.SIDE_EXPAND)
            //        .subMenuExpandingMode(subMenuExpandingMode.EMBEDDED_EXPAND)
            .id("testDiy")
    }

    func build() {
        Row() {
            Column() {
                Text("click to show menu").fontSize(50).fontWeight(FontWeight.Bold)
            }.bindMenu(builder: this.myMenu).width(50.percent)

            this.myMenu()
            Row() {
                this.myMenu1()
                this.myMenu2()
            }
        }.height(100.percent)
    }
}
