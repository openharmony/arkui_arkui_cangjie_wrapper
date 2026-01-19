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
import ohos.arkui.state_macro_manage.r
import std.collection.{ArrayList, HashMap}
import ohos.resource_manager.{ResourceManager, AppResource}

@CustomDialog
class MyDialog1 {
    @Link
    var message: String
    var controller: Option<CustomDialogController> = Option.None
    func build() {
        Row(space: 60) {
            Button("cancel").onClick(
                {
                    evt =>
                    message = "cancel"
                    controller?.closeDialog()
                }
            ).id("cancel_button")

            Button("confirm").onClick(
                {
                    evt =>
                    message = "confirm"
                    controller?.closeDialog()
                }
            ).id("confirm_button")
        }.height(500.px)
    }
}

@Entry
@Component
class ViewCustomDialog2 {
    @State
    var message: String = "begin"
    var dialogController: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message)))
    var dialogController3: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), width: 350.vp, height: 300.vp, isModal: true,
            borderWidth: 3.vp, borderColor: Color(0x30008000), borderStyle: EdgeStyles(),
            backgroundColor: Color(0x10008080), backgroundBlurStyle: BlurStyle.Thin,
            shadow: ShadowOptions(radius: 20.0, color: Color.Gray, offsetX: 50.0, offsetY: 10.0)))
    var dialogController4: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), isModal: false))
    var dialogController5: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), isModal: true,
            backgroundBlurStyle: BlurStyle.Thin, backgroundColor: Color(0x10008080)))
    var dialogController6: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), isModal: true, width: 350.vp, height: 300.vp))
    var dialogController7: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), isModal: true, borderWidth: 3.vp,
            borderColor: Color.Black, borderStyle: EdgeStyles()))
    var dialogController8: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog1(message: message),
            isModal: true,
            onWillDismiss: {
                action =>
                match (action.reason) {
                    case PressBack => Hilog.info(1, "1", "1", "customdialog8 PRESS_BACK")
                    case TouchOutside => Hilog.info(1, "1", "1", "customdialog8 TOUCH_OUTSIDE")
                    case CloseButton => Hilog.info(1, "1", "1", "customdialog8 CLOSE_BUTTON")
                    case SlideDown => Hilog.info(1, "1", "1", "customdialog8 SLIDE_DOWN")
                    case _ => Hilog.info(1, "1", "1", "customdialog8 SLIDE_DOWN")
                }
                action.dismiss()
            }
        )
    )
    var dialogController9: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog1(message: message),
            isModal: true,
            onWillDismiss: {
                action => match (action.reason) {
                    case PressBack =>
                        Hilog.info(1, "1", "1", "customdialog9 PRESS_BACK")
                        action.dismiss()
                    case TouchOutside => Hilog.info(1, "1", "1", "customdialog9 TOUCH_OUTSIDE")
                    case CloseButton => Hilog.info(1, "1", "1", "customdialog9 CLOSE_BUTTON")
                    case SlideDown => Hilog.info(1, "1", "1", "customdialog9 SLIDE_DOWN")
                    case _ => Hilog.info(1, "1", "1", "customdialog9 SLIDE_DOWN")
                }
            }
        )
    )
    var dialogController10: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), isModal: true,
            shadow: ShadowOptions(radius: 20.0, color: Color.Gray, offsetX: 50.0, offsetY: 10.0)))
    var dialogController11: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog1(message: message),
            cornerRadius: 50.vp
        )
    )
    var dialogController12: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), borderWidth: 3.vp, borderColor: Color.Green,
            isModal: true, borderStyle: EdgeStyles()))
    var dialogController13: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog1(message: message), isModal: false, borderWidth: 0.vp,
            borderColor: Color.Black, borderStyle: EdgeStyles(), backgroundBlurStyle: BlurStyle.ComponentUltraThick))


    var dialogController14: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog1(message: message),
            cancel: {=> Hilog.info(1, "1", "1", "dialog14 cancel callback")},
            alignment: DialogAlignment.Center,
            offset: Offset(10.vp, 10.vp),
            customStyle: true,
            maskColor: Color.Red,
            maskRect: Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
            showInSubWindow: false
        )
    )


    var dialogController15: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog1(message: message),
            shadow: ShadowOptions(radius: Option<Float64>.None)
        )
    )


    var dialogController16: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog1(message: message),
            shadow: ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, fill: true)
        )
    )

    func build() {
        Column {
            Text(this.message).width(100.percent).id("text")
            Button("open dialog default")
                .onClick(
                    {
                        evt =>
                        message = "open"
                        dialogController.openDialog()
                    }
                )
                .id("open_button1")
            Button("open dialog custom")
                .onClick(
                    {
                        evt =>
                        message = "open dialog3"
                        dialogController3.openDialog()
                    }
                )
                .id("open_button2")
            Button("open dialog with modal false")
                .onClick(
                    {
                        evt =>
                        message = "open dialog with modal false"
                        dialogController4.openDialog()
                    }
                )
                .id("open_button3")
            Button("open dialog with BlurStyle.Thin")
                .onClick(
                    {
                        evt =>
                        message = "open dialog with BlurStyle.Thin"
                        dialogController5.openDialog()
                    }
                )
                .id("open_button4")
            Button("open dialog with height and width")
                .onClick(
                    {
                        evt =>
                        message = "open dialog with height and width"
                        dialogController6.openDialog()
                    }
                )
                .id("open_button5")
            Button("open dialog with borderStyle borderColor borderWidth")
                .onClick(
                    {
                        evt =>
                        message = "open dialog with borderStyle borderColor borderWidth"
                        dialogController7.openDialog()
                    }
                )
                .id("open_button6")
            Button("open dialog with onWillDismiss")
                .onClick(
                    {
                        evt =>
                        message = "open dialog with onWillDismiss"
                        dialogController8.openDialog()
                    }
                )
                .id("open_button7")
            Button("open dialog without dismiss")
                .onClick(
                    {
                        evt =>
                        message = "open dialog without dismiss"
                        dialogController9.openDialog()
                    }
                )
                .id("open_button8")
            Button("open dialog with shadow")
                .onClick(
                    {
                        evt =>
                        message = "open dialog with shadow"
                        dialogController10.openDialog()
                    }
                )
                .id("open_button9")
            Button("open dialog with radius")
                .onClick(
                    {
                        evt =>
                        message = "open dialog with radius"
                        dialogController11.openDialog()
                    }
                )
                .id("open_button9")
            Button("open dialog with borderStyle borderColor borderWidth 2")
                .onClick(
                    {
                        evt =>
                        message = "borderStyle SOLID borderColor borderWidth 2"
                        dialogController12.openDialog()
                    }
                )
                .id("open_button10")


            Button("open dialog with cancel/alignment/offset/customStyle")
                .onClick(
                    {
                        evt =>
                        message = "open dialog14"
                        dialogController14.openDialog()
                    }
                )
                .id("open_button11")


            Button("open dialog with shadow None fields")
                .onClick(
                    {
                        evt =>
                        message = "open dialog15"
                        dialogController15.openDialog()
                    }
                )
                .id("open_button12")


            Button("open dialog with shadowType/fill")
                .onClick(
                    {
                        evt =>
                        message = "open dialog16"
                        dialogController16.openDialog()
                    }
                )
                .id("open_button13")
        }.id("my_dialog").height(100.percent)
    }
}
