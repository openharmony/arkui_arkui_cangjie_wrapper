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
    22,
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
        22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(path: ?String) {
        super(
            unsafe {
                let tmpPath = path ?? throw IllegalArgumentException("The type now is not supported.")
                var id = 0
                try (pathString = LibC.mallocCString(tmpPath).asResource()) {
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPath(path2D: ?Path2D): Unit {
        let tmpPath2D = path2D ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathAddPath(this.getID(), tmpPath2D.getID());
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(
        scaleX: ?Float64,
        skewX: ?Float64,
        skewY: ?Float64,
        scaleY: ?Float64,
        translateX: ?Float64,
        translateY: ?Float64
    ): Unit {
        let tmpScaleX = scaleX ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpSkewX = skewX ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpSkewY = skewY ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpScaleY = scaleY ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpTranslateX = translateX ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpTranslateY = translateY ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathSetTransform(
                this.getID(),
                TransformParams(tmpScaleX, tmpSkewX, tmpSkewY, tmpScaleY, tmpTranslateX, tmpTranslateY)
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveTo(x: ?Float64, y: ?Float64): Unit {
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathMoveTo(this.getID(), tmpX, tmpY);
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineTo(x: ?Float64, y: ?Float64): Unit {
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathLineTo(this.getID(), tmpX, tmpY);
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(
        x: ?Float64,
        y: ?Float64,
        radius: ?Float64,
        startAngle: ?Float64,
        endAngle: ?Float64,
        counterclockwise!: ?Bool = None
    ): Unit {
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpRadius = radius ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpStartAngle = startAngle ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpEndAngle = endAngle ?? throw IllegalArgumentException("The type now is not supported.")
        
        unsafe {
            FfiOHOSAceFrameworkCanvasPathArc(this.getID(), ArcParams(tmpX, tmpY, tmpRadius, tmpStartAngle, tmpEndAngle), counterclockwise ?? false);
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arcTo(
        x1: ?Float64,
        y1: ?Float64,
        x2: ?Float64,
        y2: ?Float64,
        radius: ?Float64
    ): Unit {
        let tmpX1 = x1 ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY1 = y1 ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpX2 = x2 ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY2 = y2 ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpRadius = radius ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathArcTo(this.getID(), ArcToParams(tmpX1, tmpY1, tmpX2, tmpY2, tmpRadius));
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func quadraticCurveTo(
        cpx: ?Float64,
        cpy: ?Float64,
        x: ?Float64,
        y: ?Float64
    ): Unit {
        let tmpCpx = cpx ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpCpy = cpy ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathQuadraticCurveTo(this.getID(), QuadraticCurveToParams(tmpCpx, tmpCpy, tmpX, tmpY));
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bezierCurveTo(
        cp1x: ?Float64,
        cp1y: ?Float64,
        cp2x: ?Float64,
        cp2y: ?Float64,
        x: ?Float64,
        y: ?Float64
    ): Unit {
        let tmpCp1x = cp1x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpCp1y = cp1y ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpCp2x = cp2x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpCp2y = cp2y ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathBezierCurveTo(this.getID(), BezierCurveToParams(tmpCp1x, tmpCp1y, tmpCp2x, tmpCp2y, tmpX, tmpY));
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func ellipse(
        x: ?Float64,
        y: ?Float64,
        radiusX: ?Float64,
        radiusY: ?Float64,
        rotation: ?Float64,
        startAngle: ?Float64,
        endAngle: ?Float64,
        counterclockwise!: ?Bool = None
    ): Unit {
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpRadiusX = radiusX ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpRadiusY = radiusY ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpRotation = rotation ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpStartAngle = startAngle ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpEndAngle = endAngle ?? throw IllegalArgumentException("The type now is not supported.")
        
        unsafe {
            FfiOHOSAceFrameworkCanvasPathEllipse(
                this.getID(),
                EllipseParams(tmpX, tmpY, tmpRadiusX, tmpRadiusY, tmpRotation, tmpStartAngle, tmpEndAngle),
                counterclockwise ?? false
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rect(x: ?Float64, y: ?Float64, width: ?Float64, height: ?Float64): Unit {
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpWidth = width ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpHeight = height ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCanvasPathRect(this.getID(), RectParams(tmpX, tmpY, tmpX + tmpWidth, tmpY + tmpHeight));
        }
    }

    /**
     * Returns the pen point to the start point of the current sub-path.
     *
     * @relation closePath(): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closePath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathClosePath(this.getID());
        }
    }
}
