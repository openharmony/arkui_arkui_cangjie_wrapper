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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/**
 * TC_146: @CustomDialog Combined with State Variables
 * Test Scenario: @CustomDialog component uses @State and other state variables
 * Expected Result: State variables work correctly, dialog correctly displays
 */

@CustomDialog
class CustomDialogWithStateTC146 {
    var controller: Option<CustomDialogController> = Option<CustomDialogController>.None
    @State var dialogValue: Int64 = 0
    @State var dialogText: String = "Initial"

    func build(): Unit {
        Column() {
            Text("Dialog Value: ${this.dialogValue}")
                .fontSize(18)
                .id("dialog_value_display")

            Text("Dialog Text: ${this.dialogText}")
                .fontSize(16)
                .margin(top: 10)
                .id("dialog_text_display")

            Button("Increment")
                .id("increment_button")
                .onClick({ e => this.dialogValue = this.dialogValue + 1 })

            Button("Update Text")
                .id("update_text_button")
                .onClick({ e => this.dialogText = "Updated" })

            Button("Close")
                .id("close_button")
                .onClick({ e => this.controller?.closeDialog() })
        }
        .width(300)
        .height(250)
        .padding(20)
        .backgroundColor(0xFFFFFF)
    }
}

@Entry
@Component
class ViewCustomDialogTC146 {
    var dialogController: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: CustomDialogWithStateTC146()))

    func build(): Unit {
        Column() {
            Text("TC_146: @CustomDialog Combined with State Variables")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Button("Show Dialog")
                .id("show_dialog_button")
                .onClick({ e => 
                    this.dialogController.openDialog()
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

