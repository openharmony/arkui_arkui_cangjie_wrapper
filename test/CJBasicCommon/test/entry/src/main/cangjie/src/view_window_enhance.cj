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
internal import ohos.arkui.component.text_input.TextInput
internal import ohos.arkui.component.view.CustomView
internal import ohos.arkui.component.common.CJEntry
internal import ohos.arkui.component.view.loadNativeView
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
import ohos.window.SystemBarType
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.hilog.Hilog
import ohos.base.{Callback0Argument, Callback1Argument}
import ohos.window.{Window, WindowStage, WindowCallbackType, WindowEventType, WindowStageEventType, Size, 
    WindowStatusType, TitleButtonRect, SystemBarProperties, Orientation, createWindow, findWindow, Configuration, 
    WindowType, getLastWindow, shiftAppWindowFocus, AvoidAreaType, WindowProperties, ColorSpace}
import kit.ArkUI.{WindowOrientation}
import kit.AbilityKit.*

@Entry
@Component
class View_Window_Enhance {
    let mainWindow: Window = Global.getMainWindow()
    // let mainId = mainWindow.getWindowProperties().id
    let mainId = 1
    let stageContext = getAbilityContext()

    @State
    var msg: String = ""

    func build() {
        Column() {
            Text(this.msg).id("message")
            Row() {
                Column() {
                    Button("setWinSysBarProp")
                        .id("setWindowSystemBarProperties")
                        .onClick {
                            e => let property: SystemBarProperties = SystemBarProperties(
                                statusBarColor: '#ff00ff',
                                statusBarContentColor: '#0000ff',
                                navigationBarColor: '#00ff00',
                                navigationBarContentColor: '#ff0000',
                                enableStatusBarAnimation: true,
                                enableNavigationBarAnimation: true
                            )
                            //                            mainWindow.setWindowSystemBarProperties(property)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("GetWindowLimits").id("GetWindowLimits").onClick {
                        e =>
                    }.width(20.percent).height(20)
                }
            }

            Row() {
                Column() {
                    Button("setSpecificSystemBarEnabled")
                        .id("setSpecificSystemBarEnabled")
                        .onClick {
                            e =>
                        }
                        .width(20.percent)
                        .height(20)
                }
            }

            Row() {
                Column() {
                    Button("showWindow")
                        .id("showWindow")
                        .onClick {
                            e => mainWindow.showWindow()
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("moveWindowTo")
                        .id("moveWindowTo")
                        .onClick {
                            e => mainWindow.moveWindowTo(0, 0)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("setWindowLayoutFullScreen")
                        .id("setWindowLayoutFullScreen")
                        .onClick {
                            e => mainWindow.setWindowLayoutFullScreen(true)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("isWindowSupportWideGamut")
                        .id("isWindowSupportWideGamut")
                        .onClick {
                            e => let state = mainWindow.isWindowSupportWideGamut()
                        }
                        .width(20.percent)
                        .height(20)
                }
            }

            Row() {
                Column() {
                    Button("isWindowShowing")
                        .id("isWindowShowing")
                        .onClick {
                            e => let state = mainWindow.isWindowShowing()
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("setWindowBackgroundColor")
                        .id("setWindowBackgroundColor")
                        .onClick {
                            e =>
                            mainWindow.setWindowBackgroundColor('#00ff33')
                            mainWindow.setWindowBackgroundColor('#ffffff')
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("setWindowBrightness")
                        .id("setWindowBrightness")
                        .onClick {
                            e => mainWindow.setWindowBrightness(0.5)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("setWindowFocusable")
                        .id("setWindowFocusable")
                        .onClick {
                            e => let state = mainWindow.setWindowFocusable(true)
                        }
                        .width(20.percent)
                        .height(20)
                }
            }

            Row() {
                Column() {
                    Button("setWindowKeepScreenOn")
                        .id("setWindowKeepScreenOn")
                        .onClick {
                            e => mainWindow.setWindowKeepScreenOn(true)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("setWindowTouchable")
                        .id("setWindowTouchable")
                        .onClick {
                            e => let state = mainWindow.setWindowTouchable(true)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("getWindowAvoidArea")
                        .id("getWindowAvoidArea")
                        .onClick {
                            e =>
                            let avoidarea = mainWindow.getWindowAvoidArea(AvoidAreaType.TypeCutout)
                            mainWindow.getWindowAvoidArea(AvoidAreaType.TypeSystemGesture)
                            mainWindow.getWindowAvoidArea(AvoidAreaType.TypeKeyboard)
                            mainWindow.getWindowAvoidArea(AvoidAreaType.TypeNavigationIndicator)
                            this.msg = "${avoidarea.visible}" +
                                "${avoidarea.leftRect.top},${avoidarea.topRect.top},${avoidarea.rightRect.top},${avoidarea.bottomRect.top}"
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("getWindowProperties")
                        .id("getWindowProperties")
                        .onClick {
                            e => this.msg = mainWindow.getWindowProperties().windowRect.width.toString()
                        }
                        .width(20.percent)
                        .height(20)
                }
            }

            Row() {
                Column() {
                    Button("setAspectRatio")
                        .id("setAspectRatio")
                        .onClick {
                            e => mainWindow.setAspectRatio(0.5)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("resetAspectRatio")
                        .id("resetAspectRatio")
                        .onClick {
                            e => mainWindow.resetAspectRatio()
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("setWindowColorSpace")
                        .id("setWindowColorSpace")
                        .onClick {
                            e =>
                            mainWindow.setWindowColorSpace(ColorSpace.Default)
                            mainWindow.setWindowColorSpace(ColorSpace.WideGamut)
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("test checkRet")
                        .id("test checkRet")
                        .onClick {
                            e => try {
                                var windowName = findWindow("abc")
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-App", "test checkRet " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }
            }

            Row() {
                Column() {
                    Button("getWindowColorSpace")
                        .id("getWindowColorSpace")
                        .onClick {
                            e => let ColorSpace = mainWindow.getWindowColorSpace()
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("snapshot").id("snapshot").onClick {
                        e => mainWindow.snapshot()
                    }.width(20.percent).height(20)
                }
                Column() {
                    Button("setWindowSystemBarEnable")
                        .id("setWindowSystemBarEnable")
                        .onClick {
                            e => mainWindow.setWindowSystemBarEnable([SystemBarType.Status])
                        }
                        .width(20.percent)
                        .height(20)
                }
                Column() {
                    Button("CFwindow")
                        .id("CFwindow")
                        .onClick {
                            e => try {
                                var config1 = Configuration(name: "TestSubWindow1", windowType: WindowType.TypeApp,
                                    ctx: stageContext, displayId: 1, parentId: Int64(mainId))
                                var config2 = Configuration(name: "TestSubWindow2", windowType: WindowType.TypeApp,
                                    ctx: stageContext, displayId: 2, parentId: Int64(mainId))
                                var TestSubWindow1 = createWindow(config1)
                                var TestSubWindow2 = createWindow(config2)
                                TestSubWindow1.resize(500, 500)
                                shiftAppWindowFocus(1, 2)
                                TestSubWindow1.minimize()
                                TestSubWindow1.destroyWindow()
                                TestSubWindow2.destroyWindow()
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_CFwindow " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }
            }

            Row() {
                Column() {
                    Button("setWindowPrivacyMode")
                        .id("setWindowPrivacyMode")
                        .onClick {
                            e => try {
                                mainWindow.setWindowPrivacyMode(true)
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_setWindowPrivacyMode " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }

                Column() {
                    Button("setPreferredOrientation")
                        .id("setPreferredOrientation")
                        .onClick {
                            e => try {
                                let testClass = getLastWindow(stageContext)
                                testClass.setPreferredOrientation(WindowOrientation.Unspecified)
                                testClass.setPreferredOrientation(WindowOrientation.Portrait)
                                testClass.setPreferredOrientation(WindowOrientation.Landscape)
                                testClass.setPreferredOrientation(WindowOrientation.PortraitInverted)
                                testClass.setPreferredOrientation(WindowOrientation.LandscapeInverted)
                                testClass.setPreferredOrientation(WindowOrientation.AutoRotationPortrait)
                                testClass.setPreferredOrientation(WindowOrientation.AutoRotationLandscape)
                                testClass.setPreferredOrientation(WindowOrientation.AutoRotationRestricted)
                                testClass.setPreferredOrientation(WindowOrientation.AutoRotationPortraitRestricted)
                                testClass.setPreferredOrientation(WindowOrientation.AutoRotationLandscapeRestricted)
                                testClass.setPreferredOrientation(WindowOrientation.Locked)
                                testClass.setPreferredOrientation(WindowOrientation.AutoRotation)
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_windowSettingOrientation " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }

                Column() {
                    Button("shiftAppWindowFocus")
                        .id("shiftAppWindowFocus")
                        .onClick {
                            e => try {
                                shiftAppWindowFocus(0, 0)
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_shiftAppWindowFocus " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }
            }
            Row() {
                Column() {
                    Button("structtest")
                        .id("structtest")
                        .onClick {
                            e =>
                            let size = Size(width: 100, height: 200)
                            this.msg = "${size.width},${size.height}"

                            let testavoidarea = mainWindow.getWindowAvoidArea(AvoidAreaType.TypeSystem)
                            this.msg = "${testavoidarea.visible}" +
                                "${testavoidarea.leftRect.top},${testavoidarea.topRect.top},${testavoidarea.rightRect.top},${testavoidarea.bottomRect.top}"

                            let titlebutrect = TitleButtonRect(right: 200, top: 200, width: 200, height: 200)
                            this.msg = "${titlebutrect.right},${titlebutrect.top},${titlebutrect.width},${titlebutrect.height}"
                        }
                        .width(20.percent)
                        .height(20)
                }

                Column() {
                    Button("WindowType")
                        .id("WindowTypeEnum")
                        .onClick {
                            e => try {
                                var config1 = Configuration(name: "TestSubWindow1", windowType: WindowType.TypeDialog,
                                    ctx: stageContext, displayId: 1, parentId: Int64(mainId))
                                var config2 = Configuration(name: "TestSubWindow2", windowType: WindowType.TypeFloat,
                                    ctx: stageContext, displayId: 2, parentId: Int64(mainId))
                                var TestSubWindow1 = createWindow(config1)
                                var TestSubWindow2 = createWindow(config2)
                                TestSubWindow1.resize(500, 500)
                                shiftAppWindowFocus(1, 2)
                                TestSubWindow1.minimize()
                                TestSubWindow1.destroyWindow()
                                TestSubWindow2.destroyWindow()
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_CFwindow " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }

                Column() {
                    Button("WindowEventType")
                        .id("WindowEventTypeEnum")
                        .onClick {
                            e => try {
                                var WET1: WindowEventType = WindowEventType.WindowShown
                                var WET2: WindowEventType = WindowEventType.WindowActive
                                var WET3: WindowEventType = WindowEventType.WindowInactive
                                var WET4: WindowEventType = WindowEventType.WindowHidden
                                var WET5: WindowEventType = WindowEventType.WindowDestroyed
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_WindowEventTypeEnum " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }

                Column() {
                    Button("WindowStageEventType")
                        .id("WindowStageEventTypeEnum")
                        .onClick {
                            e => try {
                                var WSET1: WindowStageEventType = WindowStageEventType.Shown
                                var WSET2: WindowStageEventType = WindowStageEventType.Active
                                var WSET3: WindowStageEventType = WindowStageEventType.Inactive
                                var WSET4: WindowStageEventType = WindowStageEventType.Hidden
                                var WSET5: WindowStageEventType = WindowStageEventType.Resumed
                                var WSET6: WindowStageEventType = WindowStageEventType.Paused
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_WindowStageEventTypeEnum " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }
            }
            Row() {
                Column() {
                    Button("WindowStatusType")
                        .id("WindowStatusTypeEnum")
                        .onClick {
                            e => try {
                                var WST1: WindowStatusType = WindowStatusType.Undefined
                                var WST2: WindowStatusType = WindowStatusType.Maximize
                                var WST3: WindowStatusType = WindowStatusType.Minimize
                                var WST4: WindowStatusType = WindowStatusType.Floating
                                var WST5: WindowStatusType = WindowStatusType.SplitScreen
                                var WST6: WindowStatusType = WindowStatusType.FullScreen
                            } catch (e: Exception) {
                                Hilog.info(1, "1", "Cangjie-Test", "case_WindowStatusTypeEnum " + e.toString())
                            }
                        }
                        .width(20.percent)
                        .height(20)
                }
            }
        }
    }
}
