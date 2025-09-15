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
 * Created on 2024/7/16
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.animator.*

@Entry
@Component
class ViewAnimator {
    var depCallbackAnimator: ?AnimatorResult = None
    var backAnimator: ?AnimatorResult = None
    var flag = false
    @State
    var wid = 100.0
    @State
    var hei = 100.0
    @State
    var message1: String = ""
    @State
    var message2: String = ""
    @State
    var message3: String = ""
    @State
    var message4: String = ""
    @State
    var message5: String = ""
    @State
    var message6: String = ""
    @State
    var message7: String = ""
    @State
    var message8: String = ""
    func build() {
        Scroll() {
            Column {
                Column()
                    .width(this.wid)
                    .height(this.wid)
                    .backgroundColor(Color.Red)
                Text(this.message1)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("for_onframe")
                Text(this.message2)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("for_oncancel")
                Text(this.message3)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("for_onrepeat")
                Text(this.message4)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("for_onfinish")
                Text(this.message5)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("forFrame")
                Text(this.message6)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("forCancel")
                Text(this.message7)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("forRepeat")
                Text(this.message8)
                    .fontSize(10)
                    .fontColor(Color.Green)
                    .id("forFinish")
                Flex(wrap: FlexWrap.Wrap) {
                Button("depCbCreate")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.depCallbackAnimator = getUIContext().createAnimator(
                            AnimatorOptions(
                                duration: 3000,
                                easing: "ease",
                                delay: 0,
                                fill: AnimatorFill.Forwards,
                                direction: AnimatorDirection.AlternateReverse,
                                iterations: 1,
                                begin: -100.0,
                                end: 200.0
                            )
                        )

                        this.depCallbackAnimator?.onFrame = {
                            value: Float64 =>
                            this.message1 = "frame ${value}"
                            this.wid = value
                            this.hei = value
                        }
                         this.depCallbackAnimator?.onCancel = {=> this.message2 = "cancel"}
                         this.depCallbackAnimator?.onRepeat = {=> this.message3 = "repeat"}
                         this.depCallbackAnimator?.onFinish = {
                            =>
                            this.message4 = "finish"
                            this.flag = true
                        }
                        var onFrame = this.depCallbackAnimator?.onFrame
                        var oncancel =  this.depCallbackAnimator?.onCancel
                        var onrepeat =  this.depCallbackAnimator?.onRepeat
                        var onfinish = this.depCallbackAnimator?.onFinish
                    }
                    .id("depCreateButton").fontSize(12).width(47.percent).height(30)

                Button("depCbfinish")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = true
                        this.depCallbackAnimator?.finish()
                    }
                    .id("depCbFinishButton").fontSize(12).width(47.percent).height(30)

                Button("temp1")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.depCallbackAnimator = getUIContext().createAnimator(
                            AnimatorOptions(
                                duration: 3000,
                                easing: "ease",
                                delay: 0,
                                fill: AnimatorFill.None,
                                direction: AnimatorDirection.Normal,
                                iterations: 1,
                                begin: -100.0,
                                end: 200.0
                            )
                        )

                        this.depCallbackAnimator?.onFrame = {
                            value: Float64 =>
                            this.message1 = "frame ${value}"
                            this.wid = value
                            this.hei = value
                        }
                         this.depCallbackAnimator?.onCancel = {=> this.message2 = "cancel"}
                         this.depCallbackAnimator?.onRepeat = {=> this.message3 = "repeat"}
                         this.depCallbackAnimator?.onFinish = {
                            =>
                            this.message4 = "finish"
                            this.flag = true
                        }
                        var onFrame = this.depCallbackAnimator?.onFrame
                        var oncancel =  this.depCallbackAnimator?.onCancel
                        var onrepeat =  this.depCallbackAnimator?.onRepeat
                        var onfinish = this.depCallbackAnimator?.onFinish
                    }
                    .id("temp1Button").fontSize(12).width(47.percent).height(30)

                Button("temp2")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.depCallbackAnimator = getUIContext().createAnimator(
                            AnimatorOptions(
                                duration: 3000,
                                easing: "ease",
                                delay: 0,
                                fill: AnimatorFill.Backwards,
                                direction: AnimatorDirection.Alternate,
                                iterations: 1,
                                begin: -100.0,
                                end: 200.0
                            )
                        )

                        this.depCallbackAnimator?.onFrame = {
                            value: Float64 =>
                            this.message1 = "frame ${value}"
                            this.wid = value
                            this.hei = value
                        }
                         this.depCallbackAnimator?.onCancel = {=> this.message2 = "cancel"}
                         this.depCallbackAnimator?.onRepeat = {=> this.message3 = "repeat"}
                         this.depCallbackAnimator?.onFinish = {
                            =>
                            this.message4 = "finish"
                            this.flag = true
                        }
                        var onFrame = this.depCallbackAnimator?.onFrame
                        var oncancel =  this.depCallbackAnimator?.onCancel
                        var onrepeat =  this.depCallbackAnimator?.onRepeat
                        var onfinish = this.depCallbackAnimator?.onFinish
                    }
                    .id("temp2Button").fontSize(12).width(47.percent).height(30)

                Button("Create")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.backAnimator = getUIContext().createAnimator(
                            AnimatorOptions(
                                duration: 3000,
                                easing: "ease",
                                delay: 0,
                                fill: AnimatorFill.Forwards,
                                direction: AnimatorDirection.AlternateReverse,
                                iterations: 1,
                                begin: -100.0,
                                end: 200.0
                            )
                        )

                        this.backAnimator?.onFrame = {
                            value: Float64 =>
                            this.message5 = "Frame ${value}"
                            this.wid = value
                            this.hei = value
                        }
                        this.backAnimator?.onCancel = {=> this.message6 = "Cancel"}
                        this.backAnimator?.onRepeat = {=> this.message7 = "Repeat"}
                        this.backAnimator?.onFinish = {
                            =>
                            this.message8 = "Finish"
                            this.flag = true
                        }

                        var onFrame = this.backAnimator?.onFrame
                        var onCancel = this.backAnimator?.onCancel
                        var onRepeat = this.backAnimator?.onRepeat
                        var onFinish = this.backAnimator?.onFinish
                    }
                    .id("CreateButton").fontSize(12).width(47.percent).height(30)
                Button("Play")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this.backAnimator?.play()
                    }
                    .id("PlayButton").fontSize(12).width(47.percent).height(30)
                Button("Play1")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                    }
                    .id("PlayButton").fontSize(12).width(Option<Length>.None).height(Option<Length>.None)
                Button("reset1")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        if (this.flag) {
                            this.message8 = "notFinished"
                            this.flag = false
                            this
                                .backAnimator?
                                .reset(
                                    AnimatorOptions(
                                        duration: 3000,
                                        easing: "linear-out-slow-in",
                                        delay: 0,
                                        fill: AnimatorFill.Both,
                                        direction: AnimatorDirection.Reverse,
                                        iterations: -1,
                                        begin: 100.0,
                                        end: 200.0
                                    )
                                )
                        } else {
                            Hilog.info(1, "Cangjie-App", "Animation not ended")
                        }
                    }
                    .id("ResetButton1").fontSize(12).width(47.percent).height(30)
                Button("expectedFrameRateRange")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this
                            .backAnimator?
                            .setExpectedFrameRateRange(
                                ExpectedFrameRateRange(
                                    min: 2,
                                    max: 15,
                                    expected: 3
                                )
                            )
                    }
                    .id("expectedFrameRateRangeButton").fontSize(12).width(47.percent).height(30)
                Button("expectedFrameRateRange2")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this
                            .backAnimator?
                            .setExpectedFrameRateRange(
                                ExpectedFrameRateRange(
                                    min: -1,
                                    max: -2,
                                    expected: 146
                                )
                            )
                    }
                    .id("expectedFrameRateRangeButton2").fontSize(12).width(47.percent).height(30)
                Button("expectedFrameRateRange3")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this
                            .backAnimator?
                            .setExpectedFrameRateRange(
                                ExpectedFrameRateRange(
                                    min: -2,
                                    max: 3,
                                    expected: 2
                                )
                            )
                    }
                    .id("expectedFrameRateRangeButton3").fontSize(12).width(47.percent).height(30)
                Button("expectedFrameRateRange4")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this
                            .backAnimator?
                            .setExpectedFrameRateRange(
                                ExpectedFrameRateRange(
                                    min: 147,
                                    max: 149,
                                    expected: 148
                                )
                            )
                    }
                    .id("expectedFrameRateRangeButton4").fontSize(12).width(47.percent).height(30)
                Button("pause")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this.backAnimator?.pause()
                    }
                    .id("PauseButton").fontSize(12).width(47.percent).height(30)
                Button("cancel")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this.backAnimator?.cancel()
                    }
                    .id("CancelButton").fontSize(12).width(47.percent).height(30)
                Button("reverse")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this.backAnimator?.reverse()
                    }
                    .id("ReverseButton").fontSize(12).width(47.percent).height(30)
                Button("finish")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = true
                        this.backAnimator?.finish()
                    }
                    .id("FinishButton").fontSize(12).width(47.percent).height(30)
                Button("depCbcancel")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this.depCallbackAnimator?.cancel()
                    }
                    .id("depCbCancelButton").fontSize(12).width(47.percent).height(30)
                Button("depCbPlay")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this.depCallbackAnimator?.play()
                    }
                    .id("depCbPlayButton").fontSize(12).width(47.percent).height(30)

                Button("depCbReverse")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick { e =>
                        this.flag = false
                        this.depCallbackAnimator?.reverse()
                    }
                    .id("depCbReverseButton").fontSize(12).width(47.percent).height(30)

                Button("depCbreset1")
                    .fontSize(20)
                    .fontColor(Color.Black)
                    .onClick {  e =>
                        if (this.flag) {
                            this.message8 = "notFinished"
                            this.flag = false
                            this
                                .depCallbackAnimator?
                                .reset(
                                    AnimatorOptions(
                                        duration: 3000,
                                        easing: "linear-out-slow-in",
                                        delay: 0,
                                        fill: AnimatorFill.Both,
                                        direction: AnimatorDirection.Reverse,
                                        iterations: -1,
                                        begin: 100.0,
                                        end: 200.0
                                    )
                                )
                        } else {
                            Hilog.info(1, "Cangjie-App", "Animation not ended")
                        }
                    }
                    .id("depCbResetButton1").fontSize(12).width(47.percent).height(30)
                }
            }
                .alignItems(HorizontalAlign.Center)
                .justifyContent(FlexAlign.SpaceAround)
                .width(100.percent)
        }
    }
}
