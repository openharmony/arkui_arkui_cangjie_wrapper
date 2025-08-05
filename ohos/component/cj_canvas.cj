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

foreign {
    func FfiOHOSAceFrameworkCanvasCreate(contextId: Int64): Unit

    func FfiOHOSAceFrameworkCanvasOnReady(callback: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextCreateLinearGradient(
        selfId: Int64,
        x0: Float64,
        y0: Float64,
        x1: Float64,
        y1: Float64
    ): Int64

    func FfiOHOSAceFrameworkRenderingContextCreateRadialGradient(
        selfId: Int64,
        x0: Float64,
        y0: Float64,
        r0: Float64,
        x1: Float64,
        y1: Float64,
        r1: Float64
    ): Int64

    func FfiOHOSAceFrameworkCanvasGradientAddColorStop(selfId: Int64, offset: Float64, color: UInt32): Unit
}

@C
public struct TextMetrics {
    public var width: Float64 = 0.0
    public var height: Float64 = 0.0
}

@C
struct ImageInfo {
    ImageInfo(
        let flag: Int32,
        let sx: Float64,
        let sy: Float64,
        let sWidth: Float64,
        let sHeight: Float64,
        let dx: Float64,
        let dy: Float64,
        let dWidth: Float64,
        let dHeight: Float64
    ) {}
}

@C
struct TransformParams {
    TransformParams(
        let scaleX: Float64,
        let skewX: Float64,
        let skewY: Float64,
        let scaleY: Float64,
        let translateX: Float64,
        let translateY: Float64
    ) {}
}

@C
struct ArcParams {
    ArcParams(
        let x: Float64,
        let y: Float64,
        let radius: Float64,
        let startAngle: Float64,
        let endAngle: Float64
    ) {}
}

@C
struct ArcToParams {
    ArcToParams(
        let x1: Float64,
        let y1: Float64,
        let x2: Float64,
        let y2: Float64,
        let radius: Float64
    ) {}
}

@C
struct QuadraticCurveToParams {
    QuadraticCurveToParams(
        let cpx: Float64,
        let cpy: Float64,
        let x: Float64,
        let y: Float64
    ) {}
}

@C
struct BezierCurveToParams {
    BezierCurveToParams(
        let cp1x: Float64,
        let cp1y: Float64,
        let cp2x: Float64,
        let cp2y: Float64,
        let x: Float64,
        let y: Float64
    ) {}
}

@C
struct EllipseParams {
    EllipseParams(
        let x: Float64,
        let y: Float64,
        let radiusX: Float64,
        let radiusY: Float64,
        let rotation: Float64,
        let startAngle: Float64,
        let endAngle: Float64
    ) {}
}

@C
struct RectParams {
    RectParams(
        let x: Float64,
        let y: Float64,
        let width: Float64,
        let height: Float64
    ) {}
}

enum CanvasImageType {
    CoordinatesOnly
    | CoordinatesAndSize
    | CoordinatesAndSizeWithSource

    func getValue(): Int32 {
        match (this) {
            case CoordinatesOnly => 0
            case CoordinatesAndSize => 1
            case CoordinatesAndSizeWithSource => 2
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RenderingContextSettings {
    public var antialias: Bool
    public init(antialias!: Bool = false) {
        this.antialias = antialias
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Canvas <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(context: CanvasRenderingContext2D) {
        unsafe {
            FfiOHOSAceFrameworkCanvasCreate(context.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReady(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasOnReady(Callback0Param<Unit>(callback).getID())
        }
        this
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CanvasGradient <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(contextId: Int64, x0: Float64, y0: Float64, x1: Float64, y1: Float64) {
        super(unsafe {
            FfiOHOSAceFrameworkRenderingContextCreateLinearGradient(contextId, x0, y0, x1, y1)
        })
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(contextId: Int64, x0: Float64, y0: Float64, r0: Float64, x1: Float64, y1: Float64, r1: Float64) {
        super(unsafe {
            FfiOHOSAceFrameworkRenderingContextCreateRadialGradient(contextId, x0, y0, r0, x1, y1, r1)
        })
    }

    init(selfID: Int64) {
        super(selfID)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addColorStop(offset: Float64, color: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasGradientAddColorStop(this.getID(), offset, transAppResourceToResourceColor(color))
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addColorStop(offset: Int64, color: ResourceColor): Unit {
        addColorStop(Float64(offset), color)
    }
}
