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

import std.unittest.testmacro.*
import ohos.arkui.component.*
import std.collection.{ArrayList, HashMap}
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.convert.*
import ohos.base.*
import ohos.resource_manager.{AppResource}
import std.database.sql.Transaction

@Entry
@Component
class View_MenuBindMenu {
    @State
    var msg_onAppear: String = "onAppear wait"
    @State
    var msg_onDisappear: String = "onDisappear wait"
    @State
    var msg_aboutToAppear: String = "aboutToAppear wait"
    @State
    var msg_aboutToDisappear: String = "aboutToDisappear wait"
    @State
    var msg_action: String = "action wait"

    func build() {
        Column(space: 20) {
            Text(msg_onAppear).id("Test_Text_02")
            Text(msg_onDisappear).id("Test_Text_03")
            Text(msg_aboutToAppear).id("Test_Text_04")
            Text(msg_aboutToDisappear).id("Test_Text_05")
            Text(msg_action)
            Button("BindMenu - MenuElement")
                .id("Test_Button_03")
                .bindMenu(
                    // 测试 MenuElement 结构；
                    [
                        MenuElement(
                            value: "菜单1",
                            action: {
                                => logger("MenuElement test: 菜单1被点击")
                            }
                        ),
                        MenuElement(
                            value: "菜单2",
                            action: {
                                => logger("MenuElement test: 菜单2被点击")
                            }
                            //                        ,
                            //                        icon: "data:image/jpeg;base64,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",
                            //                        enabled: true
                        )
                    ]
                )

            Button("BindMenu - MenuOptions")
                .id("Test_Button_04")
                .bindMenu(
                    [
                        MenuElement(
                            value: "菜单1",
                            action: {
                                => logger("MenuElement test: 菜单1被点击")
                            }
                        ),
                        MenuElement(
                            value: "菜单2",
                            action: {
                                =>
                                this.msg_action = "action show up"
                                logger("MenuElement test: 菜单2被点击")
                            }
                            //                        ,
                            //                        icon: "data:image/jpeg;base64,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",
                            //                        enabled: true
                        )
                    ]
                    //                ,
                    //                options: MenuOptions(
                    //                    enableArrow: true,
                    //                    onAppear: {=>
                    //                        this.msg_onAppear = "onAppear show up"
                    //                        logger("MenuOptions test: onAppear")},
                    //                    onDisappear: {=>
                    //                        this.msg_onDisappear = "onDisappear show up"
                    //                        logger("MenuOptions test: onDisappear")},
                    //                    aboutToAppear: {=>
                    //                        this.msg_aboutToAppear = "aboutToAppear show up"
                    //                        logger("MenuOptions test: aboutToAppear")},
                    //                    aboutToDisappear: {=>
                    //                        this.msg_aboutToDisappear = "aboutToDisappear show up"
                    //                        logger("MenuOptions test: aboutToDisappear")},
                    //                    title: "MenuOptions",
                    //                    showInSubWindow: true
                    //                )
                )
        }
    }
}
