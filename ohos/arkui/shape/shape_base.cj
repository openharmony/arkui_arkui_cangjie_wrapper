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

package ohos.arkui.shape

import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {

    func FfiOHOSAceFrameworkShapeSetInsFill(shapeId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkShapeSetInsWidth(shapeId: Int64, value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsHeight(shapeId: Int64, value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsSize(shapeId: Int64, width: Float64, widthUnit: Int32, height: Float64,
        heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkShapeSetInsOffset(shapeId: Int64, x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class BaseShape <: RemoteDataLite {
    /**
     * BaseShape Constructor.
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
     * @return BaseShape instance
     * @since 11
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(color: ?ResourceColor): This {
        let tmpColor = color ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsFill(getID(), transAppResourceToResourceColor(tmpColor))
        }
        this
    }

    /**
     * Sets the shape width.
     *
     * @param value: Shape width
     * @return BaseShape instance
     * @since 11
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width(width: ?Length): This {
        let tmpWidth = width ?? throw IllegalArgumentException("The type now is not supported.")
        var value_ = transAppResourceToLength(tmpWidth)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsWidth(getID(), value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the shape height.
     *
     * @param value: Shape height
     * @return BaseShape instance
     * @since 11
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height(height: ?Length): This {
        let tmpHeight = height ?? throw IllegalArgumentException("The type now is not supported.")
        var value_ = transAppResourceToLength(tmpHeight)
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
     * @return BaseShape instance
     * @since 11
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(width!: ?Length, height!: ?Length): This {
        let tmpWidth = width ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpHeight = height ?? throw IllegalArgumentException("The type now is not supported.")
        var width_ = transAppResourceToLength(tmpWidth)
        var height_ = transAppResourceToLength(tmpHeight)
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
     * @return BaseShape instance
     * @since 11
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offset(x!: ?Length, y!: ?Length): This {
        let tmpX = x ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = y ?? throw IllegalArgumentException("The type now is not supported.")
        var x_ = transAppResourceToLength(tmpX)
        var y_ = transAppResourceToLength(tmpY)
        unsafe {
            FfiOHOSAceFrameworkShapeSetInsOffset(getID(), x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }
}
