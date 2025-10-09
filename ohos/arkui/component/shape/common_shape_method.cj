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

import ohos.multimedia.image.PixelMap

/**
 * Defines CommonShapeMethod.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CommonShapeMethod<T> <: CommonMethod<T> {
    /**
     * Called when the fill color is set.
     *
     * @params { ?ResourceColor } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fill(value: ?ResourceColor): T

    /**
     * Called when the transparency of the border is set.
     *
     * @params { ?Float64 } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fillOpacity(value: ?Float64): T

     /**
     * Called when the transparency of the border is set.
     *
     * @params { ?AppResource } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fillOpacity(value: ?AppResource): T

    /**
     * Called when the border color is set.
     *
     * @params { ?ResourceColor } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func stroke(value: ?ResourceColor): T

    /**
     * Called when the gap of the border is set.
     *
     * @params { ?Array<Length> } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeDashArray(value: ?Array<Length>): T

    /**
     * Called when the offset of the starting point of border drawing is set.
     *
     * @params { ?Length } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeDashOffset(value: ?Length): T

    /**
     * Called when the path endpoint drawing style is set.
     *
     * @params { ?LineCapStyle } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeLineCap(value: ?LineCapStyle): T

    /**
     * Called when the border corner drawing style is set.
     *
     * @params { ?LineJoinStyle } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeLineJoin(value: ?LineJoinStyle): T

    /**
     * Called when the limit value for drawing acute angles as oblique angles is set.
     *
     * @params { ?Float64 } miterLimit
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeMiterLimit(miterLimit: ?Float64): T

    /**
     * Called when the opacity of the border is set.
     *
     * @params { ?Float64 } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeOpacity(value: ?Float64): T

    /**
     * Called when the opacity of the border is set.
     *
     * @params { ?AppResource } value
     * @returns { T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeOpacity(value: ?AppResource): T

    /**
     * Called when the width of the border is set.
     *
     * @params { ?Length } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func strokeWidth(value: ?Length): T

    /**
     * Called when setting whether anti aliasing is on.
     *
     * @params { ?Bool } value
     * @returns { T }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func antiAlias(value: ?Bool): T
}
