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

package ohos.arkui.component.video

import ohos.arkui.component.common.{CommonMethod, ImageFit}
import ohos.labels.{APILevel, Hide}
import ohos.base.{VoidCallback, Callback}

/**
 * Defines the Video attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface VideoAttribute <: CommonMethod<VideoAttribute> {
    /**
     * Controls whether the video audio is muted.
     *
     * @param { ?Bool } value - Whether the video is muted. The default value is false.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func muted(value: ?Bool): VideoAttribute

    /**
     * Controls whether the video starts playing automatically when loaded.
     *
     * @param { ?Bool } value - Whether the video is played automatically. The default value is false.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoPlay(value: ?Bool): VideoAttribute

    /**
     * Controls the visibility of the video control bar.
     *
     * @param { ?Bool } value - Whether the control bar is displayed. The default value is true.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func controls(value: ?Bool): VideoAttribute

    /**
     * Controls how the video content is scaled to fit the display area.
     *
     * @param { ?ImageFit } value - The zoom type. The default value is ImageFit.Contain.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func objectFit(value: ?ImageFit): VideoAttribute

    /**
     * Controls whether the video playback loops when it reaches the end.
     *
     * @param { ?Bool } value - Whether the video is played circular. The default value is false.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func loop(value: ?Bool): VideoAttribute

    /**
     * Triggered when the video starts playing.
     *
     * @param { ?VoidCallback } event - The callback function when the video is played.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onStart(event: ?VoidCallback): VideoAttribute

    /**
     * Called when the video is paused.
     *
     * @param { ?VoidCallback } event - The callback function when the video is paused.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPause(event: ?VoidCallback): VideoAttribute

    /**
     * Triggered when the video playback reaches the end.
     *
     * @param { ?VoidCallback } event - The callback function when the video playback ends.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFinish(event: ?VoidCallback): VideoAttribute

    /**
     * Triggered when an error occurs during video playback.
     *
     * @param { ?VoidCallback } event - The callback function when playback fails.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onError(event: ?VoidCallback): VideoAttribute

    /**
     * Triggered when the video is fully loaded and ready to play.
     *
     * @param { ?Callback<PreparedInfo, Unit> } callback - The callback function when the video preparation is complete.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPrepared(callback: ?Callback<PreparedInfo, Unit>): VideoAttribute

    /**
     * Called when the time information is reported when the progress bar process is operated.
     *
     * @param { ?Callback<PlaybackInfo, Unit> } callback - The callback function when seeking.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSeeking(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the playback time information is reported after the operation progress bar is completed.
     *
     * @param { ?Callback<PlaybackInfo, Unit> } callback - The callback function after seeking.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSeeked(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Triggered periodically during video playback to report the current playback position.
     *
     * @param { ?Callback<PlaybackInfo, Unit> } callback - The callback function when the playback progress changes.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onUpdate(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the video enters and exits the full screen.
     *
     * @param { ?Callback<FullscreenInfo, Unit> } callback - The callback function when the video enters and exits the full screen.
     * @returns { VideoAttribute } Returns the attribute of video.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFullscreenChange(callback: ?Callback<FullscreenInfo, Unit>): VideoAttribute
}
