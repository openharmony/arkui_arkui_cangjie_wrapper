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
import ohos.router.*
import ohos.arkui.state_management.SubscriberManager
import ohos.arkui.state_management.ObservedProperty
import ohos.arkui.state_management.LocalStorage
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.{AppResource}

@Entry
@Component
class ViewFocus {
    @State
    var oneButtonColor: UInt32 = 0xFFC0CB
    @State
    var twoButtonColor: UInt32 = 0x87CEFA
    @State
    var threeButtonColor: UInt32 = 0x90EE90
    @State
    var fourButtonColor: UInt32 = 0x5DD55D
    @State
    var fiveButtonColor: UInt32 = 0x1E90FF
    @State
    var rowBoxColor: UInt32 = 0xFFFFFF
    @State
    var idList: Array<String> = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]

    func build() {
        Scroll() {
            // button 组件默认可获焦
            Column(space: 5) {
                Row() {
                    // 默认焦点，并且点击可获焦
                    Button("Hello Cangjie A")
                        .onClick {
                            evt => Hilog.info(1, "Cangjie-App", "Hello Cangjie A")
                        }
                        .backgroundColor(oneButtonColor)
                        .width(400.px)
                        .height(120.px)
                        .margin(5.px)
                        .fontColor(Color.Black)
                        .focusOnTouch(true)
                        .defaultFocus(true)
                        .onFocus({
                            => oneButtonColor = 0xFF0000
                        })
                        .onBlur({
                            => oneButtonColor = 0xFFC0CB
                        })
                        .tabIndex(1)
                        .id(this.idList[0])
                        .key(this.idList[0])
                    // 不支持点击获焦，但是默认可获焦
                    Button("Hello Cangjie B")
                        .onClick {
                            evt => Hilog.info(1, "Cangjie-App", "Hello Cangjie B")
                        }
                        .backgroundColor(twoButtonColor)
                        .width(400.px)
                        .height(120.px)
                        .fontColor(Color.Black)
                        .margin(5.px)
                        .focusOnTouch(false)
                        .onFocus({
                            => twoButtonColor = 0xFF0000
                        })
                        .onBlur({
                            => twoButtonColor = 0x87CEFA
                        })
                        .tabIndex(2)
                        .id(this.idList[1])
                        .key(this.idList[1])
                }
                Row() {
                    // 不支持获焦
                    Button("Hello Cangjie C")
                        .onClick {
                            evt => Hilog.info(1, "Cangjie-App", "Hello Cangjie C")
                        }
                        .backgroundColor(threeButtonColor)
                        .width(400.px)
                        .height(120.px)
                        .margin(5.px)
                        .fontColor(Color.Black)
                        .focusable(false)
                        .onFocus({
                            => threeButtonColor = 0xFF0000
                        })
                        .onBlur({
                            => threeButtonColor = 0x90EE90
                        })
                        .tabIndex(3)
                        .id(this.idList[2])
                        .key(this.idList[2])
                    // 可获焦，并且支持点击获焦
                    Button("Hello Cangjie D")
                        .onClick {
                            evt => Hilog.info(1, "Cangjie-App", "Hello Cangjie D")
                        }
                        .backgroundColor(fourButtonColor)
                        .width(400.px)
                        .height(120.px)
                        .margin(5.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .focusOnTouch(true)
                        .onFocus({
                            => fourButtonColor = 0xFF0000
                        })
                        .onBlur({
                            => fourButtonColor = 0x5DD55D
                        })
                        .tabIndex(4)
                        .id(this.idList[3])
                        .key(this.idList[3])
                }
                Row() {
                    // 父级组件获焦时的默认焦点
                    Button("Hello Cangjie E")
                        .onClick {
                            evt => Hilog.info(1, "Cangjie-App", "Hello Cangjie E")
                        }
                        .backgroundColor(fiveButtonColor)
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .onFocus({
                            => fiveButtonColor = 0xFF0000
                        })
                        .onBlur({
                            => fiveButtonColor = 0x1E90FF
                        })
                        .groupDefaultFocus(true)
                        .id(this.idList[4])
                        .key(this.idList[4])
                }
                    .tabIndex(4)
                    .focusable(true)
                    .borderWidth(1.5)
                    .borderColor(rowBoxColor)
                    .borderStyle(BorderStyle.Solid)
                    .onFocus({
                        => rowBoxColor = 0x000000
                    })
                    .onBlur({
                        => rowBoxColor = 0xFFFFFF
                    })

                Row() {
                    // 点击让D组件获焦
                    Button("RequestFocus-D")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .onClick { e =>
                            let selectId = this.idList[3]
                            let result = FocusControl.requestFocus(selectId)
                            if (result) {
                                Hilog.info(1, "Cangjie-App", "Request success")
                            } else {
                                Hilog.info(1, "Cangjie-App", "Request failed")
                            }
                        }
                }
                Row() {
                    Button("Hello Cangjie F")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .id(this.idList[5])
                        .key(this.idList[5])
                    Button("Hello Cangjie G")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .id(this.idList[6])
                        .key(this.idList[6])
                    Button("Hello Cangjie H")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .id(this.idList[7])
                        .key(this.idList[7])
                    Button("Hello Cangjie I")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .id(this.idList[8])
                        .key(this.idList[8])
                    Button("Hello Cangjie J")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .id(this.idList[9])
                        .key(this.idList[9])
                    Button("Hello Cangjie K")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .id(this.idList[10])
                        .key(this.idList[10])
                }
                Row() {
                    Button("Hello Cangjie L")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(false)
                        .focusOnTouch(true)
                        .id(this.idList[11])
                        .key(this.idList[11])
                        .onClick { e =>
                        }
                    Button("Hello Cangjie M2")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .focusOnTouch(true)
                        .id("M2")
                        .key("M2")
                }
                Row() {
                    Button("Hello Cangjie M")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .focusOnTouch(true)
                        .id(this.idList[12])
                        .key(this.idList[12])
                }
                Row() {
                    Button("Hello Cangjie N")
                        .width(400.px)
                        .height(120.px)
                        .margin(20.px)
                        .fontColor(Color.Black)
                        .focusable(true)
                        .focusOnTouch(true)
                        .id(this.idList[13])
                        .key(this.idList[13])
                }
                Row(space: 5) {
                    Column(space: 5) {
                        Column(space: 5) {
                            Button("Group1")
                                .width(165)
                                .height(40)
                                .fontColor(Color.White)
                                .id("b1")
                                .key("b1")
                                .focusOnTouch(true)
                            Row(space: 5) {
                                Button(){}.width(80).height(40).fontColor(Color.White).id("b2").key("b2")
                                Button(){}.width(80).height(40).fontColor(Color.White).id("b3").key("b3")
                            }
                            Row(space: 5) {
                                Button(){}.width(80).height(40).fontColor(Color.White).id("b4").key("b4")
                                Button(){}.width(80).height(40).fontColor(Color.White).id("b5").key("b5")
                            }
                        }.borderWidth(2).borderColor(Color.Red).borderStyle(BorderStyle.Dashed)
                        Column(space: 5) {
                            Button("Group2").width(165).height(40).fontColor(Color.White).id("b6").key("b6")
                            Row(space: 5) {
                                Button(){}.width(80).height(40).fontColor(Color.White).id("b7").key("b7")
                                Button("PRIOR")
                                    .width(80)
                                    .height(40)
                                    .fontColor(Color.White)
                                    .id("b8")
                                    .key("b8")
                            }
                            Row(space: 5) {
                                Button(){}.width(80).height(40).fontColor(Color.White).id("b9").key("b9")
                                Button(){}.width(80).height(40).fontColor(Color.White).id("b10").key("b10")
                            }
                        }.borderWidth(2).borderColor(Color.Green).borderStyle(BorderStyle.Dashed)
                    }
                    Column(space: 5) {
                        Button("Group3")
                            .width(165)
                            .height(40)
                            .fontColor(Color.White)
                            .id("b11")
                            .key("b11")
                            .focusOnTouch(true)
                        Row(space: 5) {
                            Button(){}.width(80).height(40).fontColor(Color.White).id("b12").key("b12")
                            Button(){}.width(80).height(40).fontColor(Color.White).id("b13").key("b13")
                        }
                        Button("PREVIOUS")
                            .width(165)
                            .height(40)
                            .fontColor(Color.White)
                            .id("b14")
                            .key("b14")
                        Row(space: 5) {
                            Button(){}.width(80).height(40).fontColor(Color.White).id("b15").key("b15")
                            Button(){}.width(80).height(40).fontColor(Color.White).id("b16").key("b16")
                        }
                        Button(){}.width(165).height(40).fontColor(Color.White).id("b17").key("b17")
                        Row(space: 5) {
                            Button(){}.width(80).height(40).fontColor(Color.White).id("b18").key("b18")
                            Button(){}.width(80).height(40).fontColor(Color.White).id("b19").key("b19")
                        }
                    }
                        .borderWidth(2)
                        .borderColor(Color.Gray)
                        .borderStyle(BorderStyle.Dashed)
                }
            }.width(100.percent).margin(top: 20)
        }
    }
}
