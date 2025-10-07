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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.path_2d

import ohos.arkui.component.native_struct.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

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

/**
 * 2D path object for path drawing.
 *
 * @relation declare class Path2D extends CanvasPath
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Path2D <: RemoteDataLite {

    /**
     * Create an empty path object.
     *
     * @returns { This }
     * @relation constructor()
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkCanvasPathCtor()
        })
    }

    /**
     * Create a new path according to the description.
     *
     * @param { String } path
     * @returns { This }
     * @relation constructor(d: string)
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(path: String) {
        super(
            unsafe {
                var id = 0
                try (pathString = LibC.mallocCString(path).asResource()) {
                    id = FfiOHOSAceFrameworkCanvasPathCtorWithPath(pathString.value)
                }
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Adds a path according to the specified path variable.
     *
     * @param { Path2D } path2D
     * @relation addPath(path: Path2D, transform?: Matrix2D): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPath(path2D: Path2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathAddPath(this.getID(), path2D.getID());
        }
    }

    /**
     * Adds 2D transformation effects, including rotation, translation, and scaling.
     * The current transformation matrix will not be overwritten. Multiple transformations will be superimposed.
     *
     * @param { Float64 } scaleX
     * @param { Float64 } skewX
     * @param { Float64 } skewY
     * @param { Float64 } scaleY
     * @param { Float64 } translateX
     * @param { Float64 } translateY
     * @relation setTransform(a: number, b: number, c: number, d: number, e: number, f: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(
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

    /**
     * Moves the start point of a new sub-path to the (x, y) coordinate.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @relation moveTo(x: number, y: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathMoveTo(this.getID(), x, y);
        }
    }

    /**
     * Connect sub-path using straight lines.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @relation lineTo(x: number, y: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathLineTo(this.getID(), x, y);
        }
    }

    /**
     * Draw an arc path.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @param { Float64 } radius
     * @param { Float64 } startAngle
     * @param { Float64 } endAngle
     * @param { Bool } counterclockwise
     * @relation arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        counterclockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathArc(this.getID(), ArcParams(x, y, radius, startAngle, endAngle), counterclockwise);
        }
    }

    /**
     * Draw arc paths based on control points and radius.
     *
     * @param { Float64 } x1
     * @param { Float64 } y1
     * @param { Float64 } x2
     * @param { Float64 } y2
     * @param { Float64 } radius
     * @relation arcTo(x1: number, y1: number, x2: number, y2: number, radius: number): void
     */
    @!APILevel[
        21,
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

    /**
     * Draw quadratic Bezier curve paths.
     *
     * @param { Float64 } cpx
     * @param { Float64 } cpy
     * @param { Float64 } x
     * @param { Float64 } y
     * @relation quadraticCurveTo(cpx: number, cpy: number, x: number, y: number): void
     */
    @!APILevel[
        21,
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

    /**
     * Drawing Cubic Bessel Curve Paths.
     *
     * @param { Float64 } cp1x
     * @param { Float64 } cp1y
     * @param { Float64 } cp2x
     * @param { Float64 } cp2y
     * @param { Float64 } x
     * @param { Float64 } y
     * @relation bezierCurveTo(cp1x: number, cp1y: number, cp2x: number, cp2y: number, x: number, y: number): void
     */
    @!APILevel[
        21,
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

    /**
     * Draw an Elliptic Path.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @param { Float64 } radiusX
     * @param { Float64 } radiusY
     * @param { Float64 } rotation
     * @param { Float64 } startAngle
     * @param { Float64 } endAngle
     * @param { Bool } counterclockwise
     * @relation   ellipse(
                    x: number,
                    y: number,
                    radiusX: number,
                    radiusY: number,
                    rotation: number,
                    startAngle: number,
                    endAngle: number,
                    counterclockwise?: boolean,
                   ): void
     */
    @!APILevel[
        21,
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
        counterclockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathEllipse(
                this.getID(),
                EllipseParams(x, y, radiusX, radiusY, rotation, startAngle, endAngle),
                counterclockwise
            );
        }
    }

    /**
     * Draw Rectangular Paths.
     *
     * @param { Float64 } x
     * @param { Float64 } y
     * @param { Float64 } width
     * @param { Float64 } height
     * @relation rect(x: number, y: number, w: number, h: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathRect(this.getID(), RectParams(x, y, x + width, y + height));
        }
    }

    /**
     * Returns the pen point to the start point of the current sub-path.
     *
     * @relation closePath(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closePath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathClosePath(this.getID());
        }
    }
}
