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
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.time.MonoTime
import ohos.hilog.Hilog

@Entry
@Component
class ViewAnimation {
    @State var buttonParamsValidWidthSize: Length = 150.vp
    @State var buttonParamsValidHeightSize: Length = 50.vp
    @State var buttonParamsValidMs: Int64 = -1
    @State var buttonParamsValidflag: Bool = true
    var buttonParamsValidBeginTime: MonoTime = MonoTime.now()

    @State var buttonDurationLessThanZeroWidthSize: Length = 150.vp
    @State var buttonDurationLessThanZeroHeightSize: Length = 50.vp
    @State var buttonDurationLessThanZeroMs: Int64 = -1
    @State var buttonDurationLessThanZeroflag: Bool = true
    var buttonDurationLessThanZeroBeginTime: MonoTime = MonoTime.now()

    @State var buttonDurationEqZeroWidthSize: Length = 150.vp
    @State var buttonDurationEqZeroHeightSize: Length = 50.vp
    @State var buttonDurationEqZeroMs: Int64 = -1
    @State var buttonDurationEqZeroflag: Bool = true
    var buttonDurationEqZeroBeginTime: MonoTime = MonoTime.now()

    @State var buttonTempoLessThanZeroWidthSize: Length = 150.vp
    @State var buttonTempoLessThanZeroHeightSize: Length = 50.vp
    @State var buttonTempoLessThanZeroMs: Int64 = -1
    @State var buttonTempoLessThanZeroflag: Bool = true
    var buttonTempoLessThanZeroBeginTime: MonoTime = MonoTime.now()

    @State var buttonTempoEqZeroWidthSize: Length = 150.vp
    @State var buttonTempoEqZeroHeightSize: Length = 50.vp
    @State var buttonTempoEqZeroMs: Int64 = -1
    @State var buttonTempoEqZeroflag: Bool = true
    var buttonTempoEqZeroBeginTime: MonoTime = MonoTime.now()

    @State var buttonCurveLinearWidthSize: Length = 150.vp
    @State var buttonCurveLinearHeightSize: Length = 50.vp
    @State var buttonCurveLinearMs: Int64 = -1
    @State var buttonCurveLinearflag: Bool = true
    var buttonCurveLinearBeginTime: MonoTime = MonoTime.now()

    @State var buttonCurveFrictionWidthSize: Length = 150.vp
    @State var buttonCurveFrictionHeightSize: Length = 50.vp
    @State var buttonCurveFrictionMs: Int64 = -1
    @State var buttonCurveFrictionflag: Bool = true
    var buttonCurveFrictionBeginTime: MonoTime = MonoTime.now()

    @State var buttonDelayZeroWidthSize: Length = 150.vp
    @State var buttonDelayZeroHeightSize: Length = 50.vp
    @State var buttonDelayZeroMs: Int64 = -1
    @State var buttonDelayZeroflag: Bool = true
    var buttonDelayZeroBeginTime: MonoTime = MonoTime.now()

    @State var buttonDelayAbsLessThanActualTimeWidthSize: Length = 150.vp
    @State var buttonDelayAbsLessThanActualTimeHeightSize: Length = 50.vp
    @State var buttonDelayAbsLessThanActualTimeMs: Int64 = -1
    @State var buttonDelayAbsLessThanActualTimeflag: Bool = true
    var buttonDelayAbsLessThanActualTimeBeginTime: MonoTime = MonoTime.now()

    @State var buttonDelayAbsMoreThanActualTimeWidthSize: Length = 150.vp
    @State var buttonDelayAbsMoreThanActualTimeHeightSize: Length = 50.vp
    @State var buttonDelayAbsMoreThanActualTimeMs: Int64 = -1
    @State var buttonDelayAbsMoreThanActualTimeflag: Bool = true
    var buttonDelayAbsMoreThanActualTimeBeginTime: MonoTime = MonoTime.now()

    @State var buttonIterationsZeroWidthSize: Length = 150.vp
    @State var buttonIterationsZeroHeightSize: Length = 50.vp
    @State var buttonIterationsZeroMs: Int64 = -1
    @State var buttonIterationsZeroflag: Bool = true
    var buttonIterationsZeroBeginTime: MonoTime = MonoTime.now()

    @State var buttonIterationsLowerBoundaryWidthSize: Length = 150.vp
    @State var buttonIterationsLowerBoundaryHeightSize: Length = 50.vp
    @State var buttonIterationsLowerBoundaryMs: Int64 = -1
    @State var buttonIterationsLowerBoundaryflag: Bool = true
    var buttonIterationsLowerBoundaryBeginTime: MonoTime = MonoTime.now()
    var beginTime: MonoTime = MonoTime.now()

    @State var buttonIterationsInvalidWidthSize: Length = 150.vp
    @State var buttonIterationsInvalidHeightSize: Length = 50.vp
    @State var buttonIterationsInvalidMs: Int64 = -1
    @State var buttonIterationsInvalidflag: Bool = true
    var buttonIterationsInvalidBeginTime: MonoTime = MonoTime.now()

    @State var buttonPlayModeReverseWidthSize: Length = 150.vp
    @State var buttonPlayModeReverseHeightSize: Length = 50.vp
    @State var buttonPlayModeReverseMs: Int64 = -1
    @State var buttonPlayModeReverseflag: Bool = true
    var buttonPlayModeReverseBeginTime: MonoTime = MonoTime.now()

    @State var buttonPlayModeAlternateWidthSize: Length = 150.vp
    @State var buttonPlayModeAlternateHeightSize: Length = 50.vp
    @State var buttonPlayModeAlternateMs: Int64 = -1
    @State var buttonPlayModeAlternateflag: Bool = true
    var buttonPlayModeAlternateBeginTime: MonoTime = MonoTime.now()

    @State var buttonPlayModeAlternateReverseWidthSize: Length = 150.vp
    @State var buttonPlayModeAlternateReverseHeightSize: Length = 50.vp
    @State var buttonPlayModeAlternateReverseMs: Int64 = -1
    @State var buttonPlayModeAlternateReverseflag: Bool = true
    var buttonPlayModeAlternateReverseBeginTime: MonoTime = MonoTime.now()

    @State var buttonFrameRateLessThanLowerBoundaryWidthSize: Length = 150.vp
    @State var buttonFrameRateLessThanLowerBoundaryHeightSize: Length = 50.vp
    @State var buttonFrameRateLessThanLowerBoundaryMs: Int64 = -1
    @State var buttonFrameRateLessThanLowerBoundaryflag: Bool = true
    var buttonFrameRateLessThanLowerBoundaryBeginTime: MonoTime = MonoTime.now()

    @State var buttonExpectedFrameRateNotInRangeWidthSize: Length = 150.vp
    @State var buttonExpectedFrameRateNotInRangeHeightSize: Length = 50.vp
    @State var buttonExpectedFrameRateNotInRangeMs: Int64 = -1
    @State var buttonExpectedFrameRateNotInRangeflag: Bool = true
    var buttonExpectedFrameRateNotInRangeBeginTime: MonoTime = MonoTime.now()

    @State var buttonFrameRateMinMoreThanMaxWidthSize: Length = 150.vp
    @State var buttonFrameRateMinMoreThanMaxHeightSize: Length = 50.vp
    @State var buttonFrameRateMinMoreThanMaxMs: Int64 = -1
    @State var buttonFrameRateMinMoreThanMaxflag: Bool = true
    var buttonFrameRateMinMoreThanMaxBeginTime: MonoTime = MonoTime.now()

    @State var buttonNoSetWidthSize: Length = 150.vp
    @State var buttonNoSetHeightSize: Length = 50.vp
    @State var buttonNoSetMs: Int64 = -1
    @State var buttonNoSetflag: Bool = true
    var buttonNoSetBeginTime: MonoTime = MonoTime.now()

    @State var buttonOptionNoneWidthSize: Length = 150.vp
    @State var buttonOptionNoneHeightSize: Length = 50.vp
    @State var buttonOptionNoneMs: Int64 = -1
    @State var buttonOptionNoneflag: Bool = true
    var buttonOptionNoneBeginTime: MonoTime = MonoTime.now()

    @State var buttonAnimateParamOptionNoneWidthSize: Length = 150.vp
    @State var buttonAnimateParamOptionNoneHeightSize: Length = 50.vp
    @State var buttonAnimateParamOptionNoneMs: Int64 = -1
    @State var buttonAnimateParamOptionNoneflag: Bool = true
    var buttonAnimateParamOptionNoneBeginTime: MonoTime = MonoTime.now()

    @State var rotateAngle: Float32 = 0.0

    func build() {
        Row() {
            Column() {
                Row() {
                    Button("ParamsValid")
                        .onClick({
                           evt =>
                            if (this.buttonParamsValidflag) {
                                this.buttonParamsValidWidthSize = 100.vp
                                this.buttonParamsValidHeightSize = 20.vp
                            } else {
                                this.buttonParamsValidWidthSize = 150.vp
                                this.buttonParamsValidHeightSize = 50.vp
                            }
                            this.buttonParamsValidflag = !this.buttonParamsValidflag
                            this.buttonParamsValidBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonParamsValidWidthSize)
                        .height(this.buttonParamsValidHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 3000,
                                tempo: 2.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 3,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonParamsValidBeginTime).toMilliseconds()
                                        if (this.buttonParamsValidMs < 0) {
                                            this.buttonParamsValidMs = ms
                                        }
                                        this.buttonParamsValidBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonParamsValid")
                    Text("${this.buttonParamsValidMs}").id("textParamsValid")
                }

                Row() {
                    Button("DurationLessThanZero")
                        .onClick({
                           evt =>
                            if (this.buttonDurationLessThanZeroflag) {
                                this.buttonDurationLessThanZeroWidthSize = 100.vp
                                this.buttonDurationLessThanZeroHeightSize = 20.vp
                            } else {
                                this.buttonDurationLessThanZeroWidthSize = 150.vp
                                this.buttonDurationLessThanZeroHeightSize = 50.vp
                            }
                            this.buttonDurationLessThanZeroflag = !this.buttonDurationLessThanZeroflag
                            this.buttonDurationLessThanZeroBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonDurationLessThanZeroWidthSize)
                        .height(this.buttonDurationLessThanZeroHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: -300,
                                tempo: 2.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 3,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonDurationLessThanZeroBeginTime).toMilliseconds()
                                        if (this.buttonDurationLessThanZeroMs < 0) {
                                            this.buttonDurationLessThanZeroMs = ms
                                        }
                                        this.buttonDurationLessThanZeroBeginTime = now
                                        Hilog.info(1, "AnimationbuttonDurationLessThanZeroTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonDurationLessThanZero")
                    Text("${this.buttonDurationLessThanZeroMs}").id("textDurationLessThanZero")
                }

                Row() {
                    Button("DurationEqZero")
                        .onClick({
                           evt =>
                            if (this.buttonDurationEqZeroflag) {
                                this.buttonDurationEqZeroWidthSize = 100.vp
                                this.buttonDurationEqZeroHeightSize = 20.vp
                            } else {
                                this.buttonDurationEqZeroWidthSize = 150.vp
                                this.buttonDurationEqZeroHeightSize = 50.vp
                            }
                            this.buttonDurationEqZeroflag = !this.buttonDurationEqZeroflag
                            this.buttonDurationEqZeroBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonDurationEqZeroWidthSize)
                        .height(this.buttonDurationEqZeroHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 0,
                                tempo: 2.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 3,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonDurationEqZeroBeginTime).toMilliseconds()
                                        if (this.buttonDurationEqZeroMs < 0) {
                                            this.buttonDurationEqZeroMs = ms
                                        }
                                        this.buttonDurationEqZeroBeginTime = now
                                        Hilog.info(1, "AnimationbuttonDurationEqZeroTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonDurationEqZero")
                    Text("${this.buttonDurationEqZeroMs}").id("textDurationEqZero")
                }

                Row() {
                    Button("TempoLessThanZero")
                        .onClick({
                           evt =>
                            if (this.buttonTempoLessThanZeroflag) {
                                this.buttonTempoLessThanZeroWidthSize = 100.vp
                                this.buttonTempoLessThanZeroHeightSize = 20.vp
                            } else {
                                this.buttonTempoLessThanZeroWidthSize = 150.vp
                                this.buttonTempoLessThanZeroHeightSize = 50.vp
                            }
                            this.buttonTempoLessThanZeroflag = !this.buttonTempoLessThanZeroflag
                            this.buttonTempoLessThanZeroBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonTempoLessThanZeroWidthSize)
                        .height(this.buttonTempoLessThanZeroHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: -5.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 3,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonTempoLessThanZeroBeginTime).toMilliseconds()
                                        if (this.buttonTempoLessThanZeroMs < 0) {
                                            this.buttonTempoLessThanZeroMs = ms
                                        }
                                        this.buttonTempoLessThanZeroBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonTempoLessThanZero")
                    Text("${this.buttonTempoLessThanZeroMs}").id("textTempoLessThanZero")
                }

                Row() {
                    Button("TempoEqZero")
                        .onClick({
                           evt =>
                            if (this.buttonTempoEqZeroflag) {
                                this.buttonTempoEqZeroWidthSize = 100.vp
                                this.buttonTempoEqZeroHeightSize = 20.vp
                            } else {
                                this.buttonTempoEqZeroWidthSize = 150.vp
                                this.buttonTempoEqZeroHeightSize = 50.vp
                            }
                            this.buttonTempoEqZeroflag = !this.buttonTempoEqZeroflag
                            this.buttonTempoEqZeroBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonTempoEqZeroWidthSize)
                        .height(this.buttonTempoEqZeroHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 0.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 3,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonTempoEqZeroBeginTime).toMilliseconds()
                                        if (this.buttonTempoEqZeroMs < 0) {
                                            this.buttonTempoEqZeroMs = ms
                                        }
                                        this.buttonTempoEqZeroBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonTempoEqZero")
                    Text("${this.buttonTempoEqZeroMs}").id("textTempoEqZero")
                }

                Row() {
                    Button("CurveLinear")
                        .onClick({
                           evt =>
                            if (this.buttonCurveLinearflag) {
                                this.buttonCurveLinearWidthSize = 100.vp
                                this.buttonCurveLinearHeightSize = 20.vp
                            } else {
                                this.buttonCurveLinearWidthSize = 150.vp
                                this.buttonCurveLinearHeightSize = 50.vp
                            }
                            this.buttonCurveLinearflag = !this.buttonCurveLinearflag
                            this.buttonCurveLinearBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonCurveLinearWidthSize)
                        .height(this.buttonCurveLinearHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 3000,
                                tempo: 1.0,
                                curve: Curve.Linear,
                                delay: 500,
                                iterations: 1,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonCurveLinearBeginTime).toMilliseconds()
                                        if (this.buttonCurveLinearMs < 0) {
                                            this.buttonCurveLinearMs = ms
                                        }
                                        this.buttonCurveLinearBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonCurveLinear")
                    Text("${this.buttonCurveLinearMs}").id("textCurveLinear")
                }

                Row() {
                    Button("CurveFriction")
                        .onClick({
                           evt =>
                            if (this.buttonCurveFrictionflag) {
                                this.buttonCurveFrictionWidthSize = 100.vp
                                this.buttonCurveFrictionHeightSize = 20.vp
                            } else {
                                this.buttonCurveFrictionWidthSize = 150.vp
                                this.buttonCurveFrictionHeightSize = 50.vp
                            }
                            this.buttonCurveFrictionflag = !this.buttonCurveFrictionflag
                            this.buttonCurveFrictionBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonCurveFrictionWidthSize)
                        .height(this.buttonCurveFrictionHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 3000,
                                tempo: 1.0,
                                curve: Curve.Friction,
                                delay: 500,
                                iterations: 1,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonCurveFrictionBeginTime).toMilliseconds()
                                        if (this.buttonCurveFrictionMs < 0) {
                                            this.buttonCurveFrictionMs = ms
                                        }
                                        this.buttonCurveFrictionBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonCurveFriction")
                    Text("${this.buttonCurveFrictionMs}").id("textCurveFriction")
                }

                Row() {
                    Button("DelayZero")
                        .onClick({
                           evt =>
                            if (this.buttonDelayZeroflag) {
                                this.buttonDelayZeroWidthSize = 100.vp
                                this.buttonDelayZeroHeightSize = 20.vp
                            } else {
                                this.buttonDelayZeroWidthSize = 150.vp
                                this.buttonDelayZeroHeightSize = 50.vp
                            }
                            this.buttonDelayZeroflag = !this.buttonDelayZeroflag
                            this.buttonDelayZeroBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonDelayZeroWidthSize)
                        .height(this.buttonDelayZeroHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 1.0,
                                curve: Curve.Friction,
                                delay: 500,
                                iterations: 1,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonDelayZeroBeginTime).toMilliseconds()
                                        if (this.buttonDelayZeroMs < 0) {
                                            this.buttonDelayZeroMs = ms
                                        }
                                        this.buttonDelayZeroBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonDelayZero")
                    Text("${this.buttonDelayZeroMs}").id("textDelayZero")
                }

                Row() {
                    Button("DelayAbsLessThanActualTime")
                        .onClick({
                           evt =>
                            if (this.buttonDelayAbsLessThanActualTimeflag) {
                                this.buttonDelayAbsLessThanActualTimeWidthSize = 100.vp
                                this.buttonDelayAbsLessThanActualTimeHeightSize = 20.vp
                            } else {
                                this.buttonDelayAbsLessThanActualTimeWidthSize = 150.vp
                                this.buttonDelayAbsLessThanActualTimeHeightSize = 50.vp
                            }
                            this.buttonDelayAbsLessThanActualTimeflag = !this.buttonDelayAbsLessThanActualTimeflag
                            this.buttonDelayAbsLessThanActualTimeBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonDelayAbsLessThanActualTimeWidthSize)
                        .height(this.buttonDelayAbsLessThanActualTimeHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 1.0,
                                curve: Curve.Friction,
                                delay: -500,
                                iterations: 1,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonDelayAbsLessThanActualTimeBeginTime).toMilliseconds()
                                        if (this.buttonDelayAbsLessThanActualTimeMs < 0) {
                                            this.buttonDelayAbsLessThanActualTimeMs = ms
                                        }
                                        this.buttonDelayAbsLessThanActualTimeBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonDelayAbsLessThanActualTime")
                    Text("${this.buttonDelayAbsLessThanActualTimeMs}").id("textDelayAbsLessThanActualTime")
                }

                Row() {
                    Button("DelayAbsMoreThanActualTime")
                        .onClick({
                           evt =>
                            if (this.buttonDelayAbsMoreThanActualTimeflag) {
                                this.buttonDelayAbsMoreThanActualTimeWidthSize = 100.vp
                                this.buttonDelayAbsMoreThanActualTimeHeightSize = 20.vp
                            } else {
                                this.buttonDelayAbsMoreThanActualTimeWidthSize = 150.vp
                                this.buttonDelayAbsMoreThanActualTimeHeightSize = 50.vp
                            }
                            this.buttonDelayAbsMoreThanActualTimeflag = !this.buttonDelayAbsMoreThanActualTimeflag
                            this.buttonDelayAbsMoreThanActualTimeBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonDelayAbsMoreThanActualTimeWidthSize)
                        .height(this.buttonDelayAbsMoreThanActualTimeHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 500,
                                tempo: 1.0,
                                curve: Curve.Friction,
                                delay: -1000,
                                iterations: 1,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonDelayAbsMoreThanActualTimeBeginTime).toMilliseconds()
                                        if (this.buttonDelayAbsMoreThanActualTimeMs < 0) {
                                            this.buttonDelayAbsMoreThanActualTimeMs = ms
                                        }
                                        this.buttonDelayAbsMoreThanActualTimeBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonDelayAbsMoreThanActualTime")
                    Text("${this.buttonDelayAbsMoreThanActualTimeMs}").id("textDelayAbsMoreThanActualTime")
                }

                Row() {
                    Button("IterationsZero")
                        .onClick({
                           evt =>
                            if (this.buttonIterationsZeroflag) {
                                this.buttonIterationsZeroWidthSize = 100.vp
                                this.buttonIterationsZeroHeightSize = 20.vp
                            } else {
                                this.buttonIterationsZeroWidthSize = 150.vp
                                this.buttonIterationsZeroHeightSize = 50.vp
                            }
                            this.buttonIterationsZeroflag = !this.buttonIterationsZeroflag
                            this.buttonIterationsZeroBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonIterationsZeroWidthSize)
                        .height(this.buttonIterationsZeroHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 1.0,
                                curve: Curve.Friction,
                                delay: 500,
                                iterations: 0,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonIterationsZeroBeginTime).toMilliseconds()
                                        if (this.buttonIterationsZeroMs < 0) {
                                            this.buttonIterationsZeroMs = ms
                                        }
                                        this.buttonIterationsZeroBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonIterationsZero")
                    Text("${this.buttonIterationsZeroMs}").id("textIterationsZero")
                }

                Row() {
                    Button("IterationsLowerBoundary")
                        .onClick({
                           evt =>
                            if (this.buttonIterationsLowerBoundaryflag) {
                                this.buttonIterationsLowerBoundaryWidthSize = 100.vp
                                this.buttonIterationsLowerBoundaryHeightSize = 20.vp
                            } else {
                                this.buttonIterationsLowerBoundaryWidthSize = 150.vp
                                this.buttonIterationsLowerBoundaryHeightSize = 50.vp
                            }
                            this.buttonIterationsLowerBoundaryflag = !this.buttonIterationsLowerBoundaryflag
                            this.buttonIterationsLowerBoundaryBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonIterationsLowerBoundaryWidthSize)
                        .height(this.buttonIterationsLowerBoundaryHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 1.0,
                                curve: Curve.Friction,
                                delay: 500,
                                iterations: -1,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        this.buttonIterationsLowerBoundaryMs = (MonoTime.now() - this.beginTime).toMilliseconds()
                                        Hilog.info(1, "AnimationTest", "onFinish: ${this.buttonIterationsLowerBoundaryMs.toString()}")
                                }
                            )
                        )
                        .id("buttonIterationsLowerBoundary")
                    Text("${this.buttonIterationsLowerBoundaryMs}").id("textIterationsLowerBoundary")
                }

                Row() {
                    Button("IterationsInvalid")
                        .onClick({
                           evt =>
                            if (this.buttonIterationsInvalidflag) {
                                this.buttonIterationsInvalidWidthSize = 100.vp
                                this.buttonIterationsInvalidHeightSize = 20.vp
                            } else {
                                this.buttonIterationsInvalidWidthSize = 150.vp
                                this.buttonIterationsInvalidHeightSize = 50.vp
                            }
                            this.buttonIterationsInvalidflag = !this.buttonIterationsInvalidflag
                            this.buttonIterationsInvalidBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonIterationsInvalidWidthSize)
                        .height(this.buttonIterationsInvalidHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 1.0,
                                curve: Curve.Friction,
                                delay: 500,
                                iterations: -5,
                                playMode: PlayMode.Normal,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonIterationsInvalidBeginTime).toMilliseconds()
                                        if (this.buttonIterationsInvalidMs < 0) {
                                            this.buttonIterationsInvalidMs = ms
                                        }
                                        this.buttonIterationsInvalidBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonIterationsInvalid")
                    Text("${this.buttonIterationsInvalidMs}").id("textIterationsInvalid")
                }
            }
            .width(50.percent)
            .margin(top: 20)

            Column() {
                Row() {
                    Button("PlayModeReverse")
                        .onClick({
                           evt =>
                            if (this.buttonPlayModeReverseflag) {
                                this.buttonPlayModeReverseWidthSize = 100.vp
                                this.buttonPlayModeReverseHeightSize = 20.vp
                            } else {
                                this.buttonPlayModeReverseWidthSize = 150.vp
                                this.buttonPlayModeReverseHeightSize = 50.vp
                            }
                            this.buttonPlayModeReverseflag = !this.buttonPlayModeReverseflag
                            this.buttonPlayModeReverseBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonPlayModeReverseWidthSize)
                        .height(this.buttonPlayModeReverseHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 2.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 1,
                                playMode: PlayMode.Reverse,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonPlayModeReverseBeginTime).toMilliseconds()
                                        if (this.buttonPlayModeReverseMs < 0) {
                                            this.buttonPlayModeReverseMs = ms
                                        }
                                        this.buttonPlayModeReverseBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonPlayModeReverse")
                    Text("${this.buttonPlayModeReverseMs}").id("textPlayModeReverse")
                }
                Row() {
                    Button("PlayModeAlternate")
                        .onClick({
                           evt =>
                            if (this.buttonPlayModeAlternateflag) {
                                this.buttonPlayModeAlternateWidthSize = 100.vp
                                this.buttonPlayModeAlternateHeightSize = 20.vp
                            } else {
                                this.buttonPlayModeAlternateWidthSize = 150.vp
                                this.buttonPlayModeAlternateHeightSize = 50.vp
                            }
                            this.buttonPlayModeAlternateflag = !this.buttonPlayModeAlternateflag
                            this.buttonPlayModeAlternateBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonPlayModeAlternateWidthSize)
                        .height(this.buttonPlayModeAlternateHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 1.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 5,
                                playMode: PlayMode.Alternate,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonPlayModeAlternateBeginTime).toMilliseconds()
                                        if (this.buttonPlayModeAlternateMs < 0) {
                                            this.buttonPlayModeAlternateMs = ms
                                        }
                                        this.buttonPlayModeAlternateBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonPlayModeAlternate")
                    Text("${this.buttonPlayModeAlternateMs}").id("textPlayModeAlternate")
                }

                Row() {
                    Button("PlayModeAlternateReverse")
                        .onClick({
                           evt =>
                            if (this.buttonPlayModeAlternateReverseflag) {
                                this.buttonPlayModeAlternateReverseWidthSize = 100.vp
                                this.buttonPlayModeAlternateReverseHeightSize = 20.vp
                            } else {
                                this.buttonPlayModeAlternateReverseWidthSize = 150.vp
                                this.buttonPlayModeAlternateReverseHeightSize = 50.vp
                            }
                            this.buttonPlayModeAlternateReverseflag = !this.buttonPlayModeAlternateReverseflag
                            this.buttonPlayModeAlternateReverseBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonPlayModeAlternateReverseWidthSize)
                        .height(this.buttonPlayModeAlternateReverseHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: 1000,
                                tempo: 1.0,
                                curve: Curve.EaseOut,
                                delay: 500,
                                iterations: 6,
                                playMode: PlayMode.AlternateReverse,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonPlayModeAlternateReverseBeginTime).toMilliseconds()
                                        if (this.buttonPlayModeAlternateReverseMs < 0) {
                                            this.buttonPlayModeAlternateReverseMs = ms
                                        }
                                        this.buttonPlayModeAlternateReverseBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: FinishCallbackType.Removed,
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 90)
                            )
                        )
                        .id("buttonPlayModeAlternateReverse")
                    Text("${this.buttonPlayModeAlternateReverseMs}").id("textPlayModeAlternateReverse")
                }

                Row() {
                    Button("FrameRateLessThanLowerBoundary")
                        .onClick({
                           evt =>
                            if (this.buttonFrameRateLessThanLowerBoundaryflag) {
                                this.buttonFrameRateLessThanLowerBoundaryWidthSize = 100.vp
                                this.buttonFrameRateLessThanLowerBoundaryHeightSize = 20.vp
                            } else {
                                this.buttonFrameRateLessThanLowerBoundaryWidthSize = 150.vp
                                this.buttonFrameRateLessThanLowerBoundaryHeightSize = 50.vp
                            }
                            this.buttonFrameRateLessThanLowerBoundaryflag = !this.buttonFrameRateLessThanLowerBoundaryflag
                            this.buttonFrameRateLessThanLowerBoundaryBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonFrameRateLessThanLowerBoundaryWidthSize)
                        .height(this.buttonFrameRateLessThanLowerBoundaryHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonFrameRateLessThanLowerBoundaryBeginTime).toMilliseconds()
                                        if (this.buttonFrameRateLessThanLowerBoundaryMs < 0) {
                                            this.buttonFrameRateLessThanLowerBoundaryMs = ms
                                        }
                                        this.buttonFrameRateLessThanLowerBoundaryBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                expectedFrameRateRange: ExpectedFrameRateRange(min: -20, max: -120, expected: -90)
                            )
                        )
                        .id("buttonFrameRateLessThanLowerBoundary")
                    Text("${this.buttonFrameRateLessThanLowerBoundaryMs}").id("textFrameRateLessThanLowerBoundary")
                }

                Row() {
                    Button("ExpectedFrameRateNotInRange")
                        .onClick({
                           evt =>
                            if (this.buttonExpectedFrameRateNotInRangeflag) {
                                this.buttonExpectedFrameRateNotInRangeWidthSize = 100.vp
                                this.buttonExpectedFrameRateNotInRangeHeightSize = 20.vp
                            } else {
                                this.buttonExpectedFrameRateNotInRangeWidthSize = 150.vp
                                this.buttonExpectedFrameRateNotInRangeHeightSize = 50.vp
                            }
                            this.buttonExpectedFrameRateNotInRangeflag = !this.buttonExpectedFrameRateNotInRangeflag
                            this.buttonExpectedFrameRateNotInRangeBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonExpectedFrameRateNotInRangeWidthSize)
                        .height(this.buttonExpectedFrameRateNotInRangeHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonExpectedFrameRateNotInRangeBeginTime).toMilliseconds()
                                        if (this.buttonExpectedFrameRateNotInRangeMs < 0) {
                                            this.buttonExpectedFrameRateNotInRangeMs = ms
                                        }
                                        this.buttonExpectedFrameRateNotInRangeBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 20,  max: 120,expected: 140)
                            )
                        )
                        .id("buttonExpectedFrameRateNotInRange")
                    Text("${this.buttonExpectedFrameRateNotInRangeMs}").id("textExpectedFrameRateNotInRange")
                }

                Row() {
                    Button("FrameRateMinMoreThanMax")
                        .onClick({
                           evt =>
                            if (this.buttonFrameRateMinMoreThanMaxflag) {
                                this.buttonFrameRateMinMoreThanMaxWidthSize = 100.vp
                                this.buttonFrameRateMinMoreThanMaxHeightSize = 20.vp
                            } else {
                                this.buttonFrameRateMinMoreThanMaxWidthSize = 150.vp
                                this.buttonFrameRateMinMoreThanMaxHeightSize = 50.vp
                            }
                            this.buttonFrameRateMinMoreThanMaxflag = !this.buttonFrameRateMinMoreThanMaxflag
                            this.buttonFrameRateMinMoreThanMaxBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonFrameRateMinMoreThanMaxWidthSize)
                        .height(this.buttonFrameRateMinMoreThanMaxHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonFrameRateMinMoreThanMaxBeginTime).toMilliseconds()
                                        if (this.buttonFrameRateMinMoreThanMaxMs < 0) {
                                            this.buttonFrameRateMinMoreThanMaxMs = ms
                                        }
                                        this.buttonFrameRateMinMoreThanMaxBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                expectedFrameRateRange: ExpectedFrameRateRange(min: 120,  max: 20, expected: 90)
                            )
                        )
                        .id("buttonFrameRateMinMoreThanMax")
                    Text("${this.buttonFrameRateMinMoreThanMaxMs}").id("textFrameRateMinMoreThanMax")
                }

                Row() {
                    Button("NoSet")
                        .onClick({
                           evt =>
                            if (this.buttonNoSetflag) {
                                this.buttonNoSetWidthSize = 100.vp
                                this.buttonNoSetHeightSize = 20.vp
                            } else {
                                this.buttonNoSetWidthSize = 150.vp
                                this.buttonNoSetHeightSize = 50.vp
                            }
                            this.buttonNoSetflag = !this.buttonNoSetflag
                            this.buttonNoSetBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonNoSetWidthSize)
                        .height(this.buttonNoSetHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonNoSetBeginTime).toMilliseconds()
                                        if (this.buttonNoSetMs < 0) {
                                            this.buttonNoSetMs = ms
                                        }
                                        this.buttonNoSetBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonNoSet")
                    Text("${this.buttonNoSetMs}").id("textNoSet")
                }

                Row() {
                    Button("OptionNone")
                        .onClick({
                           evt =>
                            if (this.buttonOptionNoneflag) {
                                this.buttonOptionNoneWidthSize = 100.vp
                                this.buttonOptionNoneHeightSize = 20.vp
                            } else {
                                this.buttonOptionNoneWidthSize = 150.vp
                                this.buttonOptionNoneHeightSize = 50.vp
                            }
                            this.buttonOptionNoneflag = !this.buttonOptionNoneflag
                            this.buttonOptionNoneBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonOptionNoneWidthSize)
                        .height(this.buttonOptionNoneHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonOptionNoneBeginTime).toMilliseconds()
                                        if (this.buttonOptionNoneMs < 0) {
                                            this.buttonOptionNoneMs = ms
                                        }
                                        this.buttonOptionNoneBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                }
                            )
                        )
                        .id("buttonOptionNone")
                    Text("${this.buttonOptionNoneMs}").id("textOptionNone")
                }

                Row() {
                    Button("AnimateParamOptionNone")
                        .onClick({
                           evt =>
                            if (this.buttonAnimateParamOptionNoneflag) {
                                this.buttonAnimateParamOptionNoneWidthSize = 100.vp
                                this.buttonAnimateParamOptionNoneHeightSize = 20.vp
                            } else {
                                this.buttonAnimateParamOptionNoneWidthSize = 150.vp
                                this.buttonAnimateParamOptionNoneHeightSize = 50.vp
                            }
                            this.buttonAnimateParamOptionNoneflag = !this.buttonAnimateParamOptionNoneflag
                            this.buttonAnimateParamOptionNoneBeginTime = MonoTime.now()
                        })
                        .margin(5)
                        .width(this.buttonAnimateParamOptionNoneWidthSize)
                        .height(this.buttonAnimateParamOptionNoneHeightSize)
                        .animation(
                            // 总动画时间 = delay/tempo + (duration/tempo)*iterations
                            AnimateParam(
                                duration: Option.None,
                                tempo: Option.None,
                                curve: Option.None,
                                delay: Option.None,
                                iterations: Option.None,
                                playMode: Option.None,
                                onFinish: {
                                    =>
                                        let now: MonoTime = MonoTime.now()
                                        let ms = (now - this.buttonAnimateParamOptionNoneBeginTime).toMilliseconds()
                                        if (this.buttonAnimateParamOptionNoneMs < 0) {
                                            this.buttonAnimateParamOptionNoneMs = ms
                                        }
                                        this.buttonAnimateParamOptionNoneBeginTime = now
                                        Hilog.info(1, "AnimationTest", "onFinish: ${ms.toString()}")
                                },
                                finishCallbackType: Option.None,
                                expectedFrameRateRange: Option.None
                            )
                        )
                        .id("buttonAnimateParamOptionNone")
                    Text("${this.buttonAnimateParamOptionNoneMs}").id("textAnimateParamOptionNone")
                }
            }
            .width(50.percent)
            .margin(top: 20)
        }
    }
}