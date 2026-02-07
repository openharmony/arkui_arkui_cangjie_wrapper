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
 * TC_145: @CustomDialog Component Definition
 * Test Scenario: Define @CustomDialog component, contains CustomDialogController property
 * Expected Result: Component correctly defined, setController method correctly generated
 */

@CustomDialog
class CustomDialogTC145 {
    // TODO: NOT SUPPORTED ?CustomDialogController
    var controller: Option<CustomDialogController> = Option<CustomDialogController>.None
    @State var dialogTitle: String = "Custom Dialog"

    func build(): Unit {
        Column() {
            Text("${this.dialogTitle}")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .id("dialog_title")

            Text("This is a custom dialog")
                .fontSize(16)
                .margin(top: 10)
                .id("dialog_content")

            Button("Close")
                .id("close_button")
                .onClick({ e => this.controller?.closeDialog() })
        }
        .width(300)
        .height(200)
        .padding(20)
        .backgroundColor(0xFFFFFF)
    }
}

@Entry
@Component
class ViewCustomDialogTC145 {
    var dialogController: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: CustomDialogTC145()))

    func build(): Unit {
        Column() {
            Text("TC_145: @CustomDialog Component Definition")
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

