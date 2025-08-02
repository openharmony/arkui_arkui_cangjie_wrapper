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

package ohos.arkui.component.common

import ohos.arkui.component.util.*
import ohos.base.*
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ShapeAbstract <: ContainerBase {
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
        21,
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
        21,
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
        21,
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
        21,
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
        21,
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
