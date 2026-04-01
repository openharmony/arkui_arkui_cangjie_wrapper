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

/**
 * Created on 2024/7/17
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

@CustomDialog
class DialogShadow {
    var controller: Option<CustomDialogController> = Option.None
    func build() {
        Row(space: 60) {
            Button("cancel").onClick(
                {
                    evt =>
                    controller?.closeDialog()
                }
            ).id("cancel_button")

            Button("confirm").onClick(
                {
                    evt =>
                    controller?.closeDialog()
                }
            ).id("confirm_button")
        }.height(500.px)
    }
}

@Entry
@Component
class ViewCustomDialog {
    @State
    var message: String = "begin"
    var dialogController1: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog(message: message), autoCancel: true))
    var dialogController2: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog(message: message), gridCount: 1, backgroundColor: Color.Blue,
            openAnimation: AnimateParam(), closeAnimation: AnimateParam()))
    var dialogController: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(builder: MyDialog(message: message)))

    // CustomDialogControllerOptions.shadow：与 openCustomDialog 同 9 组场景（10, -10, 0, 1, -1, Max, Min, 省略 shadow, radius Option.None）
    var customDialogShadowRadius10Controller: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: 10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
    var customDialogShadowRadiusNeg10Controller: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: -10.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
    var customDialogShadowRadius0Controller: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: 0.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
    var customDialogShadowRadius1Controller: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: 1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
    var customDialogShadowRadiusNeg1Controller: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: -1.0, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
    var customDialogShadowRadiusFloat64MaxController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: Float64.Max, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
    var customDialogShadowRadiusFloat64MinController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: Float64.Min, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))
    var customDialogShadowOmittedController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent))
    var customDialogShadowRadiusOptionNoneController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(
        builder: DialogShadow(),
        width: 70.percent,
        height: 30.percent,
        shadow: ShadowOptions(radius: Option<Float64>.None, color: Color.Red, offsetX: 50.0, offsetY: 20.0)))

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

            Button("CustomDialog shadow radius 10").onClick(
                {
                    evt =>
                    customDialogShadowRadius10Controller.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadius10")
            Button("CustomDialog shadow radius -10").onClick(
                {
                    evt =>
                    customDialogShadowRadiusNeg10Controller.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadiusNeg10")
            Button("CustomDialog shadow radius 0").onClick(
                {
                    evt =>
                    customDialogShadowRadius0Controller.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadius0")
            Button("CustomDialog shadow radius 1").onClick(
                {
                    evt =>
                    customDialogShadowRadius1Controller.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadius1")
            Button("CustomDialog shadow radius -1").onClick(
                {
                    evt =>
                    customDialogShadowRadiusNeg1Controller.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadiusNeg1")
            Button("CustomDialog shadow radius Float64.Max").onClick(
                {
                    evt =>
                    customDialogShadowRadiusFloat64MaxController.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadiusFloat64Max")
            Button("CustomDialog shadow radius Float64.Min").onClick(
                {
                    evt =>
                    customDialogShadowRadiusFloat64MinController.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadiusFloat64Min")
            Button("CustomDialog shadow omitted").onClick(
                {
                    evt =>
                    customDialogShadowOmittedController.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowOmitted")
            Button("CustomDialog shadow radius Option.None").onClick(
                {
                    evt =>
                    customDialogShadowRadiusOptionNoneController.openDialog()
                }
            ).fontSize(12).height(30).id("customDialogShadowRadiusOptionNone")
        }.id("my_dialog")
    }
}
