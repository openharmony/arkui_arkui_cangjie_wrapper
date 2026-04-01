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
import ohos.arkui.ui_context.*

var customdialogId: Int32 = 0

@Entry
@Component
class ViewPrompt {
    @State
    var index0: Int32 = -1
    @State
    var index1: Int32 = -1

    var edgeStyles: EdgeStyles = EdgeStyles()
    var edgeColor: EdgeColors = EdgeColors()

    var customDialogOptions: CustomDialogOptions = CustomDialogOptions(builder: {=>})
    var showDialogOptions: ShowDialogOptions = ShowDialogOptions()
    var actionMenuOptions: ActionMenuOptions = ActionMenuOptions(
        buttons: [ButtonInfo(text: "text1", color: 0xFF7F50), ButtonInfo(text: "text2", color: Color.Red)])
    var showToastOptions: ShowToastOptions = ShowToastOptions(message: "ShowToastOptions")
    var mButtons: Array<ButtonInfo> = [ButtonInfo(text: "yes", color: Color.Black),
        ButtonInfo(text: "no", color: Color.Black)]

    var baseDialogOptions: BaseDialogOptions = BaseDialogOptions()
    var customDialogOptions2: CustomDialogOptions = CustomDialogOptions(builder: {=>})
    @Builder
    func customDialog() {
        Column() {
            Text("Hello").height(50.vp)
            Button("CloseDialog").onClick({
                evt => getUIContext().getPromptAction().closeCustomDialog(customdialogId)
            })
        }.margin(10.vp)
    }
    func build() {
        Scroll() {
            Column {
                Text("Show toast!")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt => getUIContext().getPromptAction().showToast(ShowToastOptions(message: "hello world", duration: 1500))
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
                                getUIContext().getPromptAction().showDialog(ShowDialogOptions(title: "select", message: "yes or no", buttons: []),
                                    callback: {e, i =>})
                            } catch (e: Exception) {
                                logger("PromptAction: Show dialog error: ${e.message}")
                            }
                            getUIContext().getPromptAction().showDialog(ShowDialogOptions(title: "select", message: "yes or no", buttons: buttons),
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
                            evt => getUIContext().getPromptAction().showToast(ShowToastOptions(message: "hello world", duration: 1500,
                                showMode: ToastShowMode.TopMost))
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
                            getUIContext().getPromptAction().showDialog(ShowDialogOptions(title: "select", message: "yes or no", buttons: buttons),
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
                                getUIContext().getPromptAction().showActionMenu(ActionMenuOptions(title: "menu", buttons: []), callback: {e, i =>})
                            } catch (e: Exception) {
                                logger("PromptAction: Show action menu error: ${e.message}")
                            }
                            getUIContext().getPromptAction().showActionMenu(ActionMenuOptions(title: "menu", buttons: buttons),
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
                            evt => getUIContext().getPromptAction().openCustomDialog(
                                CustomDialogOptions(builder: bind(this.customDialog, this)),
                                {
                                    id => customdialogId = id
                                }
                            )
                        })
                    .id("openDialog")

                Text("openCustomDialogWithOption")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick(
                        {
                            evt =>
                            Hilog.info(1, "1", "1", "PromptAction: default_openCustomDialogOption onClick")
                            var customDialogOptions: CustomDialogOptions = CustomDialogOptions(builder: {=>})
                            getUIContext().getPromptAction().openCustomDialog(customDialogOptions, {a =>})
                        }
                    )
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
                            getUIContext().getPromptAction().openCustomDialog(customDialogOptions, {a =>})
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
                            getUIContext().getPromptAction().openCustomDialog(customDialogOptions, {a =>})
                        }
                    )
                    .id("openCustomDialogWithOption2")

                Text("Show showDialog3")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                            try {
                                getUIContext().getPromptAction().showDialog(showDialogOptions)
                            } catch (e: Exception) {
                                logger("ViewPrompt: PromptAction.showDialog error: ${e.message}")
                            }
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
                                getUIContext().getPromptAction().showDialog(showDialogOptions2)
                            } catch (e: Exception) {
                                logger("ViewPrompt: PromptAction.showDialog error: ${e.message}")
                            }
                            var showDialogOptions3: ShowDialogOptions = ShowDialogOptions(
                                shadow: ShadowOptions(radius: 0.0), buttons: mButtons)
                            getUIContext().getPromptAction().showDialog(showDialogOptions3)
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
                                shadow: ShadowOptions(radius: 2.0, shadowType: ShadowType.Color), buttons: mButtons)
                            getUIContext().getPromptAction().showDialog(showDialogOptions4)
                        }
                    )
                    .id("showDialog5")

                Text("Show ActionMenu 2")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt => getUIContext().getPromptAction().showActionMenu(actionMenuOptions)
                    })
                    .id("showActionMenu2")

                Text("Show showToast 3")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick(
                        {
                            evt =>
                            getUIContext().getPromptAction().showToast(showToastOptions)
                            var showToastOptions1: ShowToastOptions = ShowToastOptions(
                                message: "ShowToastOptions",
                                shadow: ShadowOptions(radius: 2.0, shadowType: ShadowType.Color)
                                /*,shadowStyle: ProShadowStyle.OuterDefaultXS*/ )
                            getUIContext().getPromptAction().showToast(showToastOptions1)
                            var showToastOptions2: ShowToastOptions = ShowToastOptions(message: "ShowToastOptions"
                                /*shadowStyle: ProShadowStyle.OuterDefaultSM*/ )
                            getUIContext().getPromptAction().showToast(showToastOptions2)
                        }
                    )
                    .id("showToast3")

                // ShadowOptions.radius 边界与缺省：10, -10, 0, 1, -1, Float64.Max/Min, 不传 shadow, radius=Option.None
                Text("prompt shadow radius 10")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius 10",
                                message: "shadow.radius",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: 10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadius10")

                Text("prompt shadow radius -10")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius -10",
                                message: "shadow.radius",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: -10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadiusNeg10")

                Text("prompt shadow radius 0")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius 0",
                                message: "shadow.radius",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: 0.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadius0")

                Text("prompt shadow radius 1")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius 1",
                                message: "shadow.radius",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: 1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadius1")

                Text("prompt shadow radius -1")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius -1",
                                message: "shadow.radius",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: -1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadiusNeg1")

                Text("prompt shadow radius Float64.Max")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius Float64.Max",
                                message: "shadow.radius",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: Float64.Max, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadiusFloat64Max")

                Text("prompt shadow radius Float64.Min")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius Float64.Min",
                                message: "shadow.radius",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: Float64.Min, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadiusFloat64Min")

                Text("prompt shadow omitted ShowDialogOptions")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "no shadow param",
                                message: "omit shadow",
                                buttons: mButtons
                            )
                        )
                    })
                    .id("promptShadowOmitted")

                Text("prompt shadow radius Option.None")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogOptions(
                                title: "radius Option.None",
                                message: "ShadowOptions(radius: Option.None)",
                                buttons: mButtons,
                                shadow: ShadowOptions(radius: Option<Float64>.None, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            )
                        )
                    })
                    .id("promptShadowRadiusOptionNone")

                // showToast：与 showDialog 同 9 组场景（10, -10, 0, 1, -1, Max, Min, 省略 shadow, radius Option.None）
                Text("prompt toast shadow radius 10")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow radius 10",
                            duration: 4000,
                            shadow: ShadowOptions(radius: 10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadius10")

                Text("prompt toast shadow radius -10")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow radius -10",
                            duration: 4000,
                            shadow: ShadowOptions(radius: -10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadiusNeg10")

                Text("prompt toast shadow radius 0")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow radius 0",
                            duration: 4000,
                            shadow: ShadowOptions(radius: 0.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadius0")

                Text("prompt toast shadow radius 1")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow radius 1",
                            duration: 4000,
                            shadow: ShadowOptions(radius: 1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadius1")

                Text("prompt toast shadow radius -1")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow radius -1",
                            duration: 4000,
                            shadow: ShadowOptions(radius: -1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadiusNeg1")

                Text("prompt toast shadow radius Float64.Max")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow Float64.Max",
                            duration: 4000,
                            shadow: ShadowOptions(radius: Float64.Max, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadiusFloat64Max")

                Text("prompt toast shadow radius Float64.Min")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow Float64.Min",
                            duration: 4000,
                            shadow: ShadowOptions(radius: Float64.Min, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadiusFloat64Min")

                Text("prompt toast shadow omitted ShowToastOptions")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast omit shadow",
                            duration: 4000
                        ))
                    })
                    .id("promptToastShadowOmitted")

                Text("prompt toast shadow radius Option.None")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showToast(ShowToastOptions(
                            message: "toast shadow Option.None",
                            duration: 4000,
                            shadow: ShadowOptions(radius: Option<Float64>.None, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                        ))
                    })
                    .id("promptToastShadowRadiusOptionNone")

                // openCustomDialog：与 showDialog 同 9 组场景
                Text("prompt customDialog shadow radius 10")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: 10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadius10")

                Text("prompt customDialog shadow radius -10")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: -10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadiusNeg10")

                Text("prompt customDialog shadow radius 0")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: 0.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadius0")

                Text("prompt customDialog shadow radius 1")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: 1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadius1")

                Text("prompt customDialog shadow radius -1")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: -1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadiusNeg1")

                Text("prompt customDialog shadow radius Float64.Max")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: Float64.Max, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadiusFloat64Max")

                Text("prompt customDialog shadow radius Float64.Min")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: Float64.Min, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadiusFloat64Min")

                Text("prompt customDialog shadow omitted CustomDialogOptions")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(builder: bind(this.customDialog, this)),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowOmitted")

                Text("prompt customDialog shadow radius Option.None")
                    .fontSize(50.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogOptions(
                                builder: bind(this.customDialog, this),
                                shadow: ShadowOptions(radius: Option<Float64>.None, color: Color.Red, offsetX: 50.0, offsetY: 20.0)
                            ),
                            { id => customdialogId = id }
                        )
                    })
                    .id("promptCustomDialogShadowRadiusOptionNone")
            }
        }.id("viewPromptScroller")
    }
}
