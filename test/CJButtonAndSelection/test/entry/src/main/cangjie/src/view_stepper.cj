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

extend ItemState {
    func value(): UInt32 {
        match (this) {
            case Normal => 0
            case Disabled => 1
            case Waiting => 2
            case _ => 3
        }
    }

    func toString(): String {
        match (this) {
            case Normal => "Normal"
            case Disabled => "Disabled"
            case Waiting => "Waiting"
            case _ => "Skip"
        }
    }
}

@Entry
@Component
class ViewStepper {
    //响应式状态变量
    @State
    var currentIndex: UInt32 = 0
    //每一步都会有一个状态变量控制
    @State
    var firstState: ItemState = ItemState.Normal
    @State
    var secondState: ItemState = ItemState.Normal
    @State
    var thirdState: ItemState = ItemState.Normal
    @State
    var forthState: ItemState = ItemState.Normal
    @State
    var fifthState: ItemState = ItemState.Normal
    func build() {
        Column {
            Stepper(index: currentIndex) {
                // 第一个步骤页
                StepperItem() {
                    Column() {
                        Text("Page One").fontSize(35).fontColor(0x182431).id("firstText")
                        Button("change status: ${this.firstState.value()}")
                            .backgroundColor(0x007dFF)
                            .onClick(
                                { e =>
                                    //每一次点击按钮会在Normal和Skip状态之间切换
                                    if (this.firstState.toString() == "Skip") {
                                        this.firstState = ItemState.Normal
                                    } else {
                                        this.firstState = ItemState.Skip
                                    }
                                })
                            .id("firstButton")
                    }
                }
                    //StepperItem属性绑定
                    .nextLabel("下一页").status(status: this.firstState).id("firstStepperItem")
                // 第二个步骤页
                StepperItem() {
                    Column() {
                        Text("Page Two").fontSize(35).fontColor(0x182431).id("secondText")
                        //第二步骤的状态是secondState
                        Button("change status: ${this.secondState.value()}")
                            .backgroundColor(0x007dFF)
                            .onClick(
                                {
                                    evt => if (this.secondState.toString() == "Disabled") {
                                        this.secondState = ItemState.Normal
                                    } else {
                                        this.secondState = ItemState.Disabled
                                    }
                                })
                            .id("secondButton")
                    }
                }.nextLabel("下一页").prevLabel("上一页").status(status: this.secondState).id("secondStepperItem")

                // 第三个步骤页
                StepperItem() {
                    Column() {
                        Text("Page Three").fontSize(35).fontColor(0x182431).id("thirdText")
                        Button("change status: ${this.thirdState.value()}")
                            .backgroundColor(0x007dFF)
                            .onClick(
                                {
                                    evt => if (this.thirdState.toString() == "Waiting") {
                                        this.thirdState = ItemState.Normal
                                    } else {
                                        this.thirdState = ItemState.Waiting
                                    }
                                })
                            .id("thirdButton")
                    }
                }.nextLabel("下一页").prevLabel("上一页").status(status: this.thirdState).id("thirdStepperItem")

                // 第四个步骤页
                StepperItem() {
                    Column() {
                        Text("Page Four").fontSize(35).fontColor(0x182431).id("forthText")
                        Button("change status: ${this.forthState.value()}")
                            .backgroundColor(0x007dFF)
                            .onClick(
                                {
                                    evt => if (this.forthState.toString() == "Waiting") {
                                        this.forthState = ItemState.Normal
                                    } else {
                                        this.forthState = ItemState.Waiting //这里应该是什么状态，去搜一下可以有什么其他状态
                                    }
                                })
                            .id("forthButton")
                    }
                }.nextLabel("下一页").prevLabel("上一页").status(status: this.forthState).id("forthStepperItem")

                // 第五个步骤页
                StepperItem() {
                    Column() {
                        Text("Page Five").fontSize(35).fontColor(0x182431).id("fifthText")
                        Button("change status: ${this.fifthState.value()}")
                            .backgroundColor(0x007dFF)
                            .onClick(
                                {
                                    evt => if (this.fifthState.toString() == "Waiting") {
                                        this.fifthState = ItemState.Normal
                                    } else {
                                        this.fifthState = ItemState.Waiting //这里应该是什么状态，去搜一下可以有什么其他状态
                                    }
                                })
                            .id("fifthButton")
                    }
                }.nextLabel("下一页").prevLabel("上一页").status(status: this.fifthState).id("fifthStepperItem")

                // 第六个步骤页
                StepperItem() {
                    Column() {
                        //步骤六只显示text 没有按钮
                        Text("Page Six").fontSize(35).fontColor(0x182431).id("sixthText")
                    }
                }.id("sixthStepperItem")
            }
                //最后一步完成后回到第一页
                .backgroundColor(0xF1F3F5)
                .onFinish({
                    => currentIndex = 0
                })
                //跳过两步
                .onSkip({
                    => currentIndex = currentIndex + 1
                })
                //控制当前页索引
                .onChange({
                    prevIndex: UInt32, index: UInt32 => if (index != 0) {
                        currentIndex = index
                    }
                })
                .onNext({
                    prevIndex: UInt32, index: UInt32 => if (index != 0) {
                        currentIndex = index
                    }
                })
                .onPrevious({
                    prevIndex: UInt32, index: UInt32 => if (index != 0) {
                        currentIndex = index
                    }
                })
            Stepper() {
                StepperItem() {
                    Column() {
                        Text("Page A").fontSize(35).fontColor(0x182431).id("AText")
                    }
                }.id("AStepperItem")
                .prevLabel(Option.None)
                .nextLabel(Option.None)
            }
            .onChange(Option<(UInt32, UInt32) -> Unit>.None)
            .onNext(Option<(UInt32, UInt32) -> Unit>.None)
            .onPrevious(Option<(UInt32, UInt32) -> Unit>.None)
        }.width(100.percent).padding(top: 5)
    }
}