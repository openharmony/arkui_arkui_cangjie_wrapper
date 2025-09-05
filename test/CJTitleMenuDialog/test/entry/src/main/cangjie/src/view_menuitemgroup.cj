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
class ViewMenuItemGroup {
    @State
    var select: Bool = true
    let iconStr: AppResource = @r(app.media.menu)
    var iconStr2: AppResource = @r(app.media.menu)
    var content: AppResource = @r(app.string.EntryAbility_desc)

    @Builder
    func subMenu() {
        Menu() {
            MenuItem(startIcon: " ", endIcon: " ", content: "复制", labelInfo: "Ctrl+C").id("Test_Menu_07")
            MenuItem(startIcon: " ", endIcon: " ", content: "粘贴", labelInfo: "Ctrl+V").id("Test_Menu_08")
        }
    }
    @Builder
    func menuText() {
        Text("MenuItemGroup")
    }

    @Builder
    func myMenu2() {
        Menu() {
            MenuItem(startIcon: "测试", endIcon: "菜单", content: "复制", labelInfo: "Ctrl+C")
                .id("Test_Menu_01")
                .width(150.vp)
                .contentFont(size: 15.vp, weight: FontWeight.Medium, family: "HarmonyOS Sans", style: FontStyle.Normal)
                .contentFontColor(@r(app.color.blue_color))
                .labelFont(size: 15.vp, weight: FontWeight.W200, family: "Arial", style: FontStyle.Italic)
                .labelFontColor(@r(app.color.red_color))
                .selected(true)
            MenuItem(startIcon: @r(app.media.icon), content: @r(app.string.contentName), endIcon: @r(app.media.blank),
                labelInfo: @r(app.string.emptyName))
                .labelFont(family: @r(app.string.family_desc))
                .labelFont(size: 15.vp, weight: FontWeight.Medium, family: @r(app.string.family_desc),
                    style: FontStyle.Italic)
                .selected(false)
                .id("Test_Menu_02")
                .contentFont(size: 15.vp, weight: FontWeight.W800, family: @r(app.string.family_desc),
                    style: FontStyle.Normal)
            MenuItem(
                startIcon: this.iconStr,
                content: @r(app.string.contentName),
                endIcon: @r(app.media.right),
                labelInfo: @r(app.string.emptyName),
                builder: bind(this.subMenu, this)
            )
                .labelFont(size: @r(app.string.size_desc), weight: FontWeight.W600, family: "Arial",
                    style: FontStyle.Italic)
                .contentFont(size: @r(app.string.size_desc), weight: FontWeight.W700, family: "HarmonyOS Sans",
                    style: FontStyle.Normal)
                .id("Test_Menu_03")
            MenuItemGroup(header: "小标题", footer: "Test") {
                =>
                MenuItem(startIcon: "", endIcon: "", content: "菜单选项", labelInfo: "")
                    .selectIcon(true)
                    .selected(true)
                    .onChange(
                        {
                            selected =>
                            iconStr2 = @r(app.media.wx)
                            content = @r(app.string.contentName1)
                            Hilog.info(1, "1", "1", "onChange")
                        }
                    )
                    .labelFont(size: @r(app.string.size_desc), weight: FontWeight.Medium,
                        family: @r(app.string.family_desc), style: FontStyle.Italic)
                    .contentFont(size: @r(app.string.size_desc), weight: FontWeight.Medium,
                        family: @r(app.string.family_desc), style: FontStyle.Normal)
                    .id("Test_Menu_04")
                MenuItem(
                    startIcon: @r(app.media.menu),
                    content: @r(app.string.contentName),
                    endIcon: @r(app.media.right),
                    labelInfo: @r(app.string.emptyName),
                    builder: bind(this.subMenu, this)
                ).id("Test_Menu_05").selectIcon(@r(app.string.test_boolean))
            }.id("Test_MenuItemGroup")

            MenuItemGroup(header: bind(this.menuText, this), footer:  bind(this.menuText, this))

            MenuItemGroup(header: @r(app.string.menuItemGroup_header), footer: @r(app.string.menuItemGroup_footer)) {
                =>
                MenuItem(startIcon: "", endIcon: "", content: "菜单选项", labelInfo: "")
                    .selectIcon(true)
                    .selected(true)
                    .onChange(
                        {
                            selected =>
                            iconStr2 = @r(app.media.wx)
                            content = @r(app.string.contentName1)
                            Hilog.info(1, "1", "1", "onChange")
                        }
                    )
                    .labelFont(size: @r(app.string.size_desc), weight: FontWeight.Medium,
                        family: @r(app.string.family_desc), style: FontStyle.Italic)
                    .contentFont(family: @r(app.string.family_desc))
                    .contentFont(size: @r(app.string.size_desc), weight: FontWeight.Medium,
                        family: @r(app.string.family_desc), style: FontStyle.Normal)
                    .id("Test_Menu_04")
                MenuItem(
                    startIcon: @r(app.media.menu),
                    content: @r(app.string.contentName),
                    endIcon: @r(app.media.right),
                    labelInfo: @r(app.string.emptyName),
                    builder: bind(this.subMenu, this)
                ).id("Test_Menu_05").selectIcon(@r(app.string.test_boolean))
            }.id("Test_MenuItemGroup2")

            MenuItem(
                startIcon: this.iconStr2,
                content: this.content,
                endIcon: @r(app.media.right),
                labelInfo: @r(app.string.emptyName),
            ).id("Test_Menu_06")
        }
            .font(size: 15.vp, weight: FontWeight.Medium, family: "HarmonyOS Sans", style: FontStyle.Italic)
            .fontColor(0x9B30FF)
            .radius((-1.0).vp)
            .radius(40.percent)
            .width(200.vp)
            .id("Menu")

        Menu() {

        }
            .font()
            .font(size: 15.vp, weight: FontWeight.Medium, family: @r(app.string.family_desc), style: FontStyle.Italic)
            .fontColor(Color.Red)
            .radius(BorderRadiuses(topLeft: 16.vp, topRight: 16.vp, bottomLeft: 16.vp, bottomRight: 16.vp))
            .id("Menu2")

        Menu() {

        }
            .font(size: @r(app.string.size_desc), weight: FontWeight.Medium, family: "HarmonyOS Sans",
                style: FontStyle.Italic)
            .fontColor(@r(app.color.blue_color))
            .id("Menu3")

        Menu() {

        }
            .font(family: @r(app.string.family_desc))
            .font(size: @r(app.string.size_desc), weight: FontWeight.Medium, family: @r(app.string.family_desc),
                style: FontStyle.Italic)
            .id("Menu4")
        Menu() {
            MenuItemGroup(header: {=>}, footer: {=>}) {

            }.id("MenuItemGroup1")
        }
    }

    func build() {
        Row() {
            Column() {
                Button("click to show menu").id("showmenu").fontSize(50).fontWeight(FontWeight.Bold).id("button")
            }.bindMenu(builder: this.myMenu2).width(100.percent)
        }.height(100.percent)
    }
}
