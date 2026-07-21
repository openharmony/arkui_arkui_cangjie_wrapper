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
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
 */

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.ui_context.*

var dialogIdRecord: Int32 = 0
var callbackIndexRecord: Int32 = 0
var lifecycleCount: Int32 = 0

@Entry
@Component
class ViewPromptV2 {
    @State
    var testResult: String = ""
    
    var scroller: Scroller = Scroller()
    
    @Builder
    func customDialogBuilder() {
        Column() {
            Text("Custom Dialog Content").fontSize(20.fp)
            Button("Close").onClick({evt => 
                getUIContext().getPromptAction().closeCustomDialog(dialogIdRecord)
            })
        }.padding(10.vp)
    }
    
    @Builder
    func lifecycleDialogBuilder() {
        Column() {
            Text("Lifecycle Dialog").fontSize(20.fp)
        }.padding(10.vp)
    }
    
    func build() {
        Scroll(this.scroller) {
            Column(space: 10.px) {
                
                Text(this.testResult)
                    .fontSize(16.px)
                    .margin(10.px)
                    .id("testResultText")
                
                
                Button("TC01: openCustomDialog基础功能")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogConfig(builder: bind(this.customDialogBuilder, this)),
                            {id => 
                                dialogIdRecord = id
                                testResult = "dialogId: ${id}"
                            }
                        )
                    })
                    .id("openCustomDialog_tc01")
                
                Button("TC02: alignment=Top, isModal=true, showInSubWindow=true")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogConfig(
                                builder: bind(this.customDialogBuilder, this),
                                alignment: DialogAlignment.Top,
                                isModal: true,
                                showInSubWindow: true
                            ),
                            {id => dialogIdRecord = id}
                        )
                    })
                    .id("openCustomDialog_tc02")
                
                Button("TC03: alignment=Bottom, autoCancel=true, levelMode=Overlay")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogConfig(
                                builder: bind(this.customDialogBuilder, this),
                                alignment: DialogAlignment.Bottom,
                                autoCancel: true,
                                levelMode: LevelMode.Overlay
                            ),
                            {id => dialogIdRecord = id}
                        )
                    })
                    .id("openCustomDialog_tc03")
                
                Button("TC04: isModal=false, levelMode=Embedded, showInSubWindow=false")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogConfig(
                                builder: bind(this.customDialogBuilder, this),
                                isModal: false,
                                levelMode: LevelMode.Embedded,
                                showInSubWindow: false
                            ),
                            {id => dialogIdRecord = id}
                        )
                    })
                    .id("openCustomDialog_tc04")
                
                Button("TC05: 视觉样式组合(maskColor, backgroundColor, cornerRadius, width, height)")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogConfig(
                                builder: bind(this.customDialogBuilder, this),
                                maskColor: Color.Red,
                                backgroundColor: Color.White,
                                cornerRadius: BorderRadiuses(topLeft: 10.vp, topRight: 10.vp, bottomLeft: 10.vp, bottomRight: 10.vp),
                                width: 300.vp,
                                height: 200.vp
                            ),
                            {id => dialogIdRecord = id}
                        )
                    })
                    .id("openCustomDialog_tc05")
                
                Button("TC06: 回调完整性验证")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogConfig(builder: bind(this.customDialogBuilder, this)),
                            {id => 
                                if (id > 0) {
                                    testResult = "Valid dialogId: ${id}"
                                }
                            }
                        )
                    })
                    .id("openCustomDialog_tc06")
                
                Button("TC07: 生命周期回调组合测试")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        lifecycleCount = 0
                        getUIContext().getPromptAction().openCustomDialog(
                            CustomDialogConfig(
                                builder: bind(this.lifecycleDialogBuilder, this),
                                onDidAppear: {=> lifecycleCount = lifecycleCount + 1},
                                onDidDisappear: {=> lifecycleCount = lifecycleCount + 10},
                                onWillAppear: {=> lifecycleCount = lifecycleCount + 100},
                                onWillDisappear: {=> lifecycleCount = lifecycleCount + 1000}
                            ),
                            {id => dialogIdRecord = id}
                        )
                    })
                    .id("openCustomDialog_tc07")
                
                Button("TC08: 边界值(width=0, height=0) + Option.None")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        let config = CustomDialogConfig(
                            builder: bind(this.customDialogBuilder, this),
                            width: 0.vp,
                            height: 0.vp,
                            cornerRadius: BorderRadiuses(topLeft: 0.vp, topRight: 0.vp, bottomLeft: 0.vp, bottomRight: 0.vp)
                        )
                        config.alignment = Option.None
                        config.isModal = Option.None
                        getUIContext().getPromptAction().openCustomDialog(config, {id => dialogIdRecord = id})
                    })
                    .id("openCustomDialog_tc08")
                
                
                Button("TC01: showActionMenu基础功能")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showActionMenu(
                            ActionMenuConfig(
                                title: "",
                                buttons: [ButtonInfo(text: "Button1", color: Color.Red)]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showActionMenu_tc01")
                
                Button("TC02: title='菜单', buttons=3, isModal=true")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showActionMenu(
                            ActionMenuConfig(
                                title: "菜单",
                                buttons: [
                                    ButtonInfo(text: "1", color: Color.Red), 
                                    ButtonInfo(text: "2", color: Color.Red), 
                                    ButtonInfo(text: "3", color: Color.Red)
                                ],
                                isModal: true
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showActionMenu_tc02")
                
                Button("TC03: buttons=6(最大), showInSubWindow=true")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showActionMenu(
                            ActionMenuConfig(
                                buttons: [
                                    ButtonInfo(text: "1", color: Color.Red), 
                                    ButtonInfo(text: "2", color: Color.Red), 
                                    ButtonInfo(text: "3", color: Color.Red),
                                    ButtonInfo(text: "4", color: Color.Red), 
                                    ButtonInfo(text: "5", color: Color.Red),
                                    ButtonInfo(text: "6", color: Color.Red)
                                ],
                                showInSubWindow: true
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showActionMenu_tc03")
                
                Button("TC04: buttons=[](边界), levelMode=Overlay")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showActionMenu(
                            ActionMenuConfig(
                                buttons: [],
                                levelMode: LevelMode.Overlay
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showActionMenu_tc04")
                
                Button("TC05: isModal=false, levelMode=Embedded, showInSubWindow=false")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showActionMenu(
                            ActionMenuConfig(
                                buttons: [ButtonInfo(text: "OK", color: Color.Red)],
                                isModal: false,
                                levelMode: LevelMode.Embedded,
                                showInSubWindow: false
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showActionMenu_tc05")
                
                Button("TC06: 回调完整性验证")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showActionMenu(
                            ActionMenuConfig(buttons: [ButtonInfo(text: "A", color: Color.Red), ButtonInfo(text: "B", color: Color.Red)]),
                            callback: {err, index => 
                                match (err) {
                                    case Some(err) =>
                                        Hilog.info(0, "cangjie-test", "error")
                                    case None => 
                                        callbackIndexRecord = index.getOrThrow()
                                        testResult = "Button index: ${index.getOrThrow()}"
                                }
                            }
                        )
                    })
                    .id("showActionMenu_tc06")
                
                Button("TC07: 按钮样式(color=Blue, primary=true)")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showActionMenu(
                            ActionMenuConfig(
                                buttons: [ButtonInfo(text: "确定", color: Color.Blue, primary: true)]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showActionMenu_tc07")
                
                
                Button("TC01: showDialog基础功能(title, message)")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                title: "标题",
                                message: "内容"
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc01")
                
                Button("TC02: title='', message='', buttons=2")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                title: "",
                                message: "",
                                buttons: [ButtonInfo(text: "确定", color: Color.Red), ButtonInfo(text: "取消", color: Color.Red)]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc02")
                
                Button("TC03: alignment=Top, isModal=true, buttons=3")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                alignment: DialogAlignment.Top,
                                isModal: true,
                                buttons: [ButtonInfo(text: "1", color: Color.Red), ButtonInfo(text: "2", color: Color.Red), ButtonInfo(text: "3", color: Color.Red)]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc03")
                
                Button("TC04: alignment=Bottom, showInSubWindow=true, levelMode=Overlay")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                alignment: DialogAlignment.Bottom,
                                showInSubWindow: true,
                                levelMode: LevelMode.Overlay,
                                buttons: [
                                    ButtonInfo(text: "1", color: Color.Red), 
                                    ButtonInfo(text: "2", color: Color.Red), 
                                    ButtonInfo(text: "3", color: Color.Red)
                                ]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc04")
                
                Button("TC05: isModal=false, levelMode=Embedded, enableHoverMode=true")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                isModal: false,
                                levelMode: LevelMode.Embedded,
                                enableHoverMode: true,
                                buttons: [
                                    ButtonInfo(text: "1", color: Color.Red), 
                                    ButtonInfo(text: "2", color: Color.Red), 
                                    ButtonInfo(text: "3", color: Color.Red)
                                ]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc05")
                
                Button("TC06: 背景样式组合(backgroundColor, backgroundBlurStyle, shadow)")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                backgroundColor: Color.White,
                                backgroundBlurStyle: BlurStyle.ComponentUltraThick,
                                shadow: ShadowOptions(radius: 10.0),
                                buttons: [
                                    ButtonInfo(text: "1", color: Color.Red), 
                                    ButtonInfo(text: "2", color: Color.Red), 
                                    ButtonInfo(text: "3", color: Color.Red)
                                ]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc06")
                
                Button("TC07: hoverModeArea=TopScreen, levelMode=Overlay")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                hoverModeArea: HoverModeAreaType.TopScreen,
                                levelMode: LevelMode.Overlay,
                                buttons: [
                                    ButtonInfo(text: "1", color: Color.Red), 
                                    ButtonInfo(text: "2", color: Color.Red), 
                                    ButtonInfo(text: "3", color: Color.Red)
                                ]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc07")
                
                Button("TC08: offset=(10,20), maskRect")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                offset: Offset(10.vp, 20.vp),
                                maskRect: Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent),
                                buttons: [
                                    ButtonInfo(text: "1", color: Color.Red), 
                                    ButtonInfo(text: "2", color: Color.Red), 
                                    ButtonInfo(text: "3", color: Color.Red)
                                ]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc08")
                
                Button("TC09: 回调完整性验证")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                buttons: [ButtonInfo(text: "OK", color: Color.Red), ButtonInfo(text: "Cancel", color: Color.Red)]
                            ),
                            callback: {err, index => 
                                match (err) {
                                    case Some(err) =>
                                        Hilog.info(0, "cangjie-test", "error")
                                    case None => 
                                        callbackIndexRecord = index.getOrThrow()
                                        testResult = "Button index: ${index.getOrThrow()}"
                                }
                            }
                        )
                    })
                    .id("showDialog_tc09")
                
                Button("TC10: 按钮颜色(color=Blue)")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                buttons: [ButtonInfo(text: "确定", color: Color.Blue)]
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc10")
                
                Button("TC11: 边界值(offset=0, maskRect=0, buttons=[])")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        getUIContext().getPromptAction().showDialog(
                            ShowDialogConfig(
                                offset: Offset(0.vp, 0.vp),
                                maskRect: Rectangle(x: 0.vp, y: 0.vp, width: 0.vp, height: 0.vp),
                                buttons: []
                            ),
                            callback: {err, index =>}
                        )
                    })
                    .id("showDialog_tc11")
                
                Button("TC12: Option.None测试(验证框架默认值00)")
                    .fontSize(30.px)
                    .margin(10.px)
                    .onClick({
                        evt =>
                        let config = ShowDialogConfig()
                        config.title = Option.None
                        config.message = Option.None
                        config.alignment = Option.None
                        config.isModal = Option.None
                        config.showInSubWindow = Option.None
                        config.backgroundColor = Option.None
                        config.levelMode = Option.None
                        getUIContext().getPromptAction().showDialog(config, callback: {err, index =>})
                    })
                    .id("showDialog_tc12")
                
            }.width(100.percent).id("ViewPromptV2")
        }.id("scroller")
    }
}