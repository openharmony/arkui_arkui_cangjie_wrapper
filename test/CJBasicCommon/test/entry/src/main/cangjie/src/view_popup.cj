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
import ohos.base.{LengthProp, Length, Color}

@Entry
@Component
class ViewPopup {
    @State
    var isShowPopup: Bool = false
    @State
    var isShowPopupBuilder: Bool = false
    @State
    var isenableArrow: Bool = true
    @State
    var handlePopup: Bool = false
    @State
    var customPopup: Bool = false

    @State
    var text: String = ""
    @State
    var text_01: String = ""
    @State
    var text_02: String = ""
    @State
    var text_03: String = ""
    @State
    var text_04: String = ""
    @State
    var text_05: String = ""
    @State
    var text_06: String = ""
    @State
    var text_07: String = ""
    @State
    var text_08: String = ""
    @State
    var msg1: String = "Popup Wait"
    @State
    var msg2: String = "first button Wait"
    @State
    var msg3: String = "second button Wait"
    @State
    var dismiss: String = "Dismiss Wait"
    @State
    var custom: String = "Custom Wait"

    @Builder
    func builder() {
        Column {
            Button("Builder 内容").width(300.px).onClick({
                evt => Hilog.info(1, "Cangjie-App", "Builder 中的按钮被点击")
            })
        }.width(300.px)
    }

    @Builder
    func popupBuilder() {
        Column {
            Text("Custom Popup")
        }
    }

    func build() {
        Column(space: 10) {
            Text(msg1).id("Test_Text_07")
            Text(msg2).id("Test_Text_08")
            Text(msg3).id("Test_Text_09")
            Text(dismiss).id("Test_Text_10")
            Text(custom).id("Test_Text_11")
            Text(this.text_07).id("Test_Button5")
            Text(this.text_08).id("Test_Button6")

            Button("BindPopup")
                .id("button1")
                .onClick({
                    evt => isShowPopup = true
                })
                .bindPopup(
                    isShowPopup,
                    PopupOptions(
                        showInSubWindow: false,
                        message: "确定将此项删除吗？",
                        primaryButton: PopupButton(
                            value: "OK",
                            action: {
                                =>
                                Hilog.info(1, "Cangjie-App", "OK被点击")
                                this.text = "show current state is ${this.isShowPopup}"
                                isShowPopup = false
                                this.text_01 = "primaryButton current state is ${this.isShowPopup}"
                            }
                        ),
                        arrowPointPosition: ArrowPointPosition.Start,
                        secondaryButton: PopupButton(
                            value: "Off",
                            action: {
                                =>
                                Hilog.info(1, "Cangjie-App", "Cancel被点击")
                                isShowPopup = false
                                this.text_02 = "secondaryButton current state is ${this.isShowPopup}"
                            }
                        ),
                        onStateChange: {
                            evt =>
                            Hilog.info(1, "Cangjie-App", "Bind 1 isVisible: " + evt.isVisible.toString())
                            if (!evt.isVisible) {
                                isShowPopup = false
                                this.text_03 = "onStateChange current state is ${this.isShowPopup}"
                            }
                        }
                    )
                )

            Button("BindPopup-Custom")
                .id("button2")
                .onClick({
                    evt => isShowPopupBuilder = true
                })
                .bindPopup(
                    isShowPopupBuilder,
                    CustomPopupOptions(
                        showInSubWindow: false,
                        enableArrow: isenableArrow,
                        builder: bind(builder, this),
                        onStateChange: {
                            evt =>
                            Hilog.info(1, "Cangjie-App", "BindPopup-Custom isVisible: " + evt.isVisible.toString())
                            this.text_04 = "show current state is ${this.isShowPopupBuilder}"
                            this.text_05 = "enableArrow current state is ${this.isenableArrow}"
                            if (!evt.isVisible) {
                                isShowPopupBuilder = false
                                this.text_06 = "onStateChange state is ${this.isShowPopupBuilder}"
                            }
                        }
                    )
                )

            Button('PopupOptions')
                .id("button3")
                .margin(top: 200)
                .onClick ({ e =>
                    this.handlePopup = !this.handlePopup
                })
                .bindPopup(
                    this.handlePopup,
                    PopupOptions(
                        message: 'This is a popup with PopupOptions',
                        primaryButton: PopupButton(
                            value: 'confirm',
                            action: {
                                =>
                                this.handlePopup = !this.handlePopup
                                this.msg1 = "first button clicked"
                            }
                        ),
                        secondaryButton: PopupButton(
                            value: 'cancel',
                            action: {
                                =>
                                this.handlePopup = !this.handlePopup
                                this.msg2 = "second button clicked"
                            }
                        ),
                        onStateChange: {
                            e =>
                            this.msg3 = "Popup Show"
                            if (!e.isVisible) {
                                this.msg3 = "Popup Wait"
                                this.handlePopup = false
                            }
                        },
                        showInSubWindow: false,
                        arrowOffset: 60.0.vp,
                        targetSpace: 20.0.vp,
                        enableArrow: true,
                        arrowHeight: 30.0.vp,
                        arrowWidth: 30.0.vp,
                        radius: 25.0.vp,
                        autoCancel: false,
                        backgroundBlurStyle: BlurStyle.Thick,
                        shadow: ShadowStyle.OuterDefaultLG,
                        offset: Position(x: 50.0, y: 50.0),
                        placement: Placement.Top,
                        arrowPointPosition: ArrowPointPosition.Center,
                        mask: Color(0x33000000),
                        popupColor: Color.Green,
                        messageOptions: PopupMessageOptions(textColor: Color.Blue, font: Font(size: 20.vp)),
                        transition: TransitionEffect.SLIDE_SWITCH,
                        onWillDismiss: {
                            dismissPopupAction: DismissPopupAction =>
                            dismissPopupAction.dismiss()
                            match (dismissPopupAction.reason) {
                                case PRESS_BACK => this.dismiss = "dismissReason: PRESS_BACK"
                                case TOUCH_OUTSIDE => this.dismiss = "dismissReason: TOUCH_OUTSIDE"
                                case _ => this.dismiss = "dismissReason: unknown"
                            }
                        }
                    )
                )

            Button("CustomPopupOptions")
                .id("button4")
                .onClick({ e => customPopup = !customPopup})
                .bindPopup(
                    customPopup,
                    CustomPopupOptions(
                        showInSubWindow: false,
                        builder: bind(popupBuilder, this),
                        enableArrow: true,
                        placement: Placement.BottomLeft,
                        popupColor: Color.Red,
                        arrowHeight: 24.0.vp,
                        arrowWidth: 24.0.vp,
                        radius: 10.vp,
                        mask: Color(0x33000000),
                        offset: Position(x: 5.0, y: 5.0),
                        width: 100.vp,
                        autoCancel: true,
                        targetSpace: 10.vp,
                        arrowOffset: 5.vp,
                        focusable: true,
                        arrowPointPosition: ArrowPointPosition.End,
                        transition: TransitionEffect.SLIDE_SWITCH,
                        onStateChange: {
                            evt =>
                            custom = "stateChange: ${evt.isVisible}"
                            this.custom = "CustomPopup Show"
                            if (!evt.isVisible) {
                                customPopup = true
                            }
                        }
                    )
                )
            Button("EmptyPopupOptions")
                .id("button5")
                .onClick ({ e =>
                    text_07 = "Button5 Clicked"
                })
            Button("DragPreviewMode")
                .id("button6")
                .onClick ({ e =>
                    text_08 = "Button6 Clicked"
                })
            Text(this.text_01).id("Test_Text_01").width(100).height(80)
            Text(this.text_03).id("Test_Text_03").width(100).height(80)
            Text(this.text_04).id("Test_Text_04").width(100).height(80)
            Text(this.text_05).id("Test_Text_05").width(100).height(80)
            Text(this.text_06).id("Test_Text_06").width(100).height(80)
        }
    }
}