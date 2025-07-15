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

import ohos.image.PixelMap

@C
struct FFIAtCViewPort {
    FFIAtCViewPort(
        let unitX: Int32,
        let unitY: Int32,
        let unitWidth: Int32,
        let unitHeight: Int32,
        let x: Float64,
        let y: Float64,
        let width: Float64,
        let height: Float64
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkShapeCreate(): Unit

    func FfiOHOSAceFrameworkShapeCreateWithPixelMap(pixelMapId: Int64): Unit

    func FfiOHOSAceFrameworkShapeSetViewPort(viewPort: FFIAtCViewPort): Unit

    func FfiOHOSAceFrameworkShapeSetFill(color: UInt32): Unit

    func FfiOHOSAceFrameworkShapeSetFillOpacity(fillOpacity: Float64): Unit

    func FfiOHOSAceFrameworkShapeSetStroke(color: UInt32): Unit

    func FfiOHOSAceFrameworkShapeSetStrokeDashArray(arrayValue: VectorFloat64Handle, arrayUnit: VectorInt32Handle): Unit

    func FfiOHOSAceFrameworkShapeSetStrokeDashOffset(offset: Float64, offsetUnit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetStrokeLineCap(lineCap: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetStrokeLineJoin(lineJoin: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetStrokeMiterLimit(miterLimit: Float64): Unit

    func FfiOHOSAceFrameworkShapeSetStrokeOpacity(strokeOpacity: Float64): Unit

    func FfiOHOSAceFrameworkShapeSetStrokeWidth(strokeWidth: Float64, widthUnit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetAntiAlias(antiAlias: Bool): Unit

    func FfiOHOSAceFrameworkShapeSetMesh(arrayValue: VectorFloat64Handle, column: UInt32, row: UInt32): Unit

    func FfiOHOSAceFrameworkShapeSetWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsFill(shapeId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkShapeSetInsWidth(shapeId: Int64, value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsHeight(shapeId: Int64, value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsSize(shapeId: Int64, width: Float64, widthUnit: Int32, height: Float64,
        heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsOffset(shapeId: Int64, x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class ShapeAbstract <: ContainerBase {
    /**
     * ShapeAbstract Constructor.
     * @param id: Component ID
     * @since 11
     */
    protected init(id: Int64) {
        super(id)
    }

    /**
     * Sets the color of the filled area. The abnormal value is processed based on the default value.
     *
     * @param color: Color of the filled area
     * @return ShapeAbstract instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsFill(getID(), transAppResourceToResourceColor(color))
        }
        this
    }

    /**
     * Sets the shape width.
     *
     * @param value: Shape width
     * @return ShapeAbstract instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsWidth(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the shape height.
     *
     * @param value: Shape height
     * @return ShapeAbstract instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsHeight(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the shape size.
     *
     * @param width: Shape width
     * @param height: Shape height
     * @return ShapeAbstract instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsSize(getID(), width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the shape offset.
     *
     * @param x: x Offset
     * @param y: y Offset
     * @return ShapeAbstract instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offset(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsOffset(getID(), x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class ShapeComponent <: ContainerBase {
    /**
     * Sets the color of the filled area. The abnormal value is processed based on the default value.
     *
     * @param color: Color of the filled area
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetFill(transAppResourceToResourceColor(color))
        }
        this
    }

    /**
     * Sets the transparency of the filled area.
     *
     * @param value: Transparency of the filled area
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillOpacity(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetFillOpacity(value)
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
    public func fillOpacity(value: Int64): This {
        fillOpacity(Float64(value))
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillOpacity(value: AppResource): This {
        var dimension: Length = getResourceLength(value)
        fillOpacity(dimension.value)
    }

    /**
     * Sets the border color. If this parameter is not set, there is no border by default.
     *
     * @param color: Border color
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStroke(transAppResourceToResourceColor(color))
        }
        this
    }

    /**
     * Sets the border gap.
     *
     * @param dashArray: Border gap
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeDashArray(dashArray: Array<Length>): This {
        let vecValueHandle = FFIVectorFloat64(dashArray.size)
        let vecUnitHandle = FFIVectorInt32(dashArray.size)
        for (i in 0..dashArray.size) {
            vecValueHandle.setElement(i, dashArray[i].value)
            vecUnitHandle.setElement(i, dashArray[i].unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeDashArray(
                vecValueHandle.getNativeHandle(),
                vecUnitHandle.getNativeHandle()
            )
            vecValueHandle.free()
            vecUnitHandle.free()
        }
        this
    }

    /**
     * Sets the offset of the start point for drawing a border.
     *
     * @param dashArray: Offset of the start point for drawing the bounding box
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeDashOffset(dashOffset: Length): This {
        var dashOffset_ = transAppResourceToLength(dashOffset)
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeDashOffset(dashOffset_.value, dashOffset_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the drawing style of the border endpoint.
     *
     * @param lineCap: Sets the drawing style of the border endpoint
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeLineCap(lineCap: LineCapStyle): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeLineCap(lineCap.getValue())
        }
        this
    }

    /**
     * Sets the border corner drawing style.
     *
     * @param lineJoin: Border corner drawing style
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeLineJoin(lineJoin: LineJoinStyle): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeLineJoin(lineJoin.getValue())
        }
        this
    }

    /**
     * Sets the limit of the ratio of the miter length to the border width.
     *
     * @param miterLimit: The limit of the ratio of the miter length to the border width
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeMiterLimit(miterLimit: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeMiterLimit(miterLimit)
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
    public func strokeMiterLimit(miterLimit: Int64): This {
        strokeMiterLimit(Float64(miterLimit))
    }

    /**
     * Sets the border transparency.
     *
     * @param value: Border transparency
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeOpacity(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeOpacity(value)
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
    public func strokeOpacity(value: Int64): This {
        strokeOpacity(Float64(value))
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeOpacity(value: AppResource): This {
        var dimension: Length = getResourceLength(value)
        strokeOpacity(dimension.value)
    }

    /**
     * Sets the border width.
     *
     * @param value: Border width
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets whether to enable the anti-aliasing effect.
     *
     * @param value: Whether to enable the anti-aliasing effect
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func antiAlias(antiAlias: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetAntiAlias(antiAlias)
        }
        this
    }

    /**
     * Sets the shape width.
     *
     * @param value: Shape width
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkShapeSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the shape height.
     *
     * @param value: Shape height
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkShapeSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the shape size.
     *
     * @param width: Shape width
     * @param height: Shape height
     * @return ShapeComponent instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkShapeSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
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
public class Shape <: ShapeComponent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkShapeCreate()
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
    public init(content!: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkShapeCreate()
        }
        this.child = content
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(target!: PixelMap) {
        unsafe {
            FfiOHOSAceFrameworkShapeCreateWithPixelMap(target.getID())
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
    public func viewPort(
        x!: Length = 0.vp,
        y!: Length = 0.vp,
        width!: Length = 0.vp,
        height!: Length = 0.vp
    ): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkShapeSetViewPort(
                FFIAtCViewPort(
                    x_.unitType.getValue(),
                    y_.unitType.getValue(),
                    width_.unitType.getValue(),
                    height_.unitType.getValue(),
                    x_.value,
                    y_.value,
                    width_.value,
                    height_.value
                )
            )
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func mesh(array: Array<Float64>, column: UInt32, row: UInt32): This {
        let vecValueHandle = FFIVectorFloat64(array.size)
        for (i in 0..array.size) {
            vecValueHandle.setElement(i, array[i])
        }
        unsafe {
            FfiOHOSAceFrameworkShapeSetMesh(vecValueHandle.getNativeHandle(), column, row)
        }
        vecValueHandle.free()
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func mesh(array: Array<Int64>, column: UInt32, row: UInt32): This {
        let value = Array<Float64>(array.size) {index => (Float64(array[index]))}
        mesh(value, column, row)
    }
}
