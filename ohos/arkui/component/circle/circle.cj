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

package ohos.arkui.component.circle

import ohos.arkui.component.common.*
import ohos.arkui.component.shape.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkCircleCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkCircleInsCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Int64
}

/**
 * Defines Circle Component.
 *
 * @relation declare const Circle: CircleInterface
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Circle <: CommonShapeMethodComponent<CircleAttribute> & CircleAttribute {
    /**
     * Create a circle.
     * 
     * @param { Length } width - Defines the width property.
     * @param { Length } height - Defines the height property.
     * @returns { This }
     * @relation (value?: CircleOptions): CircleAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: ?Length = None, height!: ?Length = None) {
        var width_ = transAppResourceToLength(width ?? 0.vp)
        var height_ = transAppResourceToLength(height ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkCircleCreate(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
        }
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func initial() {}
}
