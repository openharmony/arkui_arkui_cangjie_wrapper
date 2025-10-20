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

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines Video Component.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface VideoAttribute <: CommonMethod<VideoAttribute> {
    /**
     * Called when judging whether the video is muted.
     *
     * @param { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func muted(value: ?Bool): VideoAttribute

    /**
     * Called when judging whether the video is played automatically.
     *
     * @param { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoPlay(value: ?Bool): VideoAttribute

    /**
     * Called when judging whether the control bar is displayed.
     *
     * @param { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func controls(value: ?Bool): VideoAttribute

    /**
     * Called when determining the zoom type of the video source.
     *
     * @param { ?ImageFit } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func objectFit(value: ?ImageFit): VideoAttribute

    /**
     * Called when judging whether the video is played circular.
     *
     * @param { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func loop(value: ?Bool): VideoAttribute

    /**
     * Called when the video is played.
     * Anonymous Object Rectification.
     *
     * @param { ?VoidCallback } event
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onStart(event: ?VoidCallback): VideoAttribute

    /**
     * Called when the video is paused.
     * Anonymous Object Rectification.
     *
     * @param { ?VoidCallback } event
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPause(event: ?VoidCallback): VideoAttribute

    /**
     * Called when the video playback ends.
     * Anonymous Object Rectification.
     *
     * @param { ?VoidCallback } event
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFinish(event: ?VoidCallback): VideoAttribute

    /**
     * Called when playback fails.
     *
     * @param { ?VoidCallback } event
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onError(event: ?VoidCallback): VideoAttribute

    /**
     * Called when the video preparation is complete.
     * Anonymous Object Rectification.
     *
     * @param { ?Callback<PreparedInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPrepared(callback: ?Callback<PreparedInfo, Unit>): VideoAttribute

    /**
     * Called when the time information is reported when the progress bar process is operated.
     * Anonymous Object Rectification.
     *
     * @param { ?Callback<PlaybackInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSeeking(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the playback time information is reported after the operation progress bar is completed.
     * Anonymous Object Rectification.
     *
     * @param { ?Callback<PlaybackInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSeeked(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the playback progress changes.
     * Anonymous Object Rectification.
     *
     * @param { ?Callback<PlaybackInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onUpdate(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the video enters and exits the full screen.
     * Anonymous Object Rectification.
     *
     * @param { ?Callback<FullscreenInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFullscreenChange(callback: ?Callback<FullscreenInfo, Unit>): VideoAttribute
}
