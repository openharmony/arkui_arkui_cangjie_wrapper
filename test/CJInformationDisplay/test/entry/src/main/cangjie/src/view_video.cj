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
 * Created on 2025/3/27
 */
package ohos_app_cangjie_entry

import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.*
import kit.ArkUI.*

@Entry
@Component
class ViewVideo {
    var videoSrc: AppResource = @rawfile("video.mp4")
    var previewUri: AppResource = @r(app.media.icon)
    @State
    var curRate: PlaybackSpeed = PlaybackSpeed.SpeedForward100X
    @State
    var isAutoPlay: Bool = false
    @State
    var showControls: Bool = true
    @State var msgText: String = ""
    var controller: VideoController = VideoController()
    func build() {
        Column() {
            Video(
                src: this.videoSrc,
                previewUri: this.previewUri,
                currentProgressRate: this.curRate,
                controller: this.controller
            ).width(100.percent)
            .height(240.px)
            .autoPlay(this.isAutoPlay)
            .controls(this.showControls)
            .onFinish({ => this.msgText = "onFinish"})
            .onError({ => this.msgText = "onError"})
            .onPause({ => this.msgText = "onPause"})
            .onStart({ => this.msgText = "onStart"})

            Video(
                src: @rawfile("index.html"),
                previewUri: this.previewUri,
                currentProgressRate: PlaybackSpeed.SpeedForward100X,
                controller: this.controller
            ).width(100.percent)
            .height(240.px)
            .onError({ => this.msgText = "onError"})

            Video(
                src: this.videoSrc,
                previewUri: this.previewUri,
                currentProgressRate: PlaybackSpeed.SpeedForward100X,
                controller: this.controller
            ).width(100.percent)
            .height(240.px)
            .autoPlay(this.isAutoPlay)
            .controls(this.showControls)
            .objectFit(ImageFit.Fill)
            .loop(true)

            Video(
                src: "https://media.w3.org/2010/05/sintel/trailer.mp4",
                previewUri: this.previewUri,
                currentProgressRate: PlaybackSpeed.SpeedForward100X,
                controller: this.controller
            ).width(100.percent)
            .height(240.px)
            .autoPlay(this.isAutoPlay)
            .controls(false)
            .muted(true)

            Video(
                src: "https://media.w3.org/2010/05/sintel/trailer.mp4",
                previewUri: this.previewUri,
                currentProgressRate: this.curRate,
                controller: this.controller
            ).width(100.percent).height(240.px).autoPlay(this.isAutoPlay).controls(this.showControls)

            Video(
                src: this.videoSrc,
                previewUri: "https://csdnimg.cn/release/devpress-cangjie/public/img/logo.81433277.png",
                currentProgressRate: this.curRate,
                controller: this.controller
            ).width(100.percent).height(240.px).autoPlay(this.isAutoPlay).controls(this.showControls)

            Video(
                src: this.videoSrc,
                previewUri: "https://csdnimg.cn/release/devpress-cangjie/public/img/logo.81433277.png",
                currentProgressRate: PlaybackSpeed.SpeedForward100X,
                controller: this.controller
            ).width(100.percent).height(240.px).autoPlay(this.isAutoPlay).controls(this.showControls)

            Video(
                src: "https://media.w3.org/2010/05/sintel/trailer.mp4",
                previewUri: "https://csdnimg.cn/release/devpress-cangjie/public/img/logo.81433277.png",
                currentProgressRate: PlaybackSpeed.SpeedForward100X,
                controller: this.controller
            ).width(100.percent).height(240.px).autoPlay(this.isAutoPlay).controls(this.showControls)

            Video(
                src: "https://media.w3.org/2010/05/sintel/trailer.mp4",
                previewUri: "https://csdnimg.cn/release/devpress-cangjie/public/img/logo.81433277.png",
                currentProgressRate: this.curRate,
                controller: this.controller
            ).width(100.percent).height(240.px).autoPlay(this.isAutoPlay).controls(this.showControls)


            Text(this.msgText).id("msgText")

            Row() {
                Button("start").onClick({
                    evt => this.controller.start() // 开始播放
                }).margin(5).id("start")
                Button("pause").onClick({
                    evt => this.controller.pause() // 暂停播放
                }).margin(5).id("pause")
                Button("stop").onClick(
                    {
                        evt =>
                        this.controller.stop() // 暂停播放
                        this.controller.exitFullscreen()
                    }
                ).margin(5).id("stop")
            }
            Row() {
                Button("Fullscreen").onClick({
                    evt => this.controller.requestFullscreen(true)
                }).margin(5).id("Fullscreen")
                Button("at 8s")
                    .onClick({
                        evt => this.controller.setCurrentTime(8, SeekMode.ClosestKeyframe)
                    })
                    .margin(5)
                    .id("at 8s")
            }
            Video()
            Video(currentProgressRate: PlaybackSpeed.SpeedForward100X)
            Video(src: this.videoSrc, previewUri: this.previewUri)
            Video(src: this.videoSrc, currentProgressRate: PlaybackSpeed.SpeedForward125X, previewUri: this.previewUri)
            Video(previewUri: this.previewUri)
            Video(currentProgressRate: PlaybackSpeed.SpeedForward125X, previewUri: this.previewUri)
            Video(src: this.videoSrc)
            Video(src: this.videoSrc, currentProgressRate: PlaybackSpeed.SpeedForward125X)
        }
    }
}