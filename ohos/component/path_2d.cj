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
    func FfiOHOSAceFrameworkCanvasPathCtor(): Int64

    func FfiOHOSAceFrameworkCanvasPathCtorWithUnit(unit: Int32): Int64

    func FfiOHOSAceFrameworkCanvasPathCtorWithPath(path: CString): Int64

    func FfiOHOSAceFrameworkCanvasPathCtorWithPathAndUnit(path: CString, unit: Int32): Int64

    func FfiOHOSAceFrameworkCanvasPathAddPath(selfId: Int64, pathId: Int64): Unit

    func FfiOHOSAceFrameworkCanvasPathAddPathWithMatrix(selfId: Int64, pathId: Int64, transform: Int64): Unit

    func FfiOHOSAceFrameworkCanvasPathSetTransform(selfId: Int64, params: TransformParams): Unit

    func FfiOHOSAceFrameworkCanvasPathMoveTo(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkCanvasPathLineTo(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkCanvasPathArc(selfId: Int64, params: ArcParams, anticlockwise: Bool): Unit

    func FfiOHOSAceFrameworkCanvasPathArcTo(selfId: Int64, params: ArcToParams): Unit

    func FfiOHOSAceFrameworkCanvasPathQuadraticCurveTo(selfId: Int64, params: QuadraticCurveToParams): Unit

    func FfiOHOSAceFrameworkCanvasPathBezierCurveTo(selfId: Int64, params: BezierCurveToParams): Unit

    func FfiOHOSAceFrameworkCanvasPathEllipse(selfId: Int64, params: EllipseParams, anticlockwise: Bool): Unit

    func FfiOHOSAceFrameworkCanvasPathRect(selfId: Int64, params: RectParams): Unit

    func FfiOHOSAceFrameworkCanvasPathClosePath(selfId: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Path2D <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(unit: LengthMetricsUnit) {
        super(unsafe {
            FfiOHOSAceFrameworkCanvasPathCtorWithUnit(unit.getValue())
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
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkCanvasPathCtor()
        })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(path: String, unit: LengthMetricsUnit) {
        super(
            unsafe {
                let pathString = LibC.mallocCString(path)
                let id = FfiOHOSAceFrameworkCanvasPathCtorWithPathAndUnit(pathString, unit.getValue())
                LibC.free(pathString)
                id
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
    public init(path: String) {
        super(
            unsafe {
                let pathString = LibC.mallocCString(path)
                let id = FfiOHOSAceFrameworkCanvasPathCtorWithPath(pathString)
                LibC.free(pathString)
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPath(path2D: Path2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathAddPath(this.getID(), path2D.getID());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPath(path2D: Path2D, transform: Matrix2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathAddPathWithMatrix(this.getID(), path2D.getID(), transform.getID());
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
    public func transform(
        scaleX: Float64,
        skewX: Float64,
        skewY: Float64,
        scaleY: Float64,
        translateX: Float64,
        translateY: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathSetTransform(
                this.getID(),
                TransformParams(scaleX, skewX, skewY, scaleY, translateX, translateY)
            );
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
    public func transform(
        scaleX: Int64,
        skewX: Int64,
        skewY: Int64,
        scaleY: Int64,
        translateX: Int64,
        translateY: Int64
    ): Unit {
        transform(
            Float64(scaleX),
            Float64(skewX),
            Float64(skewY),
            Float64(scaleY),
            Float64(translateX),
            Float64(translateY)
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathMoveTo(this.getID(), x, y);
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
    public func moveTo(x: Int64, y: Int64): Unit {
        moveTo(Float64(x), Float64(y))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathLineTo(this.getID(), x, y);
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
    public func lineTo(x: Int64, y: Int64): Unit {
        lineTo(Float64(x), Float64(y))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        anticlockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathArc(this.getID(), ArcParams(x, y, radius, startAngle, endAngle), anticlockwise);
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
    public func arc(
        x: Int64,
        y: Int64,
        radius: Int64,
        startAngle: Int64,
        endAngle: Int64,
        anticlockwise!: Bool = false
    ): Unit {
        arc(Float64(x), Float64(y), Float64(radius), Float64(startAngle), Float64(endAngle),
            anticlockwise: anticlockwise)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arcTo(
        x1: Float64,
        y1: Float64,
        x2: Float64,
        y2: Float64,
        radius: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathArcTo(this.getID(), ArcToParams(x1, y1, x2, y2, radius));
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
    public func arcTo(
        x1: Int64,
        y1: Int64,
        x2: Int64,
        y2: Int64,
        radius: Int64
    ): Unit {
        arcTo(Float64(x1), Float64(y1), Float64(x2), Float64(y2), Float64(radius))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func quadraticCurveTo(
        cpx: Float64,
        cpy: Float64,
        x: Float64,
        y: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathQuadraticCurveTo(this.getID(), QuadraticCurveToParams(cpx, cpy, x, y));
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
    public func quadraticCurveTo(
        cpx: Int64,
        cpy: Int64,
        x: Int64,
        y: Int64
    ): Unit {
        quadraticCurveTo(Float64(cpx), Float64(cpy), Float64(x), Float64(y))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bezierCurveTo(
        cp1x: Float64,
        cp1y: Float64,
        cp2x: Float64,
        cp2y: Float64,
        x: Float64,
        y: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathBezierCurveTo(this.getID(), BezierCurveToParams(cp1x, cp1y, cp2x, cp2y, x, y));
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
    public func bezierCurveTo(
        cp1x: Int64,
        cp1y: Int64,
        cp2x: Int64,
        cp2y: Int64,
        x: Int64,
        y: Int64
    ): Unit {
        bezierCurveTo(Float64(cp1x), Float64(cp1y), Float64(cp2x), Float64(cp2y), Float64(x), Float64(y))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func ellipse(
        x: Float64,
        y: Float64,
        radiusX: Float64,
        radiusY: Float64,
        rotation: Float64,
        startAngle: Float64,
        endAngle: Float64,
        anticlockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathEllipse(
                this.getID(),
                EllipseParams(x, y, radiusX, radiusY, rotation, startAngle, endAngle),
                anticlockwise
            );
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
    public func ellipse(
        x: Int64,
        y: Int64,
        radiusX: Int64,
        radiusY: Int64,
        rotation: Int64,
        startAngle: Int64,
        endAngle: Int64,
        anticlockwise!: Bool = false
    ): Unit {
        ellipse(
            Float64(x),
            Float64(y),
            Float64(radiusX),
            Float64(radiusY),
            Float64(rotation),
            Float64(startAngle),
            Float64(endAngle),
            anticlockwise: anticlockwise
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathRect(this.getID(), RectParams(x, y, x + width, y + height));
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
    public func rect(x: Int64, y: Int64, width: Int64, height: Int64): Unit {
        rect(Float64(x), Float64(y), Float64(width), Float64(height))
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closePath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathClosePath(this.getID());
        }
    }
}
