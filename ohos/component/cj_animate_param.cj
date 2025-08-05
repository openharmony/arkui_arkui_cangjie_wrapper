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

@C
struct NativeAnimateParam {
    NativeAnimateParam(
        let duration: NativeOptionInt32,
        let tempo: NativeOptionFloat32,
        let curve: NativeOptionCString,
        let delay: NativeOptionInt32,
        let iterations: NativeOptionInt32,
        let playMode: NativeOptionInt32,
        let onFinish: NativeOptionCallBack,
        let finishCallbackType: NativeOptionInt32,
        let min: NativeOptionInt32,
        let max: NativeOptionInt32,
        let expected: NativeOptionInt32
    ) {}

    init() {
        this.duration = NativeOptionInt32(false, 0)
        this.tempo = NativeOptionFloat32(false, 0.0)
        this.curve = unsafe { NativeOptionCString(false, CString(CPointer())) }
        this.delay = NativeOptionInt32(false, 0)
        this.iterations = NativeOptionInt32(false, 0)
        this.playMode = NativeOptionInt32(false, 0)
        this.onFinish = NativeOptionCallBack(false, Callback0Param<Unit>({=>}).getID())
        this.finishCallbackType = NativeOptionInt32(false, 0)
        this.min = NativeOptionInt32(false, 0)
        this.max = NativeOptionInt32(false, 0)
        this.expected = NativeOptionInt32(false, 0)
    }

    func free() {
        this.curve.free()
    }
}

@C
struct NativeOptionAnimateParam {
    NativeOptionAnimateParam(
        let hasValue: Bool,
        let value: NativeAnimateParam
    ) {}

    func free() {
        this.value.free()
    }
}

@!APILevel[
    12,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FinishCallbackType {
    @!APILevel[
        12,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    REMOVED
    | @!APILevel[
        16,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LOGICALLY
    | ...

    func getValue(): Int32 {
        match (this) {
            case REMOVED => 0
            case LOGICALLY => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ExpectedFrameRateRange {
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ExpectedFrameRateRange(
        @!APILevel[
            12,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var min!: Int32,
        @!APILevel[
            12,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var max!: Int32,
        @!APILevel[
            12,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var expected!: Int32
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AnimateParam {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var duration: Option<Int32>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var tempo: Option<Float32>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var curve: Option<Curve>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var delay: Option<Int32>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var iterations: Option<Int32>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var playMode: Option<PlayMode>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onFinish: Option<() -> Unit>
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var finishCallbackType: Option<FinishCallbackType>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var expectedFrameRateRange: Option<ExpectedFrameRateRange>

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        duration!: Option<Int32> = 1000,
        tempo!: Option<Float32> = 1.0,
        curve!: Option<Curve> = Curve.EaseInOut,
        delay!: Option<Int32> = 0,
        iterations!: Option<Int32> = 1,
        playMode!: Option<PlayMode> = PlayMode.Normal,
        onFinish!: Option<() -> Unit> = Option.None,
        finishCallbackType!: Option<FinishCallbackType> = FinishCallbackType.REMOVED,
        expectedFrameRateRange!: Option<ExpectedFrameRateRange> = Option.None
    ) {
        this.duration = duration
        this.tempo = tempo
        this.curve = curve
        this.delay = delay
        this.iterations = iterations
        this.playMode = playMode
        this.onFinish = onFinish
        this.finishCallbackType = finishCallbackType
        this.expectedFrameRateRange = expectedFrameRateRange
    }
}

func parseAnimateParam(params: AnimateParam): NativeAnimateParam {
    let duration = match (params.duration) {
        case Some(value) => NativeOptionInt32(true, value)
        case None => NativeOptionInt32(false, 0)
    }

    let tempo = match (params.tempo) {
        case Some(value) => NativeOptionFloat32(true, value)
        case None => NativeOptionFloat32(false, 0.0)
    }

    let curveCStrng = unsafe {
        match (params.curve) {
            case Some(value) => NativeOptionCString(true, LibC.mallocCString(value.getValue()))
            case None => NativeOptionCString(false, CString(CPointer()))
        }
    }

    let delay = unsafe {
        match (params.delay) {
            case Some(value) => NativeOptionInt32(true, value)
            case None => NativeOptionInt32(false, 0)
        }
    }

    let iterations = unsafe {
        match (params.iterations) {
            case Some(value) => NativeOptionInt32(true, value)
            case None => NativeOptionInt32(false, 0)
        }
    }

    let playMode = unsafe {
        match (params.playMode) {
            case Some(value) => NativeOptionInt32(true, value.getValue())
            case None => NativeOptionInt32(false, 0)
        }
    }

    let onFinish = unsafe {
        match (params.onFinish) {
            case Some(value) => NativeOptionCallBack(true, Callback0Param<Unit>(value).getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }
    }

    let finishCallbackType = unsafe {
        match (params.finishCallbackType) {
            case Some(value) => NativeOptionInt32(true, value.getValue())
            case None => NativeOptionInt32(false, 0)
        }
    }

    let min = unsafe {
        match (params.expectedFrameRateRange) {
            case Some(value) => NativeOptionInt32(true, value.min)
            case None => NativeOptionInt32(false, 0)
        }
    }

    let max = unsafe {
        match (params.expectedFrameRateRange) {
            case Some(value) => NativeOptionInt32(true, value.max)
            case None => NativeOptionInt32(false, 0)
        }
    }

    let expected = unsafe {
        match (params.expectedFrameRateRange) {
            case Some(value) => NativeOptionInt32(true, value.expected)
            case None => NativeOptionInt32(false, 0)
        }
    }

    return NativeAnimateParam(
        duration,
        tempo,
        curveCStrng,
        delay,
        iterations,
        playMode,
        onFinish,
        finishCallbackType,
        min,
        max,
        expected
    )
}
