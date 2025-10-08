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

@Entry
@Component
class ViewBindSheet {
        var SheetSize1: SheetSize = SheetSize.Medium
    var SheetSize2: SheetSize = SheetSize.Large
    var SheetSize3: SheetSize = SheetSize.FitContent
    var SheetType1: SheetType = SheetType.Bottom
    var SheetType3: SheetType = SheetType.Center
    var SheetType4: SheetType = SheetType.Popup

    @State
    var isShow: Bool = false
    @State
    var message: String = "123123"
    @State
    var text: String = "123123"

    public func onAppear() {
        Hilog.info(1, "Cangjie-Test", "BindSheet onAppear.")
        this.message = "BindSheet onAppear."
    }
    public func onDisappear() {
        Hilog.info(1, "Cangjie-Test", "BindSheet onDisappear.")
        this.message = "BindSheet onDisappear."
    }

    @Builder
    public func myBuilder() {
        Column() {
            Button("close modal 1")
                .margin(10)
                .fontSize(20)
                .onClick({ e
                    => this.isShow = false
                })
                .id("button2")
            Text(this.message).id("text1")
        }
            .width(100.percent)
            .height(100.percent)
            .justifyContent(FlexAlign.Center)
    }

    @Builder
    public func myBuilder1() {
        Column() {
            Text(text).id("text3")
            Button("close modal 2")
                .margin(10)
                .fontSize(20)
                .onClick({ e
                    => this.isShow = false
                })
                .id("button3")
            Column()
                .backgroundColor(Color.Blue)
                .height(300)
                .width(100.percent)
            Column()
                .backgroundColor(Color.Green)
                .height(300)
                .width(100.percent)
        }
    }

    func build() {
        Column {
            Button("transition modal 1")
                .onClick({ e
                    => this.isShow = true
                })
                .fontSize(20)
                .margin(10)
                .bindSheet(this.isShow, myBuilder, options: SheetOptions(onAppear: onAppear, onDisappear: onDisappear))
                .id("bindSheet")
            Text(this.message).id("text2")

            Button("transition")
                .bindSheet(this.isShow, myBuilder,
                    options: SheetOptions(onAppear: onAppear, onDisappear: onDisappear, height: SheetSize.Medium,
                        detents: [SheetSize.Medium, SheetSize.Large], preferType: SheetType.Bottom, showClose: true,
                        dragBar: false, blurStyle: BlurStyle.ComponentUltraThin, maskColor: Color.Red, title: {=>},
                        enableOutsideInteractive: false, shouldDismiss: {dismiss =>}))
                .bindSheet(this.isShow, myBuilder,
                    options: SheetOptions(borderWidth: Option.None, borderColor: Option.None, borderStyle: Option.None,
                        mode: Option.None, scrollSizeMode: Option.None))
                .bindSheet(this.isShow, myBuilder,
                    options: SheetOptions(borderColor: Option.None,
                        mode: Option.None, scrollSizeMode: Option.None))
                .bindSheet(this.isShow, myBuilder,
                    options: SheetOptions(onAppear: onAppear, onDisappear: onDisappear, height: SheetSize.Large,
                        preferType: SheetType.Center))
                .bindSheet(this.isShow, myBuilder,
                    options: SheetOptions(onAppear: onAppear, onDisappear: onDisappear, height: SheetSize.FitContent,
                        preferType: SheetType.Popup, shouldDismiss: { sheet => }, onWillDismiss: { dismiss => }, mode: SheetMode.Embedded)).id("bindSheet4")

            Button("transition modal 2")
                .onClick({ e
                    => this.isShow = true
                })
                .fontSize(20)
                .margin(10)
                .bindSheet(
                    this.isShow,
                    myBuilder,
                    options: SheetOptions(
                        detents: [SheetSize.Medium, SheetSize.Large],
                        backgroundColor: Color.Gray,
                        blurStyle: BlurStyle.Regular,
                        height: SheetSize.Large,
                        showClose: true,
                        title: {=>},
                        borderWidth: 10.vp,
                        borderColor: Color.Red,
                        borderStyle: EdgeStyles(),
                        preferType: SheetType.Center,
                        onHeightDidChange: {
                            height =>
                            this.text = "onHeightDidChange"
                            Hilog.info(1, "Cangjie-Test", "###ondidchange height change")
                        },
                        onDetentsDidChange: {
                            dents => Hilog.info(1, "Cangjie-Test", "###ondidchange Detents change")
                        },
                        onWidthDidChange: {
                            width => Hilog.info(1, "Cangjie-Test", "###ondidchange width change")
                        },
                        onTypeDidChange: {
                            typee => Hilog.info(1, "Cangjie-Test", "###ondidchange type change")
                        },
                        width: 400.vp,
                        shadow: ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: Color.Red),
                        maskColor: Color.Red,
                        enableOutsideInteractive: false,
                        onWillDismiss: {
                            action => match (action.reason) {
                                case PRESS_BACK => Hilog.info(1, "Cangjie-Test", "onWillDismiss: PRESS_BACK")
                                case TOUCH_OUTSIDE => action.dismiss()
                                case CLOSE_BUTTON => Hilog.info(1, "Cangjie-Test", "onWillDismiss: CLOSE_BUTTON")
                                case SLIDE_DOWN => Hilog.info(1, "Cangjie-Test", "onWillDismiss: SLIDE_DOWN")
                                case _ => Hilog.info(1, "Cangjie-Test", "onWillDismiss: _")
                            }
                        },
                        onWillSpringBackWhenDismiss: {springback =>}
                    )
                )
                .id("bindsheet2")

            Button("colorHeightChange")
                .onClick({ e
                    => this.isShow = true
                })
                .bindSheet(
                    this.isShow,
                    myBuilder1,
                    options: SheetOptions(
                        detents: [SheetSize.Medium, SheetSize.Large, SheetSize.FitContent],
                        mode: SheetMode.Overlay,
                        scrollSizeMode: ScrollSizeMode.Continuous,
                        backgroundColor: Color.Red
                    )
                )
                .id("bindsheet3")
        }
            .justifyContent(FlexAlign.Center)
            .backgroundColor(Color.White)
            .width(100.percent)
            .height(100.percent)
    }
}
