/**
 * Created on 2024/7/17
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}
internal import ohos.hilog.Hilog

@Entry
@Component
class ViewAlertDialog {
    @State
    var msg: String = "begin"
    @State
    var msg1: String = ""
    @State
    var msg2: String = ""
    @State
    var msg3: String = ""
    let shadow = ShadowOptions(radius: 20.0, color: Color.Green, offsetX: 50.0, offsetY: 0.0)
    let dialog1 = AlertDialogParamWithConfirm(message: "text")
    let dialog2 = AlertDialogParamWithButtons(message: "text",
        primaryButton: AlertDialogButtonOptions(value: "", action: {=>}),
        secondaryButton: AlertDialogButtonOptions(value: "", action: {=>}))

    func build() {
        Column(space: 5) {
            Button("one dialog shadowstyle")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button1"
                        let confirm1 = AlertDialogButtonOptions(
                            value: "button",
                            action: {
                                => Hilog.info(1, "1", "1", "Button-clicking callback")
                            }
                        )
                        let dialog1 = AlertDialogParamWithConfirm(
                            message: "text",
                            title: "title",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 3,
                            confirm: confirm1,
                            cornerRadius: BorderRadiuses(topLeft: 0.vp, topRight: 32.vp, bottomLeft: 0.vp,
                                bottomRight: 32.vp),
                            borderColor: BorderColor(color: Color.Red),
                            maskRect: Rectangle(x: 0, y: 15, width: 85.percent, height: 100.percent),
                            onWillDismiss: {
                                action =>
                                match (action.reason) {
                                    case PRESS_BACK => Hilog.info(1, "1", "1", "PRESS_BACK")
                                    case TOUCH_OUTSIDE => Hilog.info(1, "1", "1", "TOUCH_OUTSIDE")
                                    case CLOSE_BUTTON => Hilog.info(1, "1", "1", "CLOSE_BUTTON")
                                    case SLIDE_DOWN => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                    case _ => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                }
                                action.dismiss()
                            },
                            borderWidth: 3.vp,
                            height: 200.vp,
                            width: 200.vp,
                            borderStyle: EdgeStyles(),
                            textStyle: WordBreak.BreakAll,
                            transition: TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 1000))
                                .combine(TransitionEffect.translate(TranslateOptions(x: 100.vp)))
                        )
                        getUIContext().showAlertDialog(dialog1)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_1")

            Button("one dialog shadowoptions")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button2"
                        let confirm1 = AlertDialogButtonOptions(
                            value: "button",
                            action: {
                                => Hilog.info(1, "1", "1", "Button-clicking callback")
                            }
                        )
                        let dialog1 = AlertDialogParamWithConfirm(
                            message: "text",
                            title: "title",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 3,
                            confirm: confirm1,
                            cornerRadius: BorderRadiuses(topLeft: 0.vp, topRight: 32.vp, bottomLeft: 0.vp,
                                bottomRight: 32.vp),
                            borderColor: BorderColor(color: Color.Red),
                            maskRect: Rectangle(x: 0, y: 15, width: 85.percent, height: 100.percent),
                            onWillDismiss: {
                                action =>
                                match (action.reason) {
                                    case PRESS_BACK => Hilog.info(1, "1", "1", "PRESS_BACK")
                                    case TOUCH_OUTSIDE => Hilog.info(1, "1", "1", "TOUCH_OUTSIDE")
                                    case CLOSE_BUTTON => Hilog.info(1, "1", "1", "CLOSE_BUTTON")
                                    case SLIDE_DOWN => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                    case _ => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                }
                                action.dismiss()
                            },
                            borderWidth: 3.vp,
                            height: 200.vp,
                            width: 200.vp,
                            borderStyle: EdgeStyles(),
                            textStyle: WordBreak.BreakAll,
                            transition: TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 1000))
                                .combine(TransitionEffect.translate(TranslateOptions(x: 100.vp)))
                        )
                        getUIContext().showAlertDialog(dialog1)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_2")

            Button("one dialog")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button1"
                        let confirm1 = AlertDialogButtonOptions(
                            value: "button",
                            action: {
                                => Hilog.info(1, "1", "1", "Button-clicking callback")
                            }
                        )
                        let dialog1 = AlertDialogParamWithConfirm(
                            message: "text",
                            title: "title",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 3,
                            confirm: confirm1,
                            cornerRadius: BorderRadiuses(topLeft: 0.vp, topRight: 32.vp, bottomLeft: 0.vp,
                                bottomRight: 32.vp),
                            borderColor: BorderColor(color: Color.Red),
                            maskRect: Rectangle(x: 0, y: 15, width: 85.percent, height: 100.percent),
                            onWillDismiss: {
                                action =>
                                match (action.reason) {
                                    case PRESS_BACK => Hilog.info(1, "1", "1", "PRESS_BACK")
                                    case TOUCH_OUTSIDE => Hilog.info(1, "1", "1", "TOUCH_OUTSIDE")
                                    case CLOSE_BUTTON => Hilog.info(1, "1", "1", "CLOSE_BUTTON")
                                    case SLIDE_DOWN => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                    case _ => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                }
                                action.dismiss()
                            },
                            borderWidth: 3.vp,
                            height: 200.vp,
                            width: 200.vp,
                            borderStyle: EdgeStyles(),
                            textStyle: WordBreak.BreakAll,
                            transition: TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 1000))
                                .combine(TransitionEffect.translate(TranslateOptions(x: 100.vp)))
                        )
                        getUIContext().showAlertDialog(dialog1)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_3")

            Button("two dialog shadowoptions")
                .onClick(
                    {
                        e =>
                        this.msg2 = "button2"
                        let primaryButton = AlertDialogButtonOptions(
                            value: "cancel",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when the first button is clicked")
                            }
                        )
                        let secondaryButton = AlertDialogButtonOptions(
                            enabled: true,
                            defaultFocus: true,
                            style: DialogButtonStyle.Highlight,
                            value: "ok",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when the second button is clicked")
                            }
                        )
                        let dialog2 = AlertDialogParamWithButtons(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 4,
                            cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
                                bottomRight: 32.vp),
                            borderColor: BorderColor(color: Color.Red),
                            onWillDismiss: {
                                action =>
                                match (action.reason) {
                                    case PRESS_BACK => Hilog.info(1, "1", "1", "PRESS_BACK")
                                    case TOUCH_OUTSIDE => Hilog.info(1, "1", "1", "TOUCH_OUTSIDE")
                                    case CLOSE_BUTTON => Hilog.info(1, "1", "1", "CLOSE_BUTTON")
                                    case SLIDE_DOWN => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                    case _ => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                }
                                action.dismiss()
                            },
                            borderWidth: 3.vp,
                            borderStyle: EdgeStyles(),
                            textStyle: WordBreak.BreakAll,
                            transition: TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 1000))
                                .combine(TransitionEffect.translate(TranslateOptions(x: 100.vp))),
                            primaryButton: primaryButton,
                            secondaryButton: secondaryButton
                        )
                        getUIContext().showAlertDialog(dialog2)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_4")

            Button("two dialog shadowstyle")
                .onClick(
                    {
                        e =>
                        this.msg2 = "button2"
                        let primaryButton = AlertDialogButtonOptions(
                            value: "cancel",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when the first button is clicked")
                            }
                        )
                        let secondaryButton = AlertDialogButtonOptions(
                            enabled: true,
                            defaultFocus: true,
                            style: DialogButtonStyle.Highlight,
                            value: "ok",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when the second button is clicked")
                            }
                        )
                        let dialog2 = AlertDialogParamWithButtons(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 4,
                            cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
                                bottomRight: 32.vp),
                            borderColor: BorderColor(color: Color.Red),
                            onWillDismiss: {
                                action =>
                                match (action.reason) {
                                    case PRESS_BACK => Hilog.info(1, "1", "1", "PRESS_BACK")
                                    case TOUCH_OUTSIDE => Hilog.info(1, "1", "1", "TOUCH_OUTSIDE")
                                    case CLOSE_BUTTON => Hilog.info(1, "1", "1", "CLOSE_BUTTON")
                                    case SLIDE_DOWN => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                    case _ => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                }
                                action.dismiss()
                            },
                            borderWidth: 3.vp,
                            borderStyle: EdgeStyles(),
                            textStyle: WordBreak.BreakAll,
                            transition: TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 1000))
                                .combine(TransitionEffect.translate(TranslateOptions(x: 100.vp))),
                            primaryButton: primaryButton,
                            secondaryButton: secondaryButton
                        )
                        getUIContext().showAlertDialog(dialog2)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_5")

            Button("two dialog")
                .onClick(
                    {
                        e =>
                        this.msg2 = "button2"
                        let primaryButton = AlertDialogButtonOptions(
                            value: "cancel",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when the first button is clicked")
                            }
                        )
                        let secondaryButton = AlertDialogButtonOptions(
                            enabled: true,
                            defaultFocus: true,
                            style: DialogButtonStyle.Highlight,
                            value: "ok",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when the second button is clicked")
                            }
                        )
                        let dialog2 = AlertDialogParamWithButtons(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 4,
                            cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
                                bottomRight: 32.vp),
                            borderColor: BorderColor(color: Color.Red),
                            onWillDismiss: {
                                action =>
                                match (action.reason) {
                                    case PRESS_BACK => Hilog.info(1, "1", "1", "PRESS_BACK")
                                    case TOUCH_OUTSIDE => Hilog.info(1, "1", "1", "TOUCH_OUTSIDE")
                                    case CLOSE_BUTTON => Hilog.info(1, "1", "1", "CLOSE_BUTTON")
                                    case SLIDE_DOWN => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                    case _ => Hilog.info(1, "1", "1", "SLIDE_DOWN")
                                }
                                action.dismiss()
                            },
                            borderWidth: 3.vp,
                            borderStyle: EdgeStyles(),
                            textStyle: WordBreak.BreakAll,
                            transition: TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 1000))
                                .combine(TransitionEffect.translate(TranslateOptions(x: 100.vp))),
                            primaryButton: primaryButton,
                            secondaryButton: secondaryButton
                        )
                        getUIContext().showAlertDialog(dialog2)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_6")

            Button("three dialog")
                .onClick(
                    {
                        e =>
                        this.msg3 = "button3"
                        let button1 = AlertDialogButtonOptions(
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button1 is clicked")
                            },
                            fontColor: Color.Blue,
                            backgroundColor: Color.Red,
                            primary: true
                        )
                        let button2 = AlertDialogButtonOptions(
                            style: DialogButtonStyle.Default,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button2 is clicked")
                            },
                            fontColor: Color.Blue,
                            backgroundColor: Color.Red,
                            primary: false
                        )
                        let button3 = AlertDialogButtonOptions(
                            enabled: true,
                            defaultFocus: true,
                            style: DialogButtonStyle.Highlight,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button3 is clicked")
                            }
                        )
                        let dialog3 = AlertDialogParamWithOptions(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 4,
                            buttons: [button1, button2, button3],
                            buttonDirection: DialogButtonDirection.Horizontal
                        )
                        getUIContext().showAlertDialog(dialog3)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_7")

            Button("three dialog shadowoptions")
                .onClick(
                    {
                        e =>
                        this.msg3 = "button3"
                        let button1 = AlertDialogButtonOptions(
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button1 is clicked")
                            },
                            fontColor: Color.Blue,
                            backgroundColor: Color.Red,
                            primary: true
                        )
                        let button2 = AlertDialogButtonOptions(
                            style: DialogButtonStyle.Default,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button2 is clicked")
                            },
                            fontColor: Color.Blue,
                            backgroundColor: Color.Red,
                            primary: false
                        )
                        let button3 = AlertDialogButtonOptions(
                            enabled: true,
                            defaultFocus: true,
                            style: DialogButtonStyle.Highlight,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button3 is clicked")
                            }
                        )
                        let dialog3 = AlertDialogParamWithOptions(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 4,
                            buttons: [button1, button2, button3],
                            buttonDirection: DialogButtonDirection.Auto
                        )
                        getUIContext().showAlertDialog(dialog3)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_8")

            Button("three dialog shadowstyle")
                .onClick(
                    {
                        e =>
                        this.msg3 = "button3"
                        let button1 = AlertDialogButtonOptions(
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button1 is clicked")
                            },
                            fontColor: Color.Blue,
                            backgroundColor: Color.Red,
                            primary: true
                        )
                        let button2 = AlertDialogButtonOptions(
                            style: DialogButtonStyle.Default,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button2 is clicked")
                            },
                            fontColor: Color.Blue,
                            backgroundColor: Color.Red,
                            primary: false
                        )
                        let button3 = AlertDialogButtonOptions(
                            enabled: true,
                            defaultFocus: true,
                            style: DialogButtonStyle.Highlight,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button3 is clicked")
                            }
                        )
                        let dialog3 = AlertDialogParamWithOptions(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 4,
                            buttons: [button1, button2, button3],
                            buttonDirection: DialogButtonDirection.Horizontal
                        )
                        getUIContext().showAlertDialog(dialog3)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_9")

            Button("4 button dialog")
                .onClick(
                    {
                        e =>
                        this.msg3 = "button4"
                        let button1 = AlertDialogButtonOptions(
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button1 is clicked")
                            }
                        )
                        let button2 = AlertDialogButtonOptions(
                            style: DialogButtonStyle.Default,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button2 is clicked")
                            }
                        )
                        let button3 = AlertDialogButtonOptions(
                            enabled: true,
                            defaultFocus: true,
                            style: DialogButtonStyle.Highlight,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button3 is clicked")
                            }
                        )
                        let dialog4 = AlertDialogParamWithOptions(
                            message: "text",
                            title: "title",
                            subtitle: "subtitle",
                            autoCancel: true,
                            alignment: DialogAlignment.Bottom,
                            gridCount: 4,
                            buttons: [button1, button2, button3],
                            buttonDirection: DialogButtonDirection.Vertical
                        )
                        getUIContext().showAlertDialog(dialog4)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_10")

            Button("test None dialog")
                .onClick(
                    {
                        e =>
                        this.msg3 = "test None"
                        let button1 = AlertDialogButtonOptions(
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button1 is clicked")
                            }
                        )
                        let button2 = AlertDialogButtonOptions(
                            style: DialogButtonStyle.Default,
                            value: "按钮",
                            action: {
                                => Hilog.info(1, "1", "1", "Callback when button2 is clicked")
                            }
                        )
                        let dialog4 = AlertDialogParamWithOptions(
                            message: "text",
                            onWillDismiss: Option.None,
                            title: "",
                            subtitle: "subtitle",
                            autoCancel: false,
                            cancel: {=>},
                            alignment: DialogAlignment.Default,
                            offset: Offset(1, 1),
                            gridCount: 2,
                            maskRect: Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
                            showInSubWindow: false,
                            isModal: true,
                            backgroundColor: Color.Transparent,
                            backgroundBlurStyle: BlurStyle.ComponentUltraThick,
                            cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp,
                                bottomRight: 32.vp),
                            borderWidth: 0,
                            borderColor: BorderColor(color: Color.Black),
                            borderStyle: EdgeStyles(),
                            textStyle: WordBreak.BreakAll,
                            buttons: [button1, button2],
                            buttonDirection: DialogButtonDirection.Vertical
                        )
                        getUIContext().showAlertDialog(dialog4)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_11")

            Button("default_AlertDialogParam")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button12"
                        let dialog1 = AlertDialogParam(message: "text")
                        let dialog2 = AlertDialogParamWithConfirm(message: "text")
                        let dialog3 = AlertDialogParamWithButtons(message: "text",
                            primaryButton: AlertDialogButtonOptions(value: "", action: {=>}),
                            secondaryButton: AlertDialogButtonOptions(value: "", action: {=>}))
                        let dialog4 = AlertDialogParamWithOptions(message: "text", buttons: [])
                        // 覆盖 freeButtonsArr 中 size == 0 分支
                        getUIContext().showAlertDialog(dialog4)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_12")

            // 覆盖 AlertDialogButtonBaseOptions.toNative() 基类方法
            Button("AlertDialogButtonBaseOptions_toNative")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button13"
                        // 使用 AlertDialogButtonBaseOptions 基类（不是 AlertDialogButtonOptions 子类）
                        let baseConfirm = AlertDialogButtonBaseOptions(
                            value: "base_confirm",
                            fontColor: Color.Red,
                            backgroundColor: Color.Blue,
                            action: {=>}
                        )
                        let dialog = AlertDialogParamWithConfirm(
                            message: "test base toNative",
                            confirm: baseConfirm
                        )
                        getUIContext().showAlertDialog(dialog)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_13")

            // 覆盖 BorderColor color=None 分支 (第 163 行)
            Button("BorderColor_None")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button14"
                        let dialog = AlertDialogParamWithConfirm(
                            message: "test BorderColor None",
                            borderColor: BorderColor(color: Option<ResourceColor>.None)  // 显式传 None 覆盖 ?? 默认分支
                        )
                        getUIContext().showAlertDialog(dialog)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_14")

            // 覆盖 primaryButton/secondaryButton None 分支 (第 1075-1076 行)
            Button("AlertDialogParamWithButtons_None")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button15"
                        let dialog = AlertDialogParamWithButtons(
                            message: "test buttons None",
                            primaryButton: Option<AlertDialogButtonBaseOptions>.None,
                            secondaryButton: Option<AlertDialogButtonBaseOptions>.None
                        )
                        getUIContext().showAlertDialog(dialog)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_15")

            // 覆盖 buttons/buttonDirection None 分支 (第 1192-1193 行)
            Button("AlertDialogParamWithOptions_None")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button16"
                        let dialog = AlertDialogParamWithOptions(
                            message: "test options None",
                            buttons: Option<Array<AlertDialogButtonOptions>>.None,
                            buttonDirection: Option<DialogButtonDirection>.None
                        )
                        getUIContext().showAlertDialog(dialog)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_16")

            // 覆盖 AlertDialogButtonBaseOptions value/action None 分支 (第 320, 323 行)
            Button("AlertDialogButtonBaseOptions_ValueAction_None")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button17"
                        let baseConfirm = AlertDialogButtonBaseOptions(
                            value: Option<ResourceStr>.None,
                            action: Option<VoidCallback>.None
                        )
                        let dialog = AlertDialogParamWithConfirm(
                            message: "test value/action None",
                            confirm: baseConfirm
                        )
                        getUIContext().showAlertDialog(dialog)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_17")

            // 覆盖 shadow Some 分支 (第 782 行)
            Button("AlertDialogParam_Shadow_Some")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button18"
                        let dialog = AlertDialogParamWithConfirm(
                            message: "test shadow Some",
                            shadow: ShadowOptions(radius: 10.0, color: Color.Gray)
                        )
                        getUIContext().showAlertDialog(dialog)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_18")

            // 覆盖 AlertDialogButtonOptions value/action None 分支 (第 429, 432 行)
            Button("AlertDialogButtonOptions_ValueAction_None")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button19"
                        let button1 = AlertDialogButtonOptions(
                            value: Option<ResourceStr>.None,
                            action: Option<VoidCallback>.None
                        )
                        let dialog = AlertDialogParamWithOptions(
                            message: "test button value/action None",
                            buttons: [button1]
                        )
                        getUIContext().showAlertDialog(dialog)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_19")

            // 覆盖 confirm/primary/secondary 手动设为 None 的分支
            Button("AlertDialogParam_ManualNone")
                .onClick(
                    {
                        e =>
                        this.msg1 = "button20"
                        let dialogConfirm = AlertDialogParamWithConfirm(message: "manual none confirm")
                        dialogConfirm.confirm = Option<AlertDialogButtonBaseOptions>.None
                        getUIContext().showAlertDialog(dialogConfirm)

                        let dialogButtons = AlertDialogParamWithButtons(
                            message: "manual none buttons",
                            primaryButton: AlertDialogButtonOptions(value: "", action: {=>}),
                            secondaryButton: AlertDialogButtonOptions(value: "", action: {=>})
                        )
                        dialogButtons.primaryButton = Option<AlertDialogButtonBaseOptions>.None
                        dialogButtons.secondaryButton = Option<AlertDialogButtonBaseOptions>.None
                        getUIContext().showAlertDialog(dialogButtons)
                    }
                )
                .fontSize(12)
                .height(30)
                .id("button_20")

            Row {
                Text(this.msg).id("text")
                Text(this.msg1).id("text_1")
                Text(this.msg1).id("text_2")
            }
            Row {
                Text(this.msg1).id("text_3")
                Text(this.msg2).id("text_4")
                Text(this.msg2).id("text_5")
            }
            Row {
                Text(this.msg2).id("text_6")
                Text(this.msg3).id("text_7")
                Text(this.msg3).id("text_8")
            }
            Row {
                Text(this.msg3).id("text_9")
                Text(this.msg3).id("text_11")
            }
        }.width(@r(app.string.width_100p)).margin(5.percent).id("my_aDialog")
    }
}
