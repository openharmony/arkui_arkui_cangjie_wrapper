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

import ohos.arkui.component.native_struct.{TransformParams, ArcParams, QuadraticCurveToParams, BezierCurveToParams, EllipseParams, RectParams, ArcToParams}
import ohos.ffi.{RemoteDataLite, releaseFFIData}
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Path2D <: RemoteDataLite {

    /**
     * Create an empty path object.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?String } d - Indicates the path string that compiles with the SVG path description specifications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(d: ?String) {
        super(
            unsafe {
                var id = 0
                try (pathString = LibC.mallocCString(d ?? "").asResource()) {
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
     * @param { ?Path2D } path2D - Indicates the path object to be added.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPath(path2D: ?Path2D): Unit {
        let tmpPath2D = path2D ?? Path2D()
        unsafe {
            FfiOHOSAceFrameworkCanvasPathAddPath(this.getID(), tmpPath2D.getID());
        }
    }

    /**
     * Adds 2D transformation effects, including rotation, translation, and scaling.
     * The current transformation matrix will not be overwritten. Multiple transformations will be superimposed.
     *
     * @param { ?Float64 } scaleX - The scale value in the x-axis direction.
     * @param { ?Float64 } skewX - The skew value in the x-axis direction.
     * @param { ?Float64 } skewY - The skew value in the y-axis direction.
     * @param { ?Float64 } scaleY - The scale value in the y-axis direction.
     * @param { ?Float64 } translateX - The translate value in the x-axis direction.
     * @param { ?Float64 } translateY - The translate value in the y-axis direction.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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
        unsafe {
            FfiOHOSAceFrameworkCanvasPathSetTransform(
                this.getID(),
                TransformParams(scaleX ?? 0.0, skewX ?? 0.0, skewY ?? 0.0, scaleY ?? 0.0, translateX ?? 0.0, translateY ?? 0.0)
            );
        }
    }

    /**
     * Moves the start point of a new sub-path to the (x, y) coordinate.
     *
     * @param { Float64 } x - The x-axis coordinate of the point.
     * @param { Float64 } y - The y-axis coordinate of the point.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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
     * @param { Float64 } x - The x-axis coordinate of the end point of the line.
     * @param { Float64 } y - The y-axis coordinate of the end point of the line.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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
     * @param { Float64 } x - The x-axis coordinate of the center (center of the circle) of the arc.
     * @param { Float64 } y - The y-axis coordinate of the center (center of the circle) of the arc.
     * @param { Float64 } radius - Radius of the arc.
     * @param { Float64 } startAngle - Start point of an arc, which starts to be calculated in the x-axis direction. The unit is radian.
     * @param { Float64 } endAngle - The end point of the arc, in radians.
     * @param { ?Bool } [counterclockwise] - If the value is true, the arc is drawn counterclockwise. Otherwise, the arc is drawn clockwise.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        counterclockwise!: ?Bool = None
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathArc(this.getID(), ArcParams(x, y, radius, startAngle, endAngle), counterclockwise ?? false);
        }
    }

    /**
     * Draw arc paths based on control points and radius.
     *
     * @param { Float64 } x1 - The x-axis coordinate of the first control point.
     * @param { Float64 } y1 - The y-axis coordinate of the first control point.
     * @param { Float64 } x2 - The x-axis coordinate of the second control point.
     * @param { Float64 } y2 - The y-axis coordinate of the second control point.
     * @param { Float64 } radius - Radius of the arc.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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
     * @param { Float64 } cpx - The x-axis coordinate of the control point.
     * @param { Float64 } cpy - The y-axis coordinate of the control point.
     * @param { Float64 } x - x-axis coordinate of the end point.
     * @param { Float64 } y - y-axis coordinate of the end point.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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
     * @param { Float64 } cp1x - The x-axis coordinate of the first control point.
     * @param { Float64 } cp1y - The y-axis coordinate of the first control point.
     * @param { Float64 } cp2x - The x-axis coordinate of the second control point.
     * @param { Float64 } cp2y - The y-axis coordinate of the second control point.
     * @param { Float64 } x - x-axis coordinate of the end point.
     * @param { Float64 } y - y-axis coordinate of the end point.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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
     * @param { Float64 } x - x-axis coordinate of the center of the ellipse.
     * @param { Float64 } y - y-axis coordinate of the center of the ellipse.
     * @param { Float64 } radiusX - Radius of the major axis of the ellipse.
     * @param { Float64 } radiusY - Radius of the minor axis of the ellipse.
     * @param { Float64 } rotation - The rotation angle of the ellipse, in radians (not angular degrees).
     * @param { Float64 } startAngle - The angle of the starting point to be drawn, measured from the x-axis in radians (not angular degrees).
     * @param { Float64 } endAngle - The angle, in radians, at which the ellipse is to be drawn (not angular degrees).
     * @param { ?Bool } [counterclockwise] - If the value is true, the ellipse is drawn counterclockwise. Otherwise, the ellipse is drawn clockwise.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
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
        counterclockwise!: ?Bool = None
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathEllipse(
                this.getID(),
                EllipseParams(x, y, radiusX, radiusY, rotation, startAngle, endAngle),
                counterclockwise ?? false
            );
        }
    }

    /**
     * Draw Rectangular Paths.
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } width - Width of the rectangle.
     * @param { Float64 } height - Height of the rectangle.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathRect(this.getID(), RectParams(x, y, x + width, y + height));
        }
    }

    /**
     * Returns the pen point to the start point of the current sub-path.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closePath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPathClosePath(this.getID());
        }
    }
}
