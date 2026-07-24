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

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.common.{Offset as CovOffset}

func makeActionSheetOffsetNone(): ActionSheetOffset {
    let offset = ActionSheetOffset(dx: 10.vp, dy: 20.vp)
    offset.dx = Option<Length>.None
    offset.dy = Option<Length>.None
    return offset
}

func makeShadowOptionsNone(): ShadowOptions {
    let shadow = ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, color: Color.Black)
    shadow.radius = Option<Float64>.None
    shadow.shadowType = Option<ShadowType>.None
    shadow.color = Option<ResourceColor>.None
    shadow.offsetX = Option<Float64>.None
    shadow.offsetY = Option<Float64>.None
    shadow.fill = Option<Bool>.None
    return shadow
}

func makeActionSheetOptionsNone(): ActionSheetOptions {
    let opts = ActionSheetOptions(
        title: "t", message: "m",
        sheets: [SheetInfo(title: "s", action: { => })],
        confirm: ActionSheetButtonOptions(value: "OK", action: { => }),
        autoCancel: true,
        offset: ActionSheetOffset(dx: 0.vp, dy: 0.vp),
        maskRect: Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        onWillDismiss: { action: DismissDialogAction => action.dismiss() },
        cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp),
        borderWidth: 2.vp,
        borderColor: Color.Black
    )
    opts.title = Option<ResourceStr>.None
    opts.message = Option<ResourceStr>.None
    opts.sheets = Option<Array<SheetInfo>>.None
    opts.subtitle = Option<ResourceStr>.None
    opts.confirm = Option<ActionSheetButtonOptions>.None
    opts.autoCancel = Option<Bool>.None
    opts.cancel = Option<() -> Unit>.None
    opts.alignment = Option<DialogAlignment>.None
    opts.offset = Option<ActionSheetOffset>.None
    opts.maskRect = Option<Rectangle>.None
    opts.showInSubWindow = Option<Bool>.None
    opts.isModal = Option<Bool>.None
    opts.backgroundColor = Option<ResourceColor>.None
    opts.backgroundBlurStyle = Option<BlurStyle>.None
    opts.cornerRadius = Option<BorderRadiuses>.None
    opts.borderWidth = Option<Length>.None
    opts.borderColor = Option<ResourceColor>.None
    opts.borderStyle = Option<EdgeStyles>.None
    opts.shadow = Option<ShadowOptions>.None
    opts.onWillDismiss = Option<Callback<DismissDialogAction, Unit>>.None
    return opts
}

func makeActionSheetOptionsWithNoneSheetInfo(): ActionSheetOptions {
    let info = SheetInfo(title: "s", action: { => })
    info.title = Option<ResourceStr>.None
    info.action = Option<() -> Unit>.None
    let btn = ActionSheetButtonOptions(value: "OK", action: { => })
    btn.value = Option<ResourceStr>.None
    btn.action = Option<() -> Unit>.None
    btn.enabled = Option<Bool>.None
    btn.defaultFocus = Option<Bool>.None
    btn.style = Option<DialogButtonStyle>.None
    return ActionSheetOptions(title: "t", message: "m", sheets: [info], confirm: btn)
}

func makeAlertDialogParamWithConfirmNone(): AlertDialogParamWithConfirm {
    let param = AlertDialogParamWithConfirm(
        message: Option<ResourceStr>.None,
        confirm: AlertDialogButtonOptions(value: "OK", action: { => }),
        title: "t",
        subtitle: "s",
        autoCancel: true,
        cancel: { => },
        alignment: DialogAlignment.Default,
        offset: CovOffset(0, 0),
        gridCount: UInt32(4),
        maskRect: Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow: false,
        isModal: true,
        backgroundColor: Color.Transparent,
        backgroundBlurStyle: BlurStyle.ComponentUltraThick,
        cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp),
        borderWidth: 0.vp,
        borderColor: BorderColor(color: Color.Black),
        borderStyle: EdgeStyles(),
        shadow: ShadowOptions(radius: -1.0),
        textStyle: WordBreak.BreakAll
    )
    param.title = Option<ResourceStr>.None
    param.message = Option<ResourceStr>.None
    param.subtitle = Option<ResourceStr>.None
    param.autoCancel = Option<Bool>.None
    param.cancel = Option<() -> Unit>.None
    param.alignment = Option<DialogAlignment>.None
    param.offset = Option<CovOffset>.None
    param.gridCount = Option<UInt32>.None
    param.maskRect = Option<Rectangle>.None
    param.showInSubWindow = Option<Bool>.None
    param.isModal = Option<Bool>.None
    param.backgroundColor = Option<ResourceColor>.None
    param.backgroundBlurStyle = Option<BlurStyle>.None
    param.cornerRadius = Option<BorderRadiuses>.None
    param.borderWidth = Option<Length>.None
    param.borderColor = Option<BorderColor>.None
    param.borderStyle = Option<EdgeStyles>.None
    param.shadow = Option<ShadowOptions>.None
    param.textStyle = Option<WordBreak>.None
    return param
}

func makeAlertDialogParamWithButtonsNone(): AlertDialogParamWithButtons {
    let btn = AlertDialogButtonOptions(value: "OK", action: { => })
    btn.value = Option<ResourceStr>.None
    btn.action = Option<() -> Unit>.None
    btn.enabled = Option<Bool>.None
    btn.defaultFocus = Option<Bool>.None
    btn.style = Option<DialogButtonStyle>.None
    btn.primary = Option<Bool>.None
    btn.fontColor = Option<ResourceColor>.None
    btn.backgroundColor = Option<ResourceColor>.None
    let param = AlertDialogParamWithButtons(
        message: Option<ResourceStr>.None,
        title: "t",
        subtitle: "s",
        autoCancel: true,
        cancel: { => },
        alignment: DialogAlignment.Default,
        offset: CovOffset(0, 0),
        gridCount: UInt32(4),
        maskRect: Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow: false,
        isModal: true,
        backgroundColor: Color.Transparent,
        backgroundBlurStyle: BlurStyle.ComponentUltraThick,
        cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp),
        borderWidth: 0.vp,
        borderColor: BorderColor(color: Color.Black),
        borderStyle: EdgeStyles(),
        shadow: ShadowOptions(radius: -1.0),
        textStyle: WordBreak.BreakAll,
        primaryButton: btn,
        secondaryButton: btn
    )
    param.message = Option<ResourceStr>.None
    param.shadow = Option<ShadowOptions>.None
    return param
}

func makeAlertDialogParamWithOptionsNone(): AlertDialogParamWithOptions {
    let param = AlertDialogParamWithOptions(
        message: Option<ResourceStr>.None,
        title: "t",
        subtitle: "s",
        autoCancel: true,
        cancel: { => },
        alignment: DialogAlignment.Default,
        offset: CovOffset(0, 0),
        gridCount: UInt32(4),
        maskRect: Rectangle(x: 0, y: 0, width: 100.percent, height: 100.percent),
        showInSubWindow: false,
        isModal: true,
        backgroundColor: Color.Transparent,
        backgroundBlurStyle: BlurStyle.ComponentUltraThick,
        cornerRadius: BorderRadiuses(topLeft: 32.vp, topRight: 32.vp, bottomLeft: 32.vp, bottomRight: 32.vp),
        borderWidth: 0.vp,
        borderColor: BorderColor(color: Color.Black),
        borderStyle: EdgeStyles(),
        shadow: ShadowOptions(radius: -1.0),
        textStyle: WordBreak.BreakAll,
        buttonDirection: DialogButtonDirection.Auto,
        buttons: [AlertDialogButtonOptions(value: "P", action: { => })]
    )
    param.message = Option<ResourceStr>.None
    param.shadow = Option<ShadowOptions>.None
    param.buttons = Option<Array<AlertDialogButtonOptions>>.None
    param.buttonDirection = Option<DialogButtonDirection>.None
    return param
}

func makeAnimateParamNone(): AnimateParam {
    let ap = AnimateParam(duration: 500, curve: Curve.EaseIn)
    ap.tempo = Option<Float32>.None
    ap.iterations = Option<Int32>.None
    ap.playMode = Option<PlayMode>.None
    ap.finishCallbackType = Option<FinishCallbackType>.None
    return ap
}

func makeActionSheetOptionsAllNoneInit(): ActionSheetOptions {
    ActionSheetOptions(
        title: Option<ResourceStr>.None,
        message: Option<ResourceStr>.None,
        sheets: Option<Array<SheetInfo>>.None
    )
}

@Entry
@Component
class ViewCovActionSheetDefault {

    func build() {
        Column {
            Button("trigger action sheet 1")
                .onClick({ _ =>
                    try {
                        getUIContext().showActionSheet(ActionSheetOptions(
                            title: "cov", message: "m",
                            sheets: [SheetInfo(title: "s", action: { => })],
                            offset: makeActionSheetOffsetNone()))
                    } catch (e: Exception) {}
                })
                .id("covShowActionSheet1")

            Button("trigger action sheet 2")
                .onClick({ _ =>
                    try {
                        getUIContext().showActionSheet(ActionSheetOptions(
                            title: "cov", message: "m",
                            sheets: [SheetInfo(title: "s", action: { => })],
                            shadow: makeShadowOptionsNone()))
                    } catch (e: Exception) {}
                })
                .id("covShowActionSheet2")

            Button("trigger action sheet 3")
                .onClick({ _ =>
                    try {
                        getUIContext().showActionSheet(makeActionSheetOptionsNone())
                    } catch (e: Exception) {}
                })
                .id("covShowActionSheet3")

            Button("trigger action sheet 4")
                .onClick({ _ =>
                    try {
                        getUIContext().showActionSheet(makeActionSheetOptionsWithNoneSheetInfo())
                    } catch (e: Exception) {}
                })
                .id("covShowActionSheet4")

            Button("trigger action sheet all none init")
                .onClick({ _ =>
                    try {
                        getUIContext().showActionSheet(makeActionSheetOptionsAllNoneInit())
                    } catch (e: Exception) {}
                })
                .id("covShowActionSheet5")

            Button("trigger alert dialog 1")
                .onClick({ _ =>
                    try {
                        getUIContext().showAlertDialog(AlertDialogParamWithConfirm(
                            message: "m", shadow: makeShadowOptionsNone()))
                    } catch (e: Exception) {}
                })
                .id("covShowAlertDialog1")

            Button("trigger alert dialog 2")
                .onClick({ _ =>
                    try {
                        getUIContext().showAlertDialog(makeAlertDialogParamWithConfirmNone())
                    } catch (e: Exception) {}
                })
                .id("covShowAlertDialog2")

            Button("trigger alert dialog 3")
                .onClick({ _ =>
                    try {
                        getUIContext().showAlertDialog(makeAlertDialogParamWithButtonsNone())
                    } catch (e: Exception) {}
                })
                .id("covShowAlertDialog3")

            Button("trigger alert dialog 4")
                .onClick({ _ =>
                    try {
                        getUIContext().showAlertDialog(makeAlertDialogParamWithOptionsNone())
                    } catch (e: Exception) {}
                })
                .id("covShowAlertDialog4")

            Button("trigger animateTo default")
                .onClick({ _ =>
                    try {
                        getUIContext().animateTo(makeAnimateParamNone(), { => })
                    } catch (e: Exception) {}
                })
                .id("covAnimateTo")
        }
    }
}
