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

package ohos.component

import std.convert.*

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class VideoController <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe { FfiOHOSAceFrameworkVideoControllerCreate() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(): Unit {
        unsafe { FfiOHOSAceFrameworkVideoControllerStart(this.getID()) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pause(): Unit {
        unsafe { FfiOHOSAceFrameworkVideoControllerPause(this.getID()) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stop(): Unit {
        unsafe { FfiOHOSAceFrameworkVideoControllerStop(this.getID()) }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(): Unit {
        unsafe { FfiOHOSAceFrameworkVideoControllerReset(this.getID()) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setCurrentTime(time: Int32, seekMode: SeekMode): Unit {
        unsafe {
            FfiOHOSAceFrameworkVideoControllerSetCurrentTime(time, seekMode.getValue(), this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func requestFullscreen(fullScreen: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkVideoControllerRequestFullscreen(fullScreen, this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func exitFullscreen(): Unit {
        unsafe {
            FfiOHOSAceFrameworkVideoControllerExitFullscreen(this.getID())
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Video <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: String = "",
        currentProgressRate!: Float64 = 1.0,
        previewUri!: String = "",
        controller!: VideoController = VideoController()
    ) {
        unsafe {
            var srcStr = LibC.mallocCString(src)
            var previewUriStr = LibC.mallocCString(previewUri)
            FfiOHOSAceFrameworkVideoCreate(srcStr, currentProgressRate, previewUriStr, controller.getID())
            LibC.free(srcStr)
            LibC.free(previewUriStr)
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: String = "",
        currentProgressRate!: PlaybackSpeed,
        previewUri!: String = "",
        controller!: VideoController = VideoController()
    ) {
        this(
            src: src,
            currentProgressRate: currentProgressRate.getValue(),
            previewUri: previewUri,
            controller: controller
        )
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: AppResource,
        currentProgressRate!: Float64 = 1.0,
        previewUri!: AppResource,
        controller!: VideoController = VideoController()
    ) {
        this(
            src: getResourceMedia(src),
            currentProgressRate: currentProgressRate,
            previewUri: getResourceMedia(previewUri),
            controller: controller
        )
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: AppResource,
        currentProgressRate!: PlaybackSpeed,
        previewUri!: AppResource,
        controller!: VideoController = VideoController()
    ) {
        this(
            src: getResourceMedia(src),
            currentProgressRate: currentProgressRate.getValue(),
            previewUri: getResourceMedia(previewUri),
            controller: controller
        )
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: String = "",
        currentProgressRate!: Float64 = 1.0,
        previewUri!: AppResource,
        controller!: VideoController = VideoController()
    ) {
        this(
            src: src,
            currentProgressRate: currentProgressRate,
            previewUri: getResourceMedia(previewUri),
            controller: controller
        )
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: String = "",
        currentProgressRate!: PlaybackSpeed,
        previewUri!: AppResource,
        controller!: VideoController = VideoController()
    ) {
        this(
            src: src,
            currentProgressRate: currentProgressRate.getValue(),
            previewUri: getResourceMedia(previewUri),
            controller: controller
        )
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: AppResource,
        currentProgressRate!: Float64 = 1.0,
        previewUri!: String = "",
        controller!: VideoController = VideoController()
    ) {
        this(
            src: getResourceMedia(src),
            currentProgressRate: currentProgressRate,
            previewUri: previewUri,
            controller: controller
        )
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: AppResource,
        currentProgressRate!: PlaybackSpeed,
        previewUri!: String = "",
        controller!: VideoController = VideoController()
    ) {
        this(
            src: getResourceMedia(src),
            currentProgressRate: currentProgressRate.getValue(),
            previewUri: previewUri,
            controller: controller
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func muted(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoMuted(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoPlay(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoAutoPlay(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func controls(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoControls(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func objectFit(value: ImageFit): This {
        unsafe {
            FfiOHOSAceFrameworkVideoObjectFit(value.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func loop(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoLoop(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableAnalyzer(enable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkVideoEnableAnalyzer(enable)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStart(callback: () -> Unit): This {
        let wrapper = {
            _: CString => callback()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnStart(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPause(callback: () -> Unit): This {
        let wrapper = {
            _: CString => callback()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnPause(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFinish(callback: () -> Unit): This {
        let wrapper = {
            _: CString => callback()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnFinish(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onError(callback: () -> Unit): This {
        let wrapper = {
            _: CString => callback()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnError(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStop(callback: () -> Unit): This {
        let wrapper = {
            _: CString => callback()
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkVideoOnStop(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPrepared(callback: (Int32) -> Unit): This {
        let lambdaData = Callback1Param<Int32, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkVideoOnPrepared(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSeeking(callback: (Int32) -> Unit): This {
        let lambdaData = Callback1Param<Int32, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkVideoOnSeeking(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSeeked(callback: (Int32) -> Unit): This {
        let lambdaData = Callback1Param<Int32, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkVideoOnSeeked(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onUpdate(callback: (Int32) -> Unit): This {
        let lambdaData = Callback1Param<Int32, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkVideoOnUpdate(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFullscreenChange(callback: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkVideoOnFullscreenChange(lambdaData.getID())
        }
        this
    }
}
