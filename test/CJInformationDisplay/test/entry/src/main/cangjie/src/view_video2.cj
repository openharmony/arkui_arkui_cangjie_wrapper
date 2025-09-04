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
import ohos.font.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

extend ImageFit {
    public func toString() {
        match (this) {
            case Fill => "Fill"
            case Contain => "Contain"
            case Cover => "Cover"
            case Auto => "Auto"
            case None => "None"
            case ScaleDown => "ScaleDown"
            case TOP_START => "TOP_START"
            case TOP_END => "TOP_END"
            case BOTTOM_START => "BOTTOM_START"
            case BOTTOM_END => "BOTTOM_END"
            case _ => "_"
        }
    }
}

@Entry
@Component
class View_Video2 {
    @State
    var videoSrc: ResourceStr = @rawfile("video.mp4")
    @State
    var previewUri: ResourceStr = @r(app.media.startIcon)
    @State
    var curRate: PlaybackSpeed = PlaybackSpeed.SpeedForward100X
    @State
    var showControls: Bool = true

    @State
    var videoState: String = "Ready"

    @State
    var muted: Bool = false
    @State
    var autoPlay: Bool = false
    @State
    var controls: Bool = true
    @State
    var objectFit: ImageFit = ImageFit.Cover
    @State
    var loop: Bool = false
    @State
    var enableAnalyzer: Bool = false

    var controller: VideoController = VideoController()
    var controller_2: VideoController = VideoController()

    func build() {
        Column() {
            Column() {
                Row() {
                    Text(muted.toString())
                        .size(width: 30.percent, height: 25.vp)
                        .borderWidth(1)
                        .borderColor(Color.Black)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .textAlign(TextAlign.Center)
                        .fontSize(15)
                        .margin(top: 20.vp)
                        .id("muted")
                    Text(autoPlay.toString())
                        .size(width: 30.percent, height: 25.vp)
                        .borderWidth(1)
                        .borderColor(Color.Black)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .textAlign(TextAlign.Center)
                        .fontSize(15)
                        .margin(top: 20.vp)
                        .id("autoPlay")
                    Text(controls.toString())
                        .size(width: 30.percent, height: 25.vp)
                        .borderWidth(1)
                        .borderColor(Color.Black)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .textAlign(TextAlign.Center)
                        .fontSize(15)
                        .margin(top: 20.vp)
                        .id("controls")
                }
                Row() {
                    Text(objectFit.toString())
                        .size(width: 30.percent, height: 25.vp)
                        .borderWidth(1)
                        .borderColor(Color.Black)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .textAlign(TextAlign.Center)
                        .fontSize(15)
                        .margin(top: 20.vp)
                        .id("objectFit")
                    Text(loop.toString())
                        .size(width: 30.percent, height: 25.vp)
                        .borderWidth(1)
                        .borderColor(Color.Black)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .textAlign(TextAlign.Center)
                        .fontSize(15)
                        .margin(top: 20.vp)
                        .id("loop")

                    Text(enableAnalyzer.toString())
                        .size(width: 30.percent, height: 25.vp)
                        .borderWidth(1)
                        .borderColor(Color.Black)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .textAlign(TextAlign.Center)
                        .fontSize(15)
                        .margin(top: 20.vp)
                        .id("enableAnalyzer")
                }

                Video(
                    src: this.videoSrc,
                    currentProgressRate: this.curRate,
                    previewUri: this.previewUri,
                    controller: this.controller
                )
                    .width(100.percent)
                    .height(300)
                    .muted(muted)
                    .autoPlay(autoPlay)
                    .controls(controls)
                    .objectFit(objectFit)
                    .loop(loop)
                    .onStart({
                        => Hilog.info(1,"1","------onStart")
                    })
                    .onPause({
                        => Hilog.info(1,"1","------onPause")
                    })
                    .onFinish({
                        => Hilog.info(1,"1","------onFinish")
                    })
                    .onError({
                        => Hilog.info(1,"1","--------onError")
                    })
                    .onPrepared({
                        count: PreparedInfo => Hilog.info(1,"1","------onPrepared")
                    })
                    .onSeeking({
                        count: PlaybackInfo => Hilog.info(1,"1","------onSeeking")
                    })
                    .onSeeked({
                        count: PlaybackInfo => Hilog.info(1,"1","------onSeeked")
                    })
                    .onUpdate({
                        count: PlaybackInfo => Hilog.info(1,"1","------onUpdate")
                    })
                    .onFullscreenChange({
                        isFull: FullscreenInfo => Hilog.info(1,"1","------onFullscreenChange")
                    })
                    .id("video")

                Row() {
                    Button("start").onClick({
                        event => this.controller.start() // 开始播放
                    }).margin(5).id("start")

                    Button("pause").onClick({
                        event => this.controller.pause() // 暂停播放
                    }).margin(5).id("pause")

                    Button("stop")
                        .onClick(
                            {
                                event =>
                                this.controller.stop() // 停止播放，再次播放时从头开始播放。
                                this.controller.exitFullscreen()
                            }
                        )
                        .margin(5)
                        .id("stop")
                }

                Row() {
                    Button("Fullscreen")
                        .onClick({
                            event => this.controller.requestFullscreen(true)
                        })
                        .margin(5)
                        .id("Fullscreen")
                    Button("at 30s")
                        .onClick({
                            event =>
                        this.controller.setCurrentTime(30, SeekMode.PreviousKeyframe)
                        this.controller.setCurrentTime(30, SeekMode.NextKeyframe)
                        this.controller.setCurrentTime(30, SeekMode.Accurate)
                        this.controller.setCurrentTime(30, SeekMode.ClosestKeyframe)
                        })
                        .margin(5)
                        .id("setCurrentTime")
                    Button("exitFull").onClick({
                        event => this.controller.exitFullscreen()
                    }).margin(5).id("exitFull")
                }

                Video(
                    src: "https://media.w3.org/2010/05/sintel/trailer.mp4",
                    currentProgressRate: this.curRate,
                    previewUri: "previewUri",
                    controller: this.controller_2
                ).autoPlay(false).controls(true).height(50).id("video_2")

                Video(
                    src: "https://media.w3.org/2010/05/sintel/trailer.mp4",
                    currentProgressRate: PlaybackSpeed.SpeedForward075X,
                    previewUri: "previewUri",
                    controller: this.controller_2
                ).autoPlay(false).controls(true).height(50).id("video_3")

                Video(
                    src: @rawfile("video.mp4"),
                    currentProgressRate: PlaybackSpeed.SpeedForward075X,
                    previewUri: @r(app.media.startIcon),
                    controller: this.controller_2
                ).autoPlay(false).controls(true).height(50).id("video_4")

                Video(currentProgressRate: PlaybackSpeed.SpeedForward075X)
                Video(currentProgressRate: PlaybackSpeed.SpeedForward125X)
                Video(currentProgressRate: PlaybackSpeed.SpeedForward175X)
                Video(currentProgressRate: PlaybackSpeed.SpeedForward200X)
            }
        }
    }
}

