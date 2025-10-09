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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface VideoAttribute <: CommonMethod<VideoAttribute> {
    /**
     * Called when judging whether the video is muted.
     *
     * @params { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func muted(value: ?Bool): VideoAttribute

    /**
     * Called when judging whether the video is played automatically.
     *
     * @params { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoPlay(value: ?Bool): VideoAttribute

    /**
     * Called when judging whether the control bar is displayed.
     *
     * @params { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func controls(value: ?Bool): VideoAttribute

    /**
     * Called when determining the zoom type of the video source.
     *
     * @params { ?ImageFit } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func objectFit(value: ?ImageFit): VideoAttribute

    /**
     * Called when judging whether the video is played circular.
     *
     * @params { ?Bool } value
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func loop(value: ?Bool): VideoAttribute

    /**
     * Called when the video is played.
     * Anonymous Object Rectification.
     *
     * @params { ?VoidCallback } event
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onStart(event: ?VoidCallback): VideoAttribute

    /**
     * Called when the video is paused.
     * Anonymous Object Rectification.
     *
     * @params { ?VoidCallback } event
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPause(event: ?VoidCallback): VideoAttribute

    /**
     * Called when the video playback ends.
     * Anonymous Object Rectification.
     *
     * @params { ?VoidCallback } event
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFinish(event: ?() -> Unit): VideoAttribute

    /**
     * Called when playback fails.
     *
     * @params { ?VoidCallback } event
     * @returns { This}
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onError(event: ?VoidCallback): VideoAttribute

    /**
     * Called when the video preparation is complete.
     * Anonymous Object Rectification.
     *
     * @params { ?Callback<PreparedInfo, Unit> } callback
     * @returns { This}
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPrepared(callback: ?Callback<PreparedInfo, Unit>): VideoAttribute

    /**
     * Called when the time information is reported when the progress bar process is operated.
     * Anonymous Object Rectification.
     *
     * @params { ?Callback<PlaybackInfo, Unit> } callback
     * @returns { This}
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSeeking(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the playback time information is reported after the operation progress bar is completed.
     * Anonymous Object Rectification.
     *
     * @params { ?Callback<PlaybackInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSeeked(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the playback progress changes.
     * Anonymous Object Rectification.
     *
     * @params { ?Callback<PlaybackInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onUpdate(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    /**
     * Called when the video enters and exits the full screen.
     * Anonymous Object Rectification.
     *
     * @params { ?Callback<FullscreenInfo, Unit> } callback
     * @returns { VideoAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFullscreenChange(callback: ?Callback<FullscreenInfo, Unit>): VideoAttribute
}
