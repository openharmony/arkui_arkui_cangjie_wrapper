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

import ohos.arkui.component.common.{CommonMethod, LineCapStyle, LineJoinStyle}
import ohos.arkui.component.util.{transAppResourceToResourceColor, transAppResourceToLength}
import ohos.business_exception.BusinessException
import ohos.base.{ResourceColor, Length, FFIVectorFloat64, FFIVectorInt32}
import ohos.resource.{AppResource, getResourceLength}
import ohos.labels.{APILevel, Hide}
import ohos.multimedia.image.PixelMap

/**
 * Defines CommonShapeMethod.
 * This interface provides common shape methods for shape components.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CommonShapeMethod<T> <: CommonMethod<T> {
    /**
     * Called when the fill color is set.
     *
     * @param { ?ResourceColor } value - The shape fill color.
     * @default Color.Black
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fill(value: ?ResourceColor): T

    /**
     * Sets the opacity of the fill area.
     *
     * @param { ?Float64 } value - The shape fill opacity. Value range is [0.0, 1.0].
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fillOpacity(value: ?Float64): T

     /**
     * Sets the opacity of the fill area.
     *
     * @param { ?AppResource } value - The shape fill opacity id source.
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fillOpacity(value: ?AppResource): T

    /**
     * Called when the border color is set.
     *
     * @param { ?ResourceColor } value - The stroke color.
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func stroke(value: ?ResourceColor): T

    /**
     * Sets the offset of the start point for drawing the stroke.
     *
     * @param { ?Array<Length> } value - Offset of the start point for drawing the stroke.
     * @default [0.vp]
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeDashArray(value: ?Array<Length>): T

    /**
     * Called when the offset of the starting point of border drawing is set.
     *
     * @param { ?Length } value - The stroke dash offset.
     * @default 0.vp
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeDashOffset(value: ?Length): T

    /**
     * Called when the path endpoint drawing style is set.
     *
     * @param { ?LineCapStyle } value - The stroke line cap style.
     * @default LineCapStyle.Butt
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeLineCap(value: ?LineCapStyle): T

    /**
     * Sets the join style of the stroke.
     * This attribute does not work for the Circle component, which does not have corners.
     *
     * @param { ?LineJoinStyle } value - Join style of the stroke.
     * @default LineJoinStyle.Miter
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeLineJoin(value: ?LineJoinStyle): T

    /**
     * Limits for drawing acute angles as bevels.
     *
     * @param { ?Float64 } miterLimit - The stroke miter limit.
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeMiterLimit(miterLimit: ?Float64): T

    /**
     * Sets the stroke opacity
     * The value range is [0.0, 1.0].
     * A value less than 0.0 evaluates to the value 0.0. A value greater than 1.0 evaluates to the value 1.0.
     * Any other value evaluates to the value 1.0.
     *
     * @param { ?Float64 } value - The stroke opacity.
     * @default 1.0
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeOpacity(value: ?Float64): T

    /**
     * Sets the stroke opacity
     * The value range is [0.0, 1.0].
     * A value less than 0.0 evaluates to the value 0.0. A value greater than 1.0 evaluates to the value 1.0.
     * Any other value evaluates to the value 1.0.
     *
     * @param { ?AppResource } value - The stroke opacity id source.
     * @default 1.0
     * @returns { T } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeOpacity(value: ?AppResource): T

    /**
     * Called when the width of the border is set. 
     * If this attribute is of the string type, percentage values are not supported and will be treated as 1.px.
     *
     * @param { ?Length } value - The stroke width. The value must be greater than or equal to 0.
     * @default 1.vp
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeWidth(value: ?Length): T

    /**
     * Called when setting whether anti aliasing is on.
     *
     * @param { ?Bool } value - Whether enable anti-alias.
     * @default true
     * @returns { T } - Returns the component instance itself for method chaining.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func antiAlias(value: ?Bool): T
}
