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

import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{Length, LengthProp}
import ohos.labels.APILevel

foreign func FfiOHOSAceFrameworkEllipseInsCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Int64

/**
 * A shape component that renders an elliptical graphic element.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EllipseShape <: BaseShape {
    /**
     * Initializes an elliptical shape with optional width and height parameters.
     *
     * @param { ?Length } [width] - Width of the ellipse.
     * @param { ?Length } [height] - Height of the ellipse.
     * @returns { EllipseShape } Returns the EllipseShape instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: ?Length = None, height!: ?Length = None) {
        super(
            unsafe {
                var width_ = transAppResourceToLength(width ?? 0.vp)
                var height_ = transAppResourceToLength(height ?? 0.vp)
                FfiOHOSAceFrameworkEllipseInsCreate(
                    width_.value,
                    width_.unitType.getValue(),
                    height_.value,
                    height_.unitType.getValue()
                )
            })
    }
}
