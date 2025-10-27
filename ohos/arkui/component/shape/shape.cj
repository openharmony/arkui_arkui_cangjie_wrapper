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

package ohos.arkui.component.shape

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import ohos.business_exception.BusinessException

import ohos.multimedia.image.PixelMap

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

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}
/**
 * Defines Shape Component.
 * The Shape component is used to draw custom shapes using path drawing commands.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Shape <: CommonShapeMethodComponent<Shape> & ShapeAttribute {
    /**
    * Defines Shape Component instance.
    *
    * @param { () -> Unit } child - Child component of shape.
    * @returns { This } - Returns the component instance itself for method chaining.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child!: () -> Unit = { => }) {
        unsafe {
            FfiOHOSAceFrameworkShapeCreate()
        }
        this.child = child
    }
    /**
    * Defines Shape Component instance.
    *
    * @param { ?PixelMap } value - The shape background image.
    * @returns { This } - Returns the component instance itself for method chaining.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?PixelMap) {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkShapeCreateWithPixelMap(v.getID())
            }
        } else {
            Shape()
        }
    }
    /**
    * Viewport of shape.
    *
    * @param { ?Length } x - X coordinate of the viewport.
    * @param { ?Length } y - Y coordinate of the viewport.
    * @param { ?Length } width - Width of the viewport.
    * @param { ?Length } height - Height of the viewport.
    * @returns { This } - Returns the component instance itself for method chaining.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func viewPort(
        x!: ?Length = None,
        y!: ?Length = None,
        width!: ?Length = None,
        height!: ?Length = None
    ): This {
        var x_ = transAppResourceToLength(x ?? 0.vp)
        var y_ = transAppResourceToLength(y ?? 0.vp)
        var width_ = transAppResourceToLength(width ?? 0.vp)
        var height_ = transAppResourceToLength(height ?? 0.vp)
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
    /**
    * Called when shape mesh.
    *
    * @param { ?Array<Float64> } value - The mesh points array[x1, y1, x2, y2, ...].
    * @param { ?UInt32 } column - The column count of mesh.
    * @param { ?UInt32 } row - The row count of mesh.
    * @returns { This } - Returns the component instance itself for method chaining.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func mesh(value: ?Array<Float64>, column: ?UInt32, row: ?UInt32): This {
        let tmpValue = value ?? []
        let tmpColumn = column ?? 0
        let tmpRow = row ?? 0
        let vecValueHandle = FFIVectorFloat64(tmpValue.size)
        for (i in 0..tmpValue.size) {
            vecValueHandle.setElement(i, tmpValue[i])
        }
        unsafe {
            FfiOHOSAceFrameworkShapeSetMesh(vecValueHandle.getNativeHandle(), tmpColumn, tmpRow)
        }
        vecValueHandle.free()
        this
    }
}
