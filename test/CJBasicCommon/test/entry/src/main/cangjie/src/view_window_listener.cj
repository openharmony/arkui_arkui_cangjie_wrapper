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

internal import ohos.base.LengthProp
internal import ohos.arkui.component.column.Column
internal import ohos.arkui.component.row.Row
internal import ohos.arkui.component.button.Button
internal import ohos.arkui.component.text.Text
internal import ohos.arkui.component.view.CustomView
import ohos.callback_invoke.{ Callback0Argument, Callback1Argument }
internal import ohos.arkui.component.view.loadNativeView
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage

import ohos.hilog.*

import std.sync.{Monitor, AtomicBool}
import ohos.window.{Window, WindowStage, WindowCallbackType, WindowEventType, WindowStageEventType,
    Size, WindowStatusType, TitleButtonRect, SystemBarProperties}
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r

var callbackMsg: String = "trigger:"

class OnWindowStageEventCallback <: Callback1Argument<WindowStageEventType> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: WindowStageEventType) {
        callbackMsg += "\nWindowStageEvent;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnWindowTitleButtonRectChangeCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, rect: UInt32) {
        callbackMsg += "\nWindowTitleButtonRectChange;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnSubWindowCloseCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: UInt32) {
        callbackMsg += "\nSubWindowClose;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnWindowStatusChangeCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, status: UInt32) {
        callbackMsg += "\nWindowStatusChange;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnWindowEventCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: UInt32) {
        callbackMsg += "\nWindowEvent;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnWindowVisibilityChangeCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, visible: UInt32) {
        callbackMsg += "\nWindowVisibilityChange;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnKeyboardHeightChangeCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, height: UInt32) {
        callbackMsg += "\nKeyboardHeightChange;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnWindowSizeChangeCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, size: UInt32) {
        callbackMsg += "\nWindowSizeChange;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnTouchOutsideCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: UInt32) {
        callbackMsg += "\touchOutside"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnDialogTargetTouchCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: UInt32) {
        callbackMsg += "\ndialogTargetTouch"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnScreenCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, height: UInt32) {
        callbackMsg += "\nscreenshot"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnNoInteractionDetectedCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: UInt32) {
        callbackMsg += "\nNoInteractionDetected"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

class OnKeyboardHeight0ChangeCallback <: Callback1Argument<UInt32> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: UInt32) {
        callbackMsg += "\nKeyboardHeigh0tChange;"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1, "Cangjie-App", callbackMsg)
    }
}

@Entry
@Component
class ViewWindowListener {
    @State
    var message: String = "Hello Cangjie"
    let mainWindow: Window = Global.getMainWindow()
    var subWindow: Option<Window> = Option<Window>.None
    let onScreenshotCb = OnScreenCallback()
    let onWindowTitleButtonRectChangeCb = OnWindowTitleButtonRectChangeCallback()
    let onSubWindowCloseCb = OnSubWindowCloseCallback()
    let onWindowStatusChangeCb = OnWindowStatusChangeCallback()
    let onWindowEventCb = OnWindowEventCallback()
    let onWindowVisibilityChangeCb = OnWindowVisibilityChangeCallback()
    let onKeyboardHeightChangeCb = OnKeyboardHeightChangeCallback()
    let onKeyboardHeightChangeCb1 = OnKeyboardHeightChangeCallback()
    let onKeyboardHeightChangeCb0 = OnKeyboardHeight0ChangeCallback()
    let onWindowSizeChangeCb = OnWindowSizeChangeCallback()
    let onTouchOutsideCb = OnTouchOutsideCallback()
    let onDialogTargetTouchCb = OnDialogTargetTouchCallback()
    let onNoInteractionDetectedCb = OnNoInteractionDetectedCallback()
    let onWindowStageEventCb = OnWindowStageEventCallback()
    let onWindowStageEventCb1 = OnWindowStageEventCallback()
    func build() {
        Column() {
            Text(callbackMsg)
            Row() {
                Column() {
                    Button("onScreenShot")
                        .id("onScreenShot")
                        .onClick({ e
                            => Global
                                .getMainWindow()
                                .on(
                                    WindowCallbackType.Screenshot,
                                    onScreenshotCb
                                )
                        })
                        .width(40.percent).height(30)
                }
                Column() {
                    Button("offScreenShot")
                        .id("offScreenShot")
                        .onClick({ e
                            => Global
                                .getMainWindow()
                                .off(
                                    WindowCallbackType.Screenshot,
                                    onScreenshotCb
                                )
                        })
                        .width(40.percent).height(30)
                }
                Column() {
                    Button("off")
                        .id("offAllScrrenShot")
                        .onClick({ e
                            => Global
                                .getMainWindow()
                                .off(WindowCallbackType.Screenshot)
                        })
                        .width(40.percent).height(30)
                }
            }

            Row() {
                Column() {
                    Button("onKeyboardHeight")
                        .id("onKeyboardHeight")
                        .onClick(
                            { e
                                => Global
                                    .getMainWindow()
                                    .on(
                                        WindowCallbackType.KeyboardHeightChange,
                                        onKeyboardHeightChangeCb
                                    )
                            })
                        .width(40.percent).height(30)
                }
                Column() {
                    Button("offKeyboardHeight")
                        .id("offKeyboardHeight")
                        .onClick(
                            { e
                                => Global
                                    .getMainWindow()
                                    .off(
                                        WindowCallbackType.KeyboardHeightChange,
                                        onKeyboardHeightChangeCb
                                    )
                            })
                        .width(40.percent).height(30)
                }
            }
            Row(){
                 Column() {
                    Button("onKeyboardHeight0")
                        .id("onKeyboardHeight0")
                        .onClick(
                            { e
                            =>
                            try {
                                    Global
                                    .getMainWindow()
                                    .on(
                                        WindowCallbackType.KeyboardHeightChange,
                                        onKeyboardHeightChangeCb0
                                    )
                                }catch (e: Exception) {
                                    Hilog.info(1, "Cangjie-Test", "case_onKeyboardHeight0 " + e.toString())
                                }
                            })
                        .width(40.percent).height(30)
                }
                 Column() {
                    Button("onKeyboardHeight0_error")
                        .id("onKeyboardHeight0_error")
                        .onClick(
                            { e
                            =>
                            try {
                                    Global
                                    .getMainWindow()
                                    .on(
                                        WindowCallbackType.WindowAvoidAreaChange,
                                        onKeyboardHeightChangeCb0
                                    )
                                }catch (e: Exception) {
                                    Hilog.info(1, "Cangjie-Test", "case_onKeyboardHeight0_error " + e.toString())
                                }
                            })
                        .width(40.percent).height(30)
                }
            }
            TextInput().id("keyboardHeightTextInput")
            Button("CreateSubWindow")
                .id("CreateSubWindow")
                .onClick { e
                    =>
                    let sub = Global
                        .getWindowStage()
                        .createSubWindow("testSubWindow")
                }
                .width(40.percent).height(30)

            Row() {
                Column() {
                    Button("OldOnKeyboardHei")
                        .id("OldOnKeyboardHei")
                        .onClick({ e
                            => Global
                                .getMainWindow()
                                .on(
                                    WindowCallbackType.KeyboardHeightChange,
                                    onKeyboardHeightChangeCb
                                )
                        })
                        .width(40.percent).height(30)
                }
                Column() {
                    Button("OldOffKeyboardHei")
                        .id("OldOffKeyboardHei")
                        .onClick({ e
                            => Global
                                .getMainWindow()
                                .off(WindowCallbackType.KeyboardHeightChange
                                )
                        })
                        .width(40.percent).height(30)
                }
            }
        }
    }
}
