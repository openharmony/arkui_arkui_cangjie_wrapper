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
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import std.convert.*
import ohos.arkui.component.util.*

foreign {
    func FfiOHOSAceFrameworkVideoCreate(src: CString, progressRate: Float64, preview: CString, controller: Int64): Unit

    func FfiOHOSAceFrameworkVideoMuted(muted: Bool): Unit

    func FfiOHOSAceFrameworkVideoAutoPlay(autoPlay: Bool): Unit

    func FfiOHOSAceFrameworkVideoControls(controls: Bool): Unit

    func FfiOHOSAceFrameworkVideoObjectFit(objectFit: Int32): Unit

    func FfiOHOSAceFrameworkVideoLoop(loop: Bool): Unit

    func FfiOHOSAceFrameworkVideoEnableAnalyzer(enable: Bool): Unit

    func FfiOHOSAceFrameworkVideoOnStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnPause(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnFinish(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnError(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnStop(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnPrepared(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnSeeking(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnSeeked(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnUpdate(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoOnFullscreenChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkVideoControllerCreate(): Int64

    func FfiOHOSAceFrameworkVideoControllerStart(selfID: Int64): Unit

    func FfiOHOSAceFrameworkVideoControllerStop(selfID: Int64): Unit

    func FfiOHOSAceFrameworkVideoControllerPause(selfID: Int64): Unit

    func FfiOHOSAceFrameworkVideoControllerReset(selfID: Int64): Unit

    func FfiOHOSAceFrameworkVideoControllerSetCurrentTime(time: Int32, seekMode: Int32, selfID: Int64): Unit

    func FfiOHOSAceFrameworkVideoControllerRequestFullscreen(fullScreen: Bool, selfID: Int64): Unit

    func FfiOHOSAceFrameworkVideoControllerExitFullscreen(selfID: Int64): Unit
}

/**
 * Defines the video controller.
 *
 * @relation interface PreparedInfo
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PreparedInfo {
    /**
     * The duration of the current video, in seconds.
     * Anonymous Object Rectification.
     *
     * @type { Int32 }
     * @relation duration: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: ?Int32

    init(duration: Int32) {
        this.duration = duration
    }
}

/**
 * Playback information of the video.
 *
 * @relation interface PlaybackInfo
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PlaybackInfo {
    /**
     * The duration of the current video, in seconds.
     * Anonymous Object Rectification.
     *
     * @type { Int32 }
     * @relation time: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var time: ?Int32

    init(time: Int32) {
        this.time = time
    }
}

/**
 * Fullscreen information of the video.
 *
 * @relation interface FullscreenInfo
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FullscreenInfo {
    /**
     * The flag whether play in full screen.
     * Anonymous Object Rectification.
     *
     * @type { Bool }
     * @relation fullscreen: boolean
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fullscreen: ?Bool

    init(fullscreen: ?Bool) {
        this.fullscreen = fullscreen ?? false
    }
}

/**
 * Defines the video controller.
 *
 * @relation class VideoController
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class VideoController <: RemoteDataLite {
    /**
     * constructor.
     *
     * @relation constructor()
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe { FfiOHOSAceFrameworkVideoControllerCreate() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Provides events to play.
     *
     * @relation start(): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(): Unit {
        unsafe { FfiOHOSAceFrameworkVideoControllerStart(this.getID()) }
    }

    /**
     * Provides a pause event for playback.
     *
     * @relation pause(): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pause(): Unit {
        unsafe { FfiOHOSAceFrameworkVideoControllerPause(this.getID()) }
    }

    /**
     * Provides an event to stop playback.
     *
     * @relation stop(): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stop(): Unit {
        unsafe { FfiOHOSAceFrameworkVideoControllerStop(this.getID()) }
    }

    /**
     * Provide the progress method of video playback.
     *
     * @param { Int32 } value
     * @param { SeekMode } seekMode
     * @relation setCurrentTime(value: number, seekMode: SeekMode): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setCurrentTime(value: Int32, seekMode: ?SeekMode): Unit {
        let tmpSeekMode = seekMode ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkVideoControllerSetCurrentTime(value, tmpSeekMode.getValue(), this.getID())
        }
    }

    /**
     * Provides a full screen playback method.
     *
     * @param { Bool } value
     * @relation requestFullscreen(value: boolean): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func requestFullscreen(value: ?Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkVideoControllerRequestFullscreen(value ?? false, this.getID())
        }
    }

    /**
     * Provides a method to exit full screen playback.
     *
     * @relation exitFullscreen(): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func exitFullscreen(): Unit {
        unsafe {
            FfiOHOSAceFrameworkVideoControllerExitFullscreen(this.getID())
        }
    }
}

/**
 * Defines Video Component.
 *
 * @relation const Video: VideoInterface
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Video <: CommonMethodComponent<VideoAttribute> & VideoAttribute {
    /**
     * Set the value.
     *
     * @param { ResourceStr } src
     * @param { PlaybackSpeed } currentProgressRate
     * @param { ResourceStr } previewUri
     * @param { VideoController } controller
     * @returns { Video }
     * @relation (value: VideoOptions): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: ?ResourceStr = None,
        currentProgressRate!: ?PlaybackSpeed = Option.None,
        previewUri!: ?ResourceStr = None,
        controller!: ?VideoController = None
    ) {
        let tmpCurrentProgressRate = currentProgressRate ?? SpeedForward100X
        let tmpController = controller ?? VideoController()
        let src_ = transResourceStrToString(src ?? "")
        let previewUri_ = transResourceStrToString(previewUri ?? "")
        unsafe {
            try (srcStr = LibC.mallocCString(src_).asResource(),
                 previewUriStr = LibC.mallocCString(previewUri_).asResource()
            ) {
                FfiOHOSAceFrameworkVideoCreate(srcStr.value, tmpCurrentProgressRate.getValue(), previewUriStr.value, tmpController.getID())
            }
        }
    }

    /**
     * Called when judging whether the video is muted.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation muted(value: boolean): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func muted(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoMuted(value ?? false)
        }
        this
    }

    /**
     * Called when judging whether the video is played automatically.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation autoPlay(value: boolean): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoPlay(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoAutoPlay(value ?? false)
        }
        this
    }

    /**
     * Called when judging whether the control bar is displayed.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation controls(value: boolean): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func controls(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoControls(value ?? true)
        }
        this
    }

    /**
     * Called when determining the zoom type of the video source.
     *
     * @param { ImageFit } value
     * @returns { This }
     * @relation objectFit(value: ImageFit): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func objectFit(value: ?ImageFit): This {
        let tmpValue = value ?? ImageFit.Cover
        unsafe {
            FfiOHOSAceFrameworkVideoObjectFit(tmpValue.getValue())
        }
        this
    }

    /**
     * Called when judging whether the video is played circular.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation loop(value: boolean): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func loop(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoLoop(value ?? false)
        }
        this
    }

    /**
     * Called when the video is played.
     * Anonymous Object Rectification.
     *
     * @param { VoidCallback } event
     * @returns { This }
     * @relation onStart(event: VoidCallback): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStart(event: ?VoidCallback): This {
        let tmpEvent = event ?? { => }
        let wrapper = {
            _: CString => tmpEvent()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnStart(lambdaData.getID())
        }
        this
    }

    /**
     * Called when the video is paused.
     * Anonymous Object Rectification.
     *
     * @param { VoidCallback } event
     * @returns { This }
     * @relation onPause(event: VoidCallback): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPause(event: ?VoidCallback): This {
        let tmpEvent = event ?? { => }
        let wrapper = {
            _: CString => tmpEvent()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnPause(lambdaData.getID())
        }
        this
    }

    /**
     * Called when the video playback ends.
     * Anonymous Object Rectification.
     *
     * @param { VoidCallback } event
     * @returns { This }
     * @relation onFinish(event: VoidCallback): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFinish(event: ?() -> Unit): This {
        let tmpEvent = event ?? { => }
        let wrapper = {
            _: CString => tmpEvent()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnFinish(lambdaData.getID())
        }
        this
    }

    /**
     * Called when playback fails.
     *
     * @param { VoidCallback } event
     * @returns { This}
     * @relation onError(event: VoidCallback): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onError(event: ?VoidCallback): This {
        let tmpEvent = event ?? { => }
        let wrapper = {
            _: CString => tmpEvent()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnError(lambdaData.getID())
        }
        this
    }

    /**
     * Called when the video preparation is complete.
     * Anonymous Object Rectification.
     *
     * @param { Callback<PreparedInfo, Unit> } callback
     * @returns { This}
     * @relation onPrepared(callback: Callback<PreparedInfo>): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPrepared(callback: ?Callback<PreparedInfo, Unit>): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            duration: Int32 => tmpCallback(PreparedInfo(duration))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnPrepared(lambdaData.getID())
        }
        this
    }

    /**
     * Called when the time information is reported when the progress bar process is operated.
     * Anonymous Object Rectification.
     *
     * @param { Callback<PlaybackInfo, Unit> } callback
     * @returns { This}
     * @relation onSeeking(callback: Callback<PlaybackInfo>): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSeeking(callback: ?Callback<PlaybackInfo, Unit>): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            time: Int32 => tmpCallback(PlaybackInfo(time))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnSeeking(lambdaData.getID())
        }
        this
    }

    /**
     * Called when the playback time information is reported after the operation progress bar is completed.
     * Anonymous Object Rectification.
     *
     * @param { Callback<PlaybackInfo, Unit> } callback
     * @returns { This }
     * @relation onSeeked(callback: Callback<PlaybackInfo>): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSeeked(callback: ?Callback<PlaybackInfo, Unit>): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            time: Int32 => tmpCallback(PlaybackInfo(time))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnSeeked(lambdaData.getID())
        }
        this
    }

    /**
     * Called when the playback progress changes.
     * Anonymous Object Rectification.
     *
     * @param { Callback<PlaybackInfo, Unit> } callback
     * @returns { This }
     * @relation onUpdate(callback: Callback<PlaybackInfo>): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onUpdate(callback: ?Callback<PlaybackInfo, Unit>): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            time: Int32 => tmpCallback(PlaybackInfo(time))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnUpdate(lambdaData.getID())
        }
        this
    }

    /**
     * Called when the video enters and exits the full screen.
     * Anonymous Object Rectification.
     *
     * @param { Callback<FullscreenInfo, Unit> } callback
     * @returns { This }
     * @relation onFullscreenChange(callback: Callback<FullscreenInfo>): VideoAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFullscreenChange(callback: ?Callback<FullscreenInfo, Unit>): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            fullscreen: Bool => tmpCallback(FullscreenInfo(fullscreen))
        }
        let lambdaData = Callback1Param<Bool, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnFullscreenChange(lambdaData.getID())
        }
        this
    }
}
