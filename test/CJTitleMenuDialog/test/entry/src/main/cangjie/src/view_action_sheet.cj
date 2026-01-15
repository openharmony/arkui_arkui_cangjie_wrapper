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
class ViewActionSheet {
    var sheets: Array<SheetInfo> = [SheetInfo(title: "apple", action: {=> Hilog.info(1, "1", "1", "apple sheet")},
        icon: @r(app.media.app_icon)), SheetInfo(title: "banana", action: {=> Hilog.info(1, "1", "1", "banana sheet")})]
    // 覆盖 SheetInfo 的 None 分支
    var sheetsWithNone: Array<SheetInfo> = [SheetInfo(title: Option<ResourceStr>.None, action: Option<VoidCallback>.None, icon: Option<ResourceStr>.None)]
    var confirm: ActionSheetButtonOptions = ActionSheetButtonOptions(value: "Confirm button",
        action: {=> Hilog.info(1, "1", "1", "Confirm")}, defaultFocus: true, style: DialogButtonStyle.Default)
    var defaultConfirm: ActionSheetButtonOptions = ActionSheetButtonOptions(value: "default ActionSheetButtonOptions",
        action: {=> Hilog.info(1, "1", "1", "Default ActionSheetButtonOptions")})
    // 覆盖 ActionSheetButtonOptions 的 None 分支
    var confirmWithNone: ActionSheetButtonOptions = ActionSheetButtonOptions(value: Option<ResourceStr>.None, action: Option<VoidCallback>.None)
    // 覆盖 ActionSheetButtonOptions 的 enabled 显式传值分支
    var confirmWithEnabled: ActionSheetButtonOptions = ActionSheetButtonOptions(value: "Enabled button",
        action: {=> Hilog.info(1, "1", "1", "Enabled")}, enabled: true, defaultFocus: false, style: DialogButtonStyle.Highlight)
    func build() {
        Scroll() {
            Column() {
                Button("DefaultActionSheet with empty sheets")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.sheets = []
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .fontSize(12)
                    .height(15)
                    .id("action_sheet_button_empty")
                Button("DefaultActionSheet")
                    .onClick({
                        evt => getUIContext().showActionSheet(createDefaultSheetOptions())
                    })
                    .id("action_sheet_button1")
                            .fontSize(12)
                            .height(15)
                Button("DefaultActionSheet with highlight confirmButton")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.confirm = defaultConfirm
                            getUIContext().showActionSheet(options)
                            getUIContext().showActionSheet(options)
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button2")
                Button("DefaultActionSheet with default confirmButton")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.confirm = confirm
                            getUIContext().showActionSheet(options)
                            getUIContext().showActionSheet(options)
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button3")
                Button("DefaultActionSheet with subtitle")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.subtitle = "subtitle"
                            getUIContext().showActionSheet(options)
//                            getUIContext().showActionSheet(options, ShadowStyle.OuterDefaultSM)
//                            getUIContext().showActionSheet(options, ShadowStyle.OuterDefaultMD)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button4")
                Button("DefaultActionSheet without autoCancel")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.autoCancel = false
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button5")
                Button("DefaultActionSheet with cancel callback")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.cancel = {=> Hilog.info(1, "1", "1", "cancel")}
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button6")
                Button("DefaultActionSheet with alignment Top")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.alignment = DialogAlignment.Top
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button7")
                Button("DefaultActionSheet with alignment TopStart")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.alignment = DialogAlignment.TopStart
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button8")
                Button("DefaultActionSheet with alignment BottomEnd")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.alignment = DialogAlignment.BottomEnd
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button9")
                Button("DefaultActionSheet with offset")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.offset = ActionSheetOffset(dx: -50, dy: -50)
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button10")
                Button("DefaultActionSheet with maskRect")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.maskRect = Rectangle(x: (0), y: (0), width: (400), height: (400))
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button11")
                Button("DefaultActionSheet with showInSubWindow")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.showInSubWindow = true
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button12")
                Button("DefaultActionSheet without modal")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.isModal = false
                            getUIContext().showActionSheet(options)
                        }
                    )
                            .fontSize(12)
                            .height(15)
                    .id("action_sheet_button13")
                Button("DefaultActionSheet with GREEN background")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.backgroundBlurStyle = BlurStyle.None
                            options.backgroundColor = Color.Green
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .id("action_sheet_button14")
                Button("DefaultActionSheet with COMPONENT_THIN blurStyle")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions();
                            options.backgroundBlurStyle = BlurStyle.ComponentThin
                            getUIContext().showActionSheet(options)
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
                            getUIContext().showActionSheet(options)
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
                            getUIContext().showActionSheet(options)
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
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .id("action_sheet_button18")
                Button("DefaultActionSheet with shadow")
                    .onClick(
                        {
                            evt =>
                            let options = createDefaultSheetOptions1();
                            let shadow = ShadowOptions(radius: 20.0, color: Color.Green, offsetX: 50.0, offsetY: 0.0)
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .id("action_sheet_button19")
                // 覆盖 SheetInfo None 分支
                Button("ActionSheet with SheetInfo None values")
                    .onClick(
                        {
                            evt =>
                            var options = ActionSheetOptions(title: "Test", message: "Test", sheets: sheetsWithNone)
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .fontSize(12)
                    .height(15)
                    .id("action_sheet_button_sheetinfo_none")
                // 覆盖 ActionSheetOptions title/message/sheets None 分支
                Button("ActionSheet with None title/message/sheets")
                    .onClick(
                        {
                            evt =>
                            var options = ActionSheetOptions(title: Option<ResourceStr>.None, message: Option<ResourceStr>.None, sheets: Option<Array<SheetInfo>>.None)
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .fontSize(12)
                    .height(15)
                    .id("action_sheet_button_options_none")
                // 覆盖 ActionSheetButtonOptions None 分支
                Button("ActionSheet with confirm None values")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.confirm = confirmWithNone
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .fontSize(12)
                    .height(15)
                    .id("action_sheet_button_confirm_none")
                // 覆盖 ActionSheetButtonOptions enabled 显式传值分支
                Button("ActionSheet with confirm enabled explicit")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.confirm = confirmWithEnabled
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .fontSize(12)
                    .height(15)
                    .id("action_sheet_button_confirm_enabled")
                // 覆盖 ActionSheetOffset None 分支 (dx/dy 不传)
                Button("ActionSheet with offset None values")
                    .onClick(
                        {
                            evt =>
                            var options = createDefaultSheetOptions()
                            options.offset = ActionSheetOffset(dx: Option<Length>.None, dy: Option<Length>.None)
                            getUIContext().showActionSheet(options)
                        }
                    )
                    .fontSize(12)
                    .height(15)
                    .id("action_sheet_button_offset_none")
            }.width(100.percent)
        }.height(100.percent)
    }

    func createDefaultSheetOptions(): ActionSheetOptions {
        return ActionSheetOptions(title: "ActionSheet title", message: "message", sheets: sheets)
    }

    func createDefaultSheetOptions1(): ActionSheetOptions {
        createDefaultSheetOptions2()
        return ActionSheetOptions(title: "ActionSheet title", message: "message", sheets: sheets,
            alignment: DialogAlignment.Bottom, isModal: true, backgroundColor: Color.Transparent,
            backgroundBlurStyle: BlurStyle.ComponentUltraThick)
    }

    func createDefaultSheetOptions2(): Unit {
        let top = ActionSheetOptions(title: "ActionSheet title", message: "message", sheets: sheets, alignment: DialogAlignment.Top)
        let topStart = ActionSheetOptions(title: "ActionSheet title", message: "message", sheets: sheets, alignment: DialogAlignment.TopStart)
        let topEnd = ActionSheetOptions(title: "ActionSheet title", message: "message", sheets: sheets, alignment: DialogAlignment.TopEnd)
    }
}
