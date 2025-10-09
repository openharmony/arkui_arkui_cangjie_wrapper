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

package ohos.arkui.component.shape

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import ohos.business_exception.BusinessException

import ohos.multimedia.image.PixelMap

/**
 * Defines CommonShapeMethodComponent.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class CommonShapeMethodComponent<T> <: CommonMethodComponent<T> & CommonShapeMethod<T> {
    protected init(id: Int64){
        super(id)
    }

    protected init(){
        super()
    }

    protected open func initial(): Unit {
        super.initial()
    }

    protected open func update(): Unit {
        super.update()
    }

    /**
     * Called when the fill color is set.
     *
     * @param { ?ResourceColor } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(value: ?ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetFill(transAppResourceToResourceColor(value ?? Color.Black))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when the transparency of the border is set.
     *
     * @param { ?Float64 } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillOpacity(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetFillOpacity(value ?? 1.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }
     /**
     * Called when the transparency of the border is set.
     *
     * @param { ?AppResource } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillOpacity(value: ?AppResource): T {
        match (value) {
            case Some(v) =>
                var dimension: Length = getResourceLength(v)
                fillOpacity(dimension.value)
            case None => fillOpacity(1.0)
        }
    }

    /**
     * Called when the border color is set.
     *
     * @param { ?ResourceColor } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(value: ?ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStroke(transAppResourceToResourceColor(value ?? Color.Transparent))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when the gap of the border is set.
     *
     * @param { ?Array<Length> } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeDashArray(value: ?Array<Length>): T {
        let tmpValue = value ?? []
        let vecValueHandle = FFIVectorFloat64(tmpValue.size)
        let vecUnitHandle = FFIVectorInt32(tmpValue.size)
        for (i in 0..tmpValue.size) {
            vecValueHandle.setElement(i, tmpValue[i].value)
            vecUnitHandle.setElement(i, tmpValue[i].unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeDashArray(
                vecValueHandle.getNativeHandle(),
                vecUnitHandle.getNativeHandle()
            )
            vecValueHandle.free()
            vecUnitHandle.free()
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when the offset of the starting point of border drawing is set.
     *
     * @param { ?Length } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeDashOffset(value: ?Length): T {
        var dashOffset_ = transAppResourceToLength(value ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeDashOffset(dashOffset_.value, dashOffset_.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when the path endpoint drawing style is set.
     *
     * @param { ?LineCapStyle } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeLineCap(value: ?LineCapStyle): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeLineCap((value ?? LineCapStyle.Butt).getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when the border corner drawing style is set.
     *
     * @param { ?LineJoinStyle } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeLineJoin(value: ?LineJoinStyle): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeLineJoin((value ?? LineJoinStyle.Miter).getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when the limit value for drawing acute angles as oblique angles is set.
     *
     * @param { ?Float64 } miterLimit
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeMiterLimit(miterLimit: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeMiterLimit(miterLimit ?? 4.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when the opacity of the border is set.
     *
     * @param { ?Float64 } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeOpacity(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeOpacity(value ?? 1.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }
    /**
     * Called when the opacity of the border is set.
     *
     * @param { ?AppResource } value
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeOpacity(value: ?AppResource): T {
        match (value) {
            case Some(v) =>
                var dimension: Length = getResourceLength(v)
                strokeOpacity(dimension.value)
            case None => strokeOpacity(1.0)
        }
    }

    /**
     * Called when the width of the border is set.
     *
     * @param { ?Length } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeWidth(value: ?Length): T {
        var value_ = transAppResourceToLength(value ?? 1.vp)
        unsafe {
            FfiOHOSAceFrameworkShapeSetStrokeWidth(value_.value, value_.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Called when setting whether anti aliasing is on.
     *
     * @param { ?Bool } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func antiAlias(value: ?Bool): T {
        unsafe {
            FfiOHOSAceFrameworkShapeSetAntiAlias(value ?? true)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected override func widthInner(value: ?Length): T {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkShapeSetWidth(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected override func heightInner(value: ?Length): T {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkShapeSetHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected override func sizeInner(width: ?Length, height: ?Length): T {
        if (width.isNone() || height.isNone()) {
            widthInner(width)
            heightInner(height)
        } else {
            var width_ = transAppResourceToLength(width ?? 0.0.vp)
            var height_ = transAppResourceToLength(height ?? 0.0.vp)
            unsafe {
                FfiOHOSAceFrameworkShapeSetSize(width_.value, width_.unitType.getValue(), height_.value,
                    height_.unitType.getValue())
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }
}
