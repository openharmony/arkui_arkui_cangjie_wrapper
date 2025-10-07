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

package ohos.arkui.component.blank

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign func FfiOHOSAceFrameworkBlankCreate(minSize: Float64, unit: Int32): Unit

/**
 * Defines Blank Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Blank <: CommonMethodComponent<Blank> & BlankAttribute {
    /**
     * Minimum size of the Blank component in the container along the main axis
     * Default value: **0.vp**.
     *
     * @params { ?Length } min
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(min!: ?Length = None) {
        var min_ = transAppResourceToLength(min ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkBlankCreate(min_.value, min_.unitType.getValue())
        }
    }

    /**
     * Sets the color to fill the blank
     * Default value: **Color.Transparent**.
     *
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ?ResourceColor): This {
        backgroundColor(transAppResourceToResourceColor(value ?? Color.Transparent))
        this
    }
}
