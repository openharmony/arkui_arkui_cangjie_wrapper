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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.prompt_action.*

var customdialogId: Int32 = 0

@Entry
@Component
class View_Prompt {
    @State
    var index0: Int32 = -1
    @State
    var index1: Int32 = -1

    var promptAction: PromptAction = PromptAction()
    var edgeStyles: EdgeStyles = EdgeStyles()
    var edgeColor: EdgeColors = EdgeColors()

    var customDialogOptions: CustomDialogOptions = CustomDialogOptions(builder: {=>})
    var showDialogOptions: ShowDialogOptions = ShowDialogOptions()
    var actionMenuOptions: ActionMenuOptions = ActionMenuOptions(
        buttons: [ButtonInfo(text: "text1", color: 0xFF7F50), ButtonInfo(text: "text2", color: Color.Red)])
    var showToastOptions: ShowToastOptions = ShowToastOptions(message: "ShowToastOptions")

    @Builder
    func CustomDialog() {
        Column() {
            Text("Hello").height(50.vp)
            Button("CloseDialog").onClick({
                evt => PromptAction.closeCustomDialog(customdialogId)
            })
        }.margin(10.vp)
    }
    func build() {
        Column {
            Text("Show toast!")
                .fontSize(50.px)
                .margin(10.px)
                .onClick({
                    evt => PromptAction.showToast(message: "hello world", duration: 1500)
                })
                .id("showToast")
            Text("Show dialog! index: " + index0.toString())
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        let buttons: Array<ButtonInfo> = [ButtonInfo(text: "yes", color: Color.Black),
                            ButtonInfo(text: "no", color: Color.Black)]
                        try {
                            PromptAction.showDialog(title: "select", message: "yes or no", buttons: [],
                                callback: {e, i =>})
                        } catch (e: Exception) {
                            logger("PromptAction: Show dialog error: ${e.message}")
                        }
                        PromptAction.showDialog(title: "select", message: "yes or no", buttons: buttons,
                            callback: {
                                err: Option<BusinessException>, i: Option<Int32> => try {
                                    match (err) {
                                        case Some(e) => logger("error: errcode is ${e.code}")
                                        case _ => index0 = i.getOrThrow()
                                    }
                                } catch (e: Exception) {
                                    logger(e.toString())
                                }
                            })
                    }
                )
                .id("showDialog")

            // 覆盖率 ToastShowMode TopMost
            Text("Show toast!")
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt => PromptAction.showToast(message: "hello world", duration: 1500,
                            showMode: ToastShowMode.TopMost)
                    })
                .id("showToast_2")

            // 覆盖率ButtonInfo (text: String, color: UInt32)
            Text("Show dialog2! index: " + index0.toString())
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        let buttons: Array<ButtonInfo> = [ButtonInfo(text: "yes", color: 0xFF4ECF73),
                            ButtonInfo(text: "no", color: 0xFF4ECF73)]
                        PromptAction.showDialog(title: "select", message: "yes or no", buttons: buttons,
                            callback: {
                                err: Option<BusinessException>, i: Option<Int32> => try {
                                    match (err) {
                                        case Some(e) => logger("error: errcode is ${e.code}")
                                        case _ => index0 = i.getOrThrow()
                                    }
                                } catch (e: Exception) {
                                    logger(e.toString())
                                }
                            })
                    }
                )
                .id("showDialog_2")

            Text("Show action menu! index: " + index1.toString())
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        let buttons: Array<ButtonInfo> = [ButtonInfo(text: "showActionMenu_a", color: Color.Black),
                            ButtonInfo(text: "showActionMenu_b", color: Color.Black)]
                        try {
                            PromptAction.showActionMenu(title: "menu", buttons: [], callback: {e, i =>})
                        } catch (e: Exception) {
                            logger("PromptAction: Show action menu error: ${e.message}")
                        }
                        PromptAction.showActionMenu(title: "menu", buttons: buttons,
                            callback: {
                                err: Option<BusinessException>, i: Option<Int32> => try {
                                    match (err) {
                                        case Some(e) => logger("error: errcode is ${e.code}")
                                        case _ => index1 = i.getOrThrow()
                                    }
                                } catch (e: Exception) {
                                    logger(e.toString())
                                }
                            })
                    }
                )
                .id("showActionMenu")

            Text("openDialog")
                .onClick(
                    {
                        evt => PromptAction.openCustomDialog(
                            CustomDialogOptions(builder: bind(this.CustomDialog, this)),
                            {
                                id => customdialogId = id
                            }
                        )
                    })
                .id("openDialog")

            Text("openCustomDialogWithOption")
                .fontSize(50.px)
                .margin(10.px)
                .onClick({
                    evt => PromptAction.openCustomDialogWithOption(customDialogOptions, {a =>})
                })
                .id("openCustomDialogWithOption")

            Text("openCustomDialogWithOption1")
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        Hilog.info(1, "1", "1", "PromptAction: openCustomDialogWithOption1 onClick")
                        var customDialogOptions: CustomDialogOptions = CustomDialogOptions(builder: {=>},
                            autoCancel: true, borderStyle: EdgeStyles(),
                            shadow: ShadowOptions(radius: 2.0, shadowType: ShadowType.Color))
                        PromptAction.openCustomDialogWithOption(customDialogOptions, {a =>})
                    }
                )
                .id("openCustomDialogWithOption1")

            Text("openCustomDialogWithOption2")
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        Hilog.info(1, "1", "1", "PromptAction: openCustomDialogWithOption2 onClick")
                        var customDialogOptions: CustomDialogOptions = CustomDialogOptions(builder: {=>},
                            autoCancel: true, borderStyle: EdgeStyles())
                        PromptAction.openCustomDialogWithOption(customDialogOptions, {a =>})
                    }
                )
                .id("openCustomDialogWithOption2")

            Text("Show showDialog3")
                .fontSize(50.px)
                .margin(10.px)
                .onClick({
                    evt => PromptAction.showDialog(showDialogOptions)
                })
                .id("showDialog3")

            Text("Show showDialog4")
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        Hilog.info(1, "1", "1", "PromptAction: showDialog4 onClick")
                        var showDialogOptions2: ShowDialogOptions = ShowDialogOptions(buttons: [])
                        try {
                            PromptAction.showDialog(showDialogOptions2)
                        } catch (e: Exception) {
                            logger("View_Prompt: PromptAction.showDialog error: ${e.message}")
                        }
                        var showDialogOptions3: ShowDialogOptions = ShowDialogOptions(
                            shadow: ShadowOptions(radius: 0.0))
                        PromptAction.showDialog(showDialogOptions3)
                    }
                )
                .id("showDialog4")

            Text("Show showDialog5")
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        Hilog.info(1, "1", "1", "PromptAction: Show showDialog5 onClick")
                        var showDialogOptions4: ShowDialogOptions = ShowDialogOptions(
                            shadow: ShadowOptions(radius: 2.0, shadowType: ShadowType.Color))
                        PromptAction.showDialog(showDialogOptions4)
                    }
                )
                .id("showDialog5")

            Text("Show ActionMenu 2")
                .fontSize(50.px)
                .margin(10.px)
                .onClick({
                    evt => PromptAction.showActionMenu(actionMenuOptions)
                })
                .id("showActionMenu2")

            Text("Show showToast 3")
                .fontSize(50.px)
                .margin(10.px)
                .onClick(
                    {
                        evt =>
                        PromptAction.showToast(showToastOptions)
                        var showToastOptions1: ShowToastOptions = ShowToastOptions(
                            message: "ShowToastOptions",
                            shadow: ShadowOptions(radius: 2.0, shadowType: ShadowType.Color)
                            /*,shadowStyle: ProShadowStyle.OuterDefaultXS*/ )
                        PromptAction.showToast(showToastOptions1)
                        var showToastOptions2: ShowToastOptions = ShowToastOptions(message: "ShowToastOptions"
                            /*shadowStyle: ProShadowStyle.OuterDefaultSM*/ )
                        PromptAction.showToast(showToastOptions2)
                    }
                )
                .id("showToast3")
        }
    }
}
