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

package ohos.arkui.shape

import ohos.arkui.component.util.{transAppResourceToLength, transAppResourceToResourceColor}
import ohos.base.{ResourceColor, Length, Color, LengthProp}
import ohos.ffi.{RemoteDataLite}
import ohos.labels.APILevel

foreign {

    func FfiOHOSAceFrameworkShapeSetInsFill(shapeId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkShapeSetInsWidth(shapeId: Int64, value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsHeight(shapeId: Int64, value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsSize(shapeId: Int64, width: Float64, widthUnit: Int32, height: Float64,
        heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsOffset(shapeId: Int64, x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Base shape class.
 * Abstract base class for all shape components, providing common properties and methods for shape rendering.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class BaseShape <: RemoteDataLite {
    /**
     * BaseShape Constructor.
     * @param { Int64 } id - Component ID
     */
    protected init(id: Int64) {
        super(id)
    }

    /**
     * Sets the color of the filled area. The abnormal value is processed based on the default value.
     * Configures the fill color used to paint the interior of the shape.
     *
     * @param { ?ResourceColor } color - Color of the filled area.
     * @returns { This } Returns the BaseShape instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(color: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsFill(getID(), transAppResourceToResourceColor(color ?? Color.Black))
        }
        this
    }

    /**
     * Sets the shape width.
     * Configures the width dimension of the shape.
     *
     * @param { ?Length } width - Shape width.
     * @returns { This } Returns the BaseShape instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width(width: ?Length): This {
        match (width) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkShapeSetInsWidth(getID(), value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    /**
     * Sets the shape height.
     * Configures the height dimension of the shape.
     *
     * @param { ?Length } height - Shape height.
     * @returns { This } Returns the BaseShape instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height(height: ?Length): This {
        match (height) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkShapeSetInsHeight(getID(), value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    /**
     * Sets the shape size.
     * Configures both the width and height dimensions of the shape.
     *
     * @param { ?Length } width - Shape width.
     * @param { ?Length } height - Shape height.
     * @returns { This } Returns the BaseShape instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(width!: ?Length, height!: ?Length): This {
        var width_ = transAppResourceToLength(width ?? 0.0.vp)
        var height_ = transAppResourceToLength(height ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsSize(getID(), width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the shape offset.
     * Configures the position offset of the shape relative to its container.
     *
     * @param { ?Length } x - x Offset from the left.
     * @param { ?Length } y - y Offset from the top.
     * @returns { This } Returns the BaseShape instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offset(x!: ?Length, y!: ?Length): This {
        var x_ = transAppResourceToLength(x ?? 0.0.px)
        var y_ = transAppResourceToLength(y ?? 0.0.px)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsOffset(getID(), x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }
}
