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
 * Created on 2024/11/19
 */
package ohos_app_cangjie_entry

internal import ohos.arkui.component.*
internal import ohos.base.*
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r

@Entry
@Component
class View_ActionSheet {
    var sheets: Array<SheetInfo> = [SheetInfo(title: "apple", action: {=> Hilog.info(1, "1", "1", "apple sheet")},
        icon: @r(app.media.app_icon)), SheetInfo(title: "banana", action: {=> Hilog.info(1, "1", "1", "banana sheet")})]
    var confirm: ActionSheetButtonOptions = ActionSheetButtonOptions(value: "Confirm button",
        action: {=> Hilog.info(1, "1", "1", "Confirm")}, defaultFocus: true, style: DialogButtonStyle.Default)
    var defaultConfirm: ActionSheetButtonOptions = ActionSheetButtonOptions(value: "default Confirm",
        action: {=> Hilog.info(1, "1", "1", "Default Confirm")})

    func build() {
        Row {
            Column() {
                Button("DefaultActionSheet")
                    .onClick({
                        evt => ActionSheet.show(createDefaultSheetOptions())
                    })
                    .id("action_sheet_button1")
                Button("DefaultActionSheet with highlight confirmButton")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.confirm = defaultConfirm
                            ActionSheet.show(options)
                            ActionSheet.show(options, ShadowStyle.OuterDefaultXS)
                            ActionSheet.show(options, ShadowStyle.OuterDefaultSM)
                        }
                    )
                    .id("action_sheet_button2")
                Button("DefaultActionSheet with default confirmButton")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.confirm = confirm
                            ActionSheet.show(options)
                            ActionSheet.show(options, ShadowStyle.OuterDefaultMD)
                            ActionSheet.show(options, ShadowStyle.OuterDefaultLG)
                        }
                    )
                    .id("action_sheet_button3")
                Button("DefaultActionSheet with subtitle")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.subtitle = "subtitle"
                            ActionSheet.show(options)
                            ActionSheet.show(options, ShadowStyle.OuterDefaultSM)
                            ActionSheet.show(options, ShadowStyle.OuterDefaultMD)
                        }
                    )
                    .id("action_sheet_button4")
                Button("DefaultActionSheet without autoCancel")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.autoCancel = false
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button5")
                Button("DefaultActionSheet with cancel callback")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.cancel = {=> Hilog.info(1, "1", "1", "cancel")}
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button6")
                Button("DefaultActionSheet with alignment Top")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.alignment = DialogAlignment.Top
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button7")
                Button("DefaultActionSheet with alignment TopStart")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.alignment = DialogAlignment.TopStart
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button8")
                Button("DefaultActionSheet with alignment BottomEnd")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.alignment = DialogAlignment.BottomEnd
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button9")
                Button("DefaultActionSheet with offset")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.offset = ActionSheetOffset(dx: -50, dy: -50)
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button10")
                Button("DefaultActionSheet with maskRect")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.maskRect = Rectangle(x: (0), y: (0), width: (400), height: (400))
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button11")
                Button("DefaultActionSheet with showInSubWindow")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.showInSubWindow = true
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button12")
                Button("DefaultActionSheet without modal")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.isModal = false
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button13")
                Button("DefaultActionSheet with GREEN background")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.backgroundBlurStyle = BlurStyle.None
                            options.backgroundColor = Color.Green
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button14")
                Button("DefaultActionSheet with COMPONENT_THIN blurStyle")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.backgroundBlurStyle = BlurStyle.ComponentThin
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button15")
                Button("DefaultActionSheet with onWillDismiss callback")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.onWillDismiss = {
                                action =>
                                match (action.reason) {
                                    case PRESS_BACK => Hilog.info(1, "1", "1", "PRESS_BACK")
                                    case TOUCH_OUTSIDE => Hilog.info(1, "1", "1", "TOUCH_OUTSIDE")
                                    case CLOSE_BUTTON => Hilog.info(1, "1", "1", "CLOSE_BUTTON")
                                    case SLIDE_DOWN => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                    case _ => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                }
                                action.dismiss()
                            }
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button16")
                Button("DefaultActionSheet with dialog size and border props")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.cornerRadius = BorderRadiuses(topLeft: 10.vp, topRight: 20.vp, bottomLeft: 30.vp,
                                bottomRight: 40.vp)
                            options.borderWidth = 10.vp
                            options.borderColor = Color.Green
                            options.borderStyle = EdgeStyles(top: BorderStyle.Solid, right: BorderStyle.Solid,
                                bottom: BorderStyle.Dotted, left: BorderStyle.Dashed)
                            options.width = (300)
                            options.height = (300)
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button17")
                Button("DefaultActionSheet with transition")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.transition = TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 500, curve: Curve.Ease))
                            ActionSheet.show(options)
                        }
                    )
                    .id("action_sheet_button18")
                Button("DefaultActionSheet with shadow")
                    .onClick(
                        {
                            evt =>
                            let options = createDefaultSheetOptions1();
                            let shadow = ShadowOptions(radius: 20.0, color: Color.Green, offsetX: 50.0, offsetY: 0.0)
                            ActionSheet.show(options, shadow)
                        }
                    )
                    .id("action_sheet_button19")
            }.width(100.percent)
        }.height(100.percent)
    }

    func createDefaultSheetOptions(): ActionSheetOptions {
        return ActionSheetOptions(title: "ActionSheet title", message: "message", sheets: sheets)
    }

    func createDefaultSheetOptions1(): ActionSheetOptions {
        return ActionSheetOptions(title: "ActionSheet title", message: "message", sheets: sheets,
            alignment: DialogAlignment.Bottom, isModal: true, backgroundColor: Color.Transparent,
            backgroundBlurStyle: BlurStyle.ComponentUltraThick)
    }
}
