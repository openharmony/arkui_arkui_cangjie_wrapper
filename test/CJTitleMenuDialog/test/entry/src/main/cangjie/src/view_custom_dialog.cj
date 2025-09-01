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
import std.collection.{ArrayList, HashMap}

@CustomDialog
class MyDialog {
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
class View_CustomDialog {
    @State
    var message: String = "begin"
    var dialogController1: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog(message: message), autoCancel: true))
    var dialogController2: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog(message: message), gridCount: 1, backgroundColor: Color.Blue,
            openAnimation: AnimateParam(), closeAnimation: AnimateParam()))
    var dialogController: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog(message: message)))
    func build() {
        Column {
            Text(this.message).width(100.percent).id("text")
            Button("open dialog").onClick(
                {
                    evt =>
                    message = "open"
                    dialogController.openDialog()
                }
            ).id("open_button")
        }.id("my_dialog")
    }
}
